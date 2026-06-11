<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: labInfoArr } = useLabInfo()
const labInfo = computed(() => (labInfoArr.value as any[])?.[0])

const { data: labHistoryArr } = useLabHistory()
const labHistory = computed<any[]>(() => (labHistoryArr.value as any[]) ?? [])

const { data: membersArr } = useLabMembers()
const professor = computed(() => (membersArr.value as any[] ?? []).find((m: any) => m.role === 'professor'))

useHead({ title: `${t('lab.nav.about')} | 지능형 바이오 모니터링 연구실` })

// 섹션별 등장 애니메이션
const heroRef    = ref<HTMLElement | null>(null)
const profileRef = ref<HTMLElement | null>(null)
const historyRef = ref<HTMLElement | null>(null)
const heroVis    = ref(false)
const profileVis = ref(false)
const historyVis = ref(false)

useIntersectionObserver(heroRef,    ([e]) => { if (e.isIntersecting) heroVis.value    = true }, { threshold: 0.1 })
useIntersectionObserver(profileRef, ([e]) => { if (e.isIntersecting) profileVis.value = true }, { threshold: 0.1 })
useIntersectionObserver(historyRef, ([e]) => { if (e.isIntersecting) historyVis.value = true }, { threshold: 0.1 })
</script>

<template>
  <div>
    <!-- ── 페이지 헤더 ─────────────────────────── -->
    <section ref="heroRef" class="px-6 pb-16 pt-20 text-center">
      <p
        class="animate-item mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]"
        :class="{ 'is-visible': heroVis }"
      >About</p>
      <h1
        class="animate-item text-5xl font-extrabold mobile:text-3xl"
        :class="[{ 'is-visible': heroVis }, 'delay-1', isDark ? 'text-white' : 'text-gray-900']"
      >{{ t('lab.nav.about') }}</h1>
      <p
        class="animate-item mx-auto mt-4 max-w-2xl text-lg leading-relaxed mobile:text-base"
        :class="[{ 'is-visible': heroVis }, 'delay-2', isDark ? 'text-white/55' : 'text-gray-500']"
      >{{ labInfo ? loc(labInfo.description) : '' }}</p>
    </section>

    <!-- ── 교수 소개 ─────────────────────────────── -->
    <section ref="profileRef" class="px-6 pb-24">
      <div class="mx-auto max-w-[1100px]">
        <div
          class="animate-item flex gap-12 rounded-3xl border p-10 mobile:flex-col mobile:p-6"
          :class="[
            { 'is-visible': profileVis },
            isDark ? 'border-white/[0.07] bg-white/[0.03]' : 'border-gray-100 bg-white/70',
          ]"
        >
          <!-- 사진 -->
          <div class="flex-shrink-0">
            <div
              class="h-52 w-52 overflow-hidden rounded-2xl mobile:h-32 mobile:w-32"
              :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
            >
              <img
                v-if="professor?.imageUrl"
                :src="professor.imageUrl"
                :alt="loc(professor.name)"
                class="h-full w-full object-cover"
                @error="($event.target as HTMLImageElement).style.display='none'"
              />
              <div
                v-else
                class="flex h-full w-full items-center justify-center"
              >
                <span :class="['material-icons text-6xl mobile:text-4xl', isDark ? 'text-white/20' : 'text-gray-300']">person</span>
              </div>
            </div>
          </div>

          <!-- 정보 -->
          <div class="flex flex-1 flex-col justify-center gap-4">
            <div>
              <h2
                class="text-3xl font-extrabold mobile:text-2xl"
                :class="isDark ? 'text-white' : 'text-gray-900'"
              >{{ professor ? loc(professor.name) : '' }}</h2>
              <p class="mt-1 text-base font-medium text-[#C21807]">
                {{ labInfo ? loc(labInfo.university) : '' }}
              </p>
            </div>

            <!-- 연구 관심사 태그 -->
            <div v-if="professor?.researchInterests?.length" class="flex flex-wrap gap-2">
              <span
                v-for="ri in professor.researchInterests"
                :key="loc(ri)"
                class="rounded-full px-3 py-1 text-[12px] font-medium"
                :class="isDark ? 'bg-[#C21807]/15 text-[#C21807]/90' : 'bg-[#C21807]/8 text-[#C21807]'"
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
              <a
                v-if="professor?.email"
                :href="`mailto:${professor.email}`"
                class="flex items-center gap-1.5 text-sm font-medium text-[#C21807] transition-opacity hover:opacity-70"
              >
                <span class="material-icons text-[16px]">mail</span>
                {{ professor.email }}
              </a>
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

    <!-- ── 연혁 타임라인 ──────────────────────────── -->
    <section ref="historyRef" class="px-6 pb-28">
      <div class="mx-auto max-w-[900px]">

        <div class="animate-item mb-12 text-center" :class="{ 'is-visible': historyVis }">
          <p class="mb-2 text-sm font-semibold uppercase tracking-widest text-[#C21807]">History</p>
          <h2
            class="text-3xl font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >연혁</h2>
        </div>

        <!-- 타임라인 -->
        <div class="relative">
          <!-- 세로선 -->
          <div
            class="absolute left-[90px] top-0 h-full w-px mobile:left-[64px]"
            :class="isDark ? 'bg-white/[0.07]' : 'bg-gray-100'"
          />

          <div
            v-for="(item, i) in [...labHistory].sort((a: any, b: any) => b.year - a.year || b.month - a.month)"
            :key="`${item.year}-${item.month}`"
            class="animate-item relative mb-8 flex items-start gap-8 mobile:gap-5"
            :class="[{ 'is-visible': historyVis }, `delay-${Math.min(i + 1, 12)}`]"
          >
            <!-- 날짜 -->
            <div class="w-[90px] flex-shrink-0 pt-1 text-right mobile:w-[64px]">
              <span class="text-sm font-bold" :class="isDark ? 'text-white/80' : 'text-gray-700'">{{ item.year }}</span>
              <span class="block text-xs" :class="isDark ? 'text-white/35' : 'text-gray-400'">
                {{ String(item.month).padStart(2, '0') }}월
              </span>
            </div>

            <!-- 원형 마커 -->
            <div class="relative mt-1.5 flex-shrink-0">
              <div class="h-3 w-3 rounded-full bg-[#C21807] ring-4"
                :class="isDark ? 'ring-black' : 'ring-white'"
              />
            </div>

            <!-- 내용 -->
            <div
              class="flex-1 rounded-xl border p-4 transition-colors"
              :class="isDark
                ? 'border-white/[0.06] bg-white/[0.03]'
                : 'border-gray-100 bg-white/60'"
            >
              <p
                class="text-sm leading-relaxed"
                :class="isDark ? 'text-white/75' : 'text-gray-700'"
              >{{ loc(item.content) }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
