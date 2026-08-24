<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue'

const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const canvasRef = ref<HTMLCanvasElement | null>(null)
let animationId: number
let particles: Particle[] = []
let scrollY = 0
let pageHeight = 0
let mouseX = 0
let mouseY = 0
let targetMouseX = 0
let targetMouseY = 0

interface Particle {
  x: number
  y: number
  vx: number
  vy: number
  radius: number
  baseVx: number
  baseVy: number
}

const pointColors = {
  red: { r: 96, g: 165, b: 250 },
  orange: { r: 125, g: 211, b: 252 },
  purple: { r: 129, g: 140, b: 248 },
  pink: { r: 167, g: 139, b: 250 },
}

const colors = computed(() => {
  if (!isDark.value) {
    return {
      particle: 'rgba(0, 0, 0, 0.25)',
      line: (opacity: number) => `rgba(0, 0, 0, ${0.06 * opacity})`,
      bg: '#fafafa',
    }
  }
  return {
    particle: 'rgba(255, 255, 255, 0.25)',
    line: (opacity: number) => `rgba(255, 255, 255, ${0.05 * opacity})`,
    bg: '#09090b',
  }
})

const handleMouseMove = (e: MouseEvent) => {
  targetMouseX = e.clientX
  targetMouseY = e.clientY
}

const getParticleColor = (screenY: number, viewportHeight: number): string => {
  const absoluteY = scrollY + screenY
  const section = pageHeight > 0 ? absoluteY / pageHeight : screenY / viewportHeight
  const alpha = isDark.value ? 0.35 : 0.4

  if (section < 0.2) {
    return `rgba(${pointColors.red.r}, ${pointColors.red.g}, ${pointColors.red.b}, ${alpha})`
  } else if (section < 0.4) {
    return `rgba(${pointColors.purple.r}, ${pointColors.purple.g}, ${pointColors.purple.b}, ${alpha})`
  } else if (section < 0.6) {
    return `rgba(${pointColors.orange.r}, ${pointColors.orange.g}, ${pointColors.orange.b}, ${alpha})`
  } else if (section < 0.8) {
    return `rgba(${pointColors.pink.r}, ${pointColors.pink.g}, ${pointColors.pink.b}, ${alpha})`
  } else {
    return `rgba(${pointColors.red.r}, ${pointColors.red.g}, ${pointColors.red.b}, ${alpha})`
  }
}

const handleScroll = () => {
  scrollY = window.scrollY
  pageHeight = document.documentElement.scrollHeight
}

const initCanvas = () => {
  const canvas = canvasRef.value
  if (!canvas) return

  const ctx = canvas.getContext('2d')
  if (!ctx) return

  const resizeCanvas = () => {
    const width = window.innerWidth
    const height = window.innerHeight
    const dpr = window.devicePixelRatio

    canvas.width = width * dpr
    canvas.height = height * dpr
    canvas.style.width = width + 'px'
    canvas.style.height = height + 'px'

    ctx.setTransform(1, 0, 0, 1, 0, 0)
    ctx.scale(dpr, dpr)

    pageHeight = document.documentElement.scrollHeight
  }

  resizeCanvas()
  window.addEventListener('resize', resizeCanvas)
  window.addEventListener('scroll', handleScroll)
  window.addEventListener('mousemove', handleMouseMove)
  handleScroll()

  const width = window.innerWidth
  const height = window.innerHeight
  const particleCount = Math.min(100, Math.floor(width / 12))
  particles = []

  for (let i = 0; i < particleCount; i++) {
    const vx = (Math.random() - 0.5) * 0.4
    const vy = (Math.random() - 0.5) * 0.4
    particles.push({
      x: Math.random() * width,
      y: Math.random() * height,
      vx,
      vy,
      baseVx: vx,
      baseVy: vy,
      radius: Math.random() * 2 + 1,
    })
  }

  const animate = () => {
    const width = window.innerWidth
    const height = window.innerHeight

    mouseX += (targetMouseX - mouseX) * 0.05
    mouseY += (targetMouseY - mouseY) * 0.05

    ctx.fillStyle = colors.value.bg
    ctx.fillRect(0, 0, width, height)

    const scrollProgress = pageHeight > height ? scrollY / (pageHeight - height) : 0

    const glowAlpha = isDark.value ? 0.06 : 0.08
    const glowSize = 450

    const mainGlowY = height * 0.3
    let mainColor = pointColors.red
    if (scrollProgress > 0.75) {
      mainColor = pointColors.pink
    } else if (scrollProgress > 0.5) {
      mainColor = pointColors.orange
    } else if (scrollProgress > 0.25) {
      mainColor = pointColors.purple
    }

    const mainGradient = ctx.createRadialGradient(
      width * 0.5, mainGlowY, 0,
      width * 0.5, mainGlowY, glowSize
    )
    mainGradient.addColorStop(0, `rgba(${mainColor.r}, ${mainColor.g}, ${mainColor.b}, ${glowAlpha})`)
    mainGradient.addColorStop(1, 'transparent')
    ctx.fillStyle = mainGradient
    ctx.fillRect(0, 0, width, height)

    const leftGradient = ctx.createRadialGradient(
      0, height * 0.5, 0,
      0, height * 0.5, glowSize * 0.7
    )
    leftGradient.addColorStop(0, `rgba(${pointColors.purple.r}, ${pointColors.purple.g}, ${pointColors.purple.b}, ${glowAlpha * 0.4})`)
    leftGradient.addColorStop(1, 'transparent')
    ctx.fillStyle = leftGradient
    ctx.fillRect(0, 0, width, height)

    const rightGradient = ctx.createRadialGradient(
      width, height * 0.6, 0,
      width, height * 0.6, glowSize * 0.7
    )
    rightGradient.addColorStop(0, `rgba(${pointColors.orange.r}, ${pointColors.orange.g}, ${pointColors.orange.b}, ${glowAlpha * 0.4})`)
    rightGradient.addColorStop(1, 'transparent')
    ctx.fillStyle = rightGradient
    ctx.fillRect(0, 0, width, height)

    const bottomGradient = ctx.createRadialGradient(
      width * 0.5, height, 0,
      width * 0.5, height, glowSize * 0.6
    )
    bottomGradient.addColorStop(0, `rgba(${pointColors.pink.r}, ${pointColors.pink.g}, ${pointColors.pink.b}, ${glowAlpha * 0.35})`)
    bottomGradient.addColorStop(1, 'transparent')
    ctx.fillStyle = bottomGradient
    ctx.fillRect(0, 0, width, height)

    if (mouseX > 0 && mouseY > 0) {
      const mouseGlowAlpha = isDark.value ? 0.08 : 0.06
      const mouseGradient = ctx.createRadialGradient(
        mouseX, mouseY, 0,
        mouseX, mouseY, 250
      )
      mouseGradient.addColorStop(0, `rgba(${mainColor.r}, ${mainColor.g}, ${mainColor.b}, ${mouseGlowAlpha})`)
      mouseGradient.addColorStop(1, 'transparent')
      ctx.fillStyle = mouseGradient
      ctx.fillRect(0, 0, width, height)
    }

    particles.forEach((particle) => {
      const dx = mouseX - particle.x
      const dy = mouseY - particle.y
      const distance = Math.sqrt(dx * dx + dy * dy)
      const maxDistance = 200

      if (distance < maxDistance && distance > 0) {
        const force = (maxDistance - distance) / maxDistance * 0.02
        particle.vx = particle.baseVx + (dx / distance) * force
        particle.vy = particle.baseVy + (dy / distance) * force
      } else {
        particle.vx = particle.baseVx
        particle.vy = particle.baseVy
      }

      particle.x += particle.vx
      particle.y += particle.vy

      if (particle.x < 0 || particle.x > width) {
        particle.vx *= -1
        particle.baseVx *= -1
      }
      if (particle.y < 0 || particle.y > height) {
        particle.vy *= -1
        particle.baseVy *= -1
      }

      const particleColor = getParticleColor(particle.y, height)

      ctx.beginPath()
      ctx.arc(particle.x, particle.y, particle.radius, 0, Math.PI * 2)
      ctx.fillStyle = particleColor
      ctx.fill()
    })

    particles.forEach((particle, i) => {
      particles.slice(i + 1).forEach((otherParticle) => {
        const dx = particle.x - otherParticle.x
        const dy = particle.y - otherParticle.y
        const distance = Math.sqrt(dx * dx + dy * dy)

        if (distance < 120) {
          ctx.beginPath()
          ctx.moveTo(particle.x, particle.y)
          ctx.lineTo(otherParticle.x, otherParticle.y)
          ctx.strokeStyle = colors.value.line(1 - distance / 120)
          ctx.lineWidth = 0.5
          ctx.stroke()
        }
      })
    })

    animationId = requestAnimationFrame(animate)
  }

  animate()
}

onMounted(() => {
  initCanvas()
})

onUnmounted(() => {
  if (animationId) {
    cancelAnimationFrame(animationId)
  }
  window.removeEventListener('scroll', handleScroll)
  window.removeEventListener('mousemove', handleMouseMove)
})
</script>

<template>
  <canvas
    ref="canvasRef"
    class="fixed inset-0 h-screen w-screen"
  />
</template>
