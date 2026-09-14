-- School Timetable & Substitution Manager
-- Run in Supabase SQL Editor (or via supabase db push)

create extension if not exists "pgcrypto";

create type public.user_role as enum ('admin', 'teacher');
create type public.arrangement_status as enum ('suggested', 'confirmed', 'unassigned');

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  email text not null unique,
  full_name text not null,
  role public.user_role not null default 'teacher',
  teacher_id uuid,
  created_at timestamptz not null default now()
);

create table public.teachers (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text unique,
  created_at timestamptz not null default now()
);

alter table public.profiles
  add constraint profiles_teacher_id_fkey
  foreign key (teacher_id) references public.teachers (id) on delete set null;

create table public.subjects (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  code text,
  created_at timestamptz not null default now()
);

create table public.teacher_subjects (
  teacher_id uuid not null references public.teachers (id) on delete cascade,
  subject_id uuid not null references public.subjects (id) on delete cascade,
  primary key (teacher_id, subject_id)
);

create table public.class_sections (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  grade text,
  created_at timestamptz not null default now()
);

create table public.periods (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  sort_order int not null,
  start_time time,
  end_time time,
  unique (sort_order)
);

create table public.timetable_slots (
  id uuid primary key default gen_random_uuid(),
  day_of_week int not null check (day_of_week between 1 and 7),
  period_id uuid not null references public.periods (id) on delete cascade,
  class_section_id uuid not null references public.class_sections (id) on delete cascade,
  subject_id uuid not null references public.subjects (id) on delete restrict,
  teacher_id uuid not null references public.teachers (id) on delete restrict,
  room text,
  created_at timestamptz not null default now(),
  unique (day_of_week, period_id, class_section_id),
  unique (day_of_week, period_id, teacher_id)
);

create table public.absences (
  id uuid primary key default gen_random_uuid(),
  teacher_id uuid not null references public.teachers (id) on delete cascade,
  absence_date date not null,
  reason text,
  created_at timestamptz not null default now(),
  unique (teacher_id, absence_date)
);

create table public.arrangements (
  id uuid primary key default gen_random_uuid(),
  arrangement_date date not null,
  timetable_slot_id uuid not null references public.timetable_slots (id) on delete cascade,
  original_teacher_id uuid not null references public.teachers (id) on delete cascade,
  substitute_teacher_id uuid references public.teachers (id) on delete set null,
  status public.arrangement_status not null default 'unassigned',
  created_at timestamptz not null default now(),
  unique (arrangement_date, timetable_slot_id)
);

create index absences_date_idx on public.absences (absence_date);
create index arrangements_date_idx on public.arrangements (arrangement_date);
create index timetable_slots_teacher_idx on public.timetable_slots (teacher_id, day_of_week);

alter table public.profiles enable row level security;
alter table public.teachers enable row level security;
alter table public.subjects enable row level security;
alter table public.teacher_subjects enable row level security;
alter table public.class_sections enable row level security;
alter table public.periods enable row level security;
alter table public.timetable_slots enable row level security;
alter table public.absences enable row level security;
alter table public.arrangements enable row level security;

create or replace function public.is_admin()
returns boolean
language sql
stable
as $$
  select exists (
    select 1 from public.profiles p
    where p.id = auth.uid() and p.role = 'admin'
  );
$$;

create policy "profiles read own or admin"
  on public.profiles for select
  using (auth.uid() = id or public.is_admin());

create policy "profiles update own or admin"
  on public.profiles for update
  using (auth.uid() = id or public.is_admin());

-- Auto-create profile when a user signs up (role from user metadata, default teacher)
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  meta_role text := coalesce(new.raw_user_meta_data->>'role', 'teacher');
  resolved_role public.user_role := 'teacher';
begin
  if meta_role = 'admin' then
    resolved_role := 'admin';
  end if;

  insert into public.profiles (id, email, full_name, role)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'full_name', split_part(new.email, '@', 1)),
    resolved_role
  );
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

create policy "authenticated read teachers"
  on public.teachers for select to authenticated using (true);
create policy "admin write teachers"
  on public.teachers for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read subjects"
  on public.subjects for select to authenticated using (true);
create policy "admin write subjects"
  on public.subjects for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read teacher_subjects"
  on public.teacher_subjects for select to authenticated using (true);
create policy "admin write teacher_subjects"
  on public.teacher_subjects for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read class_sections"
  on public.class_sections for select to authenticated using (true);
create policy "admin write class_sections"
  on public.class_sections for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read periods"
  on public.periods for select to authenticated using (true);
create policy "admin write periods"
  on public.periods for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read timetable_slots"
  on public.timetable_slots for select to authenticated using (true);
create policy "admin write timetable_slots"
  on public.timetable_slots for all using (public.is_admin()) with check (public.is_admin());

create policy "authenticated read absences"
  on public.absences for select to authenticated using (true);
create policy "admin write absences"
  on public.absences for all using (public.is_admin()) with check (public.is_admin());
create policy "teachers insert own absence"
  on public.absences for insert to authenticated
  with check (
    exists (
      select 1 from public.profiles p
      where p.id = auth.uid()
        and p.teacher_id = absences.teacher_id
    )
  );

create policy "authenticated read arrangements"
  on public.arrangements for select to authenticated using (true);
create policy "admin write arrangements"
  on public.arrangements for all using (public.is_admin()) with check (public.is_admin());
