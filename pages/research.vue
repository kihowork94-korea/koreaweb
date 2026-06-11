<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.research')} | 지능형 바이오 모니터링 연구실` })

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: areasRaw } = useLabResearch()
const researchAreas = computed<any[]>(() => (areasRaw.value as any[]) ?? [])

const sectionRef = ref<HTMLElement | null>(null)
const isVisible  = ref(false)
useIntersectionObserver(sectionRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[1200px]">

      <!-- 헤더 -->
      <div class="mb-16 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">Research Areas</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.research') }}</h1>
      </div>

      <!-- 연구 분야 목록 -->
      <div ref="sectionRef" class="flex flex-col gap-8">
        <div
          v-for="(area, i) in researchAreas"
          :key="area.id"
          class="animate-item flex gap-10 rounded-3xl border p-10 mobile:flex-col mobile:p-6"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i}`,
            isDark
              ? 'border-white/[0.07] bg-white/[0.03]'
              : 'border-gray-100 bg-white/70',
          ]"
        >
          <!-- 아이콘 + 번호 -->
          <div class="flex flex-shrink-0 flex-col items-center gap-3">
            <div class="flex h-16 w-16 items-center justify-center rounded-2xl bg-[#C21807]/10">
              <UIcon :name="area.iconName" class="h-8 w-8 text-[#C21807]" />
            </div>
            <span
              class="text-xs font-bold tabular-nums"
              :class="isDark ? 'text-white/20' : 'text-gray-300'"
            >{{ String(i + 1).padStart(2, '0') }}</span>
          </div>

          <!-- 내용 -->
          <div class="flex-1">
            <h2
              class="mb-4 text-2xl font-bold mobile:text-xl"
              :class="isDark ? 'text-white' : 'text-gray-900'"
            >{{ loc(area.title) }}</h2>
            <p
              class="mb-6 text-base leading-relaxed"
              :class="isDark ? 'text-white/60' : 'text-gray-600'"
            >{{ loc(area.description) }}</p>

            <!-- 키워드 태그 -->
            <div class="flex flex-wrap gap-2">
              <span
                v-for="kw in area.keywords"
                :key="loc(kw)"
                class="rounded-full border px-3.5 py-1.5 text-[12px] font-semibold transition-colors"
                :class="isDark
                  ? 'border-white/[0.08] bg-white/[0.04] text-white/60 hover:border-[#C21807]/40 hover:text-[#C21807]/80'
                  : 'border-gray-200 bg-gray-50 text-gray-500 hover:border-[#C21807]/30 hover:text-[#C21807]'"
              >{{ loc(kw) }}</span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>
