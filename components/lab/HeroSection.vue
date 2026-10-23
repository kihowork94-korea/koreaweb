<script setup lang="ts">
const { locale } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: labInfoArr } = useLabInfo()
const labInfo = computed(() => (labInfoArr.value as any[])?.[0])

const name   = computed(() => loc(labInfo.value?.name))
const slogan = computed(() => loc(labInfo.value?.slogan))
const univ   = computed(() => loc(labInfo.value?.university))

// CTA 클릭 강조
const activeSection = ref<string | null>(null)
function onCtaClick(section: string) {
  activeSection.value = section
}

// 스크롤 인디케이터
const scrollIndicatorVisible = ref(true)
const handleScroll = () => { scrollIndicatorVisible.value = window.scrollY < 80 }
onMounted(() => window.addEventListener('scroll', handleScroll, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', handleScroll))
</script>

<template>
  <section class="relative flex min-h-[calc(100vh-72px)] flex-col items-center justify-center px-6 text-center">

    <!-- 장식 링 (배경) -->
    <div class="pointer-events-none absolute inset-0 flex items-center justify-center overflow-hidden">
      <div
        :class="['absolute h-[600px] w-[600px] rounded-full border mobile:h-[320px] mobile:w-[320px]', isDark ? 'border-white/[0.04]' : 'border-black/[0.04]']"
      />
      <div
        :class="['absolute h-[900px] w-[900px] rounded-full border mobile:h-[500px] mobile:w-[500px]', isDark ? 'border-white/[0.03]' : 'border-black/[0.03]']"
      />
      <div
        :class="['absolute h-[1200px] w-[1200px] rounded-full border mobile:h-[700px] mobile:w-[700px]', isDark ? 'border-white/[0.02]' : 'border-black/[0.02]']"
      />
    </div>

    <!-- 콘텐츠 -->
    <div class="relative z-10 flex flex-col items-center gap-5">
      <!-- 연구실 이름 -->
      <h1
        class="animate-fade-in-up text-6xl font-extrabold leading-[1.1] tracking-tight mobile:text-4xl"
        :class="isDark ? 'text-white' : 'text-gray-900'"
        style="animation-delay: 100ms"
      >
        <AriseWordmark style="width: clamp(220px, 48vw, 430px)" />
      </h1>

      <!-- ARISE 약어 풀이 -->
      <p
        class="animate-fade-in-up text-[13px] font-semibold tracking-[0.15em] uppercase mobile:text-[11px]"
        :class="isDark ? 'text-white/35' : 'text-gray-400'"
        style="animation-delay: 160ms"
      >
        <span class="text-[#D97720]">A</span>I-Integrated&nbsp;
        <span class="text-[#D97720]">R</span>ecognition and&nbsp;
        <span class="text-[#D97720]">I</span>ntelligent&nbsp;
        <span class="text-[#D97720]">S</span>ensing&nbsp;
        <span class="text-[#D97720]">E</span>ngineering
      </p>

      <!-- 슬로건 -->
      <p
        class="animate-fade-in-up max-w-2xl text-xl leading-relaxed mobile:text-base"
        :class="isDark ? 'text-white/55' : 'text-gray-500'"
        style="animation-delay: 200ms"
      >
        {{ slogan }}
      </p>

      <!-- CTA 버튼 -->
      <div
        class="animate-fade-in-up mt-2 flex flex-wrap justify-center gap-3"
        style="animation-delay: 300ms"
      >
        <a
          v-for="cta in [
            { section: 'about',    icon: 'info',    label: $t('lab.nav.about') },
            { section: 'research', icon: 'science', label: $t('lab.nav.research') },
          ]"
          :key="cta.section"
          :href="`#${cta.section}`"
          class="group flex items-center gap-2 rounded-xl border px-6 py-3 text-sm font-semibold transition-all duration-200 hover:scale-[1.03]"
          :class="activeSection === cta.section
            ? 'border-[#D97720] bg-[#D97720] text-white shadow-lg shadow-[#D97720]/20'
            : isDark
              ? 'border-white/15 text-white/80 hover:bg-white/8'
              : 'border-gray-200 text-gray-700 hover:bg-gray-50'"
          @click="onCtaClick(cta.section)"
        >
          <span class="material-icons text-[18px]">{{ cta.icon }}</span>
          {{ cta.label }}
        </a>
      </div>
    </div>

    <!-- 스크롤 인디케이터 -->
    <Transition name="fade">
      <div
        v-if="scrollIndicatorVisible"
        class="absolute bottom-10 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2"
        :class="isDark ? 'text-white/30' : 'text-gray-300'"
      >
        <span class="text-[11px] font-medium uppercase tracking-widest">Scroll</span>
        <span class="material-icons animate-bounce text-[20px]">keyboard_arrow_down</span>
      </div>
    </Transition>
  </section>
</template>

<style scoped>
.fade-enter-active, .fade-leave-active { transition: opacity 0.4s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; }
</style>
