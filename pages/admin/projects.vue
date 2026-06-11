<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const schema = {
  table: 'projects',
  title: '프로젝트 관리',
  columns: [
    { key: 'title', label: '제목', render: (v: any) => v?.ko || '-' },
    { key: 'status', label: '상태', render: (v: string) => v === 'ongoing' ? '진행중' : '완료' },
    { key: 'start_year', label: '시작연도' },
  ],
  fields: [
    { key: 'title', label: '과제명', type: 'localized' as const, required: true, span: 2 as const },
    { key: 'description', label: '설명', type: 'localized-textarea' as const, span: 2 as const },
    {
      key: 'status',
      label: '상태',
      type: 'select' as const,
      required: true,
      options: [
        { value: 'ongoing', label: '진행중' },
        { value: 'completed', label: '완료' },
      ],
    },
    { key: 'start_year', label: '시작연도', type: 'number' as const },
    { key: 'end_year', label: '종료연도', type: 'number' as const },
    { key: 'funding_agency', label: '지원 기관', type: 'localized' as const },
    { key: 'funding_amount', label: '연구비', type: 'text' as const },
    { key: 'tags', label: '태그 (쉼표 구분)', type: 'tags' as const, span: 2 as const },
  ],
}
</script>

<template>
  <AdminCrudPage :schema="schema" />
</template>
