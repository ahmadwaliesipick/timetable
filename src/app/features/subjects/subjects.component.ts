import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Subject } from '../../core/models';
import { scrollToEditForm } from '../../core/scroll-to-form';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-subjects',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './subjects.component.html',
  styleUrl: './subjects.component.scss',
})
export class SubjectsComponent {
  readonly store = inject(SchoolStore);
  readonly editingId = signal<string | null>(null);
  readonly name = signal('');
  readonly code = signal('');

  startCreate(): void {
    this.editingId.set(null);
    this.name.set('');
    this.code.set('');
  }

  startEdit(s: Subject): void {
    this.editingId.set(s.id);
    this.name.set(s.name);
    this.code.set(s.code ?? '');
    scrollToEditForm('subject-form', 'subject-name');
  }

  async save(): Promise<void> {
    if (!this.name().trim()) return;
    await this.store.upsertSubject({
      id: this.editingId() ?? undefined,
      name: this.name().trim(),
      code: this.code().trim() || null,
    });
    this.startCreate();
  }

  async remove(id: string): Promise<void> {
    if (confirm('Delete this subject?')) await this.store.deleteSubject(id);
  }
}
