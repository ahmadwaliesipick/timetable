alter table public.class_sections
  add column if not exists needs_cover boolean not null default true;

comment on column public.class_sections.needs_cover is
  'When false, periods for this class do not generate cover arrangements when a teacher is absent.';
