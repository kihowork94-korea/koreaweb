import { ref } from 'vue'

interface Toast {
  id: number
  title: string
  type: 'success' | 'error'
  timer?: NodeJS.Timeout
  duration: number
  remainingTime: number
  pausedAt?: number
}

const toasts = ref<Toast[]>([])
let toastId = 0

export const useCustomToast = () => {
  const add = (options: { title: string; type?: 'success' | 'error'; duration?: number }) => {
    const id = ++toastId
    const duration = options.duration || 3500
    const toast: Toast = {
      id,
      title: options.title,
      type: options.type || 'success',
      duration,
      remainingTime: duration,
    }

    toasts.value.push(toast)

    toast.timer = setTimeout(() => {
      remove(id)
    }, duration)
  }

  const remove = (id: number) => {
    const index = toasts.value.findIndex(t => t.id === id)
    if (index > -1) {
      const toast = toasts.value[index]
      if (toast?.timer) {
        clearTimeout(toast.timer)
      }
      toasts.value.splice(index, 1)
    }
  }

  const pause = (id: number) => {
    const toast = toasts.value.find(t => t.id === id)
    if (toast && toast.timer) {
      clearTimeout(toast.timer)
      toast.pausedAt = Date.now()
    }
  }

  const resume = (id: number) => {
    const toast = toasts.value.find(t => t.id === id)
    if (toast && toast.pausedAt) {
      const elapsed = Date.now() - toast.pausedAt
      toast.remainingTime = Math.max(0, toast.remainingTime - elapsed)
      toast.pausedAt = undefined

      toast.timer = setTimeout(() => {
        remove(id)
      }, toast.remainingTime)
    }
  }

  return {
    toasts,
    add,
    remove,
    pause,
    resume,
  }
}
