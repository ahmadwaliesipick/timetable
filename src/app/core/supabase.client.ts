import { createClient, SupabaseClient } from '@supabase/supabase-js';
import { environment } from '../../environments/environment';

let client: SupabaseClient | null = null;

export function isSupabaseConfigured(): boolean {
  return (
    !environment.demoMode &&
    !!environment.supabaseUrl?.trim() &&
    !!environment.supabaseAnonKey?.trim()
  );
}

export function getSupabase(): SupabaseClient {
  if (!isSupabaseConfigured()) {
    throw new Error('Supabase is not configured. Set supabaseUrl and supabaseAnonKey.');
  }
  if (!client) {
    client = createClient(environment.supabaseUrl, environment.supabaseAnonKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
      },
    });
  }
  return client;
}
