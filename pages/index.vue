<script setup lang="ts">
const { t } = useI18n()

useSeoMeta({
  title: 'ARISE Lab — KIST 이관희 교수 연구실 | KU-KIST 융합대학원',
  description: 'KIST 이관희 교수가 이끄는 고려대학교 KU-KIST 융합대학원 ARISE Lab입니다. AI, 나노바이오센서, 암·감염병 조기진단 및 지능형 센싱을 연구합니다.',
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
