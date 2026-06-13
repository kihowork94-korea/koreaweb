<script setup lang="ts">
const route = useRoute()
const router = useRouter()

const navItems = [
  { label: '대시보드', icon: 'dashboard', to: '/admin' },
  { label: '구성원', icon: 'group', to: '/admin/members' },
  { label: '논문', icon: 'article', to: '/admin/publications' },
  { label: '연구 분야', icon: 'biotech', to: '/admin/research' },
  { label: '프로젝트', icon: 'folder', to: '/admin/projects' },
  { label: '뉴스', icon: 'newspaper', to: '/admin/news' },
  { label: '연구실 정보', icon: 'info', to: '/admin/lab' },
]

const isActive = (to: string) =>
  to === '/admin' ? route.path === '/admin' : route.path.startsWith(to)

const logout = async () => {
  await $fetch('/api/admin/logout', { method: 'POST' })
  router.push('/admin/login')
}
</script>

<template>
  <div class="flex min-h-screen bg-gray-950 text-white">
    <!-- 사이드바 -->
    <aside class="fixed inset-y-0 left-0 flex w-56 flex-col border-r border-white/10 bg-gray-900">
      <!-- 로고 -->
      <div class="border-b border-white/10 px-5 py-4">
        <div class="text-[13px] font-bold leading-tight text-white">ARISE Lab</div>
        <div class="mt-0.5 text-[11px] text-gray-500">관리자 패널</div>
      </div>

      <!-- 네비 -->
      <nav class="flex-1 space-y-0.5 overflow-y-auto p-2">
        <NuxtLink
          v-for="item in navItems"
          :key="item.to"
          :to="item.to"
          :class="[
            'flex items-center gap-2.5 rounded-lg px-3 py-2 text-[13px] font-medium transition-colors',
            isActive(item.to)
              ? 'bg-white/10 text-white'
              : 'text-gray-400 hover:bg-white/5 hover:text-white',
          ]"
        >
          <span class="material-icons text-[18px]">{{ item.icon }}</span>
          {{ item.label }}
        </NuxtLink>
      </nav>

      <!-- 로그아웃 -->
      <div class="border-t border-white/10 p-2">
        <button
          @click="logout"
          class="flex w-full items-center gap-2.5 rounded-lg px-3 py-2 text-[13px] font-medium text-gray-400 transition-colors hover:bg-white/5 hover:text-white"
        >
          <span class="material-icons text-[18px]">logout</span>
          로그아웃
        </button>
      </div>
    </aside>

    <!-- 메인 콘텐츠 -->
    <main class="ml-56 flex-1 p-8">
      <slot />
    </main>
  </div>
</template>
