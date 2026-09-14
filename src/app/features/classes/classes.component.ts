import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ClassSection } from '../../core/models';
import { scrollToEditForm } from '../../core/scroll-to-form';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-classes',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './classes.component.html',
  styleUrl: './classes.component.scss',
})
export class ClassesComponent {
  readonly store = inject(SchoolStore);
  readonly editingId = signal<string | null>(null);
  readonly name = signal('');
  readonly grade = signal('');
  readonly needsCover = signal(true);

  startCreate(): void {
    this.editingId.set(null);
    this.name.set('');
    this.grade.set('');
    this.needsCover.set(true);
  }

  startEdit(c: ClassSection): void {
    this.editingId.set(c.id);
    this.name.set(c.name);
    this.grade.set(c.grade ?? '');
    this.needsCover.set(c.needsCover !== false);
    scrollToEditForm('class-form', 'class-name');
  }

  async save(): Promise<void> {
    if (!this.name().trim()) return;
    await this.store.upsertClass({
      id: this.editingId() ?? undefined,
      name: this.name().trim(),
      grade: this.grade().trim() || null,
      needsCover: this.needsCover(),
    });
    this.startCreate();
  }

  async remove(id: string): Promise<void> {
    if (confirm('Delete this class and its timetable slots?')) await this.store.deleteClass(id);
  }
}
