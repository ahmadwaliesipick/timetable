import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../core/auth.service';
import { AppUser, UserRole } from '../../core/models';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent {
  private readonly auth = inject(AuthService);
  private readonly store = inject(SchoolStore);
  private readonly router = inject(Router);

  readonly users = this.auth.demoUsers;
  readonly usingSupabase = this.auth.usingSupabase;

  readonly mode = signal<'signin' | 'signup'>('signin');
  readonly email = signal('');
  readonly password = signal('');
  readonly fullName = signal('');
  readonly role = signal<UserRole>('admin');
  readonly busy = signal(false);
  readonly error = signal('');

  async enterDemo(user: AppUser): Promise<void> {
    this.auth.loginAs(user);
    await this.store.refresh();
    await this.router.navigateByUrl(user.role === 'admin' ? '/daily' : '/my-day');
  }

  async submit(): Promise<void> {
    this.error.set('');
    this.busy.set(true);
    try {
      if (this.mode() === 'signin') {
        await this.auth.signIn(this.email().trim(), this.password());
      } else {
        await this.auth.signUp(
          this.email().trim(),
          this.password(),
          this.fullName().trim() || this.email().trim(),
          this.role()
        );
      }
      const user = this.auth.user();
      if (!user) {
        this.error.set(
          'Check your email to confirm the account (if confirmation is enabled), then sign in.'
        );
        return;
      }
      await this.store.refresh();
      await this.router.navigateByUrl(user.role === 'admin' ? '/daily' : '/my-day');
    } catch (e) {
      this.error.set(e instanceof Error ? e.message : 'Sign-in failed');
    } finally {
      this.busy.set(false);
    }
  }
}
