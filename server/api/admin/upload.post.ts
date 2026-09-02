const BUCKET = 'member-images'
const MAX_FILE_SIZE = 5 * 1024 * 1024
const ALLOWED_TYPES: Record<string, string> = {
  'image/jpeg': 'jpg',
  'image/png': 'png',
  'image/webp': 'webp',
}

export default defineEventHandler(async (event) => {
  const parts = await readMultipartFormData(event)
  const file = parts?.find(part => part.name === 'file' && part.filename)

  if (!file) {
    throw createError({ statusCode: 400, message: '업로드할 사진을 선택해 주세요.' })
  }

  const mimeType = file.type || ''
  const extension = ALLOWED_TYPES[mimeType]
  if (!extension) {
    throw createError({ statusCode: 400, message: 'JPG, PNG, WebP 형식만 업로드할 수 있습니다.' })
  }
  if (file.data.length > MAX_FILE_SIZE) {
    throw createError({ statusCode: 413, message: '사진 용량은 5MB 이하여야 합니다.' })
  }

  const config = useRuntimeConfig()
  const supabaseUrl = config.public.supabaseUrl as string
  const serviceKey = config.supabaseServiceKey as string
  if (!supabaseUrl || !serviceKey) {
    throw createError({ statusCode: 500, message: '이미지 저장소 설정을 확인해 주세요.' })
  }

  const storageUrl = `${supabaseUrl}/storage/v1`
  const authHeaders = {
    apikey: serviceKey,
    Authorization: `Bearer ${serviceKey}`,
  }

  try {
    await $fetch(`${storageUrl}/bucket/${BUCKET}`, { headers: authHeaders })
  }
  catch (error: any) {
    if (error?.statusCode !== 404 && error?.response?.status !== 404) throw error
    await $fetch(`${storageUrl}/bucket`, {
      method: 'POST',
      headers: { ...authHeaders, 'Content-Type': 'application/json' },
      body: { id: BUCKET, name: BUCKET, public: true, file_size_limit: MAX_FILE_SIZE, allowed_mime_types: Object.keys(ALLOWED_TYPES) },
    })
  }

  const objectName = `${Date.now()}-${crypto.randomUUID()}.${extension}`
  await $fetch(`${storageUrl}/object/${BUCKET}/${objectName}`, {
    method: 'POST',
    headers: {
      ...authHeaders,
      'Content-Type': mimeType,
      'x-upsert': 'false',
    },
    body: file.data,
  })

  return {
    url: `${supabaseUrl}/storage/v1/object/public/${BUCKET}/${objectName}`,
  }
})
