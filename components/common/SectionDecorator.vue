<script setup lang="ts">
/**
 * 섹션 데코레이터 - 양쪽 라인 스타일
 */
import { computed } from 'vue'

defineProps<{
  label: string
}>()

const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const labelClass = computed(() =>
  isDark.value ? 'text-white/40' : 'text-gray-400'
)

const lineClass = computed(() =>
  isDark.value ? 'bg-white/20' : 'bg-gray-300'
)
</script>

<template>
  <div class="flex items-center justify-center gap-4 mb-4">
    <span :class="['h-[1px] w-12', lineClass]"></span>
    <span
      :class="[
        'text-[13px] font-semibold tracking-[0.2em] uppercase',
        labelClass,
      ]"
    >
      {{ label }}
    </span>
    <span :class="['h-[1px] w-12', lineClass]"></span>
  </div>
</template>
