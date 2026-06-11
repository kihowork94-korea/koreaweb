export default defineNuxtRouteMiddleware(async () => {
  const authStore = useAuthStore()

  // 토큰이 있지만 유저 정보가 없으면 복원 시도
  if (authStore.token && !authStore.user) {
    await authStore.fetchMe()
  }

  if (!authStore.isAuthenticated) {
    return navigateTo('/hr/login')
  }

  if (!authStore.isAdmin) {
    return navigateTo('/hr')
  }
})
