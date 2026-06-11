<script setup lang="ts">
import type { ProjectStatus } from '~/types/lab'
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.projects')} | 지능형 바이오 모니터링 연구실` })

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: projectsRaw, pending } = useLabProjects()
const projects = computed<any[]>(() => (projectsRaw.value as any[]) ?? [])

const { data: membersRaw } = useLabMembers()
const getMemberById = (id: number) =>
  (membersRaw.value as any[] ?? []).find((m: any) => m.id === id)

const activeTab = ref<ProjectStatus>('ongoing')

const filtered = computed(() =>
  projects.value
    .filter((p: any) => p.status === activeTab.value)
    .sort((a: any, b: any) => b.startYear - a.startYear)
)

const sectionRef = ref<HTMLElement | null>(null)
const isVisible  = ref(false)
useIntersectionObserver(sectionRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[1100px]">

      <!-- 헤더 -->
      <div class="mb-12 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">Research Projects</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.projects') }}</h1>
      </div>

      <!-- 탭 -->
      <div class="mb-10 flex justify-center gap-3">
        <button
          v-for="tab in (['ongoing', 'completed'] as ProjectStatus[])"
          :key="tab"
          @click="activeTab = tab"
          class="flex items-center gap-2 rounded-full px-6 py-2.5 text-sm font-semibold transition-all"
          :class="activeTab === tab
            ? 'bg-[#C21807] text-white shadow-md shadow-[#C21807]/20'
            : isDark ? 'bg-white/[0.06] text-white/60 hover:bg-white/[0.10]' : 'bg-gray-100 text-gray-500 hover:bg-gray-200'"
        >
          <span
            v-if="tab === 'ongoing'"
            class="h-2 w-2 rounded-full"
            :class="activeTab === tab ? 'bg-white animate-pulse' : 'bg-green-500'"
          />
          {{ t(`lab.project.${tab}`) }}
          <span class="text-xs opacity-60">({{ projects.filter((p: any) => p.status === tab).length }})</span>
        </button>
      </div>

      <!-- 스켈레톤 로딩 -->
      <div v-if="pending" class="flex flex-col gap-5">
        <div
          v-for="i in 3" :key="i"
          class="animate-pulse rounded-3xl border p-8 mobile:p-6"
          :class="isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white'"
        >
          <div class="mb-6 h-52 rounded-2xl" :class="isDark ? 'bg-white/[0.08]' : 'bg-gray-200'" />
          <div class="mb-3 flex gap-2">
            <div class="h-6 w-20 rounded-full" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
            <div class="h-6 w-16 rounded-full" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
          </div>
          <div class="mb-2 h-7 w-3/4 rounded-md" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
          <div class="mb-1 h-4 w-full rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
          <div class="h-4 w-4/5 rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
        </div>
      </div>

      <!-- 프로젝트 리스트 -->
      <div v-else ref="sectionRef" class="flex flex-col gap-5">

        <!-- 빈 상태 -->
        <div
          v-if="filtered.length === 0"
          class="py-20 text-center"
          :class="isDark ? 'text-white/30' : 'text-gray-300'"
        >
          <span class="material-icons mb-3 block text-5xl">folder_off</span>
          <p>{{ t('lab.common.noData') }}</p>
        </div>

        <div
          v-for="(proj, i) in filtered"
          :key="proj.id"
          class="animate-item rounded-3xl border p-8 mobile:p-6"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i}`,
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <!-- 이미지 -->
          <div
            v-if="proj.imageUrl"
            class="mb-6 overflow-hidden rounded-2xl"
            :class="isDark ? 'bg-white/5' : 'bg-gray-100'"
          >
            <img
              :src="proj.imageUrl"
              :alt="loc(proj.title)"
              class="h-52 w-full object-cover"
              loading="lazy"
              decoding="async"
              @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
            />
          </div>

          <div class="flex items-start justify-between gap-4 mobile:flex-col">
            <div class="flex-1">

              <!-- 상태 배지 -->
              <div class="mb-3 flex flex-wrap items-center gap-2">
                <span
                  class="flex items-center gap-1.5 rounded-full px-3 py-1 text-[12px] font-semibold"
                  :class="proj.status === 'ongoing'
                    ? 'bg-green-500/10 text-green-600'
                    : isDark ? 'bg-white/[0.08] text-white/50' : 'bg-gray-100 text-gray-500'"
                >
                  <span
                    v-if="proj.status === 'ongoing'"
                    class="h-1.5 w-1.5 rounded-full bg-green-500 animate-pulse"
                  />
                  {{ t(`lab.project.${proj.status}`) }}
                </span>
                <span class="text-xs" :class="isDark ? 'text-white/35' : 'text-gray-400'">
                  {{ proj.startYear }}{{ proj.endYear ? ` – ${proj.endYear}` : ' – 현재' }}
                </span>
              </div>

              <!-- 제목 -->
              <h2
                class="mb-2 text-xl font-bold mobile:text-lg"
                :class="isDark ? 'text-white' : 'text-gray-900'"
              >{{ loc(proj.title) }}</h2>

              <!-- 설명 -->
              <p
                class="mb-5 text-sm leading-relaxed"
                :class="isDark ? 'text-white/55' : 'text-gray-500'"
              >{{ loc(proj.description) }}</p>

              <!-- 메타 정보 -->
              <div class="flex flex-wrap gap-x-8 gap-y-2">
                <div v-if="proj.fundingAgency" class="flex items-center gap-2">
                  <span class="material-icons text-[15px] text-[#C21807]">account_balance</span>
                  <span class="text-sm" :class="isDark ? 'text-white/60' : 'text-gray-600'">
                    {{ loc(proj.fundingAgency) }}
                  </span>
                </div>
                <div v-if="proj.memberIds?.length" class="flex items-center gap-2">
                  <span class="material-icons text-[15px] text-[#C21807]">group</span>
                  <span class="text-sm" :class="isDark ? 'text-white/60' : 'text-gray-600'">
                    {{
                      proj.memberIds
                        .map(id => getMemberById(id))
                        .filter(Boolean)
                        .map(m => loc(m!.name))
                        .join(', ')
                    }}
                  </span>
                </div>
              </div>

              <!-- 태그 -->
              <div v-if="proj.tags.length" class="mt-4 flex flex-wrap gap-1.5">
                <span
                  v-for="tag in proj.tags"
                  :key="tag"
                  class="rounded-full px-2.5 py-0.5 text-[11px] font-medium"
                  :class="isDark ? 'bg-white/[0.06] text-white/45' : 'bg-gray-100 text-gray-400'"
                >{{ tag }}</span>
              </div>
            </div>

            <!-- 링크 -->
            <div class="flex flex-shrink-0 flex-col gap-2 mobile:flex-row">
              <a
                v-if="proj.githubUrl"
                :href="proj.githubUrl"
                target="_blank"
                class="flex items-center gap-1.5 rounded-xl px-4 py-2 text-[13px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/[0.07] text-white/70 hover:bg-white/[0.12]' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                <span class="material-icons text-[15px]">code</span>GitHub
              </a>
              <a
                v-if="proj.websiteUrl"
                :href="proj.websiteUrl"
                target="_blank"
                class="flex items-center gap-1.5 rounded-xl px-4 py-2 text-[13px] font-semibold transition-colors"
                :class="isDark ? 'bg-white/[0.07] text-white/70 hover:bg-white/[0.12]' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
              >
                <span class="material-icons text-[15px]">open_in_new</span>사이트
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
