export default defineNuxtPlugin(() => {
  // 폰트 로딩 상태 체크
  if (document.fonts && document.fonts.ready) {
    document.fonts.ready.then(() => {
      document.documentElement.classList.add('fonts-loaded')
    })
  } else {
    // fallback: FontFace API 미지원 시 즉시 표시
    document.documentElement.classList.add('fonts-loaded')
  }
})
