import { transformRows } from '~/server/utils/db-transform'
import { latestPublications } from '~/data/latest-publications'

const ALLOWED_PUBLIC_TABLES = [
  'members',
  'publications',
  'research_areas',
  'projects',
  'news',
  'lab_info',
  'lab_history',
] as const

type AllowedPublicTable = (typeof ALLOWED_PUBLIC_TABLES)[number]

function getOrderParam(table: string): string {
  if (table === 'members') return 'sort_order'
  if (table === 'publications') return 'year.desc,id.desc'
  return 'id.desc'
}

export default defineEventHandler(async (event) => {
  const table = getRouterParam(event, 'table') as string

  if (!ALLOWED_PUBLIC_TABLES.includes(table as AllowedPublicTable)) {
    throw createError({ statusCode: 400, message: `Table '${table}' is not allowed` })
  }

  const config = useRuntimeConfig()
  const key = config.public.supabaseKey as string
  const baseUrl = `${config.public.supabaseUrl}/rest/v1`

  const orderParam = getOrderParam(table)

  const data = await $fetch<any[]>(`${baseUrl}/${table}?order=${orderParam}`, {
    headers: {
      'apikey': key,
      'Authorization': `Bearer ${key}`,
    },
  })

  const rows = transformRows(table, data)

  if (table === 'publications') {
    const normalizeTitle = (title: string) => title.toLowerCase().replace(/[^\p{L}\p{N}]/gu, '')
    const seenDois = new Set(rows.map((row: any) => row.doi?.toLowerCase()).filter(Boolean))
    const seenTitles = new Set(rows.map((row: any) => normalizeTitle(row.title || '')))

    for (const publication of latestPublications) {
      const doi = publication.doi.toLowerCase()
      const title = normalizeTitle(publication.title)
      if (!seenDois.has(doi) && !seenTitles.has(title)) {
        rows.push(publication)
        seenDois.add(doi)
        seenTitles.add(title)
      }
    }

    return rows.sort((a: any, b: any) =>
      b.year - a.year || (b.month ?? 0) - (a.month ?? 0) || String(b.id).localeCompare(String(a.id)),
    )
  }

  return rows
})
