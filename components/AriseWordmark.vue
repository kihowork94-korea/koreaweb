<script setup lang="ts">
const themeStore = useThemeStore()
</script>

<template>
  <span v-if="themeStore.isDark" class="arise-wordmark arise-wordmark-text">ARISELAB</span>
  <img v-else src="/images/arise-horizontal-transparent.webp" alt="ARISELAB" class="arise-wordmark" />
</template>

<style scoped>
.arise-wordmark {
  display: block;
  width: auto;
  max-width: 100%;
  height: auto;
  object-fit: contain;
}
.arise-wordmark-text {
  color: #fff;
  font-size: clamp(17px, 2vw, 24px);
  font-weight: 800;
  line-height: 1.2;
  white-space: nowrap;
}
</style>
