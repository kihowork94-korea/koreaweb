import { checkToken, ADMIN_COOKIE } from '../utils/admin-token'

export default defineEventHandler((event) => {
  const path = getRequestURL(event).pathname

  const isAdminPage = path.startsWith('/admin')
  const isAdminApi = path.startsWith('/api/admin')

  if (!isAdminPage && !isAdminApi) return

  // Allow login endpoints through without auth
  if (path === '/admin/login') return
  if (path === '/api/admin/login') return

  const token = getCookie(event, ADMIN_COOKIE)
  if (!token || !checkToken(token)) {
    if (isAdminApi) {
      throw createError({ statusCode: 401, message: 'Unauthorized' })
    }
    return sendRedirect(event, '/admin/login', 302)
  }
})
