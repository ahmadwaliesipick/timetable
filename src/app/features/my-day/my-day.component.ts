import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/auth.service';
import { DAY_LABELS, isoDayOfWeek, todayIso } from '../../core/models';
import {
  className,
  periodName,
  subjectName,
  teacherName,
} from '../../core/suggestion.logic';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-my-day',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './my-day.component.html',
  styleUrl: './my-day.component.scss',
})
export class MyDayComponent {
  readonly auth = inject(AuthService);
  readonly store = inject(SchoolStore);
  readonly date = signal(todayIso());

  readonly dayLabel = computed(() => DAY_LABELS[isoDayOfWeek(this.date())] ?? '');

  readonly myTeaching = computed(() => {
    const teacherId = this.auth.user()?.teacherId;
    if (!teacherId) return [];
    const day = isoDayOfWeek(this.date());
    const absent = this.store
      .absencesForDate(this.date())
      .some((a) => a.teacherId === teacherId);
    if (absent) return [];

    return this.store
      .slots()
      .filter((s) => s.dayOfWeek === day && s.teacherId === teacherId)
      .map((s) => ({
        ...s,
        covered: this.store
          .arrangementsForDate(this.date())
          .find((a) => a.timetableSlotId === s.id && a.status === 'confirmed'),
      }));
  });

  readonly myCovers = computed(() => {
    const teacherId = this.auth.user()?.teacherId;
    if (!teacherId) return [];
    return this.store
      .arrangementsForDate(this.date())
      .filter((a) => a.substituteTeacherId === teacherId && a.status === 'confirmed')
      .map((a) => {
        const slot = this.store.slots().find((s) => s.id === a.timetableSlotId)!;
        return { ...a, slot };
      });
  });

  teacherLabel = (id: string | null | undefined) => teacherName(this.store.teachers(), id);
  subjectLabel = (id: string) => subjectName(this.store.subjects(), id);
  classLabel = (id: string) => className(this.store.classSections(), id);
  periodLabel = (id: string) => periodName(this.store.periods(), id);
}
