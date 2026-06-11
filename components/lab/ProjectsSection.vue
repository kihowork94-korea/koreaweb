<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: projectsRaw } = useLabProjects()
const ongoingProjects = computed<any[]>(() =>
  ((projectsRaw.value as any[]) ?? [])
    .filter((p: any) => p.status === 'ongoing')
    .sort((a: any, b: any) => b.startYear - a.startYear)
    .slice(0, 4)
)

const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => {
  if (entry.isIntersecting) isVisible.value = true
}, { threshold: 0.1 })
</script>

<template>
  <section
    v-if="ongoingProjects.length > 0"
    id="projects"
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
          Projects
        </p>
        <h2
          class="text-4xl font-bold mobile:text-2xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >
          {{ t('lab.nav.projects') }}
        </h2>
      </div>

      <!-- 프로젝트 리스트 -->
      <div class="grid grid-cols-2 gap-4 mobile:grid-cols-1">
        <div
          v-for="(project, i) in ongoingProjects"
          :key="project.id"
          class="animate-item group rounded-2xl border p-6 transition-all duration-300"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i + 1}`,
            isDark
              ? 'border-white/[0.10] bg-[#111] hover:bg-[#1c1c1c]'
              : 'border-gray-200 bg-white hover:shadow-md hover:shadow-black/5',
          ]"
        >
          <!-- 이미지 -->
          <div
            v-if="project.imageUrl"
            class="mb-4 overflow-hidden rounded-xl"
            :class="isDark ? 'bg-white/5' : 'bg-gray-100'"
          >
            <img
              :src="project.imageUrl"
              :alt="loc(project.title)"
              class="h-36 w-full object-cover transition-transform duration-500 group-hover:scale-[1.03]"
              loading="lazy"
              decoding="async"
              @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
            />
          </div>

          <!-- 상태 + 기간 -->
          <div class="mb-3 flex items-center gap-2">
            <span class="flex items-center gap-1.5 rounded-full bg-emerald-500/10 px-2.5 py-0.5 text-[11px] font-semibold text-emerald-600">
              <span class="h-1.5 w-1.5 rounded-full bg-emerald-500" />
              진행 중
            </span>
            <span class="text-[12px]" :class="isDark ? 'text-white/35' : 'text-gray-400'">
              {{ project.startYear }}–
            </span>
          </div>

          <!-- 제목 -->
          <h3
            class="mb-2 text-base font-bold leading-snug"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >
            {{ loc(project.title) }}
          </h3>

          <!-- 설명 -->
          <p
            v-if="project.description"
            class="line-clamp-2 text-sm leading-relaxed"
            :class="isDark ? 'text-white/50' : 'text-gray-500'"
          >
            {{ loc(project.description) }}
          </p>

          <!-- 지원기관 -->
          <p
            v-if="project.fundingAgency"
            class="mt-3 text-[11px] font-medium"
            :class="isDark ? 'text-white/30' : 'text-gray-400'"
          >
            {{ project.fundingAgency }}
          </p>
        </div>
      </div>

      <!-- 더보기 링크 -->
      <div
        class="animate-item mt-10 text-center"
        :class="{ 'is-visible': isVisible }"
        style="transition-delay: 400ms"
      >
        <NuxtLink
          :to="localePath('/projects')"
          class="inline-flex items-center gap-1.5 text-sm font-semibold text-[#C21807] transition-all duration-200 hover:gap-3"
        >
          {{ t('lab.common.viewAll') }}
          <span class="material-icons text-[18px]">arrow_forward</span>
        </NuxtLink>
      </div>

    </div>
  </section>
</template>
