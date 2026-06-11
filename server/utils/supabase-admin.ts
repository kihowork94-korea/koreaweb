// Returns headers for Supabase REST API with service_role key (bypasses RLS)
export function getAdminHeaders() {
  const config = useRuntimeConfig()
  const key = config.supabaseServiceKey as string
  return {
    'apikey': key,
    'Authorization': `Bearer ${key}`,
    'Content-Type': 'application/json',
    'Prefer': 'return=representation',
  }
}

export function getSupabaseRestUrl() {
  const config = useRuntimeConfig()
  return `${config.public.supabaseUrl}/rest/v1`
}

export const ALLOWED_ADMIN_TABLES = [
  'members',
  'publications',
  'research_areas',
  'projects',
  'news',
  'lab_info',
  'lab_history',
] as const

export type AllowedAdminTable = (typeof ALLOWED_ADMIN_TABLES)[number]
