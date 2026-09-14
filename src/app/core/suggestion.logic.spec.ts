import { suggestArrangements } from './suggestion.logic';
import { createSeedData } from './seed-data';
import { Absence, uid } from './models';

describe('suggestArrangements', () => {
  it('suggests a free teacher for absent slots on Monday', () => {
    const data = createSeedData();
    // Pick a Monday date
    const monday = '2026-09-14';
    const absence: Absence = {
      id: uid(),
      teacherId: 't-ahmed',
      absenceDate: monday,
      reason: 'Sick',
    };
    data.absences.push(absence);

    const result = suggestArrangements(data, monday);
    expect(result.length).toBeGreaterThan(0);
    expect(result.every((a) => a.originalTeacherId === 't-ahmed')).toBeTrue();
    expect(result.some((a) => a.substituteTeacherId && a.status === 'suggested')).toBeTrue();
  });
});
