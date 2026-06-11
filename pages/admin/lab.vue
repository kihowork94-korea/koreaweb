<script setup lang="ts">
definePageMeta({ layout: 'admin' })

// ─── lab_info (단일 레코드) ───────────────────────────────────────────────
const infoLoading = ref(false)
const infoSaving  = ref(false)
const infoError   = ref<string | null>(null)
const infoSaved   = ref(false)

const info = ref({
  name:        { ko: '', en: '', zh: '', ja: '' },
  short_name:  { ko: '', en: '', zh: '', ja: '' },
  slogan:      { ko: '', en: '', zh: '', ja: '' },
  description: { ko: '', en: '', zh: '', ja: '' },
  university:  { ko: '', en: '', zh: '', ja: '' },
  department:  { ko: '', en: '', zh: '', ja: '' },
  established: '' as string | number,
  location:    '',
  contact:     '',
  sns:         '',
})

function localized(val: any) {
  if (val && typeof val === 'object') {
    return { ko: val.ko ?? '', en: val.en ?? '', zh: val.zh ?? '', ja: val.ja ?? '' }
  }
  return { ko: '', en: '', zh: '', ja: '' }
}

function jsonStr(val: any) {
  if (val === null || val === undefined) return ''
  if (typeof val === 'string') return val
  return JSON.stringify(val, null, 2)
}

onMounted(async () => {
  infoLoading.value = true
  infoError.value = null
  try {
    const rows = await $fetch<any[]>('/api/admin/lab_info')
    const row = rows?.[0]
    if (row) {
      info.value.name        = localized(row.name)
      info.value.short_name  = localized(row.short_name)
      info.value.slogan      = localized(row.slogan)
      info.value.description = localized(row.description)
      info.value.university  = localized(row.university)
      info.value.department  = localized(row.department)
      info.value.established = row.established ?? ''
      info.value.location    = jsonStr(row.location)
      info.value.contact     = jsonStr(row.contact)
      info.value.sns         = jsonStr(row.sns)
    }
  }
  catch (e: any) {
    infoError.value = e?.message ?? '불러오기 실패'
  }
  finally {
    infoLoading.value = false
  }
})

async function saveInfo() {
  infoSaving.value = true
  infoError.value = null
  infoSaved.value = false
  try {
    function parseJson(str: string) {
      if (!str.trim()) return null
      try { return JSON.parse(str) } catch { return null }
    }
    const payload = {
      name:        info.value.name,
      short_name:  info.value.short_name,
      slogan:      info.value.slogan,
      description: info.value.description,
      university:  info.value.university,
      department:  info.value.department,
      established: info.value.established === '' ? null : Number(info.value.established),
      location:    parseJson(info.value.location as string),
      contact:     parseJson(info.value.contact as string),
      sns:         parseJson(info.value.sns as string),
    }
    await $fetch('/api/admin/lab_info/1', { method: 'PUT', body: payload })
    infoSaved.value = true
    setTimeout(() => { infoSaved.value = false }, 2500)
  }
  catch (e: any) {
    infoError.value = e?.data?.message ?? e?.message ?? '저장 실패'
  }
  finally {
    infoSaving.value = false
  }
}

// ─── lab_history (리스트 CRUD) ────────────────────────────────────────────
const historySchema = {
  table: 'lab_history',
  title: '연구실 연혁',
  columns: [
    { key: 'year',  label: '연도' },
    { key: 'month', label: '월', render: (v: any) => v ?? '-' },
    { key: 'content', label: '내용', render: (v: any) => v?.ko || '-' },
  ],
  fields: [
    { key: 'year',    label: '연도', type: 'number' as const, required: true },
    { key: 'month',   label: '월 (선택)', type: 'number' as const },
    { key: 'content', label: '내용', type: 'localized-textarea' as const, required: true, span: 2 as const },
  ],
  orderKey: 'year',
}

const LOCALES = ['ko', 'en', 'zh', 'ja'] as const
const LOCALE_LABELS: Record<string, string> = { ko: '한국어', en: 'English', zh: '中文', ja: '日本語' }

const localizedFields = [
  { key: 'name',        label: '연구실 이름', textarea: false },
  { key: 'short_name',  label: '연구실 약칭', textarea: false },
  { key: 'slogan',      label: '슬로건', textarea: false },
  { key: 'description', label: '연구실 소개', textarea: true },
  { key: 'university',  label: '대학교명', textarea: false },
  { key: 'department',  label: '학과/대학원명', textarea: false },
]

const jsonFields = [
  {
    key: 'location',
    label: '위치 (JSON)',
    placeholder: '{"address": {"ko": "주소", "en": "Address"}, "lat": 37.123, "lng": 127.123}',
  },
  {
    key: 'contact',
    label: '연락처 (JSON)',
    placeholder: '{"email": "lab@korea.ac.kr", "phone": "02-3290-0000"}',
  },
  {
    key: 'sns',
    label: 'SNS 링크 (JSON)',
    placeholder: '{"github": "https://github.com/...", "youtube": "https://youtube.com/..."}',
  },
]
</script>

<template>
  <div class="space-y-12">

    <!-- ─── 연구실 기본 정보 ─── -->
    <div>
      <h1 class="mb-1 text-2xl font-bold text-white">연구실 정보 관리</h1>
      <p class="mb-6 text-[13px] text-gray-500">연구실 이름, 슬로건, 연락처 등 기본 정보를 수정합니다.</p>

      <div v-if="infoLoading" class="py-10 text-center text-[13px] text-gray-500">불러오는 중…</div>

      <form v-else class="space-y-6" @submit.prevent="saveInfo">

        <!-- 다국어 텍스트 필드들 -->
        <template v-for="field in localizedFields" :key="field.key">
          <div class="rounded-xl border border-white/10 bg-gray-900 p-5">
            <p class="mb-3 text-[13px] font-semibold text-gray-300">{{ field.label }}</p>
            <div class="grid grid-cols-2 gap-3">
              <div v-for="loc in LOCALES" :key="loc">
                <label class="mb-1 block text-[11px] font-medium text-gray-500">{{ LOCALE_LABELS[loc] }}</label>
                <textarea
                  v-if="field.textarea"
                  v-model="(info as any)[field.key][loc]"
                  rows="3"
                  class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                />
                <input
                  v-else
                  v-model="(info as any)[field.key][loc]"
                  type="text"
                  class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                />
              </div>
            </div>
          </div>
        </template>

        <!-- 설립연도 -->
        <div class="rounded-xl border border-white/10 bg-gray-900 p-5">
          <label class="mb-2 block text-[13px] font-semibold text-gray-300">설립 연도</label>
          <input
            v-model="info.established"
            type="number"
            placeholder="예: 2015"
            class="w-40 rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
          />
        </div>

        <!-- location / contact / sns (JSON 직접 편집) -->
        <template v-for="field in jsonFields" :key="field.key">
          <div class="rounded-xl border border-white/10 bg-gray-900 p-5">
            <label class="mb-2 block text-[13px] font-semibold text-gray-300">{{ field.label }}</label>
            <textarea
              v-model="(info as any)[field.key]"
              rows="5"
              :placeholder="field.placeholder"
              class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 font-mono text-[12px] text-white placeholder-gray-700 focus:border-white/30 focus:outline-none"
            />
          </div>
        </template>

        <!-- 에러 / 성공 메시지 -->
        <div v-if="infoError" class="rounded-lg border border-red-500/30 bg-red-500/10 px-4 py-3 text-[13px] text-red-400">
          {{ infoError }}
        </div>
        <div v-if="infoSaved" class="rounded-lg border border-green-500/30 bg-green-500/10 px-4 py-3 text-[13px] text-green-400">
          저장되었습니다.
        </div>

        <!-- 저장 버튼 -->
        <div class="flex justify-end">
          <button
            type="submit"
            :disabled="infoSaving"
            class="rounded-lg bg-blue-600 px-6 py-2.5 text-[13px] font-medium text-white transition-colors hover:bg-blue-500 disabled:opacity-50"
          >
            {{ infoSaving ? '저장 중…' : '저장' }}
          </button>
        </div>
      </form>
    </div>

    <!-- 구분선 -->
    <div class="h-px bg-white/[0.07]" />

    <!-- ─── 연구실 연혁 ─── -->
    <AdminCrudPage :schema="historySchema" />

  </div>
</template>
