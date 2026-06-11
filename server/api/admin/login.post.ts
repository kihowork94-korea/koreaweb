import { makeToken, ADMIN_COOKIE, COOKIE_TTL } from '../../utils/admin-token'

export default defineEventHandler(async (event) => {
  const { pin } = await readBody<{ pin: string }>(event)

  const correctPin = process.env.ADMIN_PIN ?? '1234'
  if (!pin || pin !== correctPin) {
    throw createError({ statusCode: 401, message: '핀 번호가 틀렸습니다' })
  }

  setCookie(event, ADMIN_COOKIE, makeToken(pin), {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    maxAge: COOKIE_TTL,
    path: '/',
  })

  return { ok: true }
})
