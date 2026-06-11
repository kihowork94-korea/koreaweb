import { defineSitemapEventHandler } from '#imports'

export default defineSitemapEventHandler(async () => {
  const now = new Date().toISOString()

  // 지원 언어 목록 (기본 언어 ko 제외)
  const locales = ['en', 'ja', 'zh', 'es', 'fr', 'de', 'pt', 'vi', 'th', 'id', 'hi', 'ar', 'it', 'nl', 'pl', 'ru']

  // 메인 페이지들
  const mainPages = [
    { path: '/', priority: 1.0, changefreq: 'daily' },
    { path: '/services', priority: 0.9, changefreq: 'weekly' },
    { path: '/recruitment', priority: 0.8, changefreq: 'weekly' },
    { path: '/news', priority: 0.7, changefreq: 'daily' },
    { path: '/blogs', priority: 0.7, changefreq: 'daily' },
    { path: '/branding', priority: 0.6, changefreq: 'monthly' },
    { path: '/members', priority: 0.6, changefreq: 'monthly' },
    { path: '/tools', priority: 0.95, changefreq: 'weekly' },
  ]

  // 도구 페이지들
  const toolPages = [
    { path: '/tools/json', priority: 0.9 },
    { path: '/tools/markdown', priority: 0.9 },
    { path: '/tools/mermaid', priority: 0.9 },
    { path: '/tools/jwt', priority: 0.9 },
    { path: '/tools/html', priority: 0.85 },
    { path: '/tools/csv', priority: 0.85 },
    { path: '/tools/sql', priority: 0.85 },
    { path: '/tools/base64', priority: 0.85 },
    { path: '/tools/timestamp', priority: 0.85 },
    { path: '/tools/url', priority: 0.85 },
    { path: '/tools/image-compress', priority: 0.85 },
    { path: '/tools/uuid', priority: 0.85 },
    { path: '/tools/qrcode', priority: 0.85 },
    { path: '/tools/regex', priority: 0.85 },
    { path: '/tools/xml', priority: 0.8 },
    { path: '/tools/lottie', priority: 0.8 },
    { path: '/tools/html-beautify', priority: 0.8 },
    { path: '/tools/http-status', priority: 0.8 },
    { path: '/tools/yaml-json', priority: 0.8 },
    { path: '/tools/csv-to-json', priority: 0.8 },
    { path: '/tools/json-to-csv', priority: 0.8 },
    { path: '/tools/image-base64', priority: 0.8 },
    { path: '/tools/hash', priority: 0.8 },
    { path: '/tools/password', priority: 0.8 },
    { path: '/tools/diff', priority: 0.8 },
    { path: '/tools/color', priority: 0.8 },
    { path: '/tools/gradient', priority: 0.8 },
    { path: '/tools/favicon', priority: 0.8 },
  ]

  const allPages = [...mainPages, ...toolPages]
  const urls: Array<{
    loc: string
    lastmod: string
    changefreq: string
    priority: number
    alternatives?: Array<{ hreflang: string; href: string }>
  }> = []

  // 각 페이지에 대해 기본 언어(ko) + 다른 언어 버전 생성
  for (const page of allPages) {
    const changefreq = 'changefreq' in page ? page.changefreq : 'weekly'

    // hreflang alternatives 생성
    const alternatives = [
      { hreflang: 'ko', href: page.path },
      ...locales.map((locale) => ({
        hreflang: locale,
        href: `/${locale}${page.path}`,
      })),
      { hreflang: 'x-default', href: page.path },
    ]

    // 기본 언어 (ko) - prefix 없음
    urls.push({
      loc: page.path,
      lastmod: now,
      changefreq,
      priority: page.priority,
      alternatives,
    })

    // 다른 언어들 - prefix 있음
    for (const locale of locales) {
      urls.push({
        loc: `/${locale}${page.path}`,
        lastmod: now,
        changefreq,
        priority: page.priority * 0.9, // 다른 언어는 약간 낮은 우선순위
        alternatives,
      })
    }
  }

  return urls
})
