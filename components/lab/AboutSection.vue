<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: labInfoArr } = useLabInfo()
const labInfo = computed(() => (labInfoArr.value as any[])?.[0])

const { data: labHistoryArr } = useLabHistory()
const labHistory = computed<any[]>(() => (labHistoryArr.value as any[]) ?? [])

const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => {
  if (entry.isIntersecting) isVisible.value = true
}, { threshold: 0.1 })
</script>

<template>
  <section id="about" ref="sectionRef" class="relative px-6 py-24 mobile:py-16">
    <div class="mx-auto max-w-[900px]">

      <!-- 섹션 헤더 -->
      <div class="animate-item mb-14 text-center" :class="{ 'is-visible': isVisible }">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">About</p>
        <h2
          class="text-4xl font-bold mobile:text-2xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >
          {{ t('lab.nav.about') }}
        </h2>
      </div>

      <!-- about 페이지와 동일한 소개 카드 -->
      <div
        class="animate-item delay-1 rounded-3xl border p-10 mobile:p-6"
        :class="[
          { 'is-visible': isVisible },
          isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
        ]"
      >
        <!-- 대표 수치 -->
        <div
          class="mb-8 grid grid-cols-3 gap-4 border-b pb-8 mobile:grid-cols-1"
          :class="isDark ? 'border-white/[0.07]' : 'border-gray-100'"
        >
          <div class="text-center">
            <p class="text-3xl font-extrabold text-[#C21807]">
              {{ labInfo?.established ? new Date().getFullYear() - Number(labInfo.established) + 1 : '—' }}
            </p>
            <p class="mt-1 text-xs font-medium uppercase tracking-wider" :class="isDark ? 'text-white/40' : 'text-gray-400'">
              Years of Research
            </p>
          </div>
          <div class="text-center">
            <p class="text-3xl font-extrabold text-[#C21807]">
              {{ labHistory.length || '—' }}
            </p>
            <p class="mt-1 text-xs font-medium uppercase tracking-wider" :class="isDark ? 'text-white/40' : 'text-gray-400'">
              Milestones
            </p>
          </div>
          <div class="text-center">
            <p class="text-3xl font-extrabold text-[#C21807]">
              {{ labInfo?.established || '—' }}
            </p>
            <p class="mt-1 text-xs font-medium uppercase tracking-wider" :class="isDark ? 'text-white/40' : 'text-gray-400'">
              Founded
            </p>
          </div>
        </div>

        <!-- 소개 텍스트 -->
        <p
          class="text-base leading-[1.9]"
          :class="isDark ? 'text-white/65' : 'text-gray-600'"
        >
          {{ labInfo ? loc(labInfo.description) : '' }}
        </p>

        <!-- 소속 태그 -->
        <div class="mt-8 flex flex-wrap gap-2">
          <span
            v-if="labInfo?.university"
            class="inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-semibold"
            :class="isDark ? 'bg-white/[0.07] text-white/60' : 'bg-gray-100 text-gray-500'"
          >
            <span class="material-icons text-[13px]">account_balance</span>
            {{ loc(labInfo.university) }}
          </span>
          <span
            v-if="labInfo?.department"
            class="inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-semibold"
            :class="isDark ? 'bg-white/[0.07] text-white/60' : 'bg-gray-100 text-gray-500'"
          >
            <span class="material-icons text-[13px]">school</span>
            {{ loc(labInfo.department) }}
          </span>
        </div>

        <!-- 더보기 -->
        <div class="mt-8">
          <NuxtLink
            :to="localePath('/about')"
            class="inline-flex items-center gap-1.5 text-sm font-semibold text-[#C21807] transition-all duration-200 hover:gap-3"
          >
            {{ t('lab.common.learnMore') }}
            <span class="material-icons text-[18px]">arrow_forward</span>
          </NuxtLink>
        </div>
      </div>

    </div>
  </section>
</template>
