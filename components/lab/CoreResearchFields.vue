<script setup lang="ts">
import { researchFlow } from '~/data/research-flow'
const { locale } = useI18n()
const loc = (value: Record<string, string>) => value[locale.value] || value.en
</script>

<template>
  <ol class="research-fields">
    <li v-for="field in researchFlow" :key="field.id">
      <p class="field-label">{{ field.label }}</p>
      <h4>{{ loc(field.title) }}</h4>
      <p>{{ loc(field.description) }}</p>
    </li>
  </ol>
</template>

<style scoped>
.research-fields { list-style: none; padding: 0; margin: 0; display: grid; gap: 1.6rem; }
.field-label { color: #2563eb; font-size: .72rem; font-weight: 800; letter-spacing: .12em; margin-bottom: .2rem; }
h4 { font-weight: 750; margin: 0 0 .3rem; }
li { min-width: 0; }
</style>
