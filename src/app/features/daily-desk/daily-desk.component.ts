import { Component, computed, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../core/auth.service';
import {
  buildDailyBoardRows,
  buildWhatsAppMessage,
  openDailyBoardPrint,
  openWhatsAppShare,
} from '../../core/daily-board-export';
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
    const skipped = this.store.skippedCoverGaps(this.date());
    const list = await this.store.generateSuggestions(this.date());
    const skipNote =
      skipped > 0
        ? ` Skipped ${skipped} period(s) where teacher/class has cover turned off.`
        : '';
    this.message.set(
      list.length
        ? `Suggested cover for ${list.length} period(s). Review and confirm.${skipNote}`
        : skipped > 0
          ? `No cover arrangements needed — ${skipped} absent period(s) skipped (cover turned off).`
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
    const eligible = this.store.teachers().filter((t) => t.needsCover !== false);
    const ids = suggestedIds?.length ? suggestedIds : eligible.map((t) => t.id);
    const map = new Map(eligible.map((t) => [t.id, t]));
    return ids.map((id) => map.get(id)).filter(Boolean);
  }

  private boardRows(confirmedOnly: boolean) {
    return buildDailyBoardRows(
      this.store.arrangementsForDate(this.date()),
      this.store.slots(),
      this.store.teachers(),
      this.store.subjects(),
      this.store.classSections(),
      this.store.periods(),
      confirmedOnly
    );
  }

  exportPdf(): void {
    try {
      openDailyBoardPrint(
        this.store.profile(),
        this.date(),
        this.absences(),
        this.boardRows(false),
        this.store.teachers()
      );
      this.message.set('Print dialog opened — choose Save as PDF, then share in WhatsApp.');
    } catch (e) {
      this.message.set(e instanceof Error ? e.message : 'Could not open PDF export.');
    }
  }

  shareWhatsApp(): void {
    const rows = this.boardRows(true);
    const sourceRows = rows.length ? rows : this.boardRows(false);
    const text = buildWhatsAppMessage(
      this.store.profile(),
      this.date(),
      this.absences(),
      sourceRows,
      this.store.teachers()
    );
    openWhatsAppShare(text);
    this.message.set(
      rows.length
        ? 'WhatsApp opened with confirmed covers. Pick your teachers group to send.'
        : 'WhatsApp opened with current board (confirm covers for a cleaner message).'
    );
  }
}
