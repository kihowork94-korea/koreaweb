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

const { data: membersArr } = useLabMembers()
const professor = computed(() => (membersArr.value as any[] ?? []).find((m: any) => m.role === 'professor'))

// 설명 첫 단락만 표시
const descriptionFirst = computed(() => {
  const full = labInfo.value ? loc(labInfo.value.description) : ''
  return full.split('\n\n')[0] ?? full
})

const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => {
  if (entry.isIntersecting) isVisible.value = true
}, { threshold: 0.1 })
</script>

<template>
  <section id="about" ref="sectionRef" class="relative px-6 py-24 mobile:py-16">
    <div class="mx-auto max-w-[1200px]">

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

      <!-- 카드 -->
      <div
        class="animate-item delay-1 rounded-3xl border p-10 mobile:p-6"
        :class="[
          { 'is-visible': isVisible },
          isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
        ]"
      >
        <div class="flex gap-12 mobile:flex-col mobile:gap-8">

          <!-- 교수 사진 -->
          <div class="flex-shrink-0">
            <div
              class="h-48 w-48 overflow-hidden rounded-2xl mobile:h-28 mobile:w-28"
              :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
            >
              <img
                v-if="professor?.imageUrl"
                :src="professor.imageUrl"
                :alt="professor ? loc(professor.name) : ''"
                class="h-full w-full object-cover"
                loading="lazy"
                decoding="async"
                @error="($event.target as HTMLImageElement).style.display='none'"
              />
              <div
                v-else
                class="flex h-full w-full items-center justify-center"
              >
                <span :class="['material-icons text-5xl mobile:text-3xl', isDark ? 'text-white/20' : 'text-gray-300']">person</span>
              </div>
            </div>
          </div>

          <!-- 텍스트 -->
          <div class="flex flex-1 flex-col justify-center gap-5">
            <!-- ARISE 풀이 뱃지 -->
            <div
              class="inline-flex w-fit items-center gap-2 rounded-full border px-4 py-1.5 text-xs font-semibold uppercase tracking-widest"
              :class="isDark ? 'border-[#C21807]/40 text-[#C21807]/80 bg-[#C21807]/5' : 'border-[#C21807]/30 text-[#C21807] bg-[#C21807]/5'"
            >
              <span class="h-1.5 w-1.5 rounded-full bg-[#C21807]" />
              <span class="text-[#C21807]">A</span>I-Integrated&nbsp;
              <span class="text-[#C21807]">R</span>ecognition and&nbsp;
              <span class="text-[#C21807]">I</span>ntelligent&nbsp;
              <span class="text-[#C21807]">S</span>ensing&nbsp;
              <span class="text-[#C21807]">E</span>ngineering
            </div>

            <!-- 교수 이름 + 소속 -->
            <div v-if="professor">
              <p
                class="text-2xl font-extrabold mobile:text-xl"
                :class="isDark ? 'text-white' : 'text-gray-900'"
              >{{ loc(professor.name) }}</p>
              <p class="mt-0.5 text-sm font-medium text-[#C21807]">
                {{ labInfo ? loc(labInfo.university) : '' }}
              </p>
            </div>

            <!-- 소개 첫 단락 -->
            <p
              class="text-sm leading-[1.9]"
              :class="isDark ? 'text-white/60' : 'text-gray-600'"
            >
              {{ descriptionFirst }}
            </p>

            <!-- 더보기 -->
            <NuxtLink
              :to="localePath('/about')"
              class="inline-flex w-fit items-center gap-1.5 text-sm font-semibold text-[#C21807] transition-all duration-200 hover:gap-3"
            >
              {{ t('lab.common.learnMore') }}
              <span class="material-icons text-[18px]">arrow_forward</span>
            </NuxtLink>
          </div>
        </div>
      </div>

    </div>
  </section>
</template>
