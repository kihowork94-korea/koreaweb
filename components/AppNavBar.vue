<script setup lang="ts">
const { t } = useI18n()
const route = useRoute()
const localePath = useLocalePath()
const themeStore = useThemeStore()

// 스크롤 감지
const isScrolled = ref(false)
const handleScroll = () => { isScrolled.value = window.scrollY > 10 }
onMounted(() => { window.addEventListener('scroll', handleScroll); handleScroll() })
onUnmounted(() => window.removeEventListener('scroll', handleScroll))

// 네비게이션 링크
const links = computed(() => [
  { key: 'lab.nav.about',        url: '/about' },
  { key: 'lab.nav.members',      url: '/members' },
  { key: 'lab.nav.research',     url: '/research' },
  { key: 'lab.nav.publications', url: '/publications' },
  { key: 'lab.nav.projects',     url: '/projects' },
  { key: 'lab.nav.news',         url: '/news' },
  { key: 'lab.nav.contact',      url: '/contact' },
])

const mobileMenuOpen = ref(false)
const isDark = computed(() => themeStore.isDark)

const toggleTheme = () => {
  themeStore.toggleTheme()
}

// 헤더 배경
const headerBgClass = computed(() => {
  if (!isScrolled.value) return isDark.value
    ? 'bg-black/30 backdrop-blur-sm border-b border-white/[0.06]'
    : 'bg-white/40 backdrop-blur-sm border-b border-black/[0.06]'
  return isDark.value
    ? 'bg-black/75 backdrop-blur-md border-b border-white/[0.08]'
    : 'bg-white/80 backdrop-blur-md border-b border-black/[0.08]'
})

const textClass = computed(() => isDark.value ? 'text-white' : 'text-gray-900')

// 현재 경로 active 체크
const isActive = (url: string) => {
  if (url === '/') return route.path === '/' || route.path === ''
  return route.path.startsWith(url)
}
</script>

<template>
  <div>
    <!-- 데스크탑/태블릿 헤더 -->
    <header
      :class="[
        'fixed top-0 left-0 right-0 z-50 h-[72px] flex items-center transition-all duration-300',
        headerBgClass,
      ]"
    >
      <div class="mx-auto flex w-full max-w-[1400px] items-center px-6">
        <!-- 로고 -->
        <NuxtLink
          :to="localePath('/')"
          class="mr-auto mobile:hidden transition-opacity hover:opacity-80"
        >
          <div style="display:flex;flex-direction:row;flex-wrap:nowrap;align-items:center;gap:12px">
            <img
              src="/images/ku-logo.png"
              alt="고려대학교"
              style="display:block;width:88px;height:24px;object-fit:contain;flex-shrink:0"
              :style="isDark ? { filter: 'brightness(0) invert(1)' } : {}"
            />
            <div style="width:1px;height:32px;flex-shrink:0" :style="isDark ? { background: 'rgba(255,255,255,0.2)' } : { background: 'rgba(0,0,0,0.15)' }" />
            <div style="display:flex;flex-direction:column;flex-shrink:0;line-height:1.3" :class="textClass">
              <span style="font-size:13px;font-weight:700;white-space:nowrap;letter-spacing:-0.01em">ARISE Lab</span>
              <span style="font-size:11px;font-weight:500;white-space:nowrap" :style="isDark ? { color: 'rgba(255,255,255,0.5)' } : { color: '#9ca3af' }">KU-KIST 융합대학원</span>
            </div>
          </div>
        </NuxtLink>

        <!-- 모바일 로고 -->
        <NuxtLink
          :to="localePath('/')"
          :class="['mr-auto hidden text-[15px] font-bold leading-tight mobile:block', textClass]"
        >
          ARISE Lab
        </NuxtLink>

        <!-- 모바일 메뉴 버튼 -->
        <button
          @click="mobileMenuOpen = !mobileMenuOpen"
          :class="['my-auto ml-auto hidden h-8 w-8 items-center justify-center mobile:flex', textClass]"
        >
          <span class="material-icons text-[24px]">{{ mobileMenuOpen ? 'close' : 'menu' }}</span>
        </button>

        <!-- 데스크탑 네비 -->
        <nav class="flex items-center gap-1 mobile:hidden">
          <NuxtLink
            v-for="link in links"
            :key="link.key"
            :to="localePath(link.url)"
            :class="[
              'nav-link relative px-3 py-2 text-[14px] font-semibold rounded-lg transition-all duration-200 whitespace-nowrap',
              textClass,
              isActive(link.url) ? 'nav-link--active' : '',
            ]"
          >
            {{ t(link.key) }}
          </NuxtLink>
        </nav>

        <!-- 언어 전환 + 다크모드 -->
        <div class="ml-4 flex items-center gap-1 mobile:hidden">
          <LocaleSwitcher />
          <button
            @click="toggleTheme"
            :class="[
              'flex h-8 w-8 items-center justify-center rounded-full transition-all duration-200 hover:scale-110',
              isDark ? 'hover:bg-white/10' : 'hover:bg-black/10',
            ]"
          >
            <span :class="['material-icons text-[20px]', textClass]">
              {{ isDark ? 'light_mode' : 'dark_mode' }}
            </span>
          </button>
        </div>
      </div>
    </header>

    <!-- 모바일 풀스크린 메뉴 -->
    <Transition name="fade">
      <div
        v-if="mobileMenuOpen"
        :class="[
          'fixed inset-0 z-[9999] flex flex-col items-center justify-center',
          isDark ? 'bg-black/95' : 'bg-white/95',
        ]"
      >
        <button
          @click="mobileMenuOpen = false"
          :class="['absolute right-6 top-6 flex h-10 w-10 items-center justify-center rounded-full transition-colors', isDark ? 'hover:bg-white/10' : 'hover:bg-black/10']"
        >
          <span :class="['material-icons text-[24px]', textClass]">close</span>
        </button>

        <!-- 모바일 로고 -->
        <div :class="['mb-8 text-center', textClass]">
          <p class="text-xl font-bold">ARISE Lab</p>
          <p :class="['text-sm', isDark ? 'text-white/50' : 'text-gray-400']">KU-KIST 융합대학원</p>
        </div>

        <nav class="flex flex-col items-center gap-5">
          <NuxtLink
            v-for="link in links"
            :key="link.key"
            :to="localePath(link.url)"
            @click="mobileMenuOpen = false"
            :class="[
              'text-2xl font-semibold transition-all hover:scale-105',
              textClass,
              isActive(link.url) ? '!text-[#C21807]' : '',
            ]"
          >
            {{ t(link.key) }}
          </NuxtLink>
        </nav>

        <div class="mt-8 flex items-center gap-3">
          <LocaleSwitcher />
          <button
            @click="toggleTheme"
            :class="[
              'flex items-center gap-2 rounded-full px-5 py-2.5 text-sm font-medium transition-colors',
              isDark ? 'bg-white/10 hover:bg-white/20 text-white' : 'bg-black/10 hover:bg-black/20 text-gray-900',
            ]"
          >
            <span class="material-icons text-[18px]">{{ isDark ? 'light_mode' : 'dark_mode' }}</span>
            {{ isDark ? t('lab.nav.lightMode') : t('lab.nav.darkMode') }}
          </button>
        </div>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.nav-link::after {
  content: '';
  position: absolute;
  bottom: 4px;
  left: 50%;
  width: 0;
  height: 2px;
  background: #C21807;
  border-radius: 1px;
  transition: all 0.25s ease;
  transform: translateX(-50%);
}

.nav-link:hover {
  color: #C21807 !important;
}

.nav-link:hover::after {
  width: 70%;
}

.nav-link--active {
  color: #C21807 !important;
}

.nav-link--active::after {
  width: 70%;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.25s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
