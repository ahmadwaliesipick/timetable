import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { DAY_LABELS, DAY_SHORT_LABELS, TimetableSlot } from '../../core/models';
import {
  className,
  periodName,
  subjectName,
  teacherName,
} from '../../core/suggestion.logic';
import { SchoolStore } from '../../core/school.store';
import { scrollToEditForm } from '../../core/scroll-to-form';

@Component({
  selector: 'app-timetable',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './timetable.component.html',
  styleUrl: './timetable.component.scss',
})
export class TimetableComponent {
  readonly store = inject(SchoolStore);
  readonly dayOfWeek = signal(1);
  readonly editingId = signal<string | null>(null);
  readonly periodId = signal('');
  readonly classSectionId = signal('');
  readonly subjectId = signal('');
  readonly teacherId = signal('');
  readonly room = signal('');
  readonly error = signal('');

  readonly days = [1, 2, 3, 4, 5];
  readonly dayLabels = DAY_LABELS;
  readonly dayShortLabels = DAY_SHORT_LABELS;

  constructor() {
    this.startCreate();
  }

  readonly daySlots = computed(() =>
    this.store
      .slots()
      .filter((s) => s.dayOfWeek === this.dayOfWeek())
      .sort((a, b) => {
        const pa = this.store.periods().find((p) => p.id === a.periodId)?.sortOrder ?? 0;
        const pb = this.store.periods().find((p) => p.id === b.periodId)?.sortOrder ?? 0;
        return pa - pb || className(this.store.classSections(), a.classSectionId)
          .localeCompare(className(this.store.classSections(), b.classSectionId));
      })
  );

  teacherLabel = (id: string) => teacherName(this.store.teachers(), id);
  subjectLabel = (id: string) => subjectName(this.store.subjects(), id);
  classLabel = (id: string) => className(this.store.classSections(), id);
  periodLabel = (id: string) => periodName(this.store.periods(), id);

  startCreate(): void {
    this.editingId.set(null);
    this.periodId.set(this.store.periods()[0]?.id ?? '');
    this.classSectionId.set(this.store.classSections()[0]?.id ?? '');
    this.subjectId.set(this.store.subjects()[0]?.id ?? '');
    this.teacherId.set(this.store.teachers()[0]?.id ?? '');
    this.room.set('');
    this.error.set('');
  }

  startEdit(slot: TimetableSlot): void {
    this.editingId.set(slot.id);
    this.periodId.set(slot.periodId);
    this.classSectionId.set(slot.classSectionId);
    this.subjectId.set(slot.subjectId);
    this.teacherId.set(slot.teacherId);
    this.room.set(slot.room ?? '');
    this.error.set('');
    scrollToEditForm('slot-form', 'slot-period');
  }

  async save(): Promise<void> {
    try {
      await this.store.upsertSlot({
        id: this.editingId() ?? undefined,
        dayOfWeek: this.dayOfWeek(),
        periodId: this.periodId(),
        classSectionId: this.classSectionId(),
        subjectId: this.subjectId(),
        teacherId: this.teacherId(),
        room: this.room().trim() || null,
      });
      this.startCreate();
    } catch (e) {
      this.error.set(e instanceof Error ? e.message : 'Could not save slot.');
    }
  }

  async remove(id: string): Promise<void> {
    if (confirm('Remove this timetable slot?')) await this.store.deleteSlot(id);
  }
}
