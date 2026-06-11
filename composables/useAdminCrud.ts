export function useAdminCrud(table: string) {
  const loading = ref(false)
  const rows = ref<any[]>([])
  const error = ref<string | null>(null)

  async function fetchList() {
    loading.value = true
    error.value = null
    try {
      rows.value = await $fetch<any[]>(`/api/admin/${table}`)
    }
    catch (e: any) {
      error.value = e?.message ?? '데이터를 불러오는 데 실패했습니다.'
    }
    finally {
      loading.value = false
    }
  }

  async function create(data: Record<string, any>) {
    loading.value = true
    error.value = null
    try {
      const result = await $fetch<any>(`/api/admin/${table}`, {
        method: 'POST',
        body: data,
      })
      await fetchList()
      return result
    }
    catch (e: any) {
      error.value = e?.message ?? '생성에 실패했습니다.'
      throw e
    }
    finally {
      loading.value = false
    }
  }

  async function update(id: number, data: Record<string, any>) {
    loading.value = true
    error.value = null
    try {
      const result = await $fetch<any>(`/api/admin/${table}/${id}`, {
        method: 'PUT',
        body: data,
      })
      await fetchList()
      return result
    }
    catch (e: any) {
      error.value = e?.message ?? '수정에 실패했습니다.'
      throw e
    }
    finally {
      loading.value = false
    }
  }

  async function remove(id: number) {
    loading.value = true
    error.value = null
    try {
      await $fetch(`/api/admin/${table}/${id}`, { method: 'DELETE' })
      await fetchList()
    }
    catch (e: any) {
      error.value = e?.message ?? '삭제에 실패했습니다.'
      throw e
    }
    finally {
      loading.value = false
    }
  }

  return { loading, rows, error, fetchList, create, update, remove }
}
