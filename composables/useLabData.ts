// 클라이언트 사이드 네비게이션 시 캐시된 데이터를 재사용 (재요청 방지)
function cached(key: string) {
  return (k: string, nuxtApp: ReturnType<typeof useNuxtApp>) =>
    nuxtApp.payload.data[k] ?? (nuxtApp.static as any).data?.[k]
}

// Public data fetching composables using server API routes
export const useLabMembers      = () => useFetch('/api/lab/members',       { key: 'members',       getCachedData: cached('members') })
export const useLabPublications = () => useFetch('/api/lab/publications',   { key: 'publications',  getCachedData: cached('publications') })
export const useLabResearch     = () => useFetch('/api/lab/research_areas', { key: 'research_areas', getCachedData: cached('research_areas') })
export const useLabProjects     = () => useFetch('/api/lab/projects',       { key: 'projects',      getCachedData: cached('projects') })
export const useLabNews         = () => useFetch('/api/lab/news',           { key: 'news',          getCachedData: cached('news') })
export const useLabInfo         = () => useFetch('/api/lab/lab_info',       { key: 'lab_info',      getCachedData: cached('lab_info') })
export const useLabHistory      = () => useFetch('/api/lab/lab_history',    { key: 'lab_history',   getCachedData: cached('lab_history') })
