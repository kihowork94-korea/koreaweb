<script setup lang="ts">
definePageMeta({ layout: 'admin-login' })

const inputs = ref<HTMLInputElement[]>([])
const pin = ref(['', '', '', ''])
const error = ref('')
const loading = ref(false)

const onInput = (index: number, e: Event) => {
  const val = (e.target as HTMLInputElement).value.replace(/\D/g, '')
  pin.value[index] = val.slice(-1)
  if (val && index < 3) {
    nextTick(() => inputs.value[index + 1]?.focus())
  }
  if (pin.value.every(d => d !== '')) {
    submit()
  }
}

const onKeydown = (index: number, e: KeyboardEvent) => {
  if (e.key === 'Backspace' && !pin.value[index] && index > 0) {
    inputs.value[index - 1]?.focus()
  }
}

const submit = async () => {
  const code = pin.value.join('')
  if (code.length < 4) return
  loading.value = true
  error.value = ''
  try {
    await $fetch('/api/admin/login', { method: 'POST', body: { pin: code } })
    navigateTo('/admin')
  } catch {
    error.value = '핀 번호가 틀렸습니다'
    pin.value = ['', '', '', '']
    nextTick(() => inputs.value[0]?.focus())
  } finally {
    loading.value = false
  }
}

onMounted(() => inputs.value[0]?.focus())
</script>

<template>
  <div class="flex min-h-screen items-center justify-center bg-gray-950">
    <div class="w-72 rounded-2xl border border-white/10 bg-gray-900 p-8">
      <!-- 헤더 -->
      <div class="mb-8 text-center">
        <div class="mb-1 text-[13px] font-semibold uppercase tracking-widest text-gray-500">Admin</div>
        <div class="text-lg font-bold text-white">지능형 바이오 모니터링</div>
        <div class="mt-1 text-[12px] text-gray-500">4자리 PIN을 입력하세요</div>
      </div>

      <!-- PIN 입력 -->
      <div class="mb-6 flex justify-center gap-3">
        <input
          v-for="(_, i) in pin"
          :key="i"
          ref="inputs"
          type="password"
          inputmode="numeric"
          maxlength="1"
          :value="pin[i]"
          :disabled="loading"
          @input="onInput(i, $event)"
          @keydown="onKeydown(i, $event)"
          class="h-12 w-12 rounded-xl border border-white/10 bg-gray-800 text-center text-xl font-bold text-white outline-none transition-colors focus:border-red-500 focus:ring-2 focus:ring-red-500/20 disabled:opacity-40"
        />
      </div>

      <!-- 에러 -->
      <p v-if="error" class="text-center text-[13px] text-red-400">{{ error }}</p>
      <p v-if="loading" class="text-center text-[13px] text-gray-500">확인 중...</p>
    </div>
  </div>
</template>
