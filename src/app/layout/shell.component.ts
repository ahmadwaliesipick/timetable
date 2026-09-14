import { Component, effect, inject, signal } from '@angular/core';
import { Router, RouterLink, RouterLinkActive, RouterOutlet } from '@angular/router';
import { AuthService } from '../core/auth.service';
import { SchoolStore } from '../core/school.store';

@Component({
  selector: 'app-shell',
  standalone: true,
  imports: [RouterOutlet, RouterLink, RouterLinkActive],
  templateUrl: './shell.component.html',
  styleUrl: './shell.component.scss',
})
export class ShellComponent {
  readonly auth = inject(AuthService);
  readonly store = inject(SchoolStore);
  private readonly router = inject(Router);
  readonly menuOpen = signal(false);

  constructor() {
    effect(() => {
      if (this.auth.isLoggedIn() && !this.store.loaded()) {
        void this.store.refresh();
      }
    });
  }

  toggleMenu(): void {
    this.menuOpen.update((v) => !v);
  }

  closeMenu(): void {
    this.menuOpen.set(false);
  }

  async logout(): Promise<void> {
    await this.auth.logout();
    this.store.clear();
    await this.router.navigateByUrl('/login');
  }
}
