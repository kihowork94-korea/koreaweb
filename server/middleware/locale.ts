export default defineEventHandler((event) => {
  const url = getRequestURL(event)
  if (url.pathname !== '/' || !['GET', 'HEAD'].includes(event.method)) return

  const supported = ['ko', 'en', 'zh', 'ja']
  const saved = getCookie(event, 'i18n_locale')
  const country = getHeader(event, 'x-vercel-ip-country')?.toUpperCase()
  const countries: Record<string, string> = { KR: 'ko', JP: 'ja', CN: 'zh', TW: 'zh', HK: 'zh', MO: 'zh' }
  const browser = getHeader(event, 'accept-language')?.split(',')[0]?.split('-')[0]?.toLowerCase()
  const locale = saved && supported.includes(saved)
    ? saved
    : country ? (countries[country] || 'en') : supported.includes(browser || '') ? browser! : 'en'

  setHeader(event, 'Cache-Control', 'private, no-store')
  setHeader(event, 'Vary', 'Cookie, X-Vercel-IP-Country, Accept-Language')
  if (locale !== 'ko') return sendRedirect(event, `/${locale}${url.search}`, 302)
})
