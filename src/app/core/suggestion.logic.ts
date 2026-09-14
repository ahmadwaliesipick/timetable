import {
  Absence,
  Arrangement,
  ArrangementStatus,
  ClassSection,
  isoDayOfWeek,
  Period,
  SchoolData,
  Subject,
  Teacher,
  TimetableSlot,
  uid,
} from './models';
import { createSeedData } from './seed-data';

/**
 * Semi-auto substitute ranking for a date.
 * Prefer subject match, then any free non-absent teacher.
 */
export function suggestArrangements(data: SchoolData, dateIso: string): Arrangement[] {
  const day = isoDayOfWeek(dateIso);
  const absentIds = new Set(
    data.absences.filter((a) => a.absenceDate === dateIso).map((a) => a.teacherId)
  );

  const daySlots = data.slots.filter((s) => s.dayOfWeek === day);
  const gaps = daySlots.filter((s) => absentIds.has(s.teacherId));

  const confirmedElsewhere = new Map<string, Set<string>>();
  for (const arr of data.arrangements) {
    if (arr.arrangementDate !== dateIso || arr.status !== 'confirmed' || !arr.substituteTeacherId) {
      continue;
    }
    const slot = data.slots.find((s) => s.id === arr.timetableSlotId);
    if (!slot) continue;
    if (!confirmedElsewhere.has(arr.substituteTeacherId)) {
      confirmedElsewhere.set(arr.substituteTeacherId, new Set());
    }
    confirmedElsewhere.get(arr.substituteTeacherId)!.add(slot.periodId);
  }

  const busyByPeriod = new Map<string, Set<string>>();
  for (const slot of daySlots) {
    if (absentIds.has(slot.teacherId)) continue;
    const covered = data.arrangements.find(
      (a) =>
        a.arrangementDate === dateIso &&
        a.timetableSlotId === slot.id &&
        a.status === 'confirmed' &&
        a.substituteTeacherId
    );
    const effectiveTeacher = covered?.substituteTeacherId ?? slot.teacherId;
    if (!busyByPeriod.has(slot.periodId)) busyByPeriod.set(slot.periodId, new Set());
    busyByPeriod.get(slot.periodId)!.add(effectiveTeacher);
  }

  const existingBySlot = new Map(
    data.arrangements
      .filter((a) => a.arrangementDate === dateIso)
      .map((a) => [a.timetableSlotId, a] as const)
  );

  const result: Arrangement[] = [];
  const claimedThisRun = new Map<string, Set<string>>();

  for (const gap of gaps) {
    const existing = existingBySlot.get(gap.id);
    if (existing?.status === 'confirmed') {
      result.push(existing);
      continue;
    }

    const candidates = rankCandidates(
      data.teachers,
      gap,
      absentIds,
      busyByPeriod,
      confirmedElsewhere,
      claimedThisRun
    );

    const best = candidates[0] ?? null;
    if (best) {
      if (!claimedThisRun.has(best)) claimedThisRun.set(best, new Set());
      claimedThisRun.get(best)!.add(gap.periodId);
    }

    result.push({
      id: existing?.id ?? uid(),
      arrangementDate: dateIso,
      timetableSlotId: gap.id,
      originalTeacherId: gap.teacherId,
      substituteTeacherId: best,
      status: best ? 'suggested' : 'unassigned',
      suggestedCandidateIds: candidates,
    });
  }

  return result;
}

function rankCandidates(
  teachers: Teacher[],
  gap: TimetableSlot,
  absentIds: Set<string>,
  busyByPeriod: Map<string, Set<string>>,
  confirmedElsewhere: Map<string, Set<string>>,
  claimedThisRun: Map<string, Set<string>>
): string[] {
  const busy = busyByPeriod.get(gap.periodId) ?? new Set();

  const scored = teachers
    .filter((t) => t.id !== gap.teacherId)
    .filter((t) => !absentIds.has(t.id))
    .filter((t) => !busy.has(t.id))
    .filter((t) => !(confirmedElsewhere.get(t.id)?.has(gap.periodId)))
    .filter((t) => !(claimedThisRun.get(t.id)?.has(gap.periodId)))
    .map((t) => {
      const subjectMatch = t.subjectIds.includes(gap.subjectId) ? 0 : 1;
      return { id: t.id, score: subjectMatch, name: t.name };
    })
    .sort((a, b) => a.score - b.score || a.name.localeCompare(b.name));

  return scored.map((s) => s.id);
}

export function upsertArrangements(
  current: Arrangement[],
  dateIso: string,
  next: Arrangement[]
): Arrangement[] {
  const others = current.filter((a) => a.arrangementDate !== dateIso);
  return [...others, ...next];
}

export function teacherName(teachers: Teacher[], id: string | null | undefined): string {
  if (!id) return '—';
  return teachers.find((t) => t.id === id)?.name ?? 'Unknown';
}

export function subjectName(subjects: Subject[], id: string): string {
  return subjects.find((s) => s.id === id)?.name ?? 'Unknown';
}

export function className(classes: ClassSection[], id: string): string {
  return classes.find((c) => c.id === id)?.name ?? 'Unknown';
}

export function periodName(periods: Period[], id: string): string {
  return periods.find((p) => p.id === id)?.name ?? 'Unknown';
}

export function updateArrangementPick(
  arrangements: Arrangement[],
  id: string,
  substituteTeacherId: string | null,
  status: ArrangementStatus
): Arrangement[] {
  return arrangements.map((a) =>
    a.id === id ? { ...a, substituteTeacherId, status } : a
  );
}
