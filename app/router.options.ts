import type { RouterConfig } from '@nuxt/schema'

export default <RouterConfig>{
  scrollBehavior(to, _from, savedPosition) {
    // 앵커(#hash) 이동: 네비바 높이(72px) 만큼 오프셋
    if (to.hash) {
      return { el: to.hash, top: 80, behavior: 'smooth' }
    }
    // 뒤로가기/앞으로가기: 이전 위치 복원
    if (savedPosition) {
      return savedPosition
    }
    // 페이지 이동: 항상 최상단
    return { top: 0, behavior: 'instant' }
  },
}
