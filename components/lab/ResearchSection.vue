<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: areasRaw } = useLabResearch()
const researchAreas = computed<any[]>(() => (areasRaw.value as any[]) ?? [])

// 섹션 등장 애니메이션
const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => {
  if (entry.isIntersecting) isVisible.value = true
}, { threshold: 0.1 })
</script>

<template>
  <section id="research" ref="sectionRef" class="relative px-6 py-24 mobile:py-16">
    <div class="mx-auto max-w-[1200px]">

      <!-- 섹션 헤더 -->
      <div
        class="animate-item mb-14 text-center"
        :class="{ 'is-visible': isVisible }"
      >
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">
          Research
        </p>
        <h2
          class="text-4xl font-bold mobile:text-2xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >
          {{ t('lab.nav.research') }}
        </h2>
      </div>

      <!-- 연구 분야 카드 그리드 -->
      <div class="grid grid-cols-3 gap-6 mobile:grid-cols-1 md:grid-cols-2">
        <div
          v-for="(area, i) in researchAreas"
          :key="area.id"
          class="animate-item group rounded-2xl border p-7 transition-all duration-300 hover:-translate-y-1"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i + 1}`,
            isDark
              ? 'border-white/[0.07] bg-white/[0.03] hover:bg-white/[0.06] hover:border-white/[0.12]'
              : 'border-gray-100 bg-white/60 hover:bg-white/90 hover:border-gray-200 hover:shadow-lg hover:shadow-black/5',
          ]"
        >
          <!-- 아이콘 -->
          <div
            class="mb-5 inline-flex h-12 w-12 items-center justify-center rounded-xl bg-[#C21807]/10 transition-colors duration-200 group-hover:bg-[#C21807]/15"
          >
            <UIcon :name="area.iconName" class="h-6 w-6 text-[#C21807]" />
          </div>

          <!-- 제목 -->
          <h3
            class="mb-3 text-lg font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >
            {{ loc(area.title) }}
          </h3>

          <!-- 설명 -->
          <p
            class="mb-5 text-sm leading-relaxed line-clamp-3"
            :class="isDark ? 'text-white/50' : 'text-gray-500'"
          >
            {{ loc(area.description) }}
          </p>

          <!-- 키워드 태그 -->
          <div class="flex flex-wrap gap-1.5">
            <span
              v-for="kw in area.keywords.slice(0, 3)"
              :key="loc(kw)"
              class="rounded-full px-2.5 py-1 text-[11px] font-medium"
              :class="isDark ? 'bg-white/8 text-white/60' : 'bg-gray-100 text-gray-500'"
            >
              {{ loc(kw) }}
            </span>
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
          :to="localePath('/research')"
          class="inline-flex items-center gap-1.5 text-sm font-semibold text-[#C21807] transition-all duration-200 hover:gap-3"
        >
          {{ t('lab.common.viewAll') }}
          <span class="material-icons text-[18px]">arrow_forward</span>
        </NuxtLink>
      </div>

    </div>
  </section>
</template>
