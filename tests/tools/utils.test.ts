import { describe, it, expect } from 'vitest'

// ==========================================
// Base64 Encoder/Decoder Tests
// ==========================================
describe('Base64 Tool', () => {
  const encode = (str: string) => btoa(unescape(encodeURIComponent(str)))
  const decode = (str: string) => decodeURIComponent(escape(atob(str)))

  it('should encode text to base64', () => {
    expect(encode('Hello World')).toBe('SGVsbG8gV29ybGQ=')
    expect(encode('테스트')).toBe('7YWM7Iqk7Yq4')
  })

  it('should decode base64 to text', () => {
    expect(decode('SGVsbG8gV29ybGQ=')).toBe('Hello World')
    expect(decode('7YWM7Iqk7Yq4')).toBe('테스트')
  })

  it('should handle empty string', () => {
    expect(encode('')).toBe('')
    expect(decode('')).toBe('')
  })
})

// ==========================================
// URL Encoder/Decoder Tests
// ==========================================
describe('URL Tool', () => {
  it('should encode URL', () => {
    expect(encodeURIComponent('hello world')).toBe('hello%20world')
    expect(encodeURIComponent('한글')).toBe('%ED%95%9C%EA%B8%80')
    expect(encodeURIComponent('foo=bar&baz=qux')).toBe('foo%3Dbar%26baz%3Dqux')
  })

  it('should decode URL', () => {
    expect(decodeURIComponent('hello%20world')).toBe('hello world')
    expect(decodeURIComponent('%ED%95%9C%EA%B8%80')).toBe('한글')
  })
})

// ==========================================
// JSON Formatter Tests
// ==========================================
describe('JSON Tool', () => {
  it('should parse valid JSON', () => {
    const input = '{"name":"test","value":123}'
    const parsed = JSON.parse(input)
    expect(parsed.name).toBe('test')
    expect(parsed.value).toBe(123)
  })

  it('should format JSON with indentation', () => {
    const input = { name: 'test', value: 123 }
    const formatted = JSON.stringify(input, null, 2)
    expect(formatted).toContain('\n')
    expect(formatted).toContain('  ')
  })

  it('should detect invalid JSON', () => {
    expect(() => JSON.parse('invalid')).toThrow()
    expect(() => JSON.parse('{missing: quotes}')).toThrow()
  })

  it('should handle nested objects', () => {
    const input = { a: { b: { c: 1 } } }
    const str = JSON.stringify(input)
    const parsed = JSON.parse(str)
    expect(parsed.a.b.c).toBe(1)
  })
})

// ==========================================
// Hash Generator Tests
// ==========================================
describe('Hash Tool', () => {
  // Simple hash function for testing (FNV-1a)
  const simpleHash = (str: string): number => {
    let hash = 2166136261
    for (let i = 0; i < str.length; i++) {
      hash ^= str.charCodeAt(i)
      hash = Math.imul(hash, 16777619)
    }
    return hash >>> 0
  }

  it('should produce consistent hash for same input', () => {
    const hash1 = simpleHash('test')
    const hash2 = simpleHash('test')
    expect(hash1).toBe(hash2)
  })

  it('should produce different hash for different input', () => {
    const hash1 = simpleHash('test1')
    const hash2 = simpleHash('test2')
    expect(hash1).not.toBe(hash2)
  })
})

// ==========================================
// UUID Generator Tests
// ==========================================
describe('UUID Tool', () => {
  const generateUUID = () => {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
      const r = (Math.random() * 16) | 0
      const v = c === 'x' ? r : (r & 0x3) | 0x8
      return v.toString(16)
    })
  }

  it('should generate valid UUID v4 format', () => {
    const uuid = generateUUID()
    const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i
    expect(uuid).toMatch(uuidRegex)
  })

  it('should generate unique UUIDs', () => {
    const uuids = new Set()
    for (let i = 0; i < 100; i++) {
      uuids.add(generateUUID())
    }
    expect(uuids.size).toBe(100)
  })
})

// ==========================================
// Timestamp Converter Tests
// ==========================================
describe('Timestamp Tool', () => {
  it('should convert date to timestamp', () => {
    const date = new Date('2024-01-01T00:00:00Z')
    expect(date.getTime()).toBe(1704067200000)
  })

  it('should convert timestamp to date', () => {
    const timestamp = 1704067200000
    const date = new Date(timestamp)
    expect(date.toISOString()).toBe('2024-01-01T00:00:00.000Z')
  })

  it('should handle current timestamp', () => {
    const now = Date.now()
    const date = new Date(now)
    expect(date.getTime()).toBe(now)
  })
})

// ==========================================
// Number Base Converter Tests
// ==========================================
describe('Number Base Tool', () => {
  it('should convert decimal to binary', () => {
    expect((10).toString(2)).toBe('1010')
    expect((255).toString(2)).toBe('11111111')
  })

  it('should convert decimal to hex', () => {
    expect((255).toString(16)).toBe('ff')
    expect((16).toString(16)).toBe('10')
  })

  it('should convert decimal to octal', () => {
    expect((8).toString(8)).toBe('10')
    expect((64).toString(8)).toBe('100')
  })

  it('should convert binary to decimal', () => {
    expect(parseInt('1010', 2)).toBe(10)
    expect(parseInt('11111111', 2)).toBe(255)
  })

  it('should convert hex to decimal', () => {
    expect(parseInt('ff', 16)).toBe(255)
    expect(parseInt('10', 16)).toBe(16)
  })
})

// ==========================================
// Color Converter Tests
// ==========================================
describe('Color Tool', () => {
  const hexToRgb = (hex: string) => {
    const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)
    return result ? {
      r: parseInt(result[1], 16),
      g: parseInt(result[2], 16),
      b: parseInt(result[3], 16)
    } : null
  }

  const rgbToHex = (r: number, g: number, b: number) => {
    return '#' + [r, g, b].map(x => x.toString(16).padStart(2, '0')).join('')
  }

  it('should convert hex to RGB', () => {
    expect(hexToRgb('#ff0000')).toEqual({ r: 255, g: 0, b: 0 })
    expect(hexToRgb('#00ff00')).toEqual({ r: 0, g: 255, b: 0 })
    expect(hexToRgb('#0000ff')).toEqual({ r: 0, g: 0, b: 255 })
    expect(hexToRgb('#ffffff')).toEqual({ r: 255, g: 255, b: 255 })
  })

  it('should convert RGB to hex', () => {
    expect(rgbToHex(255, 0, 0)).toBe('#ff0000')
    expect(rgbToHex(0, 255, 0)).toBe('#00ff00')
    expect(rgbToHex(0, 0, 255)).toBe('#0000ff')
  })

  it('should handle invalid hex', () => {
    expect(hexToRgb('invalid')).toBeNull()
    expect(hexToRgb('#gggggg')).toBeNull()
  })
})

// ==========================================
// Password Generator Tests
// ==========================================
describe('Password Tool', () => {
  const generatePassword = (length: number, options: {
    uppercase?: boolean
    lowercase?: boolean
    numbers?: boolean
    symbols?: boolean
  }) => {
    let chars = ''
    if (options.uppercase) chars += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    if (options.lowercase) chars += 'abcdefghijklmnopqrstuvwxyz'
    if (options.numbers) chars += '0123456789'
    if (options.symbols) chars += '!@#$%^&*()_+-='

    let password = ''
    for (let i = 0; i < length; i++) {
      password += chars.charAt(Math.floor(Math.random() * chars.length))
    }
    return password
  }

  it('should generate password with correct length', () => {
    const password = generatePassword(16, { lowercase: true })
    expect(password.length).toBe(16)
  })

  it('should include only specified characters', () => {
    const password = generatePassword(100, { numbers: true })
    expect(password).toMatch(/^[0-9]+$/)
  })

  it('should generate unique passwords', () => {
    const passwords = new Set()
    for (let i = 0; i < 10; i++) {
      passwords.add(generatePassword(16, { lowercase: true, numbers: true }))
    }
    expect(passwords.size).toBe(10)
  })
})

// ==========================================
// CSV Parser Tests
// ==========================================
describe('CSV Tool', () => {
  const parseCSV = (csv: string) => {
    const lines = csv.trim().split('\n')
    const headers = lines[0].split(',')
    return lines.slice(1).map(line => {
      const values = line.split(',')
      return headers.reduce((obj, header, i) => {
        obj[header.trim()] = values[i]?.trim() || ''
        return obj
      }, {} as Record<string, string>)
    })
  }

  it('should parse CSV to array of objects', () => {
    const csv = 'name,age\nAlice,30\nBob,25'
    const result = parseCSV(csv)
    expect(result).toEqual([
      { name: 'Alice', age: '30' },
      { name: 'Bob', age: '25' }
    ])
  })

  it('should handle empty CSV', () => {
    const csv = 'name,age'
    const result = parseCSV(csv)
    expect(result).toEqual([])
  })
})

// ==========================================
// YAML/JSON Converter Tests
// ==========================================
describe('YAML-JSON Tool', () => {
  // Simple YAML to JSON (basic key: value only)
  const simpleYamlToJson = (yaml: string) => {
    const obj: Record<string, string> = {}
    yaml.split('\n').forEach(line => {
      const [key, ...valueParts] = line.split(':')
      if (key && valueParts.length) {
        obj[key.trim()] = valueParts.join(':').trim()
      }
    })
    return obj
  }

  it('should convert simple YAML to JSON', () => {
    const yaml = 'name: test\nvalue: 123'
    const result = simpleYamlToJson(yaml)
    expect(result).toEqual({ name: 'test', value: '123' })
  })
})

// ==========================================
// Diff Tool Tests
// ==========================================
describe('Diff Tool', () => {
  const simpleDiff = (text1: string, text2: string) => {
    const lines1 = text1.split('\n')
    const lines2 = text2.split('\n')

    const added: string[] = []
    const removed: string[] = []

    lines1.forEach(line => {
      if (!lines2.includes(line)) removed.push(line)
    })

    lines2.forEach(line => {
      if (!lines1.includes(line)) added.push(line)
    })

    return { added, removed }
  }

  it('should detect added lines', () => {
    const result = simpleDiff('line1', 'line1\nline2')
    expect(result.added).toContain('line2')
  })

  it('should detect removed lines', () => {
    const result = simpleDiff('line1\nline2', 'line1')
    expect(result.removed).toContain('line2')
  })

  it('should handle identical text', () => {
    const result = simpleDiff('same', 'same')
    expect(result.added).toEqual([])
    expect(result.removed).toEqual([])
  })
})

// ==========================================
// Regex Tester Tests
// ==========================================
describe('Regex Tool', () => {
  it('should match email pattern', () => {
    const emailRegex = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/
    expect(emailRegex.test('test@example.com')).toBe(true)
    expect(emailRegex.test('invalid')).toBe(false)
  })

  it('should match phone pattern', () => {
    const phoneRegex = /010-\d{4}-\d{4}/
    expect(phoneRegex.test('010-1234-5678')).toBe(true)
    expect(phoneRegex.test('010-123-456')).toBe(false)
  })

  it('should find all matches', () => {
    const text = 'a1 b2 c3'
    const matches = text.match(/[a-z]\d/g)
    expect(matches).toEqual(['a1', 'b2', 'c3'])
  })

  it('should handle invalid regex gracefully', () => {
    expect(() => new RegExp('[')).toThrow()
  })
})

// ==========================================
// Unicode Converter Tests
// ==========================================
describe('Unicode Tool', () => {
  const toUnicode = (str: string) => {
    return str.split('').map(char =>
      '\\u' + char.charCodeAt(0).toString(16).padStart(4, '0')
    ).join('')
  }

  const fromUnicode = (str: string) => {
    return str.replace(/\\u([0-9a-fA-F]{4})/g, (_, code) =>
      String.fromCharCode(parseInt(code, 16))
    )
  }

  it('should convert text to unicode', () => {
    expect(toUnicode('AB')).toBe('\\u0041\\u0042')
  })

  it('should convert unicode to text', () => {
    expect(fromUnicode('\\u0041\\u0042')).toBe('AB')
  })

  it('should handle Korean characters', () => {
    const korean = '가'
    const unicode = toUnicode(korean)
    expect(fromUnicode(unicode)).toBe(korean)
  })
})

// ==========================================
// Date Calculator Tests
// ==========================================
describe('Date Calc Tool', () => {
  it('should calculate days between dates', () => {
    const date1 = new Date('2024-01-01')
    const date2 = new Date('2024-01-10')
    const diffTime = Math.abs(date2.getTime() - date1.getTime())
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    expect(diffDays).toBe(9)
  })

  it('should add days to date', () => {
    const date = new Date('2024-01-01')
    date.setDate(date.getDate() + 10)
    expect(date.toISOString().split('T')[0]).toBe('2024-01-11')
  })

  it('should handle month boundaries', () => {
    const date = new Date('2024-01-31')
    date.setDate(date.getDate() + 1)
    expect(date.getMonth()).toBe(1) // February
  })
})

// ==========================================
// Gradient Generator Tests
// ==========================================
describe('Gradient Tool', () => {
  const generateLinearGradient = (angle: number, stops: { color: string; position: number }[]) => {
    const stopsStr = stops.map(s => `${s.color} ${s.position}%`).join(', ')
    return `linear-gradient(${angle}deg, ${stopsStr})`
  }

  it('should generate linear gradient CSS', () => {
    const gradient = generateLinearGradient(90, [
      { color: '#ff0000', position: 0 },
      { color: '#0000ff', position: 100 }
    ])
    expect(gradient).toBe('linear-gradient(90deg, #ff0000 0%, #0000ff 100%)')
  })

  it('should handle multiple color stops', () => {
    const gradient = generateLinearGradient(45, [
      { color: '#ff0000', position: 0 },
      { color: '#00ff00', position: 50 },
      { color: '#0000ff', position: 100 }
    ])
    expect(gradient).toContain('#00ff00 50%')
  })
})

// ==========================================
// Image Compression Tests (Mock)
// ==========================================
describe('Image Compress Tool', () => {
  it('should validate image file types', () => {
    const validTypes = ['image/jpeg', 'image/png', 'image/webp', 'image/gif']
    const isValidImage = (type: string) => validTypes.includes(type)

    expect(isValidImage('image/jpeg')).toBe(true)
    expect(isValidImage('image/png')).toBe(true)
    expect(isValidImage('text/plain')).toBe(false)
  })

  it('should format file size correctly', () => {
    const formatBytes = (bytes: number) => {
      if (bytes === 0) return '0 Bytes'
      const k = 1024
      const sizes = ['Bytes', 'KB', 'MB', 'GB']
      const i = Math.floor(Math.log(bytes) / Math.log(k))
      return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i]
    }

    expect(formatBytes(0)).toBe('0 Bytes')
    expect(formatBytes(1024)).toBe('1 KB')
    expect(formatBytes(1048576)).toBe('1 MB')
  })
})

// ==========================================
// Favicon Generator Tests
// ==========================================
describe('Favicon Tool', () => {
  const faviconSizes = [16, 32, 48, 64, 128, 180, 192, 512]

  it('should have correct favicon sizes', () => {
    expect(faviconSizes).toContain(16)
    expect(faviconSizes).toContain(32)
    expect(faviconSizes).toContain(180) // Apple touch icon
    expect(faviconSizes).toContain(512) // Android chrome
  })

  it('should generate HTML code with all sizes', () => {
    const generateHtmlCode = () => {
      return faviconSizes.map(size =>
        `<link rel="icon" type="image/png" sizes="${size}x${size}" href="/favicon-${size}x${size}.png">`
      ).join('\n')
    }

    const html = generateHtmlCode()
    expect(html).toContain('16x16')
    expect(html).toContain('512x512')
  })
})

// ==========================================
// JWT Decoder Tests
// ==========================================
describe('JWT Tool', () => {
  const decodeJWTPart = (str: string) => {
    try {
      const base64 = str.replace(/-/g, '+').replace(/_/g, '/')
      return JSON.parse(atob(base64))
    } catch {
      return null
    }
  }

  it('should decode JWT header', () => {
    // Example JWT header: {"alg":"HS256","typ":"JWT"}
    const header = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
    const decoded = decodeJWTPart(header)
    expect(decoded?.alg).toBe('HS256')
    expect(decoded?.typ).toBe('JWT')
  })

  it('should decode JWT payload', () => {
    // Example payload: {"sub":"1234567890","name":"Test","iat":1516239022}
    const payload = 'eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlRlc3QiLCJpYXQiOjE1MTYyMzkwMjJ9'
    const decoded = decodeJWTPart(payload)
    expect(decoded?.sub).toBe('1234567890')
    expect(decoded?.name).toBe('Test')
  })
})
