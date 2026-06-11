/**
 * Sentry 에러 추적 플러그인 (클라이언트 전용)
 */
import * as Sentry from '@sentry/vue'

export default defineNuxtPlugin((nuxtApp) => {
  const config = useRuntimeConfig()
  const router = useRouter()

  // Sentry DSN이 설정되지 않으면 초기화하지 않음
  if (!config.public.sentryDsn) {
    return
  }

  Sentry.init({
    app: nuxtApp.vueApp,
    dsn: config.public.sentryDsn as string,
    environment: config.public.debug ? 'development' : 'production',

    // 성능 모니터링
    integrations: [
      Sentry.browserTracingIntegration({
        router,
        // XHR/fetch 요청 추적 비활성화 (GA, Clarity 등과 충돌 방지)
        enableHTTPTimings: false,
      }),
      Sentry.replayIntegration({
        maskAllText: false,
        blockAllMedia: false,
      }),
    ],

    // 성능 샘플링 비율 (rate limit 방지를 위해 낮게 설정)
    tracesSampleRate: 0.01, // 1% 트레이스 샘플링

    // Session Replay 샘플링 (rate limit 방지)
    replaysSessionSampleRate: 0.01, // 1% 세션 녹화
    replaysOnErrorSampleRate: 0.1, // 에러 발생 시 10% 녹화

    // 추적 전파 대상 - localhost만 (외부 API는 CORS 문제로 제외)
    tracePropagationTargets: ['localhost'],

    // 무시할 에러 패턴
    ignoreErrors: [
      // 네트워크 에러
      'Network Error',
      'Failed to fetch',
      'Load failed',
      // 취소된 요청
      'AbortError',
      'The operation was aborted',
      // 브라우저 확장 프로그램
      'extension',
      // ResizeObserver 에러 (무해한 에러)
      'ResizeObserver loop',
    ],

    // 태그 추가
    beforeSend(event) {
      // 개발 환경에서는 콘솔에만 출력
      if (config.public.debug) {
        console.warn('[Sentry]', event)
      }
      return event
    },
  })

  // Vue 에러 핸들러와 통합
  nuxtApp.vueApp.config.errorHandler = (error, instance, info) => {
    Sentry.captureException(error, {
      extra: {
        componentName: instance?.$options?.name,
        info,
      },
    })
  }
})
