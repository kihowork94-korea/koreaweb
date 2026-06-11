<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const schema = {
  table: 'research_areas',
  title: '연구 분야 관리',
  columns: [
    { key: 'title', label: '제목', render: (v: any) => v?.ko || '-' },
    { key: 'icon_name', label: '아이콘' },
    { key: 'sort_order', label: '순서' },
  ],
  fields: [
    { key: 'sort_order', label: '정렬 순서', type: 'number' as const },
    { key: 'title', label: '제목', type: 'localized' as const, required: true, span: 2 as const },
    { key: 'description', label: '설명', type: 'localized-textarea' as const, span: 2 as const },
    { key: 'keywords', label: '키워드 (JSON 배열)', type: 'json' as const, span: 2 as const },
    { key: 'icon_name', label: '아이콘 (예: i-heroicons-beaker)', type: 'text' as const },
    { key: 'image_url', label: '이미지 URL', type: 'text' as const },
  ],
}
</script>

<template>
  <AdminCrudPage :schema="schema" />
</template>
