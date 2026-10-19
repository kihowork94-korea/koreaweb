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

// 네비게이션 링크 — navVisibility가 false인 항목만 숨김 (undefined/true면 표시)
const { data: labInfoData } = useLabInfo()
const navVisibility = computed(() => (labInfoData.value as any)?.[0]?.navVisibility ?? {})

const links = computed(() => [
  { key: 'lab.nav.about',        url: '/about',        navKey: 'about' },
  { key: 'lab.nav.members',      url: '/members',      navKey: 'members' },
  { key: 'lab.nav.research',     url: '/research',     navKey: 'research' },
  { key: 'lab.nav.publications', url: '/publications', navKey: 'publications' },
  { key: 'lab.nav.projects',     url: '/projects',     navKey: 'projects' },
  { key: 'lab.nav.news',         url: '/news',         navKey: 'news' },
  { key: 'lab.nav.contact',      url: '/contact',      navKey: 'contact' },
].filter(link => navVisibility.value[link.navKey] !== false))

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
        <div class="brand-links mr-auto flex items-center gap-2.5 mobile:hidden">
          <a
            href="https://kukistschool.korea.ac.kr/about/professor_view.html?no=22&page=1"
            target="_blank"
            rel="noopener noreferrer"
            class="brand-link"
            aria-label="고려대학교 KU-KIST 융합대학원 홈페이지 열기"
            title="고려대학교 KU-KIST 융합대학원"
          >
            <img
              src="/images/ku-logo.png"
              alt="고려대학교"
              class="h-6 w-[88px] shrink-0 object-contain"
              :style="isDark ? { filter: 'brightness(0) invert(1)' } : {}"
            />
          </a>
          <a
            href="https://kist.re.kr/ko/research/introduction-row-molecule.do"
            target="_blank"
            rel="noopener noreferrer"
            class="brand-link"
            aria-label="KIST 공식 홈페이지 열기"
            title="한국과학기술연구원 KIST"
          >
            <img
              :src="isDark ? '/images/kist-logo.png' : '/images/kist-logo-dark.png'"
              alt="한국과학기술연구원 KIST"
              class="h-[25px] w-[105px] shrink-0 object-contain"
            />
          </a>
          <div class="h-8 w-px shrink-0" :style="isDark ? { background: 'rgba(255,255,255,0.2)' } : { background: 'rgba(0,0,0,0.15)' }" />
          <NuxtLink
            :to="localePath('/')"
            class="brand-link flex shrink-0 flex-col leading-[1.3]"
            :class="textClass"
            aria-label="ARISE Lab 메인으로 이동"
          >
            <span class="whitespace-nowrap text-[13px] font-bold tracking-[-0.01em]">ARISE Lab</span>
            <span class="whitespace-nowrap text-[11px] font-medium" :style="isDark ? { color: 'rgba(255,255,255,0.5)' } : { color: '#9ca3af' }">KU-KIST 융합대학원</span>
          </NuxtLink>
        </div>

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
              isActive(link.url) ? '!text-[#D97720]' : '',
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
  background: #e8892f;
  border-radius: 1px;
  transition: all 0.25s ease;
  transform: translateX(-50%);
}

.nav-link:hover {
  color: #d97720 !important;
}

.nav-link:hover::after {
  width: 70%;
}

.nav-link--active {
  color: #d97720 !important;
}

.brand-link {
  display: flex;
  align-items: center;
  border-radius: 0.375rem;
  transition: opacity 0.2s ease, transform 0.2s ease;
}

.brand-link:hover {
  opacity: 0.72;
  transform: translateY(-1px);
}

.brand-link:focus-visible {
  outline: 2px solid #e8892f;
  outline-offset: 4px;
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
