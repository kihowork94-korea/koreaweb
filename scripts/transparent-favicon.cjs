const sharp = require('sharp')

async function main() {
  const source = 'C:/Users/User/AppData/Local/Temp/codex-clipboard-3476ef78-602b-486c-aa5d-6aab60d30d70.png'
  const { data, info } = await sharp(source)
    .extract({ left: 375, top: 145, width: 810, height: 555 })
    .ensureAlpha().raw().toBuffer({ resolveWithObject: true })
  for (let p = 0; p < data.length; p += 4) {
    const min = Math.min(data[p], data[p + 1], data[p + 2])
    const max = Math.max(data[p], data[p + 1], data[p + 2])
    let alpha = 255
    if (min > 242 && max - min < 16) alpha = 0
    else if (min > 205 && max - min < 22) alpha = Math.round(255 * (242 - min) / 37)
    data[p + 3] = alpha
    if (alpha > 0 && alpha < 255) {
      for (let c = 0; c < 3; c++) data[p + c] = Math.max(0, Math.min(255, Math.round((data[p + c] - (255 - alpha)) * 255 / alpha)))
    }
  }
  for (const size of [32, 180]) {
    await sharp(data, { raw: { width: info.width, height: info.height, channels: 4 } })
      .resize(size, size, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
      .png().toFile(`public/arise-symbol-transparent-${size}.png`)
  }
}
main().catch(error => { console.error(error); process.exit(1) })
