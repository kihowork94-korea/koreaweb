<script setup lang="ts">
import type { NewsCategory } from '~/types/lab'
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.news')} | 지능형 바이오 모니터링 연구실` })

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: newsRaw } = useLabNews()
const news = computed<any[]>(() => (newsRaw.value as any[]) ?? [])

type CategoryFilter = NewsCategory | 'all'
const activeCategory = ref<CategoryFilter>('all')

const categories: { key: CategoryFilter; label: string }[] = [
  { key: 'all',          label: t('lab.common.viewAll') },
  { key: 'announcement', label: t('lab.news.announcement') },
  { key: 'award',        label: t('lab.news.award') },
  { key: 'press',        label: t('lab.news.press') },
  { key: 'recruitment',  label: t('lab.news.recruitment') },
  { key: 'event',        label: t('lab.news.event') },
]

const activeCategories = computed(() =>
  categories.filter(c => c.key === 'all' || news.value.some((n: any) => n.category === c.key))
)

const sorted = computed(() => {
  const list = activeCategory.value === 'all'
    ? [...news.value]
    : news.value.filter((n: any) => n.category === activeCategory.value)
  return list.sort((a: any, b: any) => {
    if (a.isPinned !== b.isPinned) return a.isPinned ? -1 : 1
    return new Date(b.date).getTime() - new Date(a.date).getTime()
  })
})

const categoryBadge: Record<string, string> = {
  announcement: 'bg-blue-500/10 text-blue-500',
  award:        'bg-amber-500/10 text-amber-600',
  press:        'bg-violet-500/10 text-violet-500',
  recruitment:  'bg-[#C21807]/10 text-[#C21807]',
  event:        'bg-emerald-500/10 text-emerald-600',
}

function formatDate(dateStr: string) {
  const d = new Date(dateStr)
  return `${d.getFullYear()}.${String(d.getMonth() + 1).padStart(2, '0')}.${String(d.getDate()).padStart(2, '0')}`
}

const listRef  = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(listRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[900px]">

      <!-- 헤더 -->
      <div class="mb-12 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">News & Announcements</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.news') }}</h1>
      </div>

      <!-- 카테고리 필터 -->
      <div class="mb-10 flex flex-wrap justify-center gap-2">
        <button
          v-for="cat in activeCategories"
          :key="cat.key"
          @click="activeCategory = cat.key"
          class="rounded-full px-4 py-1.5 text-[13px] font-semibold transition-all"
          :class="activeCategory === cat.key
            ? 'bg-[#C21807] text-white shadow-md shadow-[#C21807]/20'
            : isDark ? 'bg-white/[0.06] text-white/55 hover:bg-white/[0.10]' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'"
        >{{ cat.label }}</button>
      </div>

      <!-- 뉴스 목록 -->
      <div ref="listRef" class="flex flex-col gap-4">

        <!-- 빈 상태 -->
        <div
          v-if="sorted.length === 0"
          class="py-20 text-center"
          :class="isDark ? 'text-white/30' : 'text-gray-300'"
        >
          <span class="material-icons mb-3 block text-5xl">newspaper</span>
          <p>{{ t('lab.common.noData') }}</p>
        </div>

        <component
          :is="item.externalUrl ? 'a' : 'NuxtLink'"
          v-for="(item, i) in sorted"
          :key="item.id"
          v-bind="item.externalUrl
            ? { href: item.externalUrl, target: '_blank', rel: 'noopener noreferrer' }
            : { to: localePath(`/news/${item.id}`) }"
          class="animate-item group flex items-start gap-5 rounded-2xl border p-6 transition-all duration-200 mobile:flex-col mobile:p-5"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i}`,
            isDark
              ? 'border-white/[0.07] bg-white/[0.03] hover:bg-white/[0.06]'
              : 'border-gray-100 bg-white/70 hover:shadow-md hover:shadow-black/5',
          ]"
        >
          <!-- 이미지 썸네일 -->
          <div
            class="h-24 w-32 flex-shrink-0 overflow-hidden rounded-xl mobile:h-44 mobile:w-full"
            :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
          >
            <img
              :src="item.imageUrl || '/ku-logo.png'"
              :alt="loc(item.title)"
              class="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
              @error="($event.target as HTMLImageElement).src='/ku-logo.png'"
            />
          </div>

          <!-- 본문 -->
          <div class="flex-1 min-w-0">
            <!-- 배지 -->
            <div class="mb-2 flex flex-wrap items-center gap-2">
              <!-- 고정 배지 -->
              <span
                v-if="item.isPinned"
                class="flex items-center gap-1 rounded-full bg-[#C21807]/10 px-2.5 py-0.5 text-[11px] font-bold text-[#C21807]"
              >
                <span class="material-icons text-[11px]">push_pin</span>
                {{ t('lab.news.pinned') }}
              </span>
              <!-- 카테고리 배지 -->
              <span
                class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                :class="categoryBadge[item.category] || 'bg-gray-100 text-gray-500'"
              >{{ t(`lab.news.${item.category}`) }}</span>
              <!-- 날짜 -->
              <span class="text-xs" :class="isDark ? 'text-white/30' : 'text-gray-400'">
                {{ formatDate(item.date) }}
              </span>
            </div>

            <!-- 제목 -->
            <h3
              class="mb-1.5 font-bold leading-snug transition-colors group-hover:text-[#C21807]"
              :class="isDark ? 'text-white' : 'text-gray-900'"
            >{{ loc(item.title) }}</h3>

            <!-- 외부 링크 표시 -->
            <div v-if="item.externalUrl" class="mt-2 flex items-center gap-1 text-xs text-[#C21807]">
              <span class="material-icons text-[13px]">open_in_new</span>
              <span>외부 링크</span>
            </div>
          </div>

          <!-- 화살표 -->
          <div class="flex-shrink-0 self-center">
            <span
              class="material-icons transition-transform group-hover:translate-x-1"
              :class="isDark ? 'text-white/20' : 'text-gray-300'"
            >chevron_right</span>
          </div>
        </component>
      </div>
    </div>
  </div>
</template>
