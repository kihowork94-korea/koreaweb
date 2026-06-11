// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },

  // 개발 서버 설정
  devServer: {
    port: 3500,
  },

  // Vite 설정
  vite: {
    server: {
      hmr: {
        port: 25500,
      },
    },
    optimizeDeps: {
      exclude: ['monaco-editor'],
    },
    build: {
      sourcemap: false,
      chunkSizeWarningLimit: 1000,
    },
    esbuild: {
      keepNames: true,
      minifyIdentifiers: false,
    },
  },

  // Vercel SSR 배포용 설정
  nitro: {
    preset: 'vercel',
    compressPublicAssets: true,
  },

  // 보안 헤더
  routeRules: {
    '/**': {
      headers: {
        'X-Frame-Options': 'SAMEORIGIN',
        'X-Content-Type-Options': 'nosniff',
        'X-XSS-Protection': '1; mode=block',
        'Referrer-Policy': 'strict-origin-when-cross-origin',
      },
    },
  },

  modules: [
    '@nuxt/ui',
    '@nuxt/image',
    '@nuxtjs/i18n',
    '@pinia/nuxt',
    '@vueuse/nuxt',
    'nuxt-og-image',
    'nuxt-gtag',
    '@nuxtjs/sitemap',
    '@nuxtjs/robots',
  ],

  // Google Analytics 4
  gtag: {
    id: process.env.NUXT_PUBLIC_GA_ID || '',
    enabled: !!process.env.NUXT_PUBLIC_GA_ID,
  },

  // 사이트 기본 정보 (OG 이미지, sitemap용)
  site: {
    url: process.env.NUXT_PUBLIC_SITE_URL || 'https://TODO.ac.kr', // TODO: 실제 도메인으로 변경
    name: '이관희 연구실 — KU-KIST 융합대학원',
  },

  // Sitemap
  sitemap: {
    sources: ['/api/__sitemap__/urls'],
    xslColumns: [
      { label: 'URL', width: '50%' },
      { label: 'Priority', select: 'sitemap:priority', width: '15%' },
      { label: 'Change Freq', select: 'sitemap:changefreq', width: '15%' },
      { label: 'Last Modified', select: 'sitemap:lastmod', width: '20%' },
    ],
    defaults: {
      changefreq: 'weekly',
      priority: 0.8,
    },
    cacheMaxAgeSeconds: 3600,
    autoI18n: true,
  },

  // Robots.txt
  robots: {
    disallow: process.env.NOINDEX === 'true' ? ['/'] : ['/api/', '/_nuxt/'],
    allow: process.env.NOINDEX === 'true' ? [] : ['/api/__sitemap__/'],
    sitemap: `${process.env.NUXT_PUBLIC_SITE_URL || 'https://TODO.ac.kr'}/sitemap.xml`,
    credits: false,
  },

  // OG 이미지
  ogImage: {
    defaults: {
      component: 'OgImageTemplate',
      width: 1200,
      height: 630,
    },
  },

  ssr: true,

  // Nuxt UI 설정
  ui: {
    fonts: false,
  },

  // i18n 설정 — 한/영/중/일 4개국어
  i18n: {
    locales: [
      { code: 'ko', name: '한국어', file: 'ko.ts', iso: 'ko-KR' },
      { code: 'en', name: 'English', file: 'en.ts', iso: 'en-US' },
      { code: 'zh', name: '中文', files: ['en.ts', 'zh.ts'], iso: 'zh-CN' },
      { code: 'ja', name: '日本語', files: ['en.ts', 'ja.ts'], iso: 'ja-JP' },
    ],
    defaultLocale: 'ko',
    fallbackLocale: 'ko',
    lazy: true,
    langDir: '../locales',
    strategy: 'prefix_except_default',
    detectBrowserLanguage: {
      useCookie: true,
      cookieKey: 'i18n_locale',
      cookieSecure: true,
      redirectOn: 'root',
      alwaysRedirect: false,
      fallbackLocale: 'ko',
    },
    compilation: {
      strictMessage: false,
      escapeHtml: false,
    },
    missingWarn: false,
    fallbackWarn: false,
    vueI18n: './i18n.config.ts',
  },

  // 이미지 최적화
  image: {
    quality: 80,
    formats: ['webp', 'avif'],
    screens: {
      xs: 320,
      sm: 640,
      md: 768,
      lg: 1024,
      xl: 1280,
      xxl: 1536,
    },
    densities: [1, 2],
  },

  // 앱 설정
  app: {
    head: {
      title: '지능형 바이오 모니터링 연구실 | KU-KIST 융합대학원',
      titleTemplate: '%s | 지능형 바이오 모니터링 연구실',
      htmlAttrs: {
        lang: 'ko',
      },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        {
          name: 'description',
          content: '고려대학교-KIST 융합대학원 지능형 바이오 모니터링 연구실. AI와 바이오센서로 암·감염병 조기진단 연구를 수행합니다.',
        },
        {
          name: 'keywords',
          content: '이관희, 지능형 바이오 모니터링, KU-KIST, 융합대학원, 바이오센서, AI 진단, 암 조기진단',
        },
        { property: 'og:type', content: 'website' },
        { property: 'og:site_name', content: '지능형 바이오 모니터링 연구실' },
        { property: 'og:url', content: process.env.NUXT_PUBLIC_SITE_URL || 'https://TODO.ac.kr' },
        { property: 'og:locale', content: 'ko_KR' },
        { property: 'og:locale:alternate', content: 'en_US' },
        { property: 'og:locale:alternate', content: 'zh_CN' },
        { property: 'og:locale:alternate', content: 'ja_JP' },
        { name: 'twitter:card', content: 'summary_large_image' },
        {
          name: 'robots',
          content: process.env.NOINDEX === 'true'
            ? 'noindex, nofollow'
            : 'index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1',
        },
        { name: 'author', content: '지능형 바이오 모니터링 연구실, KU-KIST 융합대학원' },
        { name: 'google-site-verification', content: process.env.NUXT_PUBLIC_GOOGLE_SITE_VERIFICATION || '' },
        { name: 'format-detection', content: 'telephone=no' },
        // 고려대학교 크림슨 레드
        { name: 'theme-color', content: '#C21807' },
        { name: 'msapplication-TileColor', content: '#C21807' },
      ],
      link: [
        { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' },
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'apple-touch-icon', sizes: '180x180', href: '/favicon.svg' },
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        { rel: 'preload', as: 'style', href: '/fonts/fonts.css' },
        { rel: 'stylesheet', href: '/fonts/fonts.css' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/icon?family=Material+Icons' },
      ],
    },
    pageTransition: { name: 'fade', mode: 'out-in' },
  },

  // CSS
  css: ['~/assets/css/main.css'],

  // 런타임 설정
  runtimeConfig: {
    supabaseServiceKey: process.env.NUXT_SUPABASE_SECRET_KEY || '',
    public: {
      siteUrl: process.env.NUXT_PUBLIC_SITE_URL || 'https://TODO.ac.kr',
      apiBase: process.env.NUXT_PUBLIC_API_BASE || '',
      debug: process.env.NUXT_PUBLIC_DEBUG === 'true',
      gtmId: process.env.NUXT_PUBLIC_GTM_ID || '',
      sentryDsn: process.env.NUXT_PUBLIC_SENTRY_DSN || '',
      supabaseUrl: process.env.SUPABASE_URL || '',
      supabaseKey: process.env.SUPABASE_KEY || '',
    },
  },

  // TypeScript 설정
  typescript: {
    strict: true,
    typeCheck: false,
  },
})
