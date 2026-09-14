import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/auth.service';
import {
  className,
  periodName,
  subjectName,
  teacherName,
} from '../../core/suggestion.logic';
import { todayIso } from '../../core/models';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-daily-desk',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './daily-desk.component.html',
  styleUrl: './daily-desk.component.scss',
})
export class DailyDeskComponent {
  readonly auth = inject(AuthService);
  readonly store = inject(SchoolStore);

  readonly date = signal(todayIso());
  readonly absenceTeacherId = signal('');
  readonly absenceReason = signal('');
  readonly message = signal('');

  readonly absences = computed(() => this.store.absencesForDate(this.date()));
  readonly arrangements = computed(() =>
    this.store.arrangementsForDate(this.date()).map((a) => {
      const slot = this.store.slots().find((s) => s.id === a.timetableSlotId);
      return { ...a, slot };
    })
  );

  teacherLabel = (id: string | null | undefined) => teacherName(this.store.teachers(), id);
  subjectLabel = (id: string) => subjectName(this.store.subjects(), id);
  classLabel = (id: string) => className(this.store.classSections(), id);
  periodLabel = (id: string) => periodName(this.store.periods(), id);

  onDateChange(value: string): void {
    this.date.set(value);
    this.message.set('');
  }

  async addAbsence(): Promise<void> {
    if (!this.absenceTeacherId()) return;
    await this.store.addAbsence(this.absenceTeacherId(), this.date(), this.absenceReason() || null);
    this.absenceTeacherId.set('');
    this.absenceReason.set('');
    this.message.set('Absence recorded. Generate suggestions next.');
  }

  async removeAbsence(id: string): Promise<void> {
    await this.store.removeAbsence(id);
  }

  async generate(): Promise<void> {
    const list = await this.store.generateSuggestions(this.date());
    this.message.set(
      list.length
        ? `Suggested cover for ${list.length} period(s). Review and confirm.`
        : 'No uncovered periods for this date (no absences overlapping the timetable).'
    );
  }

  async setSubstitute(id: string, teacherId: string): Promise<void> {
    await this.store.setArrangementSubstitute(id, teacherId || null);
  }

  async confirmOne(id: string): Promise<void> {
    await this.store.confirmArrangement(id);
  }

  async confirmAll(): Promise<void> {
    await this.store.confirmAllForDate(this.date());
    this.message.set('All assigned covers confirmed for this date.');
  }

  candidateOptions(suggestedIds: string[] | undefined) {
    const ids = suggestedIds?.length ? suggestedIds : this.store.teachers().map((t) => t.id);
    const map = new Map(this.store.teachers().map((t) => [t.id, t]));
    return ids.map((id) => map.get(id)).filter(Boolean);
  }
}
