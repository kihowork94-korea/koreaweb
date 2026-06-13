<script setup lang="ts">
const { t } = useI18n()

useHead({
  title: 'ARISE Lab | KU-KIST 융합대학원',
  meta: [
    {
      name: 'description',
      content: '고려대학교-KIST 융합대학원 ARISE Lab. AI와 바이오센서로 암·감염병 조기진단 연구를 수행합니다.',
    },
  ],
})
</script>

<template>
  <div>
    <!-- 1. Hero 섹션 -->
    <LabHeroSection />

    <!-- 2. 연구실 소개 섹션 -->
    <LabAboutSection />

    <!-- 3. 연구 분야 섹션 -->
    <LabResearchSection />

    <!-- 4. 진행 중 프로젝트 섹션 -->
    <LabProjectsSection />
  </div>
</template>
