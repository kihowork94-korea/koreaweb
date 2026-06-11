<script setup lang="ts">
const { t } = useI18n()

useHead({
  title: '지능형 바이오 모니터링 연구실 | KU-KIST 융합대학원',
  meta: [
    {
      name: 'description',
      content: '고려대학교-KIST 융합대학원 지능형 바이오 모니터링 연구실. AI와 바이오센서로 암·감염병 조기진단 연구를 수행합니다.',
    },
  ],
})
</script>

<template>
  <div>
    <!-- 1. Hero 섹션 -->
    <LabHeroSection />

    <!-- 2. 연구 분야 섹션 -->
    <LabResearchSection />

    <!-- 3. 대표 논문 섹션 (데이터 없으면 자동 숨김) -->
    <LabPublicationsSection />
  </div>
</template>
