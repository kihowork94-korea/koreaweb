<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

useHead({ title: `${t('lab.nav.contact')} | ARISE Lab` })

const loc = (f: Record<string, string> | null | undefined) =>
  f ? (f[locale.value as keyof typeof f] || f.en || '') : ''

const { data: labInfoArr } = useLabInfo()
const labInfo = computed(() => (labInfoArr.value as any[])?.[0])

// Google Maps URL (위도/경도 기반)
const googleMapUrl = computed(() =>
  labInfo.value?.location
    ? `https://www.google.com/maps?q=${labInfo.value.location.lat},${labInfo.value.location.lng}`
    : '#'
)

// Kakao Map URL
const kakaoMapUrl = computed(() => labInfo.value?.location?.mapUrl)

const sectionRef  = ref<HTMLElement | null>(null)
const isVisible   = ref(false)
useIntersectionObserver(sectionRef, ([e]) => { if (e.isIntersecting) isVisible.value = true }, { threshold: 0.05 })
</script>

<template>
  <div class="px-6 pb-28 pt-20">
    <div class="mx-auto max-w-[1000px]">

      <!-- 헤더 -->
      <div class="mb-12 text-center">
        <p class="mb-3 text-sm font-semibold uppercase tracking-widest text-[#C21807]">Contact</p>
        <h1
          class="text-5xl font-extrabold mobile:text-3xl"
          :class="isDark ? 'text-white' : 'text-gray-900'"
        >{{ t('lab.nav.contact') }}</h1>
      </div>

      <div ref="sectionRef" class="grid grid-cols-2 gap-6 mobile:grid-cols-1">

        <!-- ── 연구실 정보 카드 ─────────────────── -->
        <div
          class="animate-item col-span-2 rounded-3xl border p-8 mobile:p-6 mobile:col-span-1"
          :class="[
            { 'is-visible': isVisible },
            'delay-0',
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <h2
            class="mb-6 text-xl font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >{{ t('lab.contact.labInfo') }}</h2>

          <div class="grid grid-cols-2 gap-8 mobile:grid-cols-1">
            <!-- 이메일 -->
            <div class="flex items-start gap-3">
              <div class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-xl bg-[#C21807]/10">
                <span class="material-icons text-[18px] text-[#C21807]">mail</span>
              </div>
              <div>
                <p class="mb-1 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                  {{ t('lab.contact.email') }}
                </p>
                <a
                  :href="labInfo?.contact?.email ? `mailto:${labInfo.contact.email}` : '#'"
                  class="text-sm font-medium transition-opacity hover:opacity-70"
                  :class="isDark ? 'text-white/80' : 'text-gray-700'"
                >{{ labInfo?.contact?.email }}</a>
              </div>
            </div>

            <!-- 전화 -->
            <div v-if="labInfo?.contact?.phone" class="flex items-start gap-3">
              <div class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-xl bg-[#C21807]/10">
                <span class="material-icons text-[18px] text-[#C21807]">phone</span>
              </div>
              <div>
                <p class="mb-1 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                  {{ t('lab.contact.phone') }}
                </p>
                <p class="text-sm font-medium" :class="isDark ? 'text-white/80' : 'text-gray-700'">
                  {{ labInfo?.contact?.phone }}
                </p>
              </div>
            </div>

            <!-- 주소 -->
            <div class="flex items-start gap-3 col-span-2 mobile:col-span-1">
              <div class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-xl bg-[#C21807]/10">
                <span class="material-icons text-[18px] text-[#C21807]">location_on</span>
              </div>
              <div>
                <p class="mb-1 text-xs font-semibold uppercase tracking-wider text-[#C21807]">
                  {{ t('lab.contact.location') }}
                </p>
                <p class="text-sm font-medium" :class="isDark ? 'text-white/80' : 'text-gray-700'">
                  {{ loc(labInfo?.location?.address) }}
                </p>
                <p class="mt-0.5 text-xs" :class="isDark ? 'text-white/40' : 'text-gray-400'">
                  {{ loc(labInfo?.location?.building) }}
                  <span v-if="labInfo?.location?.room && !labInfo.location.room.includes('TODO')">
                    · {{ labInfo.location.room }}
                  </span>
                </p>

                <!-- 지도 버튼 -->
                <div class="mt-3 flex flex-wrap gap-2">
                  <a
                    v-if="kakaoMapUrl"
                    :href="kakaoMapUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                    :class="isDark ? 'bg-white/[0.07] text-white/70 hover:bg-white/[0.12]' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
                  >
                    <span class="material-icons text-[13px]">map</span>
                    {{ t('lab.footer.openKakaoMap') }}
                  </a>
                  <a
                    :href="googleMapUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="inline-flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-[12px] font-semibold transition-colors"
                    :class="isDark ? 'bg-white/[0.07] text-white/70 hover:bg-white/[0.12]' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'"
                  >
                    <span class="material-icons text-[13px]">open_in_new</span>
                    {{ t('lab.footer.openGoogleMap') }}
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- ── 대학원 지원 안내 ─────────────────── -->
        <div
          class="animate-item rounded-3xl border p-8 mobile:p-6"
          :class="[
            { 'is-visible': isVisible },
            'delay-1',
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[#C21807]/10">
            <span class="material-icons text-[22px] text-[#C21807]">school</span>
          </div>
          <h2
            class="mb-3 text-lg font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >{{ t('lab.contact.admissions') }}</h2>
          <p
            class="mb-5 text-sm leading-relaxed"
            :class="isDark ? 'text-white/55' : 'text-gray-500'"
          >{{ t('lab.contact.admissionsDesc') }}</p>
          <a
            :href="labInfo?.contact?.email ? `mailto:${labInfo.contact.email}` : '#'"
            class="inline-flex items-center gap-2 rounded-xl bg-[#C21807] px-5 py-2.5 text-sm font-semibold text-white transition-opacity hover:opacity-80"
          >
            <span class="material-icons text-[16px]">mail</span>
            {{ t('lab.contact.email') }}로 문의
          </a>
        </div>

        <!-- ── SNS 링크 ─────────────────────────── -->
        <div
          v-if="labInfo?.sns?.github || labInfo?.sns?.youtube || labInfo?.sns?.twitter || labInfo?.sns?.linkedin || labInfo?.sns?.researchgate"
          class="animate-item rounded-3xl border p-8 mobile:p-6"
          :class="[
            { 'is-visible': isVisible },
            'delay-2',
            isDark ? 'border-white/[0.10] bg-[#111]' : 'border-gray-200 bg-white',
          ]"
        >
          <div class="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[#C21807]/10">
            <span class="material-icons text-[22px] text-[#C21807]">link</span>
          </div>
          <h2
            class="mb-5 text-lg font-bold"
            :class="isDark ? 'text-white' : 'text-gray-900'"
          >온라인 채널</h2>
          <div class="flex flex-col gap-3">
            <a
              v-if="labInfo?.sns?.github"
              :href="labInfo.sns.github"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center gap-2 text-sm transition-opacity hover:opacity-70"
              :class="isDark ? 'text-white/70' : 'text-gray-600'"
            >
              <span class="material-icons text-[16px]">code</span>GitHub
            </a>
            <a
              v-if="labInfo?.sns?.youtube"
              :href="labInfo.sns.youtube"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center gap-2 text-sm transition-opacity hover:opacity-70"
              :class="isDark ? 'text-white/70' : 'text-gray-600'"
            >
              <span class="material-icons text-[16px]">play_circle</span>YouTube
            </a>
            <a
              v-if="labInfo?.sns?.researchgate"
              :href="labInfo.sns.researchgate"
              target="_blank"
              rel="noopener noreferrer"
              class="flex items-center gap-2 text-sm transition-opacity hover:opacity-70"
              :class="isDark ? 'text-white/70' : 'text-gray-600'"
            >
              <span class="material-icons text-[16px]">science</span>ResearchGate
            </a>
          </div>
        </div>

        <!-- SNS가 없으면 단독으로 지원 안내가 wide하게 -->
      </div>
    </div>
  </div>
</template>
