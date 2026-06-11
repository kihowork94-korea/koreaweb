<script setup lang="ts">
const { toasts, remove, pause, resume } = useCustomToast()
</script>

<template>
  <Teleport to="body">
    <div class="fixed top-6 left-1/2 -translate-x-1/2 z-[999999] flex flex-col gap-2">
      <TransitionGroup name="toast">
        <div
          v-for="toast in toasts"
          :key="toast.id"
          :class="[
            'flex items-center gap-2 px-4 py-3 rounded-lg shadow-lg backdrop-blur-md cursor-pointer min-w-[200px] transition-transform hover:scale-105',
            toast.type === 'success'
              ? 'bg-emerald-500/90 text-white'
              : 'bg-red-500/90 text-white',
          ]"
          @click="remove(toast.id)"
          @mouseenter="pause(toast.id)"
          @mouseleave="resume(toast.id)"
        >
          <span class="material-icons text-[18px]">
            {{ toast.type === 'success' ? 'check_circle' : 'error' }}
          </span>
          <span class="text-sm font-medium">{{ toast.title }}</span>
        </div>
      </TransitionGroup>
    </div>
  </Teleport>
</template>

<style scoped>
.toast-enter-active,
.toast-leave-active {
  transition: all 0.3s ease;
}

.toast-enter-from {
  opacity: 0;
  transform: translateY(-20px);
}

.toast-leave-to {
  opacity: 0;
  transform: translateY(-10px) scale(0.95);
}
</style>
