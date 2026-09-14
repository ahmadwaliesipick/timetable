import { Injectable, computed, inject, signal } from '@angular/core';
import { AuthService } from './auth.service';
import {
  Absence,
  Arrangement,
  ClassSection,
  Period,
  SchoolData,
  Subject,
  Teacher,
  TimetableSlot,
  uid,
} from './models';
import { createSeedData } from './seed-data';
import {
  suggestArrangements,
  updateArrangementPick,
  upsertArrangements,
} from './suggestion.logic';
import { getSupabase, isSupabaseConfigured } from './supabase.client';
import * as api from './supabase-data';

const STORAGE_KEY = 'timetable.schoolData.v1';

@Injectable({ providedIn: 'root' })
export class SchoolStore {
  private readonly auth = inject(AuthService);
  private readonly state = signal<SchoolData>(emptyData());
  readonly loading = signal(false);
  readonly lastError = signal<string | null>(null);
  readonly loaded = signal(false);

  readonly teachers = computed(() => this.state().teachers);
  readonly subjects = computed(() => this.state().subjects);
  readonly classSections = computed(() => this.state().classSections);
  readonly periods = computed(() =>
    [...this.state().periods].sort((a, b) => a.sortOrder - b.sortOrder)
  );
  readonly slots = computed(() => this.state().slots);
  readonly absences = computed(() => this.state().absences);
  readonly arrangements = computed(() => this.state().arrangements);
  readonly demoMode = !isSupabaseConfigured();
  readonly usingSupabase = isSupabaseConfigured();

  private get client() {
    return getSupabase();
  }

  async refresh(): Promise<void> {
    this.loading.set(true);
    this.lastError.set(null);
    try {
      if (this.demoMode) {
        this.state.set(this.loadLocal());
      } else {
        if (!this.auth.isLoggedIn()) {
          this.state.set(emptyData());
        } else {
          const data = await api.fetchSchoolData(this.client);
          this.state.set(data);
        }
      }
      this.loaded.set(true);
    } catch (e) {
      this.lastError.set(e instanceof Error ? e.message : 'Failed to load school data');
      throw e;
    } finally {
      this.loading.set(false);
    }
  }

  clear(): void {
    this.state.set(emptyData());
    this.loaded.set(false);
    this.lastError.set(null);
  }

  private loadLocal(): SchoolData {
    try {
      const raw = localStorage.getItem(STORAGE_KEY);
      if (raw) return JSON.parse(raw) as SchoolData;
    } catch {
      /* ignore */
    }
    const seed = createSeedData();
    localStorage.setItem(STORAGE_KEY, JSON.stringify(seed));
    return seed;
  }

  private persistLocal(next: SchoolData): void {
    this.state.set(next);
    if (this.demoMode) {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
    }
  }

  private patchLocal(mutator: (data: SchoolData) => SchoolData): void {
    this.persistLocal(mutator(structuredClone(this.state())));
  }

  resetDemoData(): void {
    if (!this.demoMode) return;
    this.persistLocal(createSeedData());
  }

  private async run(action: () => Promise<void>): Promise<void> {
    this.lastError.set(null);
    try {
      await action();
    } catch (e) {
      const msg = e instanceof Error ? e.message : 'Request failed';
      this.lastError.set(msg);
      if (!this.demoMode) {
        try {
          await this.refresh();
        } catch {
          /* keep original error */
        }
      }
      throw e;
    }
  }

  // —— Teachers ——
  async upsertTeacher(input: Omit<Teacher, 'id'> & { id?: string }): Promise<void> {
    await this.run(async () => {
      if (this.demoMode) {
        this.patchLocal((d) => {
          if (input.id) {
            d.teachers = d.teachers.map((t) =>
              t.id === input.id ? { ...t, ...input, id: input.id } : t
            );
          } else {
            d.teachers.push({ ...input, id: uid() });
          }
          return d;
        });
        return;
      }
      const saved = await api.saveTeacher(this.client, input);
      this.patchLocal((d) => {
        const exists = d.teachers.some((t) => t.id === saved.id);
        d.teachers = exists
          ? d.teachers.map((t) => (t.id === saved.id ? saved : t))
          : [...d.teachers, saved];
        return d;
      });
    });
  }

  async deleteTeacher(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deleteTeacher(this.client, id);
      this.patchLocal((d) => {
        d.teachers = d.teachers.filter((t) => t.id !== id);
        d.slots = d.slots.filter((s) => s.teacherId !== id);
        d.absences = d.absences.filter((a) => a.teacherId !== id);
        return d;
      });
    });
  }

  // —— Subjects ——
  async upsertSubject(input: Omit<Subject, 'id'> & { id?: string }): Promise<void> {
    await this.run(async () => {
      if (this.demoMode) {
        this.patchLocal((d) => {
          if (input.id) {
            d.subjects = d.subjects.map((s) =>
              s.id === input.id ? { ...s, ...input, id: input.id } : s
            );
          } else {
            d.subjects.push({ ...input, id: uid() });
          }
          return d;
        });
        return;
      }
      const saved = await api.saveSubject(this.client, input);
      this.patchLocal((d) => {
        const exists = d.subjects.some((s) => s.id === saved.id);
        d.subjects = exists
          ? d.subjects.map((s) => (s.id === saved.id ? saved : s))
          : [...d.subjects, saved];
        return d;
      });
    });
  }

  async deleteSubject(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deleteSubject(this.client, id);
      this.patchLocal((d) => {
        d.subjects = d.subjects.filter((s) => s.id !== id);
        d.teachers = d.teachers.map((t) => ({
          ...t,
          subjectIds: t.subjectIds.filter((sid) => sid !== id),
        }));
        return d;
      });
    });
  }

  // —— Classes ——
  async upsertClass(input: Omit<ClassSection, 'id'> & { id?: string }): Promise<void> {
    await this.run(async () => {
      if (this.demoMode) {
        this.patchLocal((d) => {
          if (input.id) {
            d.classSections = d.classSections.map((c) =>
              c.id === input.id ? { ...c, ...input, id: input.id } : c
            );
          } else {
            d.classSections.push({ ...input, id: uid() });
          }
          return d;
        });
        return;
      }
      const saved = await api.saveClass(this.client, input);
      this.patchLocal((d) => {
        const exists = d.classSections.some((c) => c.id === saved.id);
        d.classSections = exists
          ? d.classSections.map((c) => (c.id === saved.id ? saved : c))
          : [...d.classSections, saved];
        return d;
      });
    });
  }

  async deleteClass(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deleteClass(this.client, id);
      this.patchLocal((d) => {
        d.classSections = d.classSections.filter((c) => c.id !== id);
        d.slots = d.slots.filter((s) => s.classSectionId !== id);
        return d;
      });
    });
  }

  // —— Periods ——
  async upsertPeriod(input: Omit<Period, 'id'> & { id?: string }): Promise<void> {
    await this.run(async () => {
      if (this.demoMode) {
        this.patchLocal((d) => {
          if (input.id) {
            d.periods = d.periods.map((p) =>
              p.id === input.id ? { ...p, ...input, id: input.id } : p
            );
          } else {
            d.periods.push({ ...input, id: uid() });
          }
          return d;
        });
        return;
      }
      const saved = await api.savePeriod(this.client, input);
      this.patchLocal((d) => {
        const exists = d.periods.some((p) => p.id === saved.id);
        d.periods = exists
          ? d.periods.map((p) => (p.id === saved.id ? saved : p))
          : [...d.periods, saved];
        return d;
      });
    });
  }

  async deletePeriod(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deletePeriod(this.client, id);
      this.patchLocal((d) => {
        d.periods = d.periods.filter((p) => p.id !== id);
        d.slots = d.slots.filter((s) => s.periodId !== id);
        return d;
      });
    });
  }

  // —— Timetable ——
  async upsertSlot(input: Omit<TimetableSlot, 'id'> & { id?: string }): Promise<string> {
    let id = input.id ?? uid();
    await this.run(async () => {
      const d = this.state();
      const clashClass = d.slots.find(
        (s) =>
          s.id !== input.id &&
          s.dayOfWeek === input.dayOfWeek &&
          s.periodId === input.periodId &&
          s.classSectionId === input.classSectionId
      );
      if (clashClass) throw new Error('This class already has a lesson in that period.');
      const clashTeacher = d.slots.find(
        (s) =>
          s.id !== input.id &&
          s.dayOfWeek === input.dayOfWeek &&
          s.periodId === input.periodId &&
          s.teacherId === input.teacherId
      );
      if (clashTeacher) throw new Error('This teacher is already assigned in that period.');

      if (this.demoMode) {
        this.patchLocal((data) => {
          if (input.id) {
            data.slots = data.slots.map((s) =>
              s.id === input.id ? { ...s, ...input, id: input.id! } : s
            );
            id = input.id;
          } else {
            id = uid();
            data.slots.push({ ...input, id });
          }
          return data;
        });
        return;
      }

      const saved = await api.saveSlot(this.client, input);
      id = saved.id;
      this.patchLocal((data) => {
        const exists = data.slots.some((s) => s.id === saved.id);
        data.slots = exists
          ? data.slots.map((s) => (s.id === saved.id ? saved : s))
          : [...data.slots, saved];
        return data;
      });
    });
    return id;
  }

  async deleteSlot(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deleteSlot(this.client, id);
      this.patchLocal((d) => {
        d.slots = d.slots.filter((s) => s.id !== id);
        d.arrangements = d.arrangements.filter((a) => a.timetableSlotId !== id);
        return d;
      });
    });
  }

  // —— Absences ——
  async addAbsence(teacherId: string, absenceDate: string, reason: string | null): Promise<void> {
    await this.run(async () => {
      if (this.state().absences.some((a) => a.teacherId === teacherId && a.absenceDate === absenceDate)) {
        return;
      }
      if (this.demoMode) {
        this.patchLocal((d) => {
          d.absences.push({ id: uid(), teacherId, absenceDate, reason });
          return d;
        });
        return;
      }
      const saved = await api.insertAbsence(this.client, teacherId, absenceDate, reason);
      this.patchLocal((d) => {
        d.absences = [saved, ...d.absences];
        return d;
      });
    });
  }

  async removeAbsence(id: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.deleteAbsence(this.client, id);
      this.patchLocal((d) => {
        d.absences = d.absences.filter((a) => a.id !== id);
        return d;
      });
    });
  }

  // —— Arrangements ——
  async generateSuggestions(dateIso: string): Promise<Arrangement[]> {
    const suggested = suggestArrangements(this.state(), dateIso);
    await this.run(async () => {
      if (this.demoMode) {
        this.patchLocal((d) => {
          d.arrangements = upsertArrangements(d.arrangements, dateIso, suggested);
          return d;
        });
        return;
      }
      const saved = await api.replaceArrangementsForDate(this.client, dateIso, suggested);
      this.patchLocal((d) => {
        d.arrangements = upsertArrangements(d.arrangements, dateIso, saved);
        return d;
      });
    });
    return this.arrangementsForDate(dateIso);
  }

  async setArrangementSubstitute(id: string, substituteTeacherId: string | null): Promise<void> {
    const status = substituteTeacherId ? 'suggested' : 'unassigned';
    await this.run(async () => {
      if (!this.demoMode) {
        await api.updateArrangement(this.client, id, { substituteTeacherId, status });
      }
      this.patchLocal((d) => {
        d.arrangements = updateArrangementPick(d.arrangements, id, substituteTeacherId, status);
        return d;
      });
    });
  }

  async confirmArrangement(id: string): Promise<void> {
    await this.run(async () => {
      const row = this.state().arrangements.find((a) => a.id === id);
      if (!row?.substituteTeacherId) return;
      if (!this.demoMode) {
        await api.updateArrangement(this.client, id, { status: 'confirmed' });
      }
      this.patchLocal((d) => {
        d.arrangements = d.arrangements.map((a) =>
          a.id === id && a.substituteTeacherId ? { ...a, status: 'confirmed' as const } : a
        );
        return d;
      });
    });
  }

  async confirmAllForDate(dateIso: string): Promise<void> {
    await this.run(async () => {
      if (!this.demoMode) await api.confirmArrangementsForDate(this.client, dateIso);
      this.patchLocal((d) => {
        d.arrangements = d.arrangements.map((a) =>
          a.arrangementDate === dateIso && a.substituteTeacherId
            ? { ...a, status: 'confirmed' as const }
            : a
        );
        return d;
      });
    });
  }

  arrangementsForDate(dateIso: string): Arrangement[] {
    return this.state().arrangements.filter((a) => a.arrangementDate === dateIso);
  }

  absencesForDate(dateIso: string): Absence[] {
    return this.state().absences.filter((a) => a.absenceDate === dateIso);
  }
}

function emptyData(): SchoolData {
  return {
    teachers: [],
    subjects: [],
    classSections: [],
    periods: [],
    slots: [],
    absences: [],
    arrangements: [],
  };
}
