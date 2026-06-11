<script setup lang="ts">
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)

const password = ref('')
const error = ref(false)
const isAuthenticated = ref(false)

const CORRECT_PASSWORD = '0331'

const handleSubmit = () => {
  if (password.value === CORRECT_PASSWORD) {
    isAuthenticated.value = true
    error.value = false
    // 세션 스토리지에 인증 상태 저장
    if (import.meta.client) {
      sessionStorage.setItem('debug_authenticated', 'true')
    }
  } else {
    error.value = true
    password.value = ''
  }
}

// 페이지 로드 시 인증 상태 확인
onMounted(() => {
  if (sessionStorage.getItem('debug_authenticated') === 'true') {
    isAuthenticated.value = true
  }
})

defineExpose({ isAuthenticated })
</script>

<template>
  <div v-if="!isAuthenticated" class="fixed inset-0 z-[9999] flex items-center justify-center">
    <!-- 배경 -->
    <div
      :class="[
        'absolute inset-0 transition-colors duration-300',
        isDark ? 'bg-black' : 'bg-white',
      ]"
    />

    <!-- 비밀번호 입력 폼 -->
    <div class="relative z-10 w-full max-w-sm mx-4">
      <div
        :class="[
          'rounded-3xl p-8 shadow-2xl',
          isDark ? 'bg-gray-900' : 'bg-gray-50',
        ]"
      >
        <!-- 로고 / 타이틀 -->
        <div class="text-center mb-8">
          <div
            :class="[
              'inline-flex items-center justify-center w-16 h-16 rounded-2xl mb-4',
              'bg-gradient-to-br from-[#F95353] to-[#FA2929]',
            ]"
          >
            <span class="material-icons text-white text-[32px]">lock</span>
          </div>
          <h1
            :class="[
              'text-xl font-bold',
              isDark ? 'text-white' : 'text-gray-900',
            ]"
          >
            비밀번호 입력
          </h1>
          <p
            :class="[
              'text-sm mt-2',
              isDark ? 'text-gray-400' : 'text-gray-500',
            ]"
          >
            접근하려면 비밀번호를 입력하세요
          </p>
        </div>

        <!-- 입력 폼 -->
        <form @submit.prevent="handleSubmit" class="space-y-4">
          <div>
            <input
              v-model="password"
              type="password"
              placeholder="비밀번호"
              autocomplete="off"
              :class="[
                'w-full px-4 py-3 rounded-xl text-center text-lg tracking-widest',
                'outline-none transition-all duration-200',
                'border-2',
                error
                  ? 'border-red-500 bg-red-500/10'
                  : isDark
                    ? 'border-white/10 bg-white/5 text-white placeholder:text-gray-500 focus:border-[#F95353]'
                    : 'border-gray-200 bg-white text-gray-900 placeholder:text-gray-400 focus:border-[#F95353]',
              ]"
              @input="error = false"
            />
            <p
              v-if="error"
              class="text-red-500 text-sm mt-2 text-center"
            >
              비밀번호가 올바르지 않습니다
            </p>
          </div>

          <button
            type="submit"
            :class="[
              'w-full py-3 rounded-xl font-semibold text-white',
              'bg-gradient-to-r from-[#F95353] to-[#FA2929]',
              'hover:shadow-lg hover:shadow-[#F95353]/30',
              'active:scale-[0.98] transition-all duration-200',
            ]"
          >
            확인
          </button>
        </form>
      </div>
    </div>
  </div>

</template>
