import { Component, effect, inject } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { SchoolStore } from './core/school.store';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  template: `<router-outlet />`,
  styles: `:host { display: block; min-height: 100vh; }`,
})
export class AppComponent {
  private readonly store = inject(SchoolStore);

  constructor() {
    void this.store.loadProfile();
    effect(() => {
      const school = this.store.profile();
      document.title = `${school.shortName} · Timetable Desk`;
    });
  }
}
