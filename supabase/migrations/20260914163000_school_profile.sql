create table public.school_profile (
  id smallint primary key default 1 check (id = 1),
  name text not null,
  short_name text not null,
  tagline text,
  address text,
  phone text,
  email text,
  website text,
  maps_url text,
  affiliation text,
  directorate text,
  established_year int,
  about text,
  updated_at timestamptz not null default now()
);

alter table public.school_profile enable row level security;

create policy "anyone can read school_profile"
  on public.school_profile for select
  using (true);

create policy "admin write school_profile"
  on public.school_profile for all
  using (public.is_admin())
  with check (public.is_admin());

insert into public.school_profile (
  id, name, short_name, tagline, address, phone, email, website, maps_url,
  affiliation, directorate, established_year, about
) values (
  1,
  'F.G Public School No.4 (Girls)',
  'FGPS No.4 Girls',
  'Wah Cantt',
  'Sector 21-F, Wah Cantt, Rawalpindi, Punjab, Pakistan',
  '051-4623069',
  'fg.ghs4.1st.wah@gmail.com',
  'https://fgps04.zsportal.com/',
  'https://share.google/51rHgYlhYsaagxAgW',
  'FBISE',
  'FGEI (Cantonments/Garrisons)',
  1955,
  'Federal Government Educational Institution for girls in Wah Cantt. Founded in 1955, the school offers elementary and secondary education and is affiliated with FBISE, Islamabad.'
);
