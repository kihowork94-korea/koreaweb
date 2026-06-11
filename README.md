# 주식회사 러너스 웹사이트

주식회사 러너스 공식 웹사이트입니다. Nuxt 4 기반의 SSR 애플리케이션으로 AWS Amplify에 배포됩니다.

## 기술 스택

| 분류 | 기술 |
|------|------|
| Framework | Nuxt 4 / Vue 3 |
| UI | Nuxt UI / Tailwind CSS |
| State | Pinia |
| i18n | @nuxtjs/i18n (17개 언어) |
| Image | @nuxt/image |
| OG Image | nuxt-og-image |
| Editor | Monaco Editor |
| Deploy | AWS Amplify (SSR) |

## 주요 기능

### 회사 소개
- 메인 페이지 (서비스 소개, 뉴스, 블로그)
- 브랜딩 가이드
- 채용 정보
- 팀원 소개

### 개발자 도구 모음 (`/tools`)
30개 이상의 온라인 개발자 도구 제공:

| 카테고리 | 도구 |
|----------|------|
| 인코딩/디코딩 | Base64, URL, HTML Entity, Unicode |
| 포맷터 | JSON, XML, SQL, HTML, YAML |
| 변환기 | CSV↔JSON, Markdown, Timestamp, Number Base |
| 생성기 | UUID, Password, QR Code, Hash, Gradient, Favicon |
| 분석기 | JWT Decoder, Regex Tester, HTTP Status, Diff |
| 미디어 | Color Picker, Lottie Player, Mermaid, Image Compress |
| 계산기 | Date Calculator |

## 지원 언어

한국어, English, 日本語, 中文, Español, Français, Deutsch, Português, Tiếng Việt, ไทย, Bahasa Indonesia, हिन्दी, العربية, Italiano, Nederlands, Polski, Русский

## 빠른 시작

```bash
# 의존성 설치
yarn install

# 개발 서버 실행 (http://localhost:3500)
yarn dev

# 프로덕션 빌드
yarn build

# 빌드 미리보기
yarn preview
```

## 요구사항

- Node.js 20+
- Yarn

## 프로젝트 구조

```
├── assets/           # CSS, 이미지 등 정적 자원
├── components/       # Vue 컴포넌트
│   ├── common/       # 공통 컴포넌트
│   ├── intro/        # 메인 페이지 섹션
│   ├── recruitment/  # 채용 페이지 컴포넌트
│   ├── backgrounds/  # 배경 컴포넌트
│   ├── tools/        # 도구 페이지 컴포넌트
│   └── OgImage/      # OG 이미지 템플릿
├── composables/      # Vue Composables
├── layouts/          # 레이아웃
├── locales/          # 다국어 번역 파일 (17개 언어)
├── pages/            # 페이지 라우트
│   └── tools/        # 개발자 도구 페이지
├── public/           # 정적 파일
├── stores/           # Pinia 스토어
├── tests/            # 테스트 파일
└── types/            # TypeScript 타입 정의
```

## 환경 변수

`.env` 파일에 다음 변수를 설정하세요:

```bash
NUXT_PUBLIC_API_BASE=
NUXT_PUBLIC_DEBUG=false
```

## 배포

AWS Amplify에서 자동 배포됩니다. `main` 또는 `dev` 브랜치에 푸시하면 자동으로 빌드 및 배포가 진행됩니다.

## 라이선스

Copyright © 주식회사 러너스. All rights reserved.
