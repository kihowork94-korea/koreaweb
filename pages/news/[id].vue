<script setup lang="ts">
const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)
const route  = useRoute()

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: newsRaw } = await useLabNews()
const allNews = computed<any[]>(() => (newsRaw.value as any[]) ?? [])

const item = computed(() => allNews.value.find((n: any) => n.id === Number(route.params.id)))

// 없는 ID면 404
if (!item.value) {
  throw createError({ statusCode: 404, statusMessage: 'News not found', fatal: true })
}

useHead(computed(() => ({
  title: `${item.value ? loc(item.value.title) : 'News'} | 지능형 바이오 모니터링 연구실`,
})))

// 이전/다음 뉴스 (날짜순 정렬 기준)
const sortedAll = computed(() =>
  [...allNews.value].sort((a: any, b: any) => new Date(b.date).getTime() - new Date(a.date).getTime())
)
const currentIdx = computed(() => sortedAll.value.findIndex((n: any) => n.id === item.value?.id))
const prevItem = computed(() => currentIdx.value < sortedAll.value.length - 1 ? sortedAll.value[currentIdx.value + 1] : null)
const nextItem = computed(() => currentIdx.value > 0 ? sortedAll.value[currentIdx.value - 1] : null)

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

// 마크다운 스타일 렌더링 (간단 처리: 줄바꿈 + 볼드)
function renderContent(text: string): string {
  return text
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\n\n/g, '</p><p class="mb-4">')
    .replace(/\n/g, '<br>')
}
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[760px]">

      <!-- 뒤로가기 -->
      <NuxtLink
        to="/news"
        class="mb-8 inline-flex items-center gap-1.5 text-sm font-semibold transition-colors"
        :class="isDark ? 'text-white/50 hover:text-white' : 'text-gray-400 hover:text-gray-700'"
      >
        <span class="material-icons text-[16px]">arrow_back</span>
        {{ t('lab.news.backToNews') }}
      </NuxtLink>

      <template v-if="item">
        <!-- 배지 + 날짜 -->
        <div class="mb-4 flex flex-wrap items-center gap-2">
          <span
            v-if="item.isPinned"
            class="flex items-center gap-1 rounded-full bg-[#C21807]/10 px-2.5 py-0.5 text-[11px] font-bold text-[#C21807]"
          >
            <span class="material-icons text-[11px]">push_pin</span>
            {{ t('lab.news.pinned') }}
          </span>
          <span
            class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
            :class="categoryBadge[item.category] || 'bg-gray-100 text-gray-500'"
          >{{ t(`lab.news.${item.category}`) }}</span>
          <span class="text-sm" :class="isDark ? 'text-white/35' : 'text-gray-400'">
            {{ formatDate(item.date) }}
          </span>
        </div>

        <!-- 제목 -->
        <h1
          class="mb-8 text-3xl font-extrabold leading-tight mobile:text-2xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ loc(item.title) }}</h1>

        <!-- 대표 이미지 -->
        <div
          v-if="item.imageUrl"
          class="mb-8 overflow-hidden rounded-2xl"
          :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
        >
          <img
            :src="item.imageUrl"
            :alt="loc(item.title)"
            class="h-full w-full object-cover"
          />
        </div>

        <!-- 구분선 -->
        <div :class="['mb-8 h-px', isDark ? 'bg-white/[0.07]' : 'bg-gray-100']" />

        <!-- 본문 -->
        <div
          class="prose prose-sm max-w-none leading-relaxed"
          :class="isDark ? 'text-white/70' : 'text-gray-600'"
        >
          <p
            class="mb-4"
            v-html="renderContent(loc(item.content))"
          />
        </div>

        <!-- 외부 링크 버튼 -->
        <div v-if="item.externalUrl" class="mt-8">
          <a
            :href="item.externalUrl"
            target="_blank"
            rel="noopener noreferrer"
            class="inline-flex items-center gap-2 rounded-xl bg-[#C21807] px-5 py-2.5 text-sm font-semibold text-white transition-opacity hover:opacity-80"
          >
            <span class="material-icons text-[16px]">open_in_new</span>
            원문 보기
          </a>
        </div>

        <!-- 구분선 -->
        <div :class="['my-12 h-px', isDark ? 'bg-white/[0.07]' : 'bg-gray-100']" />

        <!-- 이전/다음 -->
        <div class="grid grid-cols-2 gap-4 mobile:grid-cols-1">
          <!-- 이전 (더 오래된 글) -->
          <NuxtLink
            v-if="prevItem"
            :to="`/news/${prevItem.id}`"
            class="group flex flex-col gap-1 rounded-xl border p-4 transition-all"
            :class="isDark
              ? 'border-white/[0.07] bg-white/[0.03] hover:bg-white/[0.06]'
              : 'border-gray-100 bg-white/70 hover:shadow-sm'"
          >
            <span class="flex items-center gap-1 text-xs" :class="isDark ? 'text-white/35' : 'text-gray-400'">
              <span class="material-icons text-[13px]">arrow_back</span>이전 글
            </span>
            <span
              class="line-clamp-2 text-sm font-semibold transition-colors group-hover:text-[#C21807]"
              :class="isDark ? 'text-white/80' : 'text-gray-700'"
            >{{ loc(prevItem.title) }}</span>
          </NuxtLink>
          <div v-else />

          <!-- 다음 (더 최신 글) -->
          <NuxtLink
            v-if="nextItem"
            :to="`/news/${nextItem.id}`"
            class="group flex flex-col items-end gap-1 rounded-xl border p-4 text-right transition-all"
            :class="isDark
              ? 'border-white/[0.07] bg-white/[0.03] hover:bg-white/[0.06]'
              : 'border-gray-100 bg-white/70 hover:shadow-sm'"
          >
            <span class="flex items-center gap-1 text-xs" :class="isDark ? 'text-white/35' : 'text-gray-400'">
              다음 글<span class="material-icons text-[13px]">arrow_forward</span>
            </span>
            <span
              class="line-clamp-2 text-sm font-semibold transition-colors group-hover:text-[#C21807]"
              :class="isDark ? 'text-white/80' : 'text-gray-700'"
            >{{ loc(nextItem.title) }}</span>
          </NuxtLink>
        </div>
      </template>
    </div>
  </div>
</template>
