<script setup lang="ts">
import { introductionTranslations } from '~/data/introduction-translations'
defineProps<{ fallback?: string }>()
const { locale } = useI18n()
const translated = computed(() => introductionTranslations[locale.value as keyof typeof introductionTranslations] || introductionTranslations.en)
const fields = [
  { title: '지능형 바이오센싱 플랫폼', text: '반도체 기반, 전기화학 기반, 나노입자 기반 센싱 플랫폼을 개발합니다. 분자인식 소재와 신호변환 계면을 설계해 다양한 생체 표적을 고감도·고선택적으로 검출합니다.' },
  { title: '멀티오믹스 기반 바이오마커 발굴', text: '노화, 암 진단, 바이러스 검출 분야를 다룹니다. 멀티오믹스 데이터에서 진단 바이오마커를 찾고, 이를 센서 기반 진단 기술로 구현합니다.' },
  { title: '신뢰할 수 있는 의료 AI', text: '설명가능 인공지능(XAI)으로 진단 결과의 근거를 의료진이 이해할 수 있게 제시합니다. 연합학습(Federated Learning)으로는 환자 데이터를 병원 밖으로 반출하지 않고도 여러 기관이 함께 모델을 학습할 수 있도록 합니다.' },
]
const systems = [
  { title: '응급실 특화 지능형 기술', text: '신속 현장진단과 AI 기반 위험도 예측으로 응급실의 환자 분류와 초기 판단을 지원합니다.' },
  { title: 'AI 특화 병동', text: '입원 환자의 생체 신호와 바이오마커를 실시간으로 분석해 상태 악화를 조기에 감지하는 지능형 병동 환경을 구현합니다.' },
  { title: 'HOME 병동', text: '가정형 진단기기와 원격 모니터링을 연계해, 병원 밖에서도 병동 수준의 지속적인 환자 관리가 가능하도록 합니다.' },
  { title: '재난의료 현장기술', text: '감염병 유행, 대형 재난 등 의료 자원이 제한된 상황에서 현장에서 바로 쓸 수 있는 휴대형 진단 기술을 개발합니다.' },
]
</script>

<template>
  <div v-if="locale === 'ko'" class="lab-introduction text-base leading-[1.9]">
    <p>ARISE Lab은 KIST 생체분자인식연구센터와 고려대학교 KU-KIST 융합대학원을 기반으로, 바이오센서와 인공지능을 하나의 진단 시스템으로 통합하는 연구실입니다. 우리는 생체분자를 검출하는 데서 멈추지 않고, 생체분자의 유기적 신호를 해석하고 그 근거를 설명하여 실제 임상 판단으로 연결하는 과정 전체를 연구합니다.</p>

    <h3>핵심 연구 분야</h3>
    <ul>
      <li v-for="field in fields" :key="field.title"><strong>{{ field.title }}:</strong> {{ field.text }}</li>
      <li>
        <strong>국가의료시스템 대응:</strong> 의료 현장의 구조적 과제에 대응하는 지능형 진단·모니터링 기술을 개발합니다.
        <ul>
          <li v-for="system in systems" :key="system.title"><strong>{{ system.title }}:</strong> {{ system.text }}</li>
        </ul>
      </li>
    </ul>

    <h3>임상 및 산업 연계</h3>
    <p>Johns Hopkins University, Harvard Medical School, 고려대학교 안암병원, 전북대병원, 서울아산병원, 삼성서울병원 등과 공동연구를 수행하며, 실험실 성과가 실제 환자 진료로 이어지도록 검증하고 있습니다. 연구 성과의 사업화를 위해 바이오 진단기업 nMD-Bio를 창업했습니다.</p>
    <p class="mt-6">ARISE Lab은 공학, 의학, 데이터과학의 경계를 넘나들며 대한민국의 삶의 질을 한차원 높일 수 있는 미래의학을 만들어 갑니다.</p>
  </div>
  <div v-else class="lab-introduction text-base leading-[1.9]">
    <p>{{ translated.intro }}</p>
    <h3>{{ translated.research }}</h3>
    <ul>
      <li v-for="field in translated.fields" :key="field[0]"><strong>{{ field[0] }}:</strong> {{ field[1] }}</li>
      <li><strong>{{ translated.systemTitle }}:</strong> {{ translated.systemText }}
        <ul><li v-for="system in translated.systems" :key="system[0]"><strong>{{ system[0] }}:</strong> {{ system[1] }}</li></ul>
      </li>
    </ul>
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
