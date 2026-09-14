import { Injectable, computed, signal } from '@angular/core';
import { AppUser, UserRole } from './models';
import { getSupabase, isSupabaseConfigured } from './supabase.client';

const AUTH_KEY = 'timetable.auth.v1';

const DEMO_USERS: AppUser[] = [
  {
    id: 'u-admin',
    email: 'admin@school.test',
    fullName: 'School Admin',
    role: 'admin',
    teacherId: null,
  },
  {
    id: 'u-ahmed',
    email: 'ahmed@school.test',
    fullName: 'Ahmed Khan',
    role: 'teacher',
    teacherId: 't-ahmed',
  },
  {
    id: 'u-sara',
    email: 'sara@school.test',
    fullName: 'Sara Malik',
    role: 'teacher',
    teacherId: 't-sara',
  },
];

@Injectable({ providedIn: 'root' })
export class AuthService {
  private readonly userSignal = signal<AppUser | null>(null);
  private readonly readySignal = signal(false);
  private readonly errorSignal = signal<string | null>(null);

  readonly user = this.userSignal.asReadonly();
  readonly ready = this.readySignal.asReadonly();
  readonly error = this.errorSignal.asReadonly();
  readonly isLoggedIn = computed(() => !!this.userSignal());
  readonly isAdmin = computed(() => this.userSignal()?.role === 'admin');
  readonly demoUsers = DEMO_USERS;
  readonly usingSupabase = isSupabaseConfigured();

  constructor() {
    void this.init();
  }

  private async init(): Promise<void> {
    try {
      if (!this.usingSupabase) {
        this.userSignal.set(this.readDemoStored());
        return;
      }

      const client = getSupabase();
      const { data } = await client.auth.getSession();
      if (data.session?.user) {
        await this.loadProfile(data.session.user.id, data.session.user.email ?? '');
      }

      client.auth.onAuthStateChange((_event, session) => {
        if (!session?.user) {
          this.userSignal.set(null);
          return;
        }
        void this.loadProfile(session.user.id, session.user.email ?? '');
      });
    } catch (e) {
      this.errorSignal.set(e instanceof Error ? e.message : 'Auth init failed');
    } finally {
      this.readySignal.set(true);
    }
  }

  private readDemoStored(): AppUser | null {
    try {
      const raw = localStorage.getItem(AUTH_KEY);
      return raw ? (JSON.parse(raw) as AppUser) : null;
    } catch {
      return null;
    }
  }

  private async loadProfile(userId: string, email: string): Promise<void> {
    const client = getSupabase();
    const { data, error } = await client
      .from('profiles')
      .select('id,email,full_name,role,teacher_id')
      .eq('id', userId)
      .maybeSingle();

    if (error) {
      this.errorSignal.set(error.message);
      return;
    }

    if (!data) {
      this.userSignal.set({
        id: userId,
        email,
        fullName: email.split('@')[0] || 'User',
        role: 'teacher',
        teacherId: null,
      });
      return;
    }

    let teacherId = data.teacher_id as string | null;
    if (!teacherId && email) {
      teacherId = await this.tryLinkTeacherByEmail(userId, email);
    }

    this.userSignal.set({
      id: data.id,
      email: data.email,
      fullName: data.full_name,
      role: data.role as UserRole,
      teacherId,
    });
    this.errorSignal.set(null);
  }

  /** If profile has no teacher link, match by email to a teachers row. */
  private async tryLinkTeacherByEmail(userId: string, email: string): Promise<string | null> {
    try {
      const client = getSupabase();
      const { data: teacher } = await client
        .from('teachers')
        .select('id')
        .ilike('email', email.trim())
        .maybeSingle();
      if (!teacher?.id) return null;

      const { error } = await client
        .from('profiles')
        .update({ teacher_id: teacher.id })
        .eq('id', userId);
      if (error) return null;
      return teacher.id as string;
    } catch {
      return null;
    }
  }

  /** Demo-only quick login */
  loginAs(user: AppUser): void {
    if (this.usingSupabase) return;
    localStorage.setItem(AUTH_KEY, JSON.stringify(user));
    this.userSignal.set(user);
  }

  async signIn(email: string, password: string): Promise<void> {
    this.errorSignal.set(null);
    const client = getSupabase();
    const { data, error } = await client.auth.signInWithPassword({ email, password });
    if (error) throw new Error(error.message);
    if (data.user) {
      await this.loadProfile(data.user.id, data.user.email ?? email);
    }
  }

  async signUp(
    email: string,
    password: string,
    fullName: string,
    role: UserRole = 'teacher'
  ): Promise<void> {
    this.errorSignal.set(null);
    const client = getSupabase();
    const { data, error } = await client.auth.signUp({
      email,
      password,
      options: {
        data: { full_name: fullName, role },
      },
    });
    if (error) throw new Error(error.message);
    if (data.user && data.session) {
      await this.loadProfile(data.user.id, data.user.email ?? email);
    }
  }

  async logout(): Promise<void> {
    if (this.usingSupabase) {
      await getSupabase().auth.signOut();
    } else {
      localStorage.removeItem(AUTH_KEY);
    }
    this.userSignal.set(null);
  }
}
