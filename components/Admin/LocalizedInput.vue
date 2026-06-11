<script setup lang="ts">
interface LocalizedValue {
  ko: string
  en: string
  zh: string
  ja: string
}

const props = withDefaults(defineProps<{
  modelValue: LocalizedValue
  type?: 'text' | 'textarea'
  label?: string
  required?: boolean
}>(), {
  type: 'text',
})

const emit = defineEmits<{
  'update:modelValue': [value: LocalizedValue]
}>()

const locales = [
  { key: 'ko' as const, label: '한국어' },
  { key: 'en' as const, label: 'English' },
  { key: 'zh' as const, label: '中文' },
  { key: 'ja' as const, label: '日本語' },
]

const activeLocale = ref<'ko' | 'en' | 'zh' | 'ja'>('ko')

function onInput(locale: 'ko' | 'en' | 'zh' | 'ja', val: string) {
  emit('update:modelValue', { ...props.modelValue, [locale]: val })
}
</script>

<template>
  <div>
    <label v-if="label" class="mb-1 block text-[12px] font-medium text-gray-400">
      {{ label }}<span v-if="required" class="ml-0.5 text-red-400">*</span>
    </label>

    <!-- 탭 -->
    <div class="mb-1 flex gap-0.5 border-b border-white/10">
      <button
        v-for="loc in locales"
        :key="loc.key"
        type="button"
        :class="[
          'px-3 py-1.5 text-[11px] font-medium transition-colors',
          activeLocale === loc.key
            ? 'border-b-2 border-blue-400 text-blue-400'
            : 'text-gray-500 hover:text-gray-300',
        ]"
        @click="activeLocale = loc.key"
      >
        {{ loc.label }}
      </button>
    </div>

    <!-- 입력 -->
    <template v-for="loc in locales" :key="loc.key">
      <textarea
        v-if="type === 'textarea' && activeLocale === loc.key"
        :value="modelValue[loc.key]"
        rows="4"
        class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
        @input="onInput(loc.key, ($event.target as HTMLTextAreaElement).value)"
      />
      <input
        v-else-if="type === 'text' && activeLocale === loc.key"
        type="text"
        :value="modelValue[loc.key]"
        class="w-full rounded-lg border border-white/10 bg-gray-800 px-3 py-2 text-[13px] text-white placeholder-gray-600 focus:border-white/30 focus:outline-none"
        @input="onInput(loc.key, ($event.target as HTMLInputElement).value)"
      />
    </template>
  </div>
</template>
