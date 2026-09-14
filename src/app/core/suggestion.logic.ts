import {
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

/**
 * Semi-auto substitute ranking for a date.
 * Fairness: same subject preferred, then lighter day load + fewer covers already assigned.
 */
export function suggestArrangements(data: SchoolData, dateIso: string): Arrangement[] {
  const day = isoDayOfWeek(dateIso);
  const absentIds = new Set(
    data.absences.filter((a) => a.absenceDate === dateIso).map((a) => a.teacherId)
  );
  const noCoverNeeded = new Set(
    data.teachers.filter((t) => t.needsCover === false).map((t) => t.id)
  );
  const classesNoCover = new Set(
    data.classSections.filter((c) => c.needsCover === false).map((c) => c.id)
  );

  const daySlots = data.slots.filter((s) => s.dayOfWeek === day);
  const gaps = daySlots.filter(
    (s) =>
      absentIds.has(s.teacherId) &&
      !noCoverNeeded.has(s.teacherId) &&
      !classesNoCover.has(s.classSectionId)
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
    if (!slot) continue;
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

  // Process heavier gaps first so subject specialists aren't all taken by early light gaps
  const orderedGaps = [...gaps].sort((a, b) => {
    const aSpec = data.teachers.filter((t) => t.subjectIds.includes(a.subjectId)).length;
    const bSpec = data.teachers.filter((t) => t.subjectIds.includes(b.subjectId)).length;
    return aSpec - bSpec;
  });

  for (const gap of orderedGaps) {
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
