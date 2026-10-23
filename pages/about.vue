<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const labels = useLocalizedLabels()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: labInfoArr } = useLabInfo()
const labInfo = computed(() => (labInfoArr.value as any[])?.[0])

const { data: membersArr } = useLabMembers()
const professor = computed(() => (membersArr.value as any[] ?? []).find((m: any) => m.role === 'professor'))
const professorPortrait = '/images/members/professor-lee-full.png'

usePageSeo('about')

// 섹션별 등장 애니메이션
const heroRef    = ref<HTMLElement | null>(null)
const introRef   = ref<HTMLElement | null>(null)
const profileRef = ref<HTMLElement | null>(null)
const heroVis    = ref(false)
const introVis   = ref(false)
const profileVis = ref(false)

useIntersectionObserver(heroRef,    ([e]) => { if (e.isIntersecting) heroVis.value    = true }, { threshold: 0.1 })
useIntersectionObserver(introRef,   ([e]) => { if (e.isIntersecting) introVis.value   = true }, { threshold: 0.1 })
useIntersectionObserver(profileRef, ([e]) => { if (e.isIntersecting) profileVis.value = true }, { threshold: 0.1 })
</script>

<template>
  <div>
    <!-- ── 페이지 헤더 ─────────────────────────── -->
    <section ref="heroRef" class="px-6 pb-16 pt-20 text-center">
      <p
        class="animate-item mb-3 text-sm font-semibold uppercase tracking-widest text-[#D97720]"
        :class="{ 'is-visible': heroVis }"
      >About</p>
      <h1
        class="animate-item text-5xl font-extrabold mobile:text-3xl"
        :class="[{ 'is-visible': heroVis }, 'delay-1', isDark ? 'text-white' : 'text-gray-900']"
      >{{ t('lab.nav.about') }}</h1>
    </section>

    <!-- ── 연구실 소개 ────────────────────────────── -->
    <section ref="introRef" class="px-6 pb-24">
      <div class="mx-auto max-w-[900px]">

        <div
          class="animate-item delay-1 rounded-3xl border p-10 mobile:p-6"
          :class="[
            { 'is-visible': introVis },
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <!-- 상단: 대표 수치 -->
          <div
            class="mb-8 grid grid-cols-2 gap-4 mobile:grid-cols-1 border-b pb-8"
            :class="isDark ? 'border-white/[0.07]' : 'border-gray-100'"
          >
            <div class="text-center">
              <p class="text-3xl font-extrabold text-[#D97720]">
                {{ labInfo?.established ? new Date().getFullYear() - Number(labInfo.established) + 1 : '—' }}
              </p>
              <p class="mt-1 text-xs font-medium uppercase tracking-wider" :class="isDark ? 'text-white/40' : 'text-gray-400'">
                Years of Research
              </p>
            </div>
            <div class="text-center">
              <p class="text-3xl font-extrabold text-[#D97720]">
                {{ labInfo?.established || '—' }}
              </p>
              <p class="mt-1 text-xs font-medium uppercase tracking-wider" :class="isDark ? 'text-white/40' : 'text-gray-400'">
                Founded
              </p>
            </div>
          </div>

          <!-- 소개 텍스트 -->
          <LabIntroduction
            :fallback="labInfo ? loc(labInfo.description) : ''"
            :class="isDark ? 'text-white/65' : 'text-gray-600'"
          />

        </div>
      </div>
    </section>

    <!-- ── 연혁 타임라인 ──────────────────────────── -->
    <!-- ── 교수 소개 ─────────────────────────────── -->
    <section ref="profileRef" class="px-6 pb-28">
      <div class="mx-auto max-w-[900px]">

        <div class="animate-item mb-12 text-center" :class="{ 'is-visible': profileVis }">
          <p class="mb-2 text-sm font-semibold uppercase tracking-widest text-[#D97720]">Principal Investigator</p>
          <h2
            class="text-3xl font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >{{ labels.principal }}</h2>
        </div>

        <!-- 교수 데이터 없을 때 빈 상태 -->
        <div
          v-if="!professor"
          class="animate-item delay-1 py-16 text-center"
          :class="[{ 'is-visible': profileVis }, isDark ? 'text-white/30' : 'text-gray-300']"
        >
          <span class="material-icons mb-3 block text-5xl">person_off</span>
          <p class="text-sm">{{ t('lab.common.noData') }}</p>
        </div>

        <div
          v-else
          class="animate-item delay-1 grid min-h-[360px] grid-cols-[42%_1fr] overflow-hidden rounded-3xl border mobile:grid-cols-1"
          :class="[
            { 'is-visible': profileVis },
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <!-- 사진 -->
          <div class="min-h-[360px] overflow-hidden mobile:h-[340px] mobile:min-h-0" :class="isDark ? 'bg-white/10' : 'bg-gray-100'">
            <img
              :src="professorPortrait"
              :alt="loc(professor.name)"
              class="h-full w-full object-contain object-bottom"
              loading="lazy"
              decoding="async"
              @error="($event.target as HTMLImageElement).style.display='none'"
            />
          </div>

          <!-- 정보 -->
          <div class="flex min-w-0 flex-col justify-center gap-4 p-10 mobile:p-6">
            <div>
              <h2
                class="text-3xl font-extrabold mobile:text-2xl"
                :class="isDark ? 'text-white' : 'text-gray-900'"
              >{{ professor ? loc(professor.name) : '' }}</h2>
              <p class="mt-1 text-base font-medium text-[#D97720]">
                {{ professor ? loc(professor.bio) : '' }}
              </p>
            </div>

            <!-- 연구 관심사 태그 -->
            <div v-if="professor?.researchInterests?.length" class="flex flex-wrap gap-2">
              <span
                v-for="ri in professor.researchInterests"
                :key="loc(ri)"
                class="rounded-full px-3 py-1 text-[12px] font-medium"
                :class="isDark ? 'bg-[#D97720]/15 text-[#D97720]/90' : 'bg-[#D97720]/8 text-[#D97720]'"
              >{{ loc(ri) }}</span>
            </div>

            <!-- 상세 소개 -->
            <p
              v-if="professor?.description"
              class="text-sm leading-relaxed"
              :class="isDark ? 'text-white/55' : 'text-gray-500'"
            >{{ loc(professor.description) }}</p>

            <!-- 링크들 -->
            <div class="flex flex-wrap gap-3">
              <span
                v-if="professor?.email"
                class="flex items-center gap-1.5 text-sm font-medium text-[#D97720]"
              >
                <span class="material-icons text-[16px]">mail</span>
                {{ professor.email }}
              </span>
              <a
                v-if="professor?.homepage"
                :href="professor.homepage"
                target="_blank"
                class="flex items-center gap-1.5 text-sm font-medium transition-colors"
                :class="isDark ? 'text-white/60 hover:text-white' : 'text-gray-500 hover:text-gray-900'"
              >
                <span class="material-icons text-[16px]">language</span>
                {{ t('lab.member.homepage') }}
              </a>
              <a
                v-if="professor?.googleScholar"
                :href="professor.googleScholar"
                target="_blank"
                class="flex items-center gap-1.5 text-sm font-medium transition-colors"
                :class="isDark ? 'text-white/60 hover:text-white' : 'text-gray-500 hover:text-gray-900'"
              >
                <span class="material-icons text-[16px]">school</span>
                {{ t('lab.member.googleScholar') }}
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
