import { suggestArrangements } from './suggestion.logic';
import { createSeedData } from './seed-data';
import { Absence, uid } from './models';

describe('suggestArrangements', () => {
  it('suggests a free teacher for absent slots on Monday', () => {
    const data = createSeedData();
    const monday = '2026-09-14';
    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    });

    const result = suggestArrangements(data, monday);
    expect(result.length).toBeGreaterThan(0);
    expect(result.every((a) => a.originalTeacherId === 't-ahmed')).toBeTrue();
    expect(result.some((a) => a.substituteTeacherId && a.status === 'suggested')).toBeTrue();
  });

  it('prefers lighter-loaded free teachers when subjects match equally', () => {
    const data = createSeedData();
    const monday = '2026-09-14';

    // Both Sara and Fatima can cover History; Fatima already has more Monday load in seed.
    // Make Omar able to teach History too, but give him zero Monday slots so he is lightest.
    const omar = data.teachers.find((t) => t.id === 't-omar')!;
    omar.subjectIds = [...omar.subjectIds, 's-hist'];

    // Remove Omar's Monday slots so his day burden is 0
    data.slots = data.slots.filter(
      (s) => !(s.dayOfWeek === 1 && s.teacherId === 't-omar')
    );

    data.absences.push({
      id: uid(),
      teacherId: 't-fatima',
      absenceDate: monday,
      reason: 'Leave',
    } as Absence);

    const result = suggestArrangements(data, monday);
    const histGaps = result.filter((a) => {
      const slot = data.slots.find((s) => s.id === a.timetableSlotId);
      return slot?.subjectId === 's-hist';
    });

    expect(histGaps.length).toBeGreaterThan(0);
    // Omar has subject match + lowest day burden among free History teachers
    expect(histGaps[0].substituteTeacherId).toBe('t-omar');
  });

  it('spreads multiple covers across teachers instead of stacking on one', () => {
    const data = createSeedData();
    const monday = '2026-09-14';

    // Give Sara and Fatima Math so both can cover Ahmed's Math gaps
    data.teachers.find((t) => t.id === 't-sara')!.subjectIds = ['s-eng', 's-math'];
    data.teachers.find((t) => t.id === 't-fatima')!.subjectIds = ['s-hist', 's-math'];
    data.teachers.find((t) => t.id === 't-omar')!.subjectIds = ['s-sci', 's-math'];

    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    });

    const result = suggestArrangements(data, monday);
    const subs = result
      .map((a) => a.substituteTeacherId)
      .filter((id): id is string => !!id);

    expect(subs.length).toBeGreaterThan(1);
    // Not all covers should land on the same teacher when others are free
    const unique = new Set(subs);
    expect(unique.size).toBeGreaterThan(1);
  });

  it('skips cover arrangements for teachers marked needsCover false', () => {
    const data = createSeedData();
    const monday = '2026-09-14';
    data.teachers.find((t) => t.id === 't-ahmed')!.needsCover = false;
    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'No cover needed',
    });

    const result = suggestArrangements(data, monday);
    expect(result.every((a) => a.originalTeacherId !== 't-ahmed')).toBeTrue();
  });

  it('skips cover arrangements for classes marked needsCover false', () => {
    const data = createSeedData();
    const monday = '2026-09-14';
    data.classSections.find((c) => c.id === 'c-7a')!.needsCover = false;
    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    });

    const result = suggestArrangements(data, monday);
    const classIds = result.map((a) => {
      const slot = data.slots.find((s) => s.id === a.timetableSlotId);
      return slot?.classSectionId;
    });
    expect(classIds.every((id) => id !== 'c-7a')).toBeTrue();
    // Ahmed still has 8A on Monday which should still get cover
    expect(classIds.some((id) => id === 'c-8a')).toBeTrue();
  });

  it('does not suggest teachers with needsCover false as substitutes', () => {
    const data = createSeedData();
    const monday = '2026-09-14';
    data.teachers.find((t) => t.id === 't-sara')!.needsCover = false;
    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    });

    const result = suggestArrangements(data, monday);
    expect(result.length).toBeGreaterThan(0);
    expect(result.every((a) => a.substituteTeacherId !== 't-sara')).toBeTrue();
    expect(
      result.every((a) => !(a.suggestedCandidateIds ?? []).includes('t-sara'))
    ).toBeTrue();
  });

  it('excludes every teacher with needsCover false from the substitute pool', () => {
    const data = createSeedData();
    const monday = '2026-09-14';
    data.teachers.find((t) => t.id === 't-sara')!.needsCover = false;
    data.teachers.find((t) => t.id === 't-omar')!.needsCover = false;
    data.teachers.find((t) => t.id === 't-fatima')!.subjectIds = ['s-hist', 's-math'];
    data.absences.push({
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    });

    const result = suggestArrangements(data, monday);
    expect(result.length).toBeGreaterThan(0);
    for (const a of result) {
      expect(a.substituteTeacherId).not.toBe('t-sara');
      expect(a.substituteTeacherId).not.toBe('t-omar');
      expect(a.suggestedCandidateIds ?? []).not.toContain('t-sara');
      expect(a.suggestedCandidateIds ?? []).not.toContain('t-omar');
    }
  });
});
