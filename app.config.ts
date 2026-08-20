export default defineAppConfig({
  // @nuxt/ui 설정
  ui: {
    // 차콜과 그레이 기반의 무채색 연구실 브랜드 컬러
    colors: {
      primary: 'zinc',
      neutral: 'zinc',
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
