# Timetable Desk

Angular app for school weekly timetables and **semi-automatic daily teacher cover**, backed by **Supabase** (Postgres + Auth).

## 1. Create a Supabase project

1. Go to [https://supabase.com](https://supabase.com) → New project  
2. Open **SQL Editor** → run [`supabase/schema.sql`](supabase/schema.sql)  
3. Run [`supabase/seed.sql`](supabase/seed.sql) for sample periods/teachers/Monday slots  
4. **Authentication → Providers**: Email enabled  
5. Optional: disable “Confirm email” under Auth settings while testing  

## 2. Add API keys to the app

Copy **Project URL** and **anon public** key from **Project Settings → API** into:

[`src/environments/environment.development.ts`](src/environments/environment.development.ts)

```ts
export const environment = {
  production: false,
  demoMode: false,
  supabaseUrl: 'https://YOUR_PROJECT.supabase.co',
  supabaseAnonKey: 'YOUR_ANON_KEY',
};
```

If URL/key are empty (or `demoMode: true`), the app falls back to **local demo** mode.

## 3. Create the first admin

1. `npm start` → open the app  
2. **Create account** with role **Admin**  
3. Sign in  
4. Link teacher users later: set `profiles.teacher_id` in Supabase to a row in `teachers`

Or create the user in **Authentication → Users**, then set `profiles.role = 'admin'` in Table Editor.

## 4. Run locally

```bash
npm install
npm start
```

Open http://localhost:4200

## How data flows

```text
Angular UI  →  Supabase Auth (JWT)
            →  Postgres tables (RLS: admin write, all authenticated read)
Suggestion ranking stays in the browser (same subject + free period).
```

## Deploy frontend (Vercel)

Build output: `dist/web/browser`  
Set the same `supabaseUrl` / `supabaseAnonKey` in production environment file or CI env injection before build.

## Stack

- Angular 19  
- Supabase Auth + Postgres (`@supabase/supabase-js`)  
- Suggestion engine: `src/app/core/suggestion.logic.ts`
