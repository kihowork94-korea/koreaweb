<script setup lang="ts">
const themeStore = useThemeStore()
const { locales } = useI18n()
const route = useRoute()

onMounted(() => {
  themeStore.init()
})

// hreflang 자동 생성
const localeHead = useLocaleHead({ seo: true })
useHead(computed(() => ({
  link: localeHead.value.link || [],
  meta: localeHead.value.meta || [],
})))
</script>

<template>
  <div class="relative min-h-screen flex flex-col transition-colors duration-300">
    <!-- 파티클 배경 -->
    <ClientOnly>
      <BackgroundsParticleBackground />
    </ClientOnly>

    <!-- 네비게이션 -->
    <AppNavBar />

    <!-- 페이지 콘텐츠 -->
    <main class="relative z-10 flex-1 pt-[72px]">
      <slot />
    </main>

    <!-- 푸터 -->
    <AppFooter />
  </div>
</template>
