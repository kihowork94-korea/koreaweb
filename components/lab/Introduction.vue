<script setup lang="ts">
import { introductionTranslations } from '~/data/introduction-translations'
defineProps<{ fallback?: string }>()
const { locale } = useI18n()
const translated = computed(() => introductionTranslations[locale.value as keyof typeof introductionTranslations] || introductionTranslations.en)
</script>

<template>
  <div v-if="locale === 'ko'" class="lab-introduction text-base leading-[1.9]">
    <p>ARISE Lab은 KIST 생체분자인식연구센터와 고려대학교 KU-KIST 융합대학원을 기반으로, 바이오센서와 인공지능을 하나의 진단 시스템으로 통합하는 연구실입니다. 우리는 생체분자를 검출하는 데서 멈추지 않고, 생체분자의 유기적 신호를 해석하고 그 근거를 설명하여 실제 임상 판단으로 연결하는 과정 전체를 연구합니다.</p>

    <h3>핵심 연구 분야</h3>
    <LabCoreResearchFields />

    <h3>임상 및 산업 연계</h3>
    <p>Johns Hopkins University, Harvard Medical School, 고려대학교 안암병원, 전북대병원, 서울아산병원, 삼성서울병원 등과 공동연구를 수행하며, 실험실 성과가 실제 환자 진료로 이어지도록 검증하고 있습니다. 연구 성과의 사업화를 위해 바이오 진단기업 nMD-Bio를 창업했습니다.</p>
    <p class="mt-6">ARISE Lab은 공학, 의학, 데이터과학의 경계를 넘나들며 대한민국의 삶의 질을 한차원 높일 수 있는 미래의학을 만들어 갑니다.</p>
  </div>
  <div v-else class="lab-introduction text-base leading-[1.9]">
    <p>{{ translated.intro }}</p>
    <h3>{{ translated.research }}</h3>
    <LabCoreResearchFields />
    <h3>{{ translated.clinical }}</h3>
    <p>{{ translated.collaboration }}</p>
    <p class="mt-6">{{ translated.closing }}</p>
  </div>
</template>

<style scoped>
.lab-introduction { overflow-wrap: anywhere; word-break: keep-all; }
h3 { margin: 2rem 0 .85rem; font-size: 1.15rem; font-weight: 800; color: inherit; }
ul { list-style: disc; padding-left: 1.3rem; }
li + li { margin-top: .9rem; }
li ul { margin-top: .9rem; }
strong { font-weight: 750; }
@media (max-width: 480px) {
  .lab-introduction { font-size: .925rem; }
  ul { padding-left: 1rem; }
}
</style>
