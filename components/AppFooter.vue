<script setup lang="ts">
const { t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const currentYear = new Date().getFullYear()

const navLinks = computed(() => [
  { key: 'lab.nav.about',        url: '/about' },
  { key: 'lab.nav.members',      url: '/members' },
  { key: 'lab.nav.research',     url: '/research' },
  { key: 'lab.nav.publications', url: '/publications' },
  { key: 'lab.nav.projects',     url: '/projects' },
  { key: 'lab.nav.news',         url: '/news' },
  { key: 'lab.nav.contact',      url: '/contact' },
])

const footerBgClass = computed(() =>
  isDark.value
    ? 'bg-black/30 backdrop-blur-2xl border-t border-white/[0.06]'
    : 'bg-white/30 backdrop-blur-2xl border-t border-black/[0.06]'
)
const subTextClass = computed(() => isDark.value ? 'text-white/40' : 'text-gray-400')
const linkClass = computed(() => isDark.value ? 'text-white/60 hover:text-white' : 'text-gray-500 hover:text-gray-900')
</script>

<template>
  <footer class="relative z-[1]">
    <div :class="['flex w-full justify-center py-16 mobile:py-10', footerBgClass]">
      <div class="flex w-full max-w-[1200px] flex-col gap-10 px-6">

        <!-- 상단: 로고 + 네비 -->
        <div class="flex items-start justify-between gap-8 mobile:flex-col mobile:gap-6">

          <!-- 연구실 정보 -->
          <div class="flex flex-col gap-2">
            <NuxtLink
              :to="localePath('/')"
              :class="['text-[17px] font-bold transition-opacity hover:opacity-70', isDark ? 'text-white' : 'text-gray-900']"
            >
              {{ t('lab.footer.labName') }}
            </NuxtLink>
            <p :class="['text-[13px]', subTextClass]">{{ t('lab.footer.university') }}</p>
            <p :class="['text-[13px]', subTextClass]">{{ t('lab.footer.address') }}</p>
          </div>

          <!-- 네비게이션 -->
          <nav class="flex flex-wrap gap-x-6 gap-y-2 mobile:gap-x-5">
            <NuxtLink
              v-for="link in navLinks"
              :key="link.key"
              :to="localePath(link.url)"
              :class="['text-[13px] font-medium transition-colors', linkClass]"
            >
              {{ t(link.key) }}
            </NuxtLink>
          </nav>
        </div>

        <!-- 구분선 -->
        <div :class="['h-px', isDark ? 'bg-white/[0.06]' : 'bg-black/[0.06]']" />

        <!-- 하단: 저작권 + 카카오맵/구글맵 링크 -->
        <div class="flex items-center justify-between gap-4 mobile:flex-col mobile:items-start">
          <p :class="['text-[12px]', subTextClass]">
            {{ t('lab.footer.copyright', { year: currentYear }) }}
          </p>
          <div class="flex items-center gap-4">
            <a
              href="https://map.kakao.com/link/map/한국과학기술연구원,37.6027,127.0586"
              target="_blank"
              rel="noopener noreferrer"
              :class="['flex items-center gap-1 text-[12px] transition-colors', linkClass]"
            >
              <span class="material-icons text-[14px]">place</span>
              {{ t('lab.footer.openKakaoMap') }}
            </a>
            <a
              href="https://www.google.com/maps?q=37.6027,127.0586"
              target="_blank"
              rel="noopener noreferrer"
              :class="['flex items-center gap-1 text-[12px] transition-colors', linkClass]"
            >
              <span class="material-icons text-[14px]">map</span>
              {{ t('lab.footer.openGoogleMap') }}
            </a>
          </div>
        </div>

      </div>
    </div>
  </footer>
</template>
