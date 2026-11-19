<script setup lang="ts">
const { member, titleId, lightSurface } = defineProps<{ member: any; titleId: string; lightSurface?: boolean }>()
const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark && !lightSurface)
const loc = (value: Record<string, string> | null | undefined) =>
  value?.[locale.value] || value?.en || value?.ko || ''

const professorAwards = [
  { year: '2026.02', title: { ko: 'KIST 우수연구개발팀상', en: 'KIST Outstanding R&D Team Award' } },
  { year: '2025.03', title: { ko: 'KIST 이달의 KIST인 상', en: 'KIST Person of the Month Award' } },
  { year: '2024.01', title: { ko: '보건복지부 장관 표창 수상', en: 'Minister of Health and Welfare Commendation' } },
  { year: '2022.02', title: { ko: 'KIST 연구개발팀상', en: 'KIST R&D Team Award' } },
  { year: '2021.12', title: { ko: '대한민국 10대 과학기술뉴스 선정 (인공지능 진단기술)', en: 'Selected for Korea’s Top 10 Science and Technology News (AI diagnostic technology)' } },
  { year: '2020.12', title: { ko: 'UST 최우수 교수상', en: 'UST Best Professor Award' } },
  { year: '2020.02', title: { ko: 'KIST 우수연구팀상', en: 'KIST Outstanding Research Team Award' } },
  { year: '2019.12', title: { ko: '대한민국 10대 과학기술뉴스 후보선정 (조류인플루엔자 진단기술)', en: 'Nominated for Korea’s Top 10 Science and Technology News (avian influenza diagnostic technology)' } },
]
const achievements = computed(() => {
  const existing = member.achievements ?? []
  if (member.role !== 'professor' || member.name?.ko !== '이관희') return existing
  return [
    ...professorAwards,
    ...existing.filter((award: any) => !professorAwards.some(current =>
      current.year.startsWith(String(award.year).slice(0, 4))
      && [award.title?.ko, award.title?.en].some(title =>
        title && [current.title.ko, current.title.en].some(text => text.includes(title)),
      ),
    )),
  ].sort((a, b) => String(b.year).localeCompare(String(a.year)))
})
</script>

<template>
    <!-- 기본 정보 -->
    <div class="flex gap-6 mobile:flex-col">
      <div
        class="shrink-0 overflow-hidden rounded-2xl"
        :class="member.role === 'professor' ? 'h-[380px] w-full max-w-[300px] mobile:mx-auto mobile:h-[310px]' : 'h-40 w-40 mobile:h-32 mobile:w-32'"

      >
        <img
          :src="member.imageUrl || '/images/ku-logo.png'"
          :alt="loc(member.name)"
          class="h-full w-full" :class="member.role === 'professor' ? 'object-contain' : 'object-cover'"
          decoding="async"
          @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
        />
      </div>
      <div>
        <p class="mb-1 text-xs font-semibold uppercase tracking-wider text-[#D97720]">
          {{ t(`lab.member.${member.role}`) }}
        </p>
        <h2
          :id="titleId"
          class="mb-2 text-2xl font-bold"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ loc(member.name) }}</h2>
        <p
          v-if="member.bio && loc(member.bio)"
          class="text-sm leading-relaxed"
          :class="isDark ? 'text-white/55' : 'text-gray-500'"
        >{{ loc(member.bio) }}</p>

        <!-- 링크 -->
        <div class="mt-3 flex flex-wrap gap-3">
          <span v-if="member.email"
            class="flex items-center gap-1 text-sm text-[#D97720]">
            <span class="material-icons text-[15px]">mail</span>{{ member.email }}
          </span>
          <a v-if="member.homepage" :href="member.homepage" target="_blank"
            :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
            <span class="material-icons text-[15px]">language</span>{{ t('lab.member.homepage') }}
          </a>
          <a v-if="member.googleScholar" :href="member.googleScholar" target="_blank"
            :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
            <span class="material-icons text-[15px]">school</span>Scholar
          </a>
          <a v-if="member.github" :href="member.github" target="_blank"
            :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
            <span class="material-icons text-[15px]">code</span>GitHub
          </a>
        </div>
      </div>
    </div>

    <!-- 구분선 -->
    <div :class="['my-6 h-px', isDark ? 'bg-white/[0.07]' : 'bg-gray-100']" />

    <!-- 연구 관심사 -->
    <div v-if="member.researchInterests?.length" class="mb-6">
      <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#D97720]">
        {{ t('lab.member.researchInterests') }}
      </h4>
      <div class="flex flex-wrap gap-2">
        <span
          v-for="ri in member.researchInterests"
          :key="loc(ri)"
          class="rounded-full px-3 py-1 text-xs font-medium"
          :class="isDark ? 'bg-[#D97720]/12 text-[#D97720]/80' : 'bg-[#D97720]/8 text-[#D97720]'"
        >{{ loc(ri) }}</span>
      </div>
    </div>

    <!-- 상세 소개 -->
    <div v-if="member.description && loc(member.description)" class="mb-6">
      <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#D97720]">About</h4>
      <p class="text-sm leading-relaxed" :class="isDark ? 'text-white/65' : 'text-gray-600'">
        {{ loc(member.description) }}
      </p>
    </div>

    <!-- 학력 -->
    <div v-if="member.education?.length" class="mb-6">
      <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#D97720]">
        {{ t('lab.member.education') }}
      </h4>
      <div class="flex flex-col gap-2">
        <div
          v-for="edu in member.education"
          :key="`${edu.year}-${loc(edu.degree)}`"
          class="flex items-start gap-3"
        >
          <span class="mt-0.5 text-[11px] font-bold text-[#D97720]">{{ edu.year }}</span>
          <div>
            <p class="text-sm font-semibold" :class="isDark ? 'text-white/80' : 'text-gray-800'">
              {{ loc(edu.degree) }}, {{ loc(edu.major) }}
            </p>
            <p class="text-xs" :class="isDark ? 'text-white/40' : 'text-gray-400'">
              {{ loc(edu.institution) }}
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- 수상/성과 -->
    <div v-if="achievements?.length" class="mb-6">
      <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#D97720]">
        {{ t('lab.achievements') }}
      </h4>
      <div class="flex flex-col gap-2">
        <div
          v-for="ach in achievements"
          :key="`${ach.year}-${loc(ach.title)}`"
          class="flex items-start gap-3"
        >
          <span class="mt-0.5 flex-shrink-0 rounded bg-amber-500/10 px-1.5 py-0.5 text-[11px] font-bold text-amber-600">
            {{ ach.year }}
          </span>
          <div>
            <p class="text-sm font-medium" :class="isDark ? 'text-white/80' : 'text-gray-700'">
              {{ loc(ach.title) }}
            </p>
            <p v-if="ach.organizer" class="text-xs" :class="isDark ? 'text-white/40' : 'text-gray-400'">
              {{ loc(ach.organizer) }}
            </p>
          </div>
        </div>
      </div>
    </div>
</template>
