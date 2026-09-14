update public.school_profile
set
  tagline = 'Lahore Cantt',
  address = 'Old Officers Colony, Lahore Cantt, Punjab, Pakistan',
  phone = '042-99220675',
  email = null,
  website = null,
  maps_url = 'https://share.google/51rHgYlhYsaagxAgW',
  affiliation = 'FBISE',
  directorate = 'FGEI (Cantonments/Garrisons), Lahore Region',
  established_year = null,
  about = 'Federal Government Educational Institution for girls in Lahore Cantt. The school offers education from the early years through matriculation and is affiliated with FBISE, Islamabad.',
  updated_at = now()
where id = 1;
