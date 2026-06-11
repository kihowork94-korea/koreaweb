// Public data fetching composables using server API routes
export const useLabMembers = () => useFetch('/api/lab/members', { key: 'members' })
export const useLabPublications = () => useFetch('/api/lab/publications', { key: 'publications' })
export const useLabResearch = () => useFetch('/api/lab/research_areas', { key: 'research_areas' })
export const useLabProjects = () => useFetch('/api/lab/projects', { key: 'projects' })
export const useLabNews = () => useFetch('/api/lab/news', { key: 'news' })
export const useLabInfo = () => useFetch('/api/lab/lab_info', { key: 'lab_info' })
export const useLabHistory = () => useFetch('/api/lab/lab_history', { key: 'lab_history' })
