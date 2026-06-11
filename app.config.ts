export default defineAppConfig({
  // @nuxt/ui 설정
  ui: {
    // 고려대학교 크림슨 레드를 primary 컬러로 사용
    colors: {
      primary: 'red',   // Tailwind red 팔레트 기반 (CSS 변수로 #C21807 적용)
      neutral: 'zinc',  // 기본 회색 계열
    },
    toaster: {
      expand: true,
    },
    toast: {
      slots: {
        root: 'z-[99999]',
      },
    },
  },
})
