import {
  Arrangement,
  ArrangementStatus,
  ClassSection,
  isoDayOfWeek,
  SchoolData,
  Subject,
  Teacher,
  TimetableSlot,
  uid,
} from './models';

/**
 * Semi-auto substitute ranking for a date.
 * Fairness: same subject preferred, then lighter day load + fewer covers already assigned.
 * Skips absences where the teacher or class has needsCover turned off.
 */
export function suggestArrangements(data: SchoolData, dateIso: string): Arrangement[] {
  const day = isoDayOfWeek(dateIso);
  const absentIds = new Set(
    data.absences.filter((a) => a.absenceDate === dateIso).map((a) => a.teacherId)
  );

  const daySlots = data.slots.filter((s) => s.dayOfWeek === day);
  // Only create cover for slots where BOTH teacher and class still need cover.
  const gaps = daySlots.filter(
    (s) => absentIds.has(s.teacherId) && slotNeedsCover(data, s)
  );

  /** Confirmed cover periods for a substitute on this date */
  const confirmedElsewhere = new Map<string, Set<string>>();
  /** How many covers each teacher already has confirmed today */
  const confirmedCoverCount = new Map<string, number>();

  for (const arr of data.arrangements) {
    if (arr.arrangementDate !== dateIso || arr.status !== 'confirmed' || !arr.substituteTeacherId) {
      continue;
    }
    const slot = data.slots.find((s) => s.id === arr.timetableSlotId);
    if (!slot || !slotNeedsCover(data, slot)) continue;
    if (!confirmedElsewhere.has(arr.substituteTeacherId)) {
      confirmedElsewhere.set(arr.substituteTeacherId, new Set());
    }
    confirmedElsewhere.get(arr.substituteTeacherId)!.add(slot.periodId);
    confirmedCoverCount.set(
      arr.substituteTeacherId,
      (confirmedCoverCount.get(arr.substituteTeacherId) ?? 0) + 1
    );
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

  /** Own teaching periods on this weekday (master timetable). */
  const ownPeriodsToday = new Map<string, number>();
  for (const slot of daySlots) {
    ownPeriodsToday.set(slot.teacherId, (ownPeriodsToday.get(slot.teacherId) ?? 0) + 1);
  }

  const existingBySlot = new Map(
    data.arrangements
      .filter((a) => a.arrangementDate === dateIso)
      .map((a) => [a.timetableSlotId, a] as const)
  );

  const result: Arrangement[] = [];
  /** Periods claimed by a teacher during this suggestion pass */
  const claimedThisRun = new Map<string, Set<string>>();
  /** Covers assigned during this suggestion pass (for fairness) */
  const coversThisRun = new Map<string, number>();

  // Process scarcer subjects first so specialists aren't all taken by early light gaps
  const orderedGaps = [...gaps].sort((a, b) => {
    const aSpec = data.teachers.filter((t) => t.subjectIds.includes(a.subjectId)).length;
    const bSpec = data.teachers.filter((t) => t.subjectIds.includes(b.subjectId)).length;
    return aSpec - bSpec;
  });

  for (const gap of orderedGaps) {
    if (!slotNeedsCover(data, gap)) continue;

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
      claimedThisRun,
      ownPeriodsToday,
      confirmedCoverCount,
      coversThisRun
    );

    const best = candidates[0] ?? null;
    if (best) {
      if (!claimedThisRun.has(best)) claimedThisRun.set(best, new Set());
      claimedThisRun.get(best)!.add(gap.periodId);
      coversThisRun.set(best, (coversThisRun.get(best) ?? 0) + 1);
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

  // Keep UI order stable by period then class
  result.sort((a, b) => {
    const sa = data.slots.find((s) => s.id === a.timetableSlotId);
    const sb = data.slots.find((s) => s.id === b.timetableSlotId);
    const pa = data.periods.find((p) => p.id === sa?.periodId)?.sortOrder ?? 0;
    const pb = data.periods.find((p) => p.id === sb?.periodId)?.sortOrder ?? 0;
    return pa - pb || (sa?.classSectionId ?? '').localeCompare(sb?.classSectionId ?? '');
  });

  return result;
}

/** True when both the teacher and the class still want cover arrangements. */
export function slotNeedsCover(data: SchoolData, slot: TimetableSlot): boolean {
  const teacher = data.teachers.find((t) => t.id === slot.teacherId);
  const classSection = data.classSections.find((c) => c.id === slot.classSectionId);
  if (teacher?.needsCover === false) return false;
  if (classSection?.needsCover === false) return false;
  return true;
}

/** Absent timetable slots skipped because teacher/class has cover turned off. */
export function countSkippedCoverGaps(data: SchoolData, dateIso: string): number {
  const day = isoDayOfWeek(dateIso);
  const absentIds = new Set(
    data.absences.filter((a) => a.absenceDate === dateIso).map((a) => a.teacherId)
  );
  return data.slots.filter(
    (s) => s.dayOfWeek === day && absentIds.has(s.teacherId) && !slotNeedsCover(data, s)
  ).length;
}

function rankCandidates(
  teachers: Teacher[],
  gap: TimetableSlot,
  absentIds: Set<string>,
  busyByPeriod: Map<string, Set<string>>,
  confirmedElsewhere: Map<string, Set<string>>,
  claimedThisRun: Map<string, Set<string>>,
  ownPeriodsToday: Map<string, number>,
  confirmedCoverCount: Map<string, number>,
  coversThisRun: Map<string, number>
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
      const ownLoad = ownPeriodsToday.get(t.id) ?? 0;
      const covers =
        (confirmedCoverCount.get(t.id) ?? 0) + (coversThisRun.get(t.id) ?? 0);
      // Total day burden: own classes + covers already / being given today
      const dayBurden = ownLoad + covers;
      return {
        id: t.id,
        subjectMatch,
        dayBurden,
        covers,
        name: t.name,
      };
    })
    .sort(
      (a, b) =>
        a.subjectMatch - b.subjectMatch ||
        a.dayBurden - b.dayBurden ||
        a.covers - b.covers ||
        a.name.localeCompare(b.name)
    );

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

export function periodName(periods: import('./models').Period[], id: string): string {
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
