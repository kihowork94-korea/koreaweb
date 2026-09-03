import { defineSitemapEventHandler } from '#imports'

export default defineSitemapEventHandler(() => {
  const siteUrl = 'https://www.ariselab.kr'
  const locales = ['', '/en', '/zh', '/ja']
  const pages = [
    { path: '', priority: 1.0, changefreq: 'weekly' as const },
    { path: '/about', priority: 0.8, changefreq: 'monthly' as const },
    { path: '/members', priority: 0.9, changefreq: 'monthly' as const },
    { path: '/research', priority: 0.9, changefreq: 'monthly' as const },
    { path: '/publications', priority: 0.8, changefreq: 'monthly' as const },
    { path: '/projects', priority: 0.8, changefreq: 'monthly' as const },
    { path: '/news', priority: 0.7, changefreq: 'weekly' as const },
    { path: '/contact', priority: 0.6, changefreq: 'yearly' as const },
  ]

  return locales.flatMap(prefix => pages.map(page => ({
    loc: `${siteUrl}${prefix}${page.path || '/'}`,
    priority: page.priority,
    changefreq: page.changefreq,
  })))
})
