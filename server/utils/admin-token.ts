import { createHmac } from 'node:crypto'

export const ADMIN_COOKIE = 'ibm_admin'
export const COOKIE_TTL = 60 * 60 * 24 // 24시간

export function makeToken(pin: string): string {
  return createHmac('sha256', pin)
    .update('ibm-lab-admin-session')
    .digest('hex')
}

export function checkToken(token: string): boolean {
  const pin = process.env.ADMIN_PIN ?? '1234'
  return token === makeToken(pin)
}
