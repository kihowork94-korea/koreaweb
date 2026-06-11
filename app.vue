<script setup lang="ts">
const { t } = useI18n()

useHead({
  titleTemplate: (title) => title ? `${title} | 지능형 바이오 모니터링 연구실` : '지능형 바이오 모니터링 연구실 | KU-KIST 융합대학원',
})
</script>

<template>
  <UApp>
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
    <ClientOnly>
      <CustomToast />
    </ClientOnly>
  </UApp>
</template>
