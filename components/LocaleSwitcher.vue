<script setup lang="ts">
const { locale, setLocale } = useI18n()
const themeStore = useThemeStore()
const showDropdown = ref(false)
const dropdownRef = ref<HTMLElement | null>(null)

const isDark = computed(() => themeStore.isDark)

const localeOptions = [
  { code: 'ko', name: '한국어', flag: '🇰🇷' },
  { code: 'en', name: 'English', flag: '🇺🇸' },
  { code: 'zh', name: '中文', flag: '🇨🇳' },
  { code: 'ja', name: '日本語', flag: '🇯🇵' },
]

const currentLocale = computed(
  () => localeOptions.find(l => l.code === locale.value) ?? localeOptions[0]
)

const selectLocale = async (code: string) => {
  showDropdown.value = false
  await setLocale(code as Parameters<typeof setLocale>[0])
}

const handleClickOutside = (e: MouseEvent) => {
  if (dropdownRef.value && !dropdownRef.value.contains(e.target as Node)) {
    showDropdown.value = false
  }
}

onMounted(() => document.addEventListener('click', handleClickOutside))
onUnmounted(() => document.removeEventListener('click', handleClickOutside))
</script>

<template>
  <div ref="dropdownRef" class="relative">
    <button
      @click.stop="showDropdown = !showDropdown"
      :class="[
        'flex items-center gap-1.5 rounded-lg px-3 py-2 text-sm font-medium transition-colors',
        isDark ? 'hover:bg-white/10 text-white' : 'hover:bg-black/10 text-gray-900',
      ]"
    >
      <span class="text-base leading-none">{{ currentLocale.flag }}</span>
      <span>{{ currentLocale.name }}</span>
      <span
        :class="[
          'material-icons text-[16px] transition-transform duration-200',
          showDropdown ? 'rotate-180' : '',
        ]"
      >expand_more</span>
    </button>

    <Transition
      enter-active-class="transition duration-200 ease-out"
      enter-from-class="transform scale-95 opacity-0"
      enter-to-class="transform scale-100 opacity-100"
      leave-active-class="transition duration-150 ease-in"
      leave-from-class="transform scale-100 opacity-100"
      leave-to-class="transform scale-95 opacity-0"
    >
      <div
        v-if="showDropdown"
        :class="[
          'absolute right-0 top-full z-50 mt-2 min-w-[150px] rounded-xl py-2 shadow-lg backdrop-blur-md',
          isDark ? 'bg-[#1a1a1a]/95 border border-white/10' : 'bg-white/95 border border-gray-200',
        ]"
      >
        <button
          v-for="option in localeOptions"
          :key="option.code"
          @click="selectLocale(option.code)"
          :class="[
            'flex w-full items-center gap-2.5 px-4 py-2.5 text-left text-sm font-medium transition-colors',
            locale === option.code
              ? isDark ? 'bg-white/10 text-white' : 'bg-gray-100 text-gray-900'
              : isDark ? 'text-gray-300 hover:bg-white/5 hover:text-white' : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900',
          ]"
        >
          <span class="text-base">{{ option.flag }}</span>
          <span>{{ option.name }}</span>
          <span
            v-if="locale === option.code"
            class="ml-auto h-1.5 w-1.5 rounded-full bg-[#3F3F46]"
          />
        </button>
      </div>
    </Transition>
  </div>
</template>
