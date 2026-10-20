<script setup lang="ts">
const { t } = useI18n()

usePageSeo('home')
</script>

<template>
  <div>
    <!-- 1. Hero 섹션 -->
    <LabHeroSection />

    <!-- 2. 연구실 소개 섹션 -->
    <LabAboutSection />

    <!-- 3. 연구 분야 섹션 -->
    <LabResearchSection />

  </div>
</template>
