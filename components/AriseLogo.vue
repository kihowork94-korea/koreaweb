<script setup lang="ts">
const themeStore = useThemeStore()
</script>

<template>
  <span v-if="themeStore.isDark" class="arise-brand arise-brand-text">ARISELAB</span>
  <img v-else src="/images/arise-logo.png" alt="ARISE LAB" class="arise-brand" />
</template>

<style scoped>
.arise-brand {
  display: block;
  width: auto;
  height: 56px;
  max-width: 100%;
  flex-shrink: 0;
  object-fit: contain;
  background: white;
  border-radius: 8px;
  padding: 4px 8px;
}
.arise-brand-text {
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  color: #fff;
  font-size: 20px;
  font-weight: 800;
  line-height: 1.2;
  white-space: nowrap;
}
</style>
