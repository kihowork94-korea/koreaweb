<script setup lang="ts">
import type { MemberRole } from '~/types/lab'
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.members')} | 지능형 바이오 모니터링 연구실` })

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: membersRaw } = useLabMembers()
const members = computed<any[]>(() => (membersRaw.value as any[]) ?? [])

// 탭 구성 (alumni 제외)
const tabs: { key: MemberRole; label: string }[] = [
  { key: 'professor',     label: t('lab.member.professor') },
  { key: 'postdoc',       label: t('lab.member.postdoc') },
  { key: 'phd',           label: t('lab.member.phd') },
  { key: 'combined',      label: t('lab.member.combined') },
  { key: 'ms',            label: t('lab.member.ms') },
  { key: 'undergraduate', label: t('lab.member.undergraduate') },
]

// 실제 구성원이 있는 탭만 표시
const activeTabs = computed(() =>
  tabs.filter(tab => members.value.some((m: any) => m.role === tab.key))
)

const activeTab = ref<MemberRole>(activeTabs.value[0]?.key ?? 'professor')

const filteredMembers = computed(() =>
  members.value.filter((m: any) => m.role === activeTab.value)
)

// 선택된 구성원 (상세 모달)
const selectedMember = ref<any | null>(null)

// 모달 열릴 때 body 스크롤 잠금
watch(selectedMember, (val) => {
  if (import.meta.client) {
    document.body.style.overflow = val ? 'hidden' : ''
  }
})
onUnmounted(() => {
  if (import.meta.client) document.body.style.overflow = ''
})

// 섹션 등장
const sectionRef = ref<HTMLElement | null>(null)
const isVisible  = ref(false)
useIntersectionObserver(sectionRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[1200px]">

      <!-- 헤더 -->
      <div class="mb-14 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">People</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.members') }}</h1>
      </div>

      <!-- 탭 -->
      <div
        class="mb-10 flex flex-wrap justify-center gap-2"
        :class="isDark ? '' : ''"
      >
        <button
          v-for="tab in activeTabs"
          :key="tab.key"
          @click="activeTab = tab.key"
          class="rounded-full px-5 py-2 text-sm font-semibold transition-all duration-200"
          :class="activeTab === tab.key
            ? 'bg-[#C21807] text-white shadow-lg shadow-[#C21807]/20'
            : isDark
              ? 'bg-white/[0.06] text-white/60 hover:bg-white/[0.10] hover:text-white'
              : 'bg-gray-100 text-gray-500 hover:bg-gray-200 hover:text-gray-800'"
        >
          {{ tab.label }}
          <span class="ml-1.5 text-xs opacity-60">({{ members.filter(m => m.role === tab.key).length }})</span>
        </button>
      </div>

      <!-- 구성원 카드 그리드 -->
      <div ref="sectionRef" class="grid grid-cols-3 gap-6 mobile:grid-cols-1 md:grid-cols-2">
        <div
          v-for="(member, i) in filteredMembers"
          :key="member.id"
          class="animate-item group cursor-pointer rounded-2xl border p-6 transition-all duration-300 hover:-translate-y-1"
          :class="[
            { 'is-visible': isVisible },
            `delay-${i}`,
            isDark
              ? 'border-white/[0.10] bg-[#111] hover:bg-[#1c1c1c]'
              : 'border-gray-200 bg-white hover:shadow-lg hover:shadow-black/5',
          ]"
          @click="selectedMember = member"
        >
          <!-- 사진 -->
          <div
            class="mb-4 h-24 w-24 overflow-hidden rounded-xl"
            :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
          >
            <img
              :src="member.imageUrl || '/images/ku-logo.png'"
              :alt="loc(member.name)"
              class="h-full w-full object-cover"
              loading="lazy"
              decoding="async"
              @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
            />
          </div>

          <!-- 이름 + 소개 -->
          <h3
            class="mb-1 text-lg font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >{{ loc(member.name) }}</h3>
          <p
            class="mb-3 text-sm leading-relaxed line-clamp-2"
            :class="isDark ? 'text-white/50' : 'text-gray-500'"
          >{{ loc(member.bio) || '—' }}</p>

          <!-- 연구 관심사 태그 -->
          <div class="flex flex-wrap gap-1.5">
            <span
              v-for="ri in member.researchInterests.slice(0, 2)"
              :key="loc(ri)"
              class="rounded-full px-2.5 py-0.5 text-[11px] font-medium"
              :class="isDark ? 'bg-white/8 text-white/55' : 'bg-gray-100 text-gray-500'"
            >{{ loc(ri) }}</span>
          </div>

          <!-- 이메일 링크 -->
          <a
            v-if="member.email"
            :href="`mailto:${member.email}`"
            class="mt-3 flex items-center gap-1 text-xs text-[#C21807] opacity-0 transition-opacity group-hover:opacity-100"
            @click.stop
          >
            <span class="material-icons text-[14px]">mail</span>
            {{ member.email }}
          </a>
        </div>
      </div>

      <!-- 빈 상태 -->
      <div
        v-if="filteredMembers.length === 0"
        class="py-20 text-center"
        :class="isDark ? 'text-white/30' : 'text-gray-300'"
      >
        <span class="material-icons mb-3 block text-5xl">group_off</span>
        <p>{{ t('lab.common.noData') }}</p>
      </div>
    </div>

    <!-- ── 구성원 상세 모달 ──────────────────────── -->
    <Teleport to="body">
      <Transition name="modal">
        <div v-if="selectedMember">
          <!-- 1) backdrop (클릭 시 닫기) -->
          <div
            class="fixed inset-0 z-[9999] bg-black/60 backdrop-blur-sm"
            @click="selectedMember = null"
          />
          <!-- 2) 스크롤 컨테이너 (backdrop과 별개) -->
          <div class="fixed inset-0 z-[10000] overflow-y-auto">
            <div class="flex min-h-full items-start justify-center p-6 py-10">
          <div
            class="relative w-full max-w-[700px] rounded-3xl p-8 shadow-2xl mobile:p-6"
            :class="isDark ? 'bg-[#111] border border-white/10' : 'bg-white border border-gray-100'"
          >
            <!-- 닫기 -->
            <button
              @click="selectedMember = null"
              class="absolute right-6 top-6 flex h-8 w-8 items-center justify-center rounded-full transition-colors"
              :class="isDark ? 'text-white/50 hover:bg-white/10 hover:text-white' : 'text-gray-400 hover:bg-gray-100 hover:text-gray-700'"
            >
              <span class="material-icons text-[20px]">close</span>
            </button>

            <!-- 기본 정보 -->
            <div class="flex gap-6 mobile:flex-col">
              <div
                class="h-32 w-32 flex-shrink-0 overflow-hidden rounded-2xl mobile:h-24 mobile:w-24"
                :class="isDark ? 'bg-white/10' : 'bg-gray-100'"
              >
                <img
                  :src="selectedMember.imageUrl || '/images/ku-logo.png'"
                  :alt="loc(selectedMember.name)"
                  class="h-full w-full object-cover"
                  decoding="async"
                  @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
                />
              </div>
              <div>
                <p class="mb-1 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                  {{ t(`lab.member.${selectedMember.role}`) }}
                </p>
                <h2
                  class="mb-2 text-2xl font-bold"
                  :class="isDark ? 'text-white' : 'text-gray-900'"
                >{{ loc(selectedMember.name) }}</h2>
                <p
                  v-if="selectedMember.bio && loc(selectedMember.bio)"
                  class="text-sm leading-relaxed"
                  :class="isDark ? 'text-white/55' : 'text-gray-500'"
                >{{ loc(selectedMember.bio) }}</p>

                <!-- 링크 -->
                <div class="mt-3 flex flex-wrap gap-3">
                  <a v-if="selectedMember.email" :href="`mailto:${selectedMember.email}`"
                    class="flex items-center gap-1 text-sm text-[#C21807] hover:opacity-70">
                    <span class="material-icons text-[15px]">mail</span>{{ selectedMember.email }}
                  </a>
                  <a v-if="selectedMember.homepage" :href="selectedMember.homepage" target="_blank"
                    :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
                    <span class="material-icons text-[15px]">language</span>{{ t('lab.member.homepage') }}
                  </a>
                  <a v-if="selectedMember.googleScholar" :href="selectedMember.googleScholar" target="_blank"
                    :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
                    <span class="material-icons text-[15px]">school</span>Scholar
                  </a>
                  <a v-if="selectedMember.github" :href="selectedMember.github" target="_blank"
                    :class="['flex items-center gap-1 text-sm hover:opacity-70', isDark ? 'text-white/60' : 'text-gray-500']">
                    <span class="material-icons text-[15px]">code</span>GitHub
                  </a>
                </div>
              </div>
            </div>

            <!-- 구분선 -->
            <div :class="['my-6 h-px', isDark ? 'bg-white/[0.07]' : 'bg-gray-100']" />

            <!-- 연구 관심사 -->
            <div v-if="selectedMember.researchInterests?.length" class="mb-6">
              <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                {{ t('lab.member.researchInterests') }}
              </h4>
              <div class="flex flex-wrap gap-2">
                <span
                  v-for="ri in selectedMember.researchInterests"
                  :key="loc(ri)"
                  class="rounded-full px-3 py-1 text-xs font-medium"
                  :class="isDark ? 'bg-[#C21807]/12 text-[#C21807]/80' : 'bg-[#C21807]/8 text-[#C21807]'"
                >{{ loc(ri) }}</span>
              </div>
            </div>

            <!-- 상세 소개 -->
            <div v-if="selectedMember.description && loc(selectedMember.description)" class="mb-6">
              <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#C21807]">About</h4>
              <p class="text-sm leading-relaxed" :class="isDark ? 'text-white/65' : 'text-gray-600'">
                {{ loc(selectedMember.description) }}
              </p>
            </div>

            <!-- 학력 -->
            <div v-if="selectedMember.education?.length" class="mb-6">
              <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                {{ t('lab.member.education') }}
              </h4>
              <div class="flex flex-col gap-2">
                <div
                  v-for="edu in selectedMember.education"
                  :key="`${edu.year}-${loc(edu.degree)}`"
                  class="flex items-start gap-3"
                >
                  <span class="mt-0.5 text-[11px] font-bold text-[#C21807]">{{ edu.year }}</span>
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
            <div v-if="selectedMember.achievements?.length" class="mb-6">
              <h4 class="mb-3 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                {{ t('lab.member.achievements') }}
              </h4>
              <div class="flex flex-col gap-2">
                <div
                  v-for="ach in selectedMember.achievements"
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
          </div>
            </div>
          </div>
        </div>
      </Transition>
    </Teleport>
  </div>
</template>

<style scoped>
.modal-enter-active, .modal-leave-active { transition: opacity 0.25s ease; }
.modal-enter-from, .modal-leave-to { opacity: 0; }
</style>
