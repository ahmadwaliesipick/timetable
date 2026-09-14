export type UserRole = 'admin' | 'teacher';
export type ArrangementStatus = 'suggested' | 'confirmed' | 'unassigned';

export interface Teacher {
  id: string;
  name: string;
  email: string | null;
  subjectIds: string[];
  /** When false, absences do not generate cover arrangements. */
  needsCover: boolean;
}

export interface Subject {
  id: string;
  name: string;
  code: string | null;
}

export interface ClassSection {
  id: string;
  name: string;
  grade: string | null;
  /** When false, absences for this class do not generate cover arrangements. */
  needsCover: boolean;
}

export interface Period {
  id: string;
  name: string;
  sortOrder: number;
  startTime: string | null;
  endTime: string | null;
}

export interface TimetableSlot {
  id: string;
  dayOfWeek: number; // 1=Mon .. 7=Sun
  periodId: string;
  classSectionId: string;
  subjectId: string;
  teacherId: string;
  room: string | null;
}

export interface Absence {
  id: string;
  teacherId: string;
  absenceDate: string; // YYYY-MM-DD
  reason: string | null;
}

export interface Arrangement {
  id: string;
  arrangementDate: string;
  timetableSlotId: string;
  originalTeacherId: string;
  substituteTeacherId: string | null;
  status: ArrangementStatus;
  /** Ranked candidate ids from last suggestion run (UI helper, not persisted in Supabase). */
  suggestedCandidateIds?: string[];
}

export interface AppUser {
  id: string;
  email: string;
  fullName: string;
  role: UserRole;
  teacherId: string | null;
}

export interface SchoolData {
  teachers: Teacher[];
  subjects: Subject[];
  classSections: ClassSection[];
  periods: Period[];
  slots: TimetableSlot[];
  absences: Absence[];
  arrangements: Arrangement[];
}

export interface SchoolProfile {
  id: number;
  name: string;
  shortName: string;
  tagline: string;
  address: string;
  phone: string;
  email: string;
  website: string;
  mapsUrl: string;
  affiliation: string;
  directorate: string;
  establishedYear: number | null;
  about: string;
}

export const DEFAULT_SCHOOL_PROFILE: SchoolProfile = {
  id: 1,
  name: 'F.G Public School No.4 (Girls)',
  shortName: 'FGPS No.4 Girls',
  tagline: 'Lahore Cantt',
  address: 'Old Officers Colony, Lahore Cantt, Punjab, Pakistan',
  phone: '042-99220675',
  email: '',
  website: '',
  mapsUrl: 'https://share.google/51rHgYlhYsaagxAgW',
  affiliation: 'FBISE',
  directorate: 'FGEI (Cantonments/Garrisons), Lahore Region',
  establishedYear: null,
  about:
    'Federal Government Educational Institution for girls in Lahore Cantt. The school offers education from the early years through matriculation and is affiliated with FBISE, Islamabad.',
};

export const DAY_LABELS: Record<number, string> = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

export const DAY_SHORT_LABELS: Record<number, string> = {
  1: 'Mon',
  2: 'Tue',
  3: 'Wed',
  4: 'Thu',
  5: 'Fri',
  6: 'Sat',
  7: 'Sun',
};

export function uid(): string {
  return crypto.randomUUID();
}

export function todayIso(): string {
  const d = new Date();
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

/** JS getDay(): 0=Sun → ISO 1=Mon..7=Sun */
export function isoDayOfWeek(dateIso: string): number {
  const d = new Date(dateIso + 'T12:00:00');
  const js = d.getDay();
  return js === 0 ? 7 : js;
}
