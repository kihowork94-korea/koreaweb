<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const supabase = useSupabase()

const stats = ref([
  { label: '구성원', icon: 'group', count: 0, to: '/admin/members', color: 'text-blue-400' },
  { label: '논문', icon: 'article', count: 0, to: '/admin/publications', color: 'text-green-400' },
  { label: '연구 분야', icon: 'biotech', count: 0, to: '/admin/research', color: 'text-purple-400' },
  { label: '프로젝트', icon: 'folder', count: 0, to: '/admin/projects', color: 'text-yellow-400' },
  { label: '뉴스', icon: 'newspaper', count: 0, to: '/admin/news', color: 'text-red-400' },
])

onMounted(async () => {
  const tables = ['members', 'publications', 'research_areas', 'projects', 'news']
  const results = await Promise.all(
    tables.map(t => supabase.from(t).select('*', { count: 'exact', head: true }))
  )
  results.forEach((r, i) => { stats.value[i].count = r.count ?? 0 })
})
</script>

<template>
  <div>
    <h1 class="mb-2 text-2xl font-bold text-white">대시보드</h1>
    <p class="mb-8 text-sm text-gray-500">지능형 바이오 모니터링 연구실 관리 패널</p>

    <!-- 통계 카드 -->
    <div class="grid grid-cols-5 gap-4">
      <NuxtLink
        v-for="stat in stats"
        :key="stat.label"
        :to="stat.to"
        class="rounded-xl border border-white/10 bg-gray-900 p-5 transition-colors hover:border-white/20 hover:bg-gray-800"
      >
        <span :class="['material-icons text-[28px] mb-3 block', stat.color]">{{ stat.icon }}</span>
        <div class="text-3xl font-bold text-white">{{ stat.count }}</div>
        <div class="mt-1 text-[13px] text-gray-400">{{ stat.label }}</div>
      </NuxtLink>
    </div>

    <!-- 빠른 링크 -->
    <div class="mt-10">
      <h2 class="mb-4 text-[13px] font-semibold uppercase tracking-widest text-gray-500">바로가기</h2>
      <div class="grid grid-cols-3 gap-3">
        <NuxtLink
          v-for="stat in stats"
          :key="stat.label"
          :to="stat.to"
          class="flex items-center gap-3 rounded-lg border border-white/10 bg-gray-900 px-4 py-3 text-[13px] font-medium text-gray-300 transition-colors hover:border-white/20 hover:text-white"
        >
          <span :class="['material-icons text-[16px]', stat.color]">{{ stat.icon }}</span>
          {{ stat.label }} 관리
        </NuxtLink>
        <NuxtLink
          to="/admin/lab"
          class="flex items-center gap-3 rounded-lg border border-white/10 bg-gray-900 px-4 py-3 text-[13px] font-medium text-gray-300 transition-colors hover:border-white/20 hover:text-white"
        >
          <span class="material-icons text-[16px] text-orange-400">info</span>
          연구실 정보 관리
        </NuxtLink>
      </div>
    </div>
  </div>
</template>
