<script setup lang="ts">
definePageMeta({ layout: 'admin' })

const schema = {
  table: 'publications',
  title: '논문 관리',
  columns: [
    { key: 'title', label: '제목', class: 'max-w-[300px] truncate' },
    { key: 'type', label: '유형' },
    { key: 'year', label: '연도' },
    { key: 'is_highlighted', label: '대표', render: (v: boolean) => v ? '★' : '' },
  ],
  fields: [
    {
      key: 'type',
      label: '유형',
      type: 'select' as const,
      required: true,
      options: [
        { value: 'journal', label: '저널' },
        { value: 'conference', label: '학회' },
        { value: 'patent', label: '특허' },
        { value: 'preprint', label: '프리프린트' },
        { value: 'book', label: '단행본' },
      ],
    },
    { key: 'title', label: '제목 (영문)', type: 'text' as const, required: true, span: 2 as const },
    { key: 'venue', label: '저널/학회명', type: 'text' as const, span: 2 as const },
    { key: 'year', label: '연도', type: 'number' as const, required: true },
    { key: 'month', label: '월', type: 'number' as const },
    { key: 'volume', label: 'Volume/Issue', type: 'text' as const },
    { key: 'pages', label: 'Pages', type: 'text' as const },
    { key: 'doi', label: 'DOI', type: 'text' as const, span: 2 as const },
    { key: 'abstract', label: 'Abstract', type: 'textarea' as const, span: 2 as const },
    { key: 'authors', label: '저자 (JSON 배열)', type: 'json' as const, span: 2 as const },
    { key: 'tags', label: '태그 (쉼표 구분)', type: 'tags' as const, span: 2 as const },
    { key: 'is_highlighted', label: '대표 논문', type: 'boolean' as const },
    { key: 'publisher', label: 'Publisher', type: 'text' as const },
    { key: 'patent_number', label: '특허번호', type: 'text' as const },
    { key: 'patent_country', label: '특허국가', type: 'text' as const },
    {
      key: 'patent_status',
      label: '특허상태',
      type: 'select' as const,
      options: [
        { value: '', label: '해당없음' },
        { value: 'registered', label: '등록' },
        { value: 'pending', label: '출원중' },
      ],
    },
  ],
}
</script>

<template>
  <AdminCrudPage :schema="schema" />
</template>
