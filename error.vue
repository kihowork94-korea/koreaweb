<script setup lang="ts">
defineProps<{
  error: {
    statusCode: number
    message: string
  }
}>()

onMounted(() => {
  clearError({ redirect: '/?from=404' })
})
</script>

<template>
  <div />
</template>
