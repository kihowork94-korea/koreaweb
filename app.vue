<script setup lang="ts">
const { t } = useI18n()

useHead({
  titleTemplate: (title) => title ? `${title} | ARISE Lab` : 'ARISE Lab | KU-KIST 융합대학원',
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
