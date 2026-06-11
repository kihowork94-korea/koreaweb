<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const schema = {
  table: 'news',
  title: '뉴스 관리',
  columns: [
    { key: 'title', label: '제목', render: (v: any) => v?.ko || '-' },
    { key: 'category', label: '분류' },
    { key: 'date', label: '날짜' },
    { key: 'is_pinned', label: '고정', render: (v: boolean) => v ? '📌' : '' },
  ],
  fields: [
    {
      key: 'category',
      label: '분류',
      type: 'select' as const,
      required: true,
      options: [
        { value: 'announcement', label: '공지' },
        { value: 'award', label: '수상' },
        { value: 'press', label: '언론보도' },
        { value: 'recruitment', label: '모집' },
        { value: 'event', label: '행사' },
      ],
    },
    { key: 'date', label: '날짜', type: 'date' as const, required: true },
    { key: 'is_pinned', label: '상단 고정', type: 'boolean' as const },
    { key: 'title', label: '제목', type: 'localized' as const, required: true, span: 2 as const },
    { key: 'content', label: '본문 (마크다운)', type: 'localized-textarea' as const, span: 2 as const },
    { key: 'image_url', label: '썸네일 이미지 URL (선택)', type: 'text' as const, span: 2 as const, placeholder: '비우면 기본 이미지(고려대 마크) 사용' },
    { key: 'external_url', label: '외부 링크', type: 'text' as const, span: 2 as const },
  ],
}
</script>

<template>
  <AdminCrudPage :schema="schema" />
</template>
