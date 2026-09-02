<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const schema = {
  table: 'members',
  title: '구성원 관리',
  columns: [
    { key: 'name', label: '이름', render: (v: any) => v?.ko || '-' },
    {
      key: 'role',
      label: '역할',
      render: (v: string) => ({
        professor: '교수',
        postdoc: '박사후연구원',
        phd: '박사과정',
        combined: '석박통합',
        ms: '석사과정',
        undergraduate: '학부연구생',
        alumni: '졸업생',
      }[v] || v),
    },
    { key: 'email', label: '이메일' },
    { key: 'sort_order', label: '순서' },
  ],
  fields: [
    { key: 'sort_order', label: '정렬 순서', type: 'number' as const },
    { key: 'name', label: '이름', type: 'localized' as const, required: true },
    {
      key: 'role',
      label: '역할',
      type: 'select' as const,
      required: true,
      options: [
        { value: 'professor', label: '교수' },
        { value: 'postdoc', label: '박사후연구원' },
        { value: 'phd', label: '박사과정' },
        { value: 'combined', label: '석박통합과정' },
        { value: 'ms', label: '석사과정' },
        { value: 'undergraduate', label: '학부연구생' },
        { value: 'alumni', label: '졸업생' },
      ],
    },
    { key: 'email', label: '이메일', type: 'text' as const },
    { key: 'image_url', label: '프로필 사진 (선택)', type: 'image' as const, span: 2 as const },
    { key: 'bio', label: '한 줄 소개', type: 'localized' as const, span: 2 as const },
    { key: 'research_interests', label: '연구 관심사 (JSON 배열)', type: 'json' as const, span: 2 as const },
    { key: 'education', label: '학력 (JSON 배열)', type: 'json' as const, span: 2 as const },
    { key: 'graduated_year', label: '졸업연도', type: 'number' as const },
    { key: 'current_position', label: '현재 직책', type: 'localized' as const },
    { key: 'current_institution', label: '현재 소속', type: 'localized' as const },
  ],
}
</script>

<template>
  <AdminCrudPage :schema="schema" />
</template>
