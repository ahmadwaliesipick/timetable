import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Teacher } from '../../core/models';
import { scrollToEditForm } from '../../core/scroll-to-form';
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
  readonly needsCover = signal(true);
  readonly error = signal('');

  startCreate(): void {
    this.editingId.set(null);
    this.name.set('');
    this.email.set('');
    this.subjectIds.set([]);
    this.needsCover.set(true);
    this.error.set('');
  }

  startEdit(t: Teacher): void {
    this.editingId.set(t.id);
    this.name.set(t.name);
    this.email.set(t.email ?? '');
    this.subjectIds.set([...t.subjectIds]);
    this.needsCover.set(t.needsCover !== false);
    this.error.set('');
    scrollToEditForm('teacher-form', 'teacher-name');
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
      needsCover: this.needsCover(),
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
