import ko from './locales/ko'

export default defineI18nConfig(() => ({
  fallbackLocale: 'ko',
  fallbackWarn: false,
  missingWarn: false,
  // lazy loading 사용 시 fallback locale 메시지를 미리 로드해야 함
  messages: {
    ko,
  },
}))
