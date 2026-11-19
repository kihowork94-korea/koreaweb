<script setup lang="ts">
import type { MemberRole } from '~/types/lab'
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: membersRaw, pending } = useLabMembers()
const members = computed<any[]>(() => (membersRaw.value as any[]) ?? [])

usePageSeo('members')

useHead(() => ({
  script: [{
    type: 'application/ld+json',
    innerHTML: JSON.stringify({
      '@context': 'https://schema.org',
      '@type': 'ItemList',
      name: 'ARISE Lab 구성원',
      itemListElement: members.value
        .filter(member => member.role !== 'alumni')
        .map((member, index) => ({
          '@type': 'ListItem',
          position: index + 1,
          item: {
            '@type': 'Person',
            '@id': `https://www.ariselab.kr/members#member-${member.id}`,
            name: member.name?.ko || member.name?.en,
            alternateName: member.name?.en || undefined,
            image: member.imageUrl || undefined,
            email: member.email || undefined,
            jobTitle: member.role === 'professor' ? '교수' : loc(member.bio) || undefined,
            affiliation: {
              '@type': 'ResearchOrganization',
              '@id': 'https://www.ariselab.kr/#organization',
              name: 'ARISE Lab',
            },
          },
        })),
    }),
  }],
}))

// 탭: 전체 | 교수 | 학생
type TabKey = 'all' | 'professor' | 'student'

const STUDENT_ROLES: MemberRole[] = ['postdoc', 'phd', 'combined', 'ms', 'undergraduate']

const tabs = computed<{ key: TabKey; label: string }[]>(() => [
  { key: 'all',       label: t('lab.common.all') },
  { key: 'professor', label: t('lab.member.professor') },
  { key: 'student',   label: t('lab.member.student') },
])

const activeTabs = computed(() =>
  tabs.value.filter(tab => {
    if (tab.key === 'all') return true
    if (tab.key === 'professor') return members.value.some((m: any) => m.role === 'professor')
    return members.value.some((m: any) => STUDENT_ROLES.includes(m.role))
  })
)

const activeTab = ref<TabKey>('all')

const filteredMembers = computed(() => {
  if (activeTab.value === 'professor') return members.value.filter((m: any) => m.role === 'professor')
  if (activeTab.value === 'student')   return members.value.filter((m: any) => STUDENT_ROLES.includes(m.role))
  return members.value.filter((m: any) => m.role !== 'alumni')
})

const memberGroups = computed(() => {
  const list = filteredMembers.value
  if (activeTab.value === 'all') {
    return [
      { key: 'professor', label: t('lab.member.professor'), members: list.filter((m: any) => m.role === 'professor') },
      { key: 'student', label: t('lab.member.student'), members: list.filter((m: any) => STUDENT_ROLES.includes(m.role)) },
    ].filter(group => group.members.length > 0)
  }
  return [{ key: activeTab.value, label: '', members: list }]
})

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

// Escape 키로 모달 닫기
function onKeydown(e: KeyboardEvent) {
  if (e.key === 'Escape') selectedMember.value = null
}
onMounted(() => window.addEventListener('keydown', onKeydown))
onUnmounted(() => window.removeEventListener('keydown', onKeydown))

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
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#D97720]">People</p>
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
          @click="activeTab = (tab.key as TabKey)"
          class="rounded-full px-5 py-2 text-sm font-semibold transition-all duration-200"
          :class="activeTab === tab.key
            ? 'bg-[#D97720] text-white shadow-lg shadow-[#D97720]/20'
            : isDark
              ? 'bg-white/[0.06] text-white/60 hover:bg-white/[0.10] hover:text-white'
              : 'bg-gray-100 text-gray-500 hover:bg-gray-200 hover:text-gray-800'"
        >
          {{ tab.label }}
          <span class="ml-1.5 text-xs opacity-60">({{
            tab.key === 'all'       ? members.filter((m: any) => m.role !== 'alumni').length
            : tab.key === 'student' ? members.filter((m: any) => STUDENT_ROLES.includes(m.role)).length
            : members.filter((m: any) => m.role === tab.key).length
          }})</span>
        </button>
      </div>

      <!-- 스켈레톤 로딩 -->
      <div v-if="pending" class="grid grid-cols-3 gap-6 mobile:grid-cols-1 md:grid-cols-2">
        <div
          v-for="i in 6" :key="i"
          class="animate-pulse rounded-2xl border p-6"
          :class="isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white'"
        >
          <div class="mb-5 h-36 w-36 rounded-xl" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
          <div class="mb-2 h-5 w-2/3 rounded-md" :class="isDark ? 'bg-white/10' : 'bg-gray-200'" />
          <div class="mb-1 h-4 w-full rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
          <div class="mb-3 h-4 w-4/5 rounded-md" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
          <div class="flex gap-1.5">
            <div class="h-5 w-16 rounded-full" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
            <div class="h-5 w-20 rounded-full" :class="isDark ? 'bg-white/[0.06]' : 'bg-gray-100'" />
          </div>
        </div>
      </div>

      <!-- 구성원 카드 그리드 -->
      <div v-else ref="sectionRef" class="flex flex-col">
        <section
          v-for="(group, groupIndex) in memberGroups"
          :key="group.key"
          :class="groupIndex > 0 ? 'mt-16 border-t pt-14' : ''"
          :style="groupIndex > 0 ? { borderColor: isDark ? 'rgba(255,255,255,.12)' : 'rgba(39,39,42,.14)' } : {}"
        >
          <div v-if="activeTab === 'all'" class="mb-7 flex items-center gap-4">
            <h2 class="text-xl font-bold" :class="isDark ? 'text-white' : 'text-gray-900'">{{ group.label }}</h2>
            <span class="rounded-full bg-[#f28c28]/10 px-2.5 py-1 text-xs font-bold text-[#d97720]">{{ group.members.length }}</span>
          </div>

          <div
            v-if="activeTab === 'professor'"
            v-for="member in group.members"
            :key="member.id"
            class="rounded-3xl border border-gray-200 bg-white p-8 shadow-sm mobile:p-5"
          >
            <MemberProfileDetail :member="member" :title-id="`professor-profile-${member.id}`" light-surface />
          </div>
          <div v-else class="grid grid-cols-2 gap-6 mobile:grid-cols-1">
            <article
              v-for="(member, i) in group.members"
              :key="member.id"
              class="animate-item group min-h-[250px] cursor-pointer overflow-hidden rounded-2xl border transition-all duration-300 hover:-translate-y-1"
              :class="[
                { 'is-visible': isVisible },
                `delay-${Math.min(i, 8)}`,
                isDark
                  ? 'border-white/[0.10] bg-[#111] hover:bg-[#1c1c1c]'
                  : 'border-gray-200/80 bg-white hover:border-gray-300 hover:shadow-xl hover:shadow-slate-900/8',
              ]"
              @click="selectedMember = member"
            >
              <div class="grid h-full grid-cols-[42%_1fr] mobile:grid-cols-[40%_1fr]">
                <div class="min-h-[250px] overflow-hidden" :class="isDark ? 'bg-white/10' : 'bg-gray-100'">
                  <img
                    :src="member.imageUrl || '/images/ku-logo.png'"
                    :alt="loc(member.name)"
                    class="h-full w-full object-cover object-top transition-transform duration-500 group-hover:scale-[1.035]"
                    loading="lazy"
                    decoding="async"
                    @error="($event.target as HTMLImageElement).src='/images/ku-logo.png'"
                  />
                </div>

                <div class="flex min-w-0 flex-col justify-center p-6 mobile:p-4">
                  <h3 class="mb-1 text-lg font-bold" :class="isDark ? 'text-white' : 'text-gray-900'">{{ loc(member.name) }}</h3>
                  <p class="mb-4 text-sm leading-relaxed line-clamp-3" :class="isDark ? 'text-white/50' : 'text-gray-500'">{{ loc(member.bio) || '—' }}</p>
                  <div class="flex flex-wrap gap-1.5">
                    <span
                      v-for="ri in (member.role === 'professor' ? member.researchInterests : member.researchInterests.slice(0, 2))"
                      :key="loc(ri)"
                      class="rounded-full px-2.5 py-0.5 text-[11px] font-medium"
                      :class="isDark ? 'bg-white/8 text-white/55' : 'bg-gray-100 text-gray-500'"
                    >{{ loc(ri) }}</span>
                  </div>
                  <div
                    v-if="member.email"
                    class="mt-4 flex items-center gap-1 truncate text-xs text-[#d97720]"
                  >
                    <span class="material-icons text-[14px]">mail</span>
                    <span class="truncate">{{ member.email }}</span>
                  </div>
                  <button
                    v-if="member.role === 'professor'"
                    type="button"
                    class="mt-4 self-end rounded-full border border-[#D97720]/50 px-4 py-1.5 text-sm font-semibold text-[#D97720] hover:bg-[#D97720]/10"
                    @click.stop="selectedMember = member"
                  >View <span aria-hidden="true">→</span></button>
                </div>
              </div>
            </article>
          </div>
        </section>
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
          <div
            class="fixed inset-0 z-[10000] overflow-y-auto"
            role="dialog"
            aria-modal="true"
            :aria-labelledby="`member-modal-title-${selectedMember?.id}`"
          >
            <div class="flex min-h-full items-start justify-center p-4 py-8" @click.self="selectedMember = null">
          <div
            class="relative w-full max-w-[880px] rounded-3xl p-8 pt-16 shadow-2xl mobile:p-6 mobile:pt-16"
            :class="isDark ? 'bg-[#111] border border-white/10' : 'bg-white border border-gray-100'"
          >
            <!-- 닫기 -->
            <button
              autofocus
              @click="selectedMember = null"
              class="absolute right-6 top-6 flex h-8 w-8 items-center justify-center rounded-full transition-colors"
              :class="isDark ? 'text-white/50 hover:bg-white/10 hover:text-white' : 'text-gray-400 hover:bg-gray-100 hover:text-gray-700'"
              aria-label="닫기"
            >
              <span class="material-icons text-[20px]">close</span>
            </button>

            <MemberProfileDetail :member="selectedMember" :title-id="`member-modal-title-${selectedMember.id}`" />
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
