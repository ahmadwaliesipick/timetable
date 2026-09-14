import { Component, inject, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Period } from '../../core/models';
import { SchoolStore } from '../../core/school.store';

@Component({
  selector: 'app-periods',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './periods.component.html',
  styleUrl: './periods.component.scss',
})
export class PeriodsComponent {
  readonly store = inject(SchoolStore);
  readonly editingId = signal<string | null>(null);
  readonly name = signal('');
  readonly sortOrder = signal(1);
  readonly startTime = signal('');
  readonly endTime = signal('');

  startCreate(): void {
    this.editingId.set(null);
    this.name.set('');
    this.sortOrder.set((this.store.periods().at(-1)?.sortOrder ?? 0) + 1);
    this.startTime.set('');
    this.endTime.set('');
  }

  startEdit(p: Period): void {
    this.editingId.set(p.id);
    this.name.set(p.name);
    this.sortOrder.set(p.sortOrder);
    this.startTime.set(p.startTime ?? '');
    this.endTime.set(p.endTime ?? '');
  }

  async save(): Promise<void> {
    if (!this.name().trim()) return;
    await this.store.upsertPeriod({
      id: this.editingId() ?? undefined,
      name: this.name().trim(),
      sortOrder: Number(this.sortOrder()) || 1,
      startTime: this.startTime() || null,
      endTime: this.endTime() || null,
    });
    this.startCreate();
  }

  async remove(id: string): Promise<void> {
    if (confirm('Delete this period and related slots?')) await this.store.deletePeriod(id);
  }
}
