<script setup lang="ts">
withDefaults(defineProps<{
  message?: string
}>(), {
  message: '정말 삭제하시겠습니까?',
})

const emit = defineEmits<{
  confirm: []
  cancel: []
}>()
</script>

<template>
  <div class="fixed inset-0 z-50 flex items-center justify-center bg-black/60">
    <div class="w-80 rounded-xl border border-white/10 bg-gray-900 p-6 shadow-2xl">
      <p class="mb-6 text-center text-[14px] text-white">{{ message }}</p>
      <div class="flex justify-center gap-3">
        <button
          type="button"
          class="rounded-lg border border-white/10 px-5 py-2 text-[13px] font-medium text-gray-300 transition-colors hover:bg-white/5"
          @click="emit('cancel')"
        >
          취소
        </button>
        <button
          type="button"
          class="rounded-lg bg-red-600 px-5 py-2 text-[13px] font-medium text-white transition-colors hover:bg-red-500"
          @click="emit('confirm')"
        >
          삭제
        </button>
      </div>
    </div>
  </div>
</template>
