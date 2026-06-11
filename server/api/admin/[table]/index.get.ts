import { ALLOWED_ADMIN_TABLES, getAdminHeaders, getSupabaseRestUrl } from '~/server/utils/supabase-admin'

export default defineEventHandler(async (event) => {
  const table = getRouterParam(event, 'table') as string

  if (!ALLOWED_ADMIN_TABLES.includes(table as any)) {
    throw createError({ statusCode: 400, message: `Table '${table}' is not allowed` })
  }

  const baseUrl = getSupabaseRestUrl()
  const headers = getAdminHeaders()

  const data = await $fetch<any[]>(`${baseUrl}/${table}?order=id`, {
    headers,
  })

  return data
})
