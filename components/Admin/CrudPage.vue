<script setup lang="ts">
interface Column {
  key: string
  label: string
  render?: (value: any, row: any) => string
  class?: string
}

interface SelectOption {
  value: string
  label: string
}

interface FormField {
  key: string
  label: string
  type: 'text' | 'textarea' | 'number' | 'date' | 'select' | 'boolean' | 'localized' | 'localized-textarea' | 'tags' | 'json' | 'image'
  options?: SelectOption[]
  required?: boolean
  placeholder?: string
  span?: 1 | 2
}

interface CrudSchema {
  table: string
  title: string
  columns: Column[]
  fields: FormField[]
  orderKey?: string
}

const props = defineProps<{ schema: CrudSchema }>()

const { loading, rows, error, fetchList, create, update, remove } = useAdminCrud(props.schema.table)

const showModal = ref(false)
const isEdit = ref(false)
const editId = ref<number | null>(null)
const formState = ref<Record<string, any>>({})
const saveError = ref<string | null>(null)
const uploadingField = ref<string | null>(null)

const confirmDeleteId = ref<number | null>(null)

function initFormState(fromRow?: Record<string, any>) {
  const state: Record<string, any> = {}
  for (const field of props.schema.fields) {
    if (fromRow && field.key in fromRow) {
      const val = fromRow[field.key]
      if (field.type === 'tags') {
        state[field.key] = Array.isArray(val) ? val.join(', ') : (val ?? '')
      }
      else if (field.type === 'json') {
        state[field.key] = val !== null && val !== undefined ? JSON.stringify(val, null, 2) : ''
      }
      else if (field.type === 'localized' || field.type === 'localized-textarea') {
        state[field.key] = val && typeof val === 'object'
          ? { ko: val.ko ?? '', en: val.en ?? '', zh: val.zh ?? '', ja: val.ja ?? '' }
          : { ko: '', en: '', zh: '', ja: '' }
      }
      else {
        state[field.key] = val ?? ''
      }
    }
    else {
      if (field.type === 'localized' || field.type === 'localized-textarea') {
        state[field.key] = { ko: '', en: '', zh: '', ja: '' }
      }
      else if (field.type === 'boolean') {
        state[field.key] = false
      }
      else if (field.type === 'number') {
        state[field.key] = ''
      }
      else if (field.type === 'json') {
        state[field.key] = ''
      }
      else {
        state[field.key] = ''
      }
    }
  }
  return state
}

function openCreate() {
  isEdit.value = false
  editId.value = null
  formState.value = initFormState()
  saveError.value = null
  showModal.value = true
}

function openEdit(row: Record<string, any>) {
  isEdit.value = true
  editId.value = row.id
  formState.value = initFormState(row)
  saveError.value = null
  showModal.value = true
}

function buildPayload(): Record<string, any> {
  const payload: Record<string, any> = {}
  for (const field of props.schema.fields) {
    const val = formState.value[field.key]
    if (field.type === 'tags') {
      // convert comma-separated string to array
      payload[field.key] = typeof val === 'string'
        ? val.split(',').map((s: string) => s.trim()).filter(Boolean)
        : []
    }
    else if (field.type === 'json') {
      try {
        payload[field.key] = val ? JSON.parse(val) : null
      }
      catch {
        payload[field.key] = null
      }
    }
    else if (field.type === 'number') {
      payload[field.key] = val === '' || val === null || val === undefined ? null : Number(val)
    }
    else if (field.type === 'boolean') {
      payload[field.key] = Boolean(val)
    }
    else if (field.type === 'localized' || field.type === 'localized-textarea') {
      payload[field.key] = val
    }
    else {
      payload[field.key] = val === '' ? null : val
    }
  }
  return payload
}

async function onSave() {
  saveError.value = null
  try {
    const payload = buildPayload()
    if (isEdit.value && editId.value !== null) {
      await update(editId.value, payload)
    }
    else {
      await create(payload)
    }
    showModal.value = false
  }
  catch (e: any) {
    saveError.value = e?.data?.message ?? e?.message ?? '저장에 실패했습니다.'
  }
}

async function onImageSelected(fieldKey: string, event: Event) {
  const input = event.target as HTMLInputElement
  const file = input.files?.[0]
  input.value = ''
  if (!file) return

  saveError.value = null
  uploadingField.value = fieldKey
  try {
    const formData = new FormData()
    formData.append('file', file)
    const result = await $fetch<{ url: string }>('/api/admin/upload', {
      method: 'POST',
      body: formData,
    })
    formState.value[fieldKey] = result.url
  }
  catch (e: any) {
    saveError.value = e?.data?.message ?? e?.message ?? '이미지 업로드에 실패했습니다.'
  }
  finally {
    uploadingField.value = null
  }
}

function onDeleteClick(id: number) {
  confirmDeleteId.value = id
}

async function onConfirmDelete() {
  if (confirmDeleteId.value !== null) {
    await remove(confirmDeleteId.value)
    confirmDeleteId.value = null
  }
}

function getCellValue(col: Column, row: Record<string, any>): string {
  const val = row[col.key]
  if (col.render) return col.render(val, row)
  if (val === null || val === undefined) return '-'
  if (typeof val === 'boolean') return val ? '✓' : ''
  if (typeof val === 'object') return JSON.stringify(val).slice(0, 60)
  return String(val)
}

onMounted(fetchList)
</script>

<template>
  <div>
    <!-- 헤더 -->
    <div class="mb-6 flex items-center justify-between">
      <div>
        <h1 class="text-2xl font-bold text-white">{{ schema.title }}</h1>
        <p class="mt-1 text-[13px] text-gray-500">총 {{ rows.length }}건</p>
      </div>
      <button
        class="flex items-center gap-2 rounded-lg bg-blue-600 px-4 py-2 text-[13px] font-medium text-white transition-colors hover:bg-blue-500"
        @click="openCreate"
      >
        <span class="material-icons text-[16px]">add</span>
        추가
      </button>
    </div>

    <!-- 에러 -->
    <div v-if="error" class="mb-4 rounded-lg border border-red-500/30 bg-red-500/10 px-4 py-3 text-[13px] text-red-400">
      {{ error }}
    </div>

    <!-- 로딩 -->
    <div v-if="loading && rows.length === 0" class="py-12 text-center text-[13px] text-gray-500">
      불러오는 중…
    </div>

    <!-- 테이블 -->
    <div v-else class="overflow-hidden rounded-xl border border-white/10">
      <table class="w-full text-[13px]">
        <thead>
          <tr class="border-b border-white/10 bg-gray-900">
            <th
              v-for="col in schema.columns"
              :key="col.key"
              :class="['px-4 py-3 text-left font-medium text-gray-400', col.class]"
            >
              {{ col.label }}
            </th>
            <th class="px-4 py-3 text-right font-medium text-gray-400">
              작업
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="row in rows"
            :key="row.id"
            class="border-b border-white/5 bg-gray-950 transition-colors hover:bg-gray-900"
          >
            <td
              v-for="col in schema.columns"
              :key="col.key"
              :class="['px-4 py-3 text-gray-300', col.class]"
            >
              {{ getCellValue(col, row) }}
            </td>
            <td class="px-4 py-3 text-right">
              <button
                class="mr-2 text-blue-400 transition-colors hover:text-blue-300"
                @click="openEdit(row)"
              >
                <span class="material-icons text-[16px]">edit</span>
              </button>
              <button
                class="text-red-400 transition-colors hover:text-red-300"
                @click="onDeleteClick(row.id)"
              >
                <span class="material-icons text-[16px]">delete</span>
              </button>
            </td>
          </tr>
          <tr v-if="rows.length === 0 && !loading">
            <td :colspan="schema.columns.length + 1" class="py-10 text-center text-gray-600">
              데이터가 없습니다.
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- 모달 -->
    <Teleport to="body">
      <div v-if="showModal" class="fixed inset-0 z-40 flex items-start justify-center overflow-y-auto bg-black/70 py-10">
        <div class="w-full max-w-2xl rounded-2xl border border-white/10 bg-gray-900 shadow-2xl">
          <!-- 모달 헤더 -->
          <div class="flex items-center justify-between border-b border-white/10 px-6 py-4">
            <h2 class="text-[15px] font-semibold text-white">
              {{ isEdit ? '수정' : '추가' }} — {{ schema.title }}
            </h2>
            <button
              type="button"
              class="text-gray-500 transition-colors hover:text-gray-300"
              @click="showModal = false"
            >
              <span class="material-icons text-[20px]">close</span>
            </button>
          </div>

          <!-- 모달 본문 -->
          <form class="p-6" @submit.prevent="onSave">
            <div class="grid grid-cols-2 gap-4">
              <template v-for="field in schema.fields" :key="field.key">
                <div :class="field.span === 2 ? 'col-span-2' : 'col-span-1'">
                  <!-- localized / localized-textarea -->
                  <AdminLocalizedInput
                    v-if="field.type === 'localized' || field.type === 'localized-textarea'"
                    v-model="formState[field.key]"
                    :type="field.type === 'localized-textarea' ? 'textarea' : 'text'"
                    :label="field.label"
                    :required="field.required"
                  />

                  <!-- boolean -->
                  <template v-else-if="field.type === 'boolean'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">{{ field.label }}</label>
                    <button
                      type="button"
                      :class="[
                        'flex h-8 w-14 items-center rounded-full px-1 transition-colors',
                        formState[field.key] ? 'bg-blue-600' : 'bg-gray-700',
                      ]"
                      @click="formState[field.key] = !formState[field.key]"
                    >
                      <span
                        :class="[
                          'h-6 w-6 rounded-full bg-white shadow transition-transform',
                          formState[field.key] ? 'translate-x-6' : 'translate-x-0',
                        ]"
                      />
                    </button>
                  </template>

                  <!-- select -->
                  <template v-else-if="field.type === 'select'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <select
                      v-model="formState[field.key]"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white focus:border-white/30 focus:outline-none"
                      :required="field.required"
                    >
                      <option v-for="opt in field.options" :key="opt.value" :value="opt.value">
                        {{ opt.label }}
                      </option>
                    </select>
                  </template>

                  <!-- image upload -->
                  <template v-else-if="field.type === 'image'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <div class="flex items-center gap-4 rounded-xl border border-dashed border-white/15 bg-gray-800/60 p-4">
                      <div class="flex h-28 w-24 shrink-0 items-center justify-center overflow-hidden rounded-lg bg-gray-950">
                        <img
                          v-if="formState[field.key]"
                          :src="formState[field.key]"
                          alt="프로필 이미지 미리보기"
                          class="h-full w-full object-cover"
                        >
                        <span v-else class="material-icons text-3xl text-gray-600">person</span>
                      </div>
                      <div class="min-w-0 flex-1">
                        <p class="mb-3 text-[12px] leading-5 text-gray-500">
                          JPG, PNG, WebP · 최대 5MB
                        </p>
                        <div class="flex flex-wrap gap-2">
                          <label
                            :class="[
                              'inline-flex cursor-pointer items-center gap-1.5 rounded-lg bg-blue-600 px-3 py-2 text-[12px] font-medium text-white transition-colors hover:bg-blue-500',
                              uploadingField === field.key ? 'pointer-events-none opacity-50' : '',
                            ]"
                          >
                            <span class="material-icons text-[15px]">upload</span>
                            {{ uploadingField === field.key ? '업로드 중…' : '사진 선택' }}
                            <input
                              type="file"
                              accept="image/jpeg,image/png,image/webp"
                              class="sr-only"
                              :disabled="uploadingField === field.key"
                              @change="onImageSelected(field.key, $event)"
                            >
                          </label>
                          <button
                            v-if="formState[field.key]"
                            type="button"
                            class="rounded-lg border border-white/10 px-3 py-2 text-[12px] text-gray-300 transition-colors hover:bg-white/5"
                            @click="formState[field.key] = ''"
                          >
                            사진 제거
                          </button>
                        </div>
                      </div>
                    </div>
                  </template>

                  <!-- textarea (plain) -->
                  <template v-else-if="field.type === 'textarea'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <textarea
                      v-model="formState[field.key]"
                      rows="4"
                      :placeholder="field.placeholder"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>

                  <!-- json -->
                  <template v-else-if="field.type === 'json'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <textarea
                      v-model="formState[field.key]"
                      rows="4"
                      :placeholder="field.placeholder ?? '[]'"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 font-mono text-[12px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>

                  <!-- tags -->
                  <template v-else-if="field.type === 'tags'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <input
                      v-model="formState[field.key]"
                      type="text"
                      :placeholder="field.placeholder ?? 'tag1, tag2, tag3'"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>

                  <!-- number -->
                  <template v-else-if="field.type === 'number'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <input
                      v-model="formState[field.key]"
                      type="number"
                      :placeholder="field.placeholder"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>

                  <!-- date -->
                  <template v-else-if="field.type === 'date'">
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <input
                      v-model="formState[field.key]"
                      type="date"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>

                  <!-- text (default) -->
                  <template v-else>
                    <label class="mb-1 block text-[12px] font-medium text-gray-400">
                      {{ field.label }}<span v-if="field.required" class="ml-0.5 text-red-400">*</span>
                    </label>
                    <input
                      v-model="formState[field.key]"
                      type="text"
                      :placeholder="field.placeholder"
                      :required="field.required"
                      class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
                    />
                  </template>
                </div>
              </template>
            </div>

            <!-- 저장 에러 -->
            <div v-if="saveError" class="mt-4 rounded-lg border border-red-500/30 bg-red-500/10 px-3 py-2 text-[12px] text-red-400">
              {{ saveError }}
            </div>

            <!-- 버튼 -->
            <div class="mt-6 flex justify-end gap-3">
              <button
                type="button"
                class="rounded-lg border border-white/10 px-5 py-2 text-[13px] font-medium text-gray-300 transition-colors hover:bg-white/5"
                @click="showModal = false"
              >
                취소
              </button>
              <button
                type="submit"
                :disabled="loading || uploadingField !== null"
                class="rounded-lg bg-blue-600 px-5 py-2 text-[13px] font-medium text-white transition-colors hover:bg-blue-500 disabled:opacity-50"
              >
                {{ loading ? '저장 중…' : '저장' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </Teleport>

    <!-- 삭제 확인 다이얼로그 -->
    <Teleport to="body">
      <AdminConfirmDialog
        v-if="confirmDeleteId !== null"
        @confirm="onConfirmDelete"
        @cancel="confirmDeleteId = null"
      />
    </Teleport>
  </div>
</template>
