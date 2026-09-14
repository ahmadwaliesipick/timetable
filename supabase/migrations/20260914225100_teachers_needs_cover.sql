alter table public.teachers
  add column if not exists needs_cover boolean not null default true;

comment on column public.teachers.needs_cover is
  'When false, absences for this teacher do not generate cover arrangements.';
