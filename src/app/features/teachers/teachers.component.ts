import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Teacher } from '../../core/models';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-teachers',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './teachers.component.html',
  styleUrl: './teachers.component.scss',
})
export class TeachersComponent {
  readonly store = inject(SchoolStore);
  readonly editingId = signal<string | null>(null);
  readonly name = signal('');
  readonly email = signal('');
  readonly subjectIds = signal<string[]>([]);
  readonly error = signal('');

  startCreate(): void {
    this.editingId.set(null);
    this.name.set('');
    this.email.set('');
    this.subjectIds.set([]);
    this.error.set('');
  }

  startEdit(t: Teacher): void {
    this.editingId.set(t.id);
    this.name.set(t.name);
    this.email.set(t.email ?? '');
    this.subjectIds.set([...t.subjectIds]);
    this.error.set('');
    this.scrollToForm();
  }

  private scrollToForm(): void {
    // Mobile Safari is unreliable with smooth scrollIntoView — force top + focus.
    const go = () => {
      const form = document.getElementById('teacher-form');
      const headerOffset = 72;
      if (form) {
        const y = form.getBoundingClientRect().top + window.pageYOffset - headerOffset;
        window.scrollTo(0, Math.max(0, y));
        document.documentElement.scrollTop = Math.max(0, y);
        document.body.scrollTop = Math.max(0, y);
      } else {
        window.scrollTo(0, 0);
        document.documentElement.scrollTop = 0;
        document.body.scrollTop = 0;
      }
      const nameInput = document.getElementById('teacher-name') as HTMLInputElement | null;
      nameInput?.focus({ preventScroll: true });
    };
    // Run twice so layout/paint after Angular updates is covered.
    setTimeout(go, 0);
    setTimeout(go, 120);
  }

  toggleSubject(id: string, checked: boolean): void {
    const set = new Set(this.subjectIds());
    if (checked) set.add(id);
    else set.delete(id);
    this.subjectIds.set([...set]);
  }

  async save(): Promise<void> {
    if (!this.name().trim()) {
      this.error.set('Name is required.');
      return;
    }
    await this.store.upsertTeacher({
      id: this.editingId() ?? undefined,
      name: this.name().trim(),
      email: this.email().trim() || null,
      subjectIds: this.subjectIds(),
    });
    this.startCreate();
  }

  async remove(id: string): Promise<void> {
    if (confirm('Delete this teacher and their timetable slots?')) {
      await this.store.deleteTeacher(id);
    }
  }

  subjectNames(ids: string[]): string {
    return ids
      .map((id) => this.store.subjects().find((s) => s.id === id)?.name)
      .filter(Boolean)
      .join(', ');
  }
}
