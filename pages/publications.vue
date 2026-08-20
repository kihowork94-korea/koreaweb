<script setup lang="ts">
import type { PublicationType, Publication } from '~/types/lab'
import { useIntersectionObserver } from '@vueuse/core'

const { t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.publications')} | ARISE Lab` })

const { data: pubsRaw, pending } = useLabPublications()
const publications = computed<any[]>(() => (pubsRaw.value as any[]) ?? [])

// ── 필터 상태 ──────────────────────────────────
type TypeFilter = PublicationType | 'all'

const typeFilter = ref<TypeFilter>('all')
const yearFilter = ref<number | 'all'>('all')
const tagFilter  = ref<string>('all')

const hasActiveFilter = computed(() =>
  typeFilter.value !== 'all' || yearFilter.value !== 'all' || tagFilter.value !== 'all'
)
function resetFilters() {
  typeFilter.value = 'all'
  yearFilter.value = 'all'
  tagFilter.value  = 'all'
}

// ── 필터 옵션 ──────────────────────────────────
const typeOptions: { key: TypeFilter; label: string }[] = [
  { key: 'all',        label: t('lab.publication.all') },
  { key: 'conference', label: t('lab.publication.conference') },
  { key: 'journal',    label: t('lab.publication.journal') },
  { key: 'patent',     label: t('lab.publication.patent') },
  { key: 'preprint',   label: t('lab.publication.preprint') },
  { key: 'book',       label: t('lab.publication.book') },
]

const availableYears = computed(() => {
  const years = [...new Set(publications.value.map((p: any) => p.year))].sort((a: number, b: number) => b - a)
  return years
})

const allTags = computed(() => {
  const tags = new Set<string>()
  publications.value.forEach((p: any) => p.tags?.forEach((tag: string) => tags.add(tag)))
  return [...tags].sort()
})

// ── 필터 적용 ──────────────────────────────────
const filtered = computed(() => {
  let list: any[] = [...publications.value]
  if (typeFilter.value !== 'all') list = list.filter(p => p.type === typeFilter.value)
  if (yearFilter.value !== 'all') list = list.filter(p => p.year === yearFilter.value)
  if (tagFilter.value  !== 'all') list = list.filter(p => p.tags?.includes(tagFilter.value))
  return list.sort((a, b) => b.year - a.year || (b.month ?? 0) - (a.month ?? 0))
})

// 연도별 그룹
const groupedByYear = computed(() => {
  const groups: Record<number, Publication[]> = {}
  filtered.value.forEach(p => {
    if (!groups[p.year]) groups[p.year] = []
    groups[p.year].push(p)
  })
  return groups
})

const sortedYears = computed(() =>
  Object.keys(groupedByYear.value).map(Number).sort((a, b) => b - a)
)

// ── 뱃지 스타일 ────────────────────────────────
const typeBadge: Record<string, string> = {
  journal:    'bg-blue-500/10 text-blue-500',
  conference: 'bg-[#3F3F46]/10 text-[#3F3F46]',
  patent:     'bg-amber-500/10 text-amber-600',
  preprint:   'bg-violet-500/10 text-violet-500',
  book:       'bg-emerald-500/10 text-emerald-600',
}

const typeLabel: Record<string, string> = {
  journal: 'Journal', conference: 'Conference',
  patent: 'Patent', preprint: 'Preprint', book: 'Book',
}

// ── 섹션 등장 ──────────────────────────────────
const listRef   = ref<HTMLElement | null>(null)
const isVisible = ref(false)
onMounted(() => { isVisible.value = true })
useIntersectionObserver(listRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[1100px]">

      <!-- 헤더 -->
      <div class="mb-12 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#3F3F46]">Research Output</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.publications') }}</h1>
        <p class="mt-2 text-sm" :class="isDark ? 'text-white/40' : 'text-gray-400'">
          {{ publications.length }} publications
        </p>
      </div>

      <!-- ── 필터 ──────────────────────────────── -->
      <div class="mb-10 flex flex-wrap items-center gap-4">

        <!-- 종류 탭 -->
        <div class="flex flex-wrap gap-2">
          <button
            v-for="opt in typeOptions.filter(o => o.key === 'all' || publications.some(p => p.type === o.key))"
            :key="opt.key"
            @click="typeFilter = opt.key"
            class="rounded-full px-4 py-1.5 text-[13px] font-semibold transition-all"
            :class="typeFilter === opt.key
              ? 'bg-[#3F3F46] text-white shadow-md shadow-[#3F3F46]/20'
              : isDark ? 'bg-white/[0.06] text-white/55 hover:bg-white/[0.10]' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'"
          >{{ opt.label }}</button>
        </div>

        <!-- 연도 선택 -->
        <select
          v-model="yearFilter"
          class="ml-auto rounded-xl border px-3 py-1.5 text-[13px] font-semibold outline-none transition-colors"
          :class="[isDark ? 'bg-white/[0.06] border-white/10 text-white/70' : 'bg-white border-gray-200 text-gray-600', yearFilter !== 'all' ? 'ring-2 ring-[#3F3F46]/40' : '']"
        >
          <option value="all">{{ t('lab.publication.filterByYear') }}: 전체</option>
          <option v-for="y in availableYears" :key="y" :value="y">{{ y }}</option>
        </select>

        <!-- 태그 선택 -->
        <select
          v-if="allTags.length > 0"
          v-model="tagFilter"
          class="rounded-xl border px-3 py-1.5 text-[13px] font-semibold outline-none transition-colors"
          :class="[isDark ? 'bg-white/[0.06] border-white/10 text-white/70' : 'bg-white border-gray-200 text-gray-600', tagFilter !== 'all' ? 'ring-2 ring-[#3F3F46]/40' : '']"
        >
          <option value="all">{{ t('lab.publication.filterByTag') }}: 전체</option>
          <option v-for="tag in allTags" :key="tag" :value="tag">{{ tag }}</option>
        </select>

        <!-- 필터 초기화 버튼 -->
        <button
          v-if="hasActiveFilter"
          @click="resetFilters"
          class="flex items-center gap-1 rounded-full px-3 py-1.5 text-[12px] font-semibold text-[#3F3F46] transition-colors hover:bg-[#3F3F46]/10"
        >
          <span class="material-icons text-[14px]">close</span>
          필터 초기화
        </button>
      </div>

      <!-- 활성 필터 요약 -->
      <div v-if="hasActiveFilter" class="mb-6 flex flex-wrap items-center gap-2 text-[13px]">
        <span :class="isDark ? 'text-white/40' : 'text-gray-400'">필터:</span>
        <span
          v-if="typeFilter !== 'all'"
          class="flex items-center gap-1 rounded-full bg-[#3F3F46]/10 px-3 py-0.5 font-semibold text-[#3F3F46]"
        >
          {{ typeOptions.find(o => o.key === typeFilter)?.label }}
          <button @click="typeFilter = 'all'" class="ml-0.5 hover:opacity-70">
            <span class="material-icons text-[12px]">close</span>
          </button>
        </span>
        <span
          v-if="yearFilter !== 'all'"
          class="flex items-center gap-1 rounded-full bg-[#3F3F46]/10 px-3 py-0.5 font-semibold text-[#3F3F46]"
        >
          {{ yearFilter }}년
          <button @click="yearFilter = 'all'" class="ml-0.5 hover:opacity-70">
            <span class="material-icons text-[12px]">close</span>
          </button>
        </span>
        <span
          v-if="tagFilter !== 'all'"
          class="flex items-center gap-1 rounded-full bg-[#3F3F46]/10 px-3 py-0.5 font-semibold text-[#3F3F46]"
        >
          #{{ tagFilter }}
          <button @click="tagFilter = 'all'" class="ml-0.5 hover:opacity-70">
            <span class="material-icons text-[12px]">close</span>
          </button>
        </span>
        <span :class="isDark ? 'text-white/30' : 'text-gray-400'">· {{ filtered.length }}건</span>
      </div>

      <!-- 스켈레톤 로딩 -->
      <div v-if="pending" class="flex flex-col gap-4">
        <div
          v-for="i in 5" :key="i"
          class="animate-pulse rounded-2xl border p-6"
          :class="isDark ? 'border-white/[0.07] bg-[#111]' : 'border-gray-100 bg-white'"
        >
          <div class="flex items-start gap-4">
            <div class="flex-1">
              <div class="mb-3 flex gap-2">
                <div class="h-5 w-20 rounded-full" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
                <div class="h-5 w-12 rounded-full" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
              </div>
              <div class="mb-2 h-5 w-4/5 rounded-md" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
              <div class="mb-1 h-4 w-full rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
              <div class="h-4 w-2/3 rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
            </div>
            <div class="flex flex-shrink-0 gap-2">
              <div class="h-8 w-16 rounded-lg" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
              <div class="h-8 w-14 rounded-lg" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
            </div>
          </div>
        </div>
      </div>

      <!-- ── 논문 리스트 ──────────────────────── -->
      <div v-else ref="listRef">
        <!-- 결과 없음 -->
        <div
          v-if="sortedYears.length === 0"
          class="py-20 text-center"
          :class="isDark ? 'text-white/30' : 'text-gray-300'"
        >
          <span class="material-icons mb-3 block text-5xl">search_off</span>
          <p>{{ t('lab.publication.noResults') }}</p>
        </div>

        <!-- 연도별 그룹 -->
        <div v-for="year in sortedYears" :key="year" class="mb-10">
          <!-- 연도 구분선 -->
          <div class="mb-5 flex items-center gap-4">
            <span
              class="text-2xl font-extrabold tabular-nums"
              :class="isDark ? 'text-white/80' : 'text-gray-800'"
            >{{ year }}</span>
            <div :class="['flex-1 h-px', isDark ? 'bg-white/[0.07]' : 'bg-gray-100']" />
          </div>

          <div class="flex flex-col gap-4">
            <div
              v-for="(pub, i) in groupedByYear[year]"
              :key="pub.id"
              class="animate-item rounded-2xl border p-6 transition-all duration-200"
              :class="[
                { 'is-visible': isVisible },
                `delay-${i}`,
                isDark
                  ? 'border-white/[0.07] bg-[#111] hover:bg-[#1c1c1c]'
                  : 'border-gray-100 bg-white hover:shadow-md hover:shadow-black/5',
              ]"
            >
              <div class="flex items-start gap-4 mobile:flex-col">
                <div class="flex-1">
                  <!-- 뱃지 -->
                  <div class="mb-2 flex flex-wrap items-center gap-2">
                    <span
                      class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                      :class="typeBadge[pub.type] || 'bg-gray-100 text-gray-500'"
                    >{{ typeLabel[pub.type] || pub.type }}</span>
                    <span
                      v-if="pub.award"
                      class="flex items-center gap-1 rounded-full bg-amber-500/10 px-2.5 py-0.5 text-[11px] font-semibold text-amber-600"
                    >
                      <span class="material-icons text-[12px]">emoji_events</span>
                      {{ pub.award.title.en }}
                    </span>
                    <span v-if="pub.month" class="text-xs" :class="isDark ? 'text-white/30' : 'text-gray-400'">
                      {{ pub.year }}.{{ String(pub.month).padStart(2, '0') }}
                    </span>
                  </div>

                  <!-- 제목 -->
                  <h3
                    class="mb-1.5 font-bold leading-snug"
                    :class="isDark ? 'text-white' : 'text-gray-900'"
                  >{{ pub.title }}</h3>

                  <!-- 저자 -->
                  <p class="mb-1 text-sm" :class="isDark ? 'text-white/50' : 'text-gray-500'">
                    {{ pub.authors.join(', ') }}
                  </p>

                  <!-- 학회/저널명 -->
                  <p class="text-sm italic" :class="isDark ? 'text-white/35' : 'text-gray-400'">
                    {{ pub.venue }}
                    <span v-if="pub.volume"> · {{ pub.volume }}</span>
                    <span v-if="pub.pages"> · pp. {{ pub.pages }}</span>
                  </p>

                  <!-- 초록 (접기/펼치기) -->
                  <details v-if="pub.abstract" class="mt-3">
                    <summary
                      class="cursor-pointer text-xs font-semibold text-[#3F3F46] select-none"
                    >Abstract</summary>
                    <p
                      class="mt-2 text-sm leading-relaxed"
                      :class="isDark ? 'text-white/50' : 'text-gray-500'"
                    >{{ pub.abstract }}</p>
                  </details>

                  <!-- 태그 -->
                  <div v-if="pub.tags.length" class="mt-3 flex flex-wrap gap-1.5">
                    <span
                      v-for="tag in pub.tags"
                      :key="tag"
                      class="rounded-full px-2 py-0.5 text-[11px]"
                      :class="isDark ? 'bg-white/[0.06] text-white/40' : 'bg-gray-100 text-gray-400'"
                    >{{ tag }}</span>
                  </div>
                </div>

                <!-- 링크 버튼 -->
                <div class="flex flex-shrink-0 flex-wrap gap-2 mobile:flex-row">
                  <a v-if="pub.pdfUrl"      :href="pub.pdfUrl"      target="_blank" class="pub-link bg-[#3F3F46]/10 text-[#3F3F46] hover:bg-[#3F3F46]/20">
                    <span class="material-icons text-[14px]">picture_as_pdf</span>PDF
                  </a>
                  <a v-if="pub.codeUrl"     :href="pub.codeUrl"     target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">
                    <span class="material-icons text-[14px]">code</span>{{ t('lab.common.code') }}
                  </a>
                  <a v-if="pub.projectUrl"  :href="pub.projectUrl"  target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">
                    <span class="material-icons text-[14px]">open_in_new</span>{{ t('lab.common.project') }}
                  </a>
                  <a v-if="pub.videoUrl"    :href="pub.videoUrl"    target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">
                    <span class="material-icons text-[14px]">play_circle</span>{{ t('lab.common.video') }}
                  </a>
                  <a v-if="pub.slidesUrl"   :href="pub.slidesUrl"   target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">
                    <span class="material-icons text-[14px]">slideshow</span>{{ t('lab.common.slides') }}
                  </a>
                  <a v-if="pub.posterUrl"   :href="pub.posterUrl"   target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">
                    <span class="material-icons text-[14px]">image</span>{{ t('lab.common.poster') }}
                  </a>
                  <a v-if="pub.arxivUrl"    :href="pub.arxivUrl"    target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">arXiv</a>
                  <a v-if="pub.doi"         :href="`https://doi.org/${pub.doi}`" target="_blank" :class="['pub-link', isDark ? 'pub-link-dark' : 'pub-link-light']">DOI</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.pub-link {
  display: flex;
  align-items: center;
  gap: 0.25rem;
  border-radius: 0.5rem;
  padding: 0.375rem 0.75rem;
  font-size: 12px;
  font-weight: 600;
  transition: color 0.15s, background-color 0.15s;
  white-space: nowrap;
}
.pub-link-dark  { background: rgb(255 255 255 / 0.07); color: rgb(255 255 255 / 0.65); }
.pub-link-dark:hover  { background: rgb(255 255 255 / 0.12); }
.pub-link-light { background: #f3f4f6; color: #4b5563; }
.pub-link-light:hover { background: #e5e7eb; }
</style>
