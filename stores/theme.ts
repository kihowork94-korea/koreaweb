import { defineStore } from 'pinia'

export type ThemeMode = 'dark' | 'light' | 'system'

export const useThemeStore = defineStore('theme', () => {
  const themeMode = ref<ThemeMode>('system')
  const resolvedTheme = ref<'dark' | 'light'>('dark')

  // 시스템 테마 감지
  function getSystemTheme(): 'dark' | 'light' {
    if (import.meta.client && window.matchMedia) {
      return window.matchMedia('(prefers-color-scheme: dark)').matches
        ? 'dark'
        : 'light'
    }
    return 'dark'
  }

  // 초기화
  function init() {
    if (import.meta.client) {
      const savedTheme = localStorage.getItem('theme') as ThemeMode | null
      if (savedTheme) {
        themeMode.value = savedTheme
      }
      updateResolvedTheme()

      // 시스템 테마 변경 감지
      window.matchMedia('(prefers-color-scheme: dark)')
        .addEventListener('change', () => {
          if (themeMode.value === 'system') {
            updateResolvedTheme()
          }
        })
    }
  }

  // 테마 변경
  function setTheme(mode: ThemeMode) {
    themeMode.value = mode
    if (import.meta.client) {
      localStorage.setItem('theme', mode)
    }
    updateResolvedTheme()
  }

  // 토글
  function toggleTheme() {
    if (themeMode.value === 'system') {
      setTheme(resolvedTheme.value === 'dark' ? 'light' : 'dark')
    } else {
      setTheme(themeMode.value === 'dark' ? 'light' : 'dark')
    }
  }

  // resolved 테마 업데이트
  function updateResolvedTheme() {
    if (themeMode.value === 'system') {
      resolvedTheme.value = getSystemTheme()
    } else {
      resolvedTheme.value = themeMode.value
    }
    applyThemeClass()
  }

  // HTML 요소에 dark 클래스 적용
  function applyThemeClass() {
    if (import.meta.client) {
      const isDark = resolvedTheme.value === 'dark'

      if (isDark) {
        document.documentElement.classList.add('dark')
        document.documentElement.classList.remove('light')
      } else {
        document.documentElement.classList.remove('dark')
        document.documentElement.classList.add('light')
      }

      document.documentElement.style.colorScheme = isDark ? 'dark' : 'light'
    }
  }

  const isDark = computed(() => resolvedTheme.value === 'dark')

  return {
    themeMode,
    resolvedTheme,
    isDark,
    init,
    setTheme,
    toggleTheme,
  }
})
