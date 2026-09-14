import { SupabaseClient } from '@supabase/supabase-js';
import {
  Absence,
  Arrangement,
  ArrangementStatus,
  AppUser,
  ClassSection,
  Period,
  SchoolData,
  SchoolProfile,
  Subject,
  Teacher,
  TimetableSlot,
  UserRole,
} from './models';

type TeacherRow = { id: string; name: string; email: string | null };
type SubjectRow = { id: string; name: string; code: string | null };
type ClassRow = { id: string; name: string; grade: string | null };
type PeriodRow = {
  id: string;
  name: string;
  sort_order: number;
  start_time: string | null;
  end_time: string | null;
};
type SlotRow = {
  id: string;
  day_of_week: number;
  period_id: string;
  class_section_id: string;
  subject_id: string;
  teacher_id: string;
  room: string | null;
};
type AbsenceRow = {
  id: string;
  teacher_id: string;
  absence_date: string;
  reason: string | null;
};
type ArrangementRow = {
  id: string;
  arrangement_date: string;
  timetable_slot_id: string;
  original_teacher_id: string;
  substitute_teacher_id: string | null;
  status: ArrangementStatus;
};
type TeacherSubjectRow = { teacher_id: string; subject_id: string };
type SchoolProfileRow = {
  id: number;
  name: string;
  short_name: string;
  tagline: string | null;
  address: string | null;
  phone: string | null;
  email: string | null;
  website: string | null;
  maps_url: string | null;
  affiliation: string | null;
  directorate: string | null;
  established_year: number | null;
  about: string | null;
};

function mapSchoolProfile(row: SchoolProfileRow): SchoolProfile {
  return {
    id: row.id,
    name: row.name,
    shortName: row.short_name,
    tagline: row.tagline ?? '',
    address: row.address ?? '',
    phone: row.phone ?? '',
    email: row.email ?? '',
    website: row.website ?? '',
    mapsUrl: row.maps_url ?? '',
    affiliation: row.affiliation ?? '',
    directorate: row.directorate ?? '',
    establishedYear: row.established_year,
    about: row.about ?? '',
  };
}

function assertOk<T>(label: string, error: { message: string } | null, data: T): T {
  if (error) throw new Error(`${label}: ${error.message}`);
  return data;
}

export async function fetchSchoolProfile(client: SupabaseClient): Promise<SchoolProfile | null> {
  const { data, error } = await client.from('school_profile').select('*').eq('id', 1).maybeSingle();
  if (error) throw new Error(`school_profile: ${error.message}`);
  return data ? mapSchoolProfile(data as SchoolProfileRow) : null;
}

export async function saveSchoolProfile(
  client: SupabaseClient,
  input: SchoolProfile
): Promise<SchoolProfile> {
  const payload = {
    id: 1,
    name: input.name,
    short_name: input.shortName,
    tagline: input.tagline || null,
    address: input.address || null,
    phone: input.phone || null,
    email: input.email || null,
    website: input.website || null,
    maps_url: input.mapsUrl || null,
    affiliation: input.affiliation || null,
    directorate: input.directorate || null,
    established_year: input.establishedYear,
    about: input.about || null,
    updated_at: new Date().toISOString(),
  };
  const { data, error } = await client
    .from('school_profile')
    .upsert(payload)
    .select('*')
    .single();
  if (error) throw new Error(error.message);
  return mapSchoolProfile(data as SchoolProfileRow);
}

export async function fetchProfiles(client: SupabaseClient): Promise<AppUser[]> {
  const { data, error } = await client
    .from('profiles')
    .select('id,email,full_name,role,teacher_id')
    .order('full_name');
  if (error) throw new Error(error.message);
  return (data ?? []).map((row) => ({
    id: row.id as string,
    email: row.email as string,
    fullName: row.full_name as string,
    role: row.role as UserRole,
    teacherId: (row.teacher_id as string | null) ?? null,
  }));
}

export async function updateProfileRole(
  client: SupabaseClient,
  userId: string,
  role: UserRole
): Promise<void> {
  const { error } = await client.from('profiles').update({ role }).eq('id', userId);
  if (error) throw new Error(error.message);
}

export async function fetchSchoolData(client: SupabaseClient): Promise<SchoolData> {
  const [
    teachersRes,
    subjectsRes,
    classesRes,
    periodsRes,
    slotsRes,
    absencesRes,
    arrangementsRes,
    linksRes,
  ] = await Promise.all([
    client.from('teachers').select('id,name,email').order('name'),
    client.from('subjects').select('id,name,code').order('name'),
    client.from('class_sections').select('id,name,grade').order('name'),
    client.from('periods').select('id,name,sort_order,start_time,end_time').order('sort_order'),
    client.from('timetable_slots').select('*'),
    client.from('absences').select('*').order('absence_date', { ascending: false }),
    client.from('arrangements').select('*'),
    client.from('teacher_subjects').select('teacher_id,subject_id'),
  ]);

  const teachers = assertOk('teachers', teachersRes.error, teachersRes.data as TeacherRow[]);
  const subjects = assertOk('subjects', subjectsRes.error, subjectsRes.data as SubjectRow[]);
  const classSections = assertOk('classes', classesRes.error, classesRes.data as ClassRow[]);
  const periods = assertOk('periods', periodsRes.error, periodsRes.data as PeriodRow[]);
  const slots = assertOk('slots', slotsRes.error, slotsRes.data as SlotRow[]);
  const absences = assertOk('absences', absencesRes.error, absencesRes.data as AbsenceRow[]);
  const arrangements = assertOk(
    'arrangements',
    arrangementsRes.error,
    arrangementsRes.data as ArrangementRow[]
  );
  const links = assertOk('teacher_subjects', linksRes.error, linksRes.data as TeacherSubjectRow[]);

  const subjectsByTeacher = new Map<string, string[]>();
  for (const link of links) {
    const list = subjectsByTeacher.get(link.teacher_id) ?? [];
    list.push(link.subject_id);
    subjectsByTeacher.set(link.teacher_id, list);
  }

  return {
    teachers: teachers.map(
      (t): Teacher => ({
        id: t.id,
        name: t.name,
        email: t.email,
        subjectIds: subjectsByTeacher.get(t.id) ?? [],
      })
    ),
    subjects: subjects.map(
      (s): Subject => ({ id: s.id, name: s.name, code: s.code })
    ),
    classSections: classSections.map(
      (c): ClassSection => ({ id: c.id, name: c.name, grade: c.grade })
    ),
    periods: periods.map(
      (p): Period => ({
        id: p.id,
        name: p.name,
        sortOrder: p.sort_order,
        startTime: p.start_time,
        endTime: p.end_time,
      })
    ),
    slots: slots.map(
      (s): TimetableSlot => ({
        id: s.id,
        dayOfWeek: s.day_of_week,
        periodId: s.period_id,
        classSectionId: s.class_section_id,
        subjectId: s.subject_id,
        teacherId: s.teacher_id,
        room: s.room,
      })
    ),
    absences: absences.map(
      (a): Absence => ({
        id: a.id,
        teacherId: a.teacher_id,
        absenceDate: a.absence_date,
        reason: a.reason,
      })
    ),
    arrangements: arrangements.map(
      (a): Arrangement => ({
        id: a.id,
        arrangementDate: a.arrangement_date,
        timetableSlotId: a.timetable_slot_id,
        originalTeacherId: a.original_teacher_id,
        substituteTeacherId: a.substitute_teacher_id,
        status: a.status,
      })
    ),
  };
}

export async function saveTeacher(
  client: SupabaseClient,
  input: Omit<Teacher, 'id'> & { id?: string }
): Promise<Teacher> {
  const payload = { name: input.name, email: input.email };
  let id = input.id;

  if (id) {
    const { error } = await client.from('teachers').update(payload).eq('id', id);
    if (error) throw new Error(error.message);
  } else {
    const { data, error } = await client.from('teachers').insert(payload).select('id').single();
    if (error) throw new Error(error.message);
    id = data.id as string;
  }

  await client.from('teacher_subjects').delete().eq('teacher_id', id);
  if (input.subjectIds.length) {
    const { error } = await client.from('teacher_subjects').insert(
      input.subjectIds.map((subject_id) => ({ teacher_id: id!, subject_id }))
    );
    if (error) throw new Error(error.message);
  }

  return { id: id!, name: input.name, email: input.email, subjectIds: input.subjectIds };
}

export async function deleteTeacher(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('teachers').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function saveSubject(
  client: SupabaseClient,
  input: Omit<Subject, 'id'> & { id?: string }
): Promise<Subject> {
  const payload = { name: input.name, code: input.code };
  if (input.id) {
    const { error } = await client.from('subjects').update(payload).eq('id', input.id);
    if (error) throw new Error(error.message);
    return { id: input.id, ...payload };
  }
  const { data, error } = await client.from('subjects').insert(payload).select('id').single();
  if (error) throw new Error(error.message);
  return { id: data.id as string, ...payload };
}

export async function deleteSubject(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('subjects').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function saveClass(
  client: SupabaseClient,
  input: Omit<ClassSection, 'id'> & { id?: string }
): Promise<ClassSection> {
  const payload = { name: input.name, grade: input.grade };
  if (input.id) {
    const { error } = await client.from('class_sections').update(payload).eq('id', input.id);
    if (error) throw new Error(error.message);
    return { id: input.id, ...payload };
  }
  const { data, error } = await client.from('class_sections').insert(payload).select('id').single();
  if (error) throw new Error(error.message);
  return { id: data.id as string, ...payload };
}

export async function deleteClass(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('class_sections').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function savePeriod(
  client: SupabaseClient,
  input: Omit<Period, 'id'> & { id?: string }
): Promise<Period> {
  const payload = {
    name: input.name,
    sort_order: input.sortOrder,
    start_time: input.startTime,
    end_time: input.endTime,
  };
  if (input.id) {
    const { error } = await client.from('periods').update(payload).eq('id', input.id);
    if (error) throw new Error(error.message);
    return {
      id: input.id,
      name: input.name,
      sortOrder: input.sortOrder,
      startTime: input.startTime,
      endTime: input.endTime,
    };
  }
  const { data, error } = await client.from('periods').insert(payload).select('id').single();
  if (error) throw new Error(error.message);
  return {
    id: data.id as string,
    name: input.name,
    sortOrder: input.sortOrder,
    startTime: input.startTime,
    endTime: input.endTime,
  };
}

export async function deletePeriod(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('periods').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function saveSlot(
  client: SupabaseClient,
  input: Omit<TimetableSlot, 'id'> & { id?: string }
): Promise<TimetableSlot> {
  const payload = {
    day_of_week: input.dayOfWeek,
    period_id: input.periodId,
    class_section_id: input.classSectionId,
    subject_id: input.subjectId,
    teacher_id: input.teacherId,
    room: input.room,
  };
  if (input.id) {
    const { error } = await client.from('timetable_slots').update(payload).eq('id', input.id);
    if (error) throw new Error(error.message);
    return { id: input.id, ...input };
  }
  const { data, error } = await client.from('timetable_slots').insert(payload).select('id').single();
  if (error) throw new Error(error.message);
  return { id: data.id as string, ...input };
}

export async function deleteSlot(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('timetable_slots').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function insertAbsence(
  client: SupabaseClient,
  teacherId: string,
  absenceDate: string,
  reason: string | null
): Promise<Absence> {
  const { data, error } = await client
    .from('absences')
    .insert({ teacher_id: teacherId, absence_date: absenceDate, reason })
    .select('id,teacher_id,absence_date,reason')
    .single();
  if (error) throw new Error(error.message);
  return {
    id: data.id,
    teacherId: data.teacher_id,
    absenceDate: data.absence_date,
    reason: data.reason,
  };
}

export async function deleteAbsence(client: SupabaseClient, id: string): Promise<void> {
  const { error } = await client.from('absences').delete().eq('id', id);
  if (error) throw new Error(error.message);
}

export async function replaceArrangementsForDate(
  client: SupabaseClient,
  dateIso: string,
  arrangements: Arrangement[]
): Promise<Arrangement[]> {
  const { error: delError } = await client
    .from('arrangements')
    .delete()
    .eq('arrangement_date', dateIso);
  if (delError) throw new Error(delError.message);

  if (!arrangements.length) return [];

  const rows = arrangements.map((a) => ({
    id: a.id,
    arrangement_date: a.arrangementDate,
    timetable_slot_id: a.timetableSlotId,
    original_teacher_id: a.originalTeacherId,
    substitute_teacher_id: a.substituteTeacherId,
    status: a.status,
  }));

  const { data, error } = await client.from('arrangements').insert(rows).select('*');
  if (error) throw new Error(error.message);

  return (data as ArrangementRow[]).map((a) => ({
    id: a.id,
    arrangementDate: a.arrangement_date,
    timetableSlotId: a.timetable_slot_id,
    originalTeacherId: a.original_teacher_id,
    substituteTeacherId: a.substitute_teacher_id,
    status: a.status,
    suggestedCandidateIds: arrangements.find((x) => x.id === a.id)?.suggestedCandidateIds,
  }));
}

export async function updateArrangement(
  client: SupabaseClient,
  id: string,
  patch: Partial<Pick<Arrangement, 'substituteTeacherId' | 'status'>>
): Promise<void> {
  const payload: Record<string, unknown> = {};
  if (patch.substituteTeacherId !== undefined) {
    payload['substitute_teacher_id'] = patch.substituteTeacherId;
  }
  if (patch.status !== undefined) payload['status'] = patch.status;
  const { error } = await client.from('arrangements').update(payload).eq('id', id);
  if (error) throw new Error(error.message);
}

export async function confirmArrangementsForDate(
  client: SupabaseClient,
  dateIso: string
): Promise<void> {
  const { error } = await client
    .from('arrangements')
    .update({ status: 'confirmed' })
    .eq('arrangement_date', dateIso)
    .not('substitute_teacher_id', 'is', null);
  if (error) throw new Error(error.message);
}
