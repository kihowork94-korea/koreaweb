<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const { data: pubsRaw } = useLabPublications()
const highlightedPublications = computed<any[]>(() =>
  ((pubsRaw.value as any[]) ?? []).filter((p: any) => p.isHighlighted)
)

const typeLabel: Record<string, string> = {
  journal: 'Journal',
  conference: 'Conference',
  patent: 'Patent',
  preprint: 'Preprint',
  book: 'Book',
}

const typeBadgeClass: Record<string, string> = {
  journal:    'bg-blue-500/10 text-blue-500',
  conference: 'bg-[#C21807]/10 text-[#C21807]',
  patent:     'bg-amber-500/10 text-amber-600',
  preprint:   'bg-violet-500/10 text-violet-500',
  book:       'bg-emerald-500/10 text-emerald-600',
}

// 섹션 등장 애니메이션
const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => {
  if (entry.isIntersecting) isVisible.value = true
}, { threshold: 0.1 })
</script>

<template>
  <!-- 데이터 없으면 섹션 자체를 숨김 -->
  <section
    v-if="highlightedPublications.length > 0"
    id="publications"
    ref="sectionRef"
    class="relative px-6 py-24 mobile:py-16"
  >
    <!-- 섹션 구분선 -->
    <div
      class="mx-auto mb-24 h-px max-w-[1200px] mobile:mb-16"
      :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'"
    />

    <div class="mx-auto max-w-[1200px]">

      <!-- 섹션 헤더 -->
      <div
        class="animate-item mb-14 text-center"
        :class="{ 'is-visible': isVisible }"
      >
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">
          Publications
        </p>
        <h2
          class="text-4xl font-bold mobile:text-2xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >
          {{ t('lab.nav.publications') }}
        </h2>
      </div>

      <!-- 논문 리스트 -->
      <div class="flex flex-col gap-4">
        <div
          v-for="(pub, i) in highlightedPublications"
          :key="pub.id"
          class="animate-item group rounded-2xl border p-6 transition-all duration-300"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i + 1}`,
            isDark
              ? 'border-white/[0.07] bg-white/[0.03] hover:bg-white/[0.06]'
              : 'border-gray-100 bg-white/60 hover:bg-white/90 hover:shadow-md hover:shadow-black/5',
          ]"
        >
          <div class="flex items-start justify-between gap-4 mobile:flex-col">
            <div class="flex-1">

              <!-- 타입 배지 + 수상 -->
              <div class="mb-2.5 flex flex-wrap items-center gap-2">
                <span
                  class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold"
                  :class="typeBadgeClass[pub.type] || 'bg-gray-100 text-gray-500'"
                >
                  {{ typeLabel[pub.type] || pub.type }}
                </span>
                <span
                  v-if="pub.award"
                  class="flex items-center gap-1 rounded-full bg-amber-500/10 px-2.5 py-0.5 text-[11px] font-semibold text-amber-600"
                >
                  <span class="material-icons text-[12px]">emoji_events</span>
                  {{ pub.award.title[useI18n().locale.value as keyof typeof pub.award.title] || pub.award.title.en }}
                </span>
                <span
                  :class="['text-[12px]', isDark ? 'text-white/35' : 'text-gray-400']"
                >
                  {{ pub.year }}
                </span>
              </div>

              <!-- 제목 -->
              <h3
                class="mb-1.5 text-base font-bold leading-snug"
                :class="isDark ? 'text-white' : 'text-gray-900'"
              >
                {{ pub.title }}
              </h3>

              <!-- 저자 -->
              <p
                class="mb-1 text-sm"
                :class="isDark ? 'text-white/50' : 'text-gray-500'"
              >
                {{ pub.authors.join(', ') }}
              </p>

              <!-- 저널/학회명 -->
              <p
                class="text-sm italic"
                :class="isDark ? 'text-white/40' : 'text-gray-400'"
              >
                {{ pub.venue }}
              </p>
            </div>

            <!-- 링크 버튼들 -->
            <div class="flex flex-shrink-0 flex-wrap gap-2">
              <a
                v-if="pub.pdfUrl"
                :href="pub.pdfUrl"
                target="_blank"
                class="flex items-center gap-1 rounded-lg bg-[#C21807]/10 px-3 py-1.5 text-[12px] font-semibold text-[#C21807] transition-colors hover:bg-[#C21807]/20"
              >
                <span class="material-icons text-[14px]">picture_as_pdf</span>
                {{ t('lab.common.pdf') }}
              </a>
              <a
                v-if="pub.codeUrl"
                :href="pub.codeUrl"
                target="_blank"
                class="flex items-center gap-1 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/8 text-white/70 hover:bg-white/15' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                <span class="material-icons text-[14px]">code</span>
                {{ t('lab.common.code') }}
              </a>
              <a
                v-if="pub.projectUrl"
                :href="pub.projectUrl"
                target="_blank"
                class="flex items-center gap-1 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/8 text-white/70 hover:bg-white/15' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                <span class="material-icons text-[14px]">open_in_new</span>
                {{ t('lab.common.project') }}
              </a>
              <a
                v-if="pub.videoUrl"
                :href="pub.videoUrl"
                target="_blank"
                class="flex items-center gap-1 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/8 text-white/70 hover:bg-white/15' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                <span class="material-icons text-[14px]">play_circle</span>
                {{ t('lab.common.video') }}
              </a>
              <a
                v-if="pub.doi"
                :href="`https://doi.org/${pub.doi}`"
                target="_blank"
                class="flex items-center gap-1 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/8 text-white/70 hover:bg-white/15' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                DOI
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- 더보기 링크 -->
      <div
        class="animate-item mt-10 text-center"
        :class="{ 'is-visible': isVisible }"
        style="transition-delay: 400ms"
      >
        <NuxtLink
          :to="localePath('/publications')"
          class="inline-flex items-center gap-1.5 text-sm font-semibold text-[#C21807] transition-all duration-200 hover:gap-3"
        >
          {{ t('lab.common.viewAll') }}
          <span class="material-icons text-[18px]">arrow_forward</span>
        </NuxtLink>
      </div>

    </div>
  </section>
</template>
