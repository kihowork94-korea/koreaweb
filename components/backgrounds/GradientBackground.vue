<script setup lang="ts">
const themeStore = useThemeStore()
const route = useRoute()
const isDark = computed(() => themeStore.isDark)

// 스크롤 오프셋
const scrollY = ref(0)
const onScroll = () => {
  scrollY.value = window.scrollY
}

// RGB 색상 값
const colors: Record<string, string> = {
  red: '239, 68, 68',
  orange: '249, 115, 22',
  amber: '245, 158, 11',
  yellow: '234, 179, 8',
  lime: '132, 204, 22',
  green: '34, 197, 94',
  emerald: '16, 185, 129',
  teal: '20, 184, 166',
  cyan: '6, 182, 212',
  sky: '14, 165, 233',
  blue: '59, 130, 246',
  indigo: '99, 102, 241',
  violet: '139, 92, 246',
  purple: '168, 85, 247',
  fuchsia: '217, 70, 239',
  pink: '236, 72, 153',
  rose: '244, 63, 94',
}

// 색상 팔레트
const colorPalettes = [
  { primary: 'red', secondary: 'indigo', tertiary: 'orange' },
  { primary: 'blue', secondary: 'cyan', tertiary: 'indigo' },
  { primary: 'emerald', secondary: 'teal', tertiary: 'green' },
  { primary: 'violet', secondary: 'purple', tertiary: 'fuchsia' },
  { primary: 'amber', secondary: 'yellow', tertiary: 'orange' },
  { primary: 'rose', secondary: 'pink', tertiary: 'red' },
  { primary: 'sky', secondary: 'blue', tertiary: 'indigo' },
  { primary: 'lime', secondary: 'emerald', tertiary: 'teal' },
  { primary: 'fuchsia', secondary: 'violet', tertiary: 'purple' },
  { primary: 'cyan', secondary: 'sky', tertiary: 'blue' },
]

// 블롭 데이터 생성
const generateBlobs = () => {
  const palette = colorPalettes[Math.floor(Math.random() * colorPalettes.length)]
  return {
    palette,
    blobs: [
      { x: Math.random() * 80 - 20, y: Math.random() * 80 - 20, vx: (Math.random() - 0.5) * 0.3, vy: (Math.random() - 0.5) * 0.3, size: 600 + Math.random() * 300, color: 'primary' },
      { x: Math.random() * 80 - 20, y: Math.random() * 80 - 20, vx: (Math.random() - 0.5) * 0.3, vy: (Math.random() - 0.5) * 0.3, size: 500 + Math.random() * 250, color: 'secondary' },
      { x: Math.random() * 80 - 20, y: Math.random() * 80 - 20, vx: (Math.random() - 0.5) * 0.3, vy: (Math.random() - 0.5) * 0.3, size: 450 + Math.random() * 200, color: 'tertiary' },
      { x: Math.random() * 80 - 20, y: Math.random() * 80 - 20, vx: (Math.random() - 0.5) * 0.3, vy: (Math.random() - 0.5) * 0.3, size: 400 + Math.random() * 250, color: 'secondary' },
      { x: Math.random() * 80 - 20, y: Math.random() * 80 - 20, vx: (Math.random() - 0.5) * 0.3, vy: (Math.random() - 0.5) * 0.3, size: 500 + Math.random() * 200, color: 'primary' },
    ],
  }
}

const blobData = ref(generateBlobs())

// 애니메이션
let animationId: number
const animate = () => {
  blobData.value.blobs.forEach((blob) => {
    blob.x += blob.vx
    blob.y += blob.vy

    // 경계에서 부드럽게 반전
    if (blob.x < -30 || blob.x > 90) blob.vx *= -1
    if (blob.y < -30 || blob.y > 90) blob.vy *= -1
  })
  animationId = requestAnimationFrame(animate)
}

onMounted(() => {
  window.addEventListener('scroll', onScroll, { passive: true })
  animate()
})

onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
  cancelAnimationFrame(animationId)
})

watch(() => route.path, () => {
  blobData.value = generateBlobs()
})

// 색상 스타일 생성
const getColorStyle = (colorType: string) => {
  const palette = blobData.value.palette
  if (!palette) return 'rgba(0, 0, 0, 0.1)'
  const colorName = palette[colorType as keyof typeof palette]
  const rgb = colors[colorName]
  const opacityMap = {
    primary: isDark.value ? 0.08 : 0.25,
    secondary: isDark.value ? 0.06 : 0.20,
    tertiary: isDark.value ? 0.05 : 0.15,
  }
  return `rgba(${rgb}, ${opacityMap[colorType as keyof typeof opacityMap] || 0.1})`
}
</script>

<template>
  <div class="fixed inset-0 z-0 overflow-hidden">
    <!-- 베이스 배경색 -->
    <div
      :class="[
        'absolute inset-0 transition-colors duration-500',
        isDark ? 'bg-black' : 'bg-white'
      ]"
    />

    <!-- 메인 그라데이션 블롭들 -->
    <div
      v-for="(blob, i) in blobData.blobs"
      :key="i"
      class="absolute rounded-full blur-[120px] transition-colors duration-700"
      :style="{
        top: `${blob.y}%`,
        left: `${blob.x}%`,
        width: `${blob.size}px`,
        height: `${blob.size}px`,
        backgroundColor: getColorStyle(blob.color),
        transform: `translateY(${scrollY * (0.05 + i * 0.03)}px)`,
      }"
    />

    <!-- 노이즈 오버레이 (텍스처) -->
    <div
      :class="[
        'absolute inset-0',
        isDark ? 'opacity-[0.02]' : 'opacity-[0.03]'
      ]"
      style="background-image: url('data:image/svg+xml,%3Csvg viewBox=&quot;0 0 256 256&quot; xmlns=&quot;http://www.w3.org/2000/svg&quot;%3E%3Cfilter id=&quot;noise&quot;%3E%3CfeTurbulence type=&quot;fractalNoise&quot; baseFrequency=&quot;0.65&quot; numOctaves=&quot;3&quot; stitchTiles=&quot;stitch&quot;/%3E%3C/filter%3E%3Crect width=&quot;100%25&quot; height=&quot;100%25&quot; filter=&quot;url(%23noise)&quot;/%3E%3C/svg%3E');"
    />
  </div>
</template>

