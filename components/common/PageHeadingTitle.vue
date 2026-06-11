<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'

const props = withDefaults(defineProps<{
  type?: 'small' | 'default' | 'section'
  animate?: boolean
}>(), {
  type: 'default',
  animate: true
})

const themeStore = useThemeStore()

const textColorClass = computed(() =>
  themeStore.isDark ? 'text-white' : 'text-[#111]'
)

const isVisible = ref(false)
const titleRef = ref<HTMLElement | null>(null)

onMounted(() => {
  if (!props.animate) {
    isVisible.value = true
    return
  }

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible.value = true
          observer.disconnect()
        }
      })
    },
    { threshold: 0.2 }
  )

  if (titleRef.value) {
    observer.observe(titleRef.value)
  }
})

const sizeClasses = {
  default: 'text-[56px] font-[800] leading-[1.2] mobile:text-[32px] mobile:font-[700]',
  small: 'text-[40px] font-[700] leading-[1.3] mobile:text-[20px] mobile:font-[600]',
  section: 'text-[48px] font-[800] leading-[1.2] mobile:text-[28px] mobile:font-[700]',
}
</script>

<template>
  <h1
    ref="titleRef"
    :class="[
      'font-suit transition-all duration-500',
      sizeClasses[props.type as keyof typeof sizeClasses] || sizeClasses.default,
      isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-3',
      textColorClass,
    ]"
  >
    <slot />
  </h1>
</template>
