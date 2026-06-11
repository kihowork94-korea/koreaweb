# 개발자 가이드

이 문서는 프로젝트 개발에 필요한 상세 정보를 제공합니다.

## 개발 환경 설정

### 필수 요구사항
- Node.js 20+ (`.nvmrc` 참조)
- Yarn 패키지 매니저

### 설치 및 실행

```bash
# Node 버전 설정 (nvm 사용 시)
nvm use

# 의존성 설치
yarn install

# 개발 서버 실행
yarn dev
```

개발 서버: `http://localhost:3500` (HMR 포트: 25500)

## NPM 스크립트

| 명령어 | 설명 |
|--------|------|
| `yarn dev` | 개발 서버 실행 (포트 3500) |
| `yarn build` | 프로덕션 빌드 |
| `yarn generate` | 정적 사이트 생성 |
| `yarn preview` | 빌드 결과 미리보기 |
| `yarn test` | 테스트 실행 (watch 모드) |
| `yarn test:run` | 테스트 1회 실행 |
| `yarn test:coverage` | 커버리지 포함 테스트 |

## 프로젝트 아키텍처

### 디렉토리 구조

```
runners-web-nuxt/
├── .github/workflows/    # GitHub Actions CI/CD
│   ├── ci.yml           # 메인 CI (테스트, 빌드, 타입체크)
│   └── pr-check.yml     # PR 체크 워크플로우
├── assets/
│   └── css/main.css     # 글로벌 스타일
├── components/
│   ├── AppFooter.vue    # 푸터
│   ├── AppNavBar.vue    # 네비게이션 바
│   ├── common/          # 공통 UI 컴포넌트
│   ├── intro/           # 메인 페이지 섹션 컴포넌트
│   ├── recruitment/     # 채용 페이지 컴포넌트
│   ├── tools/           # 도구 페이지 공통 컴포넌트
│   └── OgImage/         # OG 이미지 템플릿
├── composables/         # Vue Composables
│   ├── useBlogs.ts      # 블로그 데이터
│   ├── useNews.ts       # 뉴스 데이터
│   ├── useCustomToast.ts      # 토스트 알림
│   ├── useToolFavorites.ts    # 도구 즐겨찾기
│   ├── useToolSavedItems.ts   # 도구 저장 항목
│   └── useToolStorage.ts      # 도구 로컬 스토리지
├── layouts/
│   ├── default.vue      # 기본 레이아웃
│   └── tools.vue        # 도구 페이지 레이아웃
├── locales/             # i18n 번역 파일 (17개 언어)
├── pages/
│   ├── index.vue        # 메인 페이지
│   ├── blogs.vue        # 블로그 목록
│   ├── news.vue         # 뉴스 목록
│   ├── branding.vue     # 브랜딩 가이드
│   ├── services.vue     # 서비스 소개
│   ├── members/         # 팀원 소개
│   ├── recruitment/     # 채용 정보
│   └── tools/           # 개발자 도구 (30+)
├── stores/              # Pinia 스토어
│   ├── theme.ts         # 테마 상태
│   ├── blogs.ts         # 블로그 상태
│   ├── news.ts          # 뉴스 상태
│   ├── members.ts       # 팀원 상태
│   └── recruitments.ts  # 채용 상태
├── tests/               # Vitest 테스트
│   └── tools/utils.test.ts
└── types/               # TypeScript 타입 정의
```

### 주요 설정 파일

| 파일 | 설명 |
|------|------|
| `nuxt.config.ts` | Nuxt 설정 (모듈, i18n, 이미지, SSR 등) |
| `app.config.ts` | 앱 런타임 설정 |
| `vitest.config.ts` | Vitest 테스트 설정 |
| `amplify.yml` | AWS Amplify 빌드 설정 |
| `tsconfig.json` | TypeScript 설정 |

## 개발 가이드

### 새 도구 페이지 추가

1. `pages/tools/` 디렉토리에 Vue 파일 생성
2. `locales/` 디렉토리의 각 언어 파일에 번역 추가
3. 도구 목록에 등록 (해당되는 경우)

### 도구 페이지 구조

```vue
<template>
  <ToolPageLayout
    :title="$t('tools.toolName.title')"
    :description="$t('tools.toolName.description')"
  >
    <!-- 도구 UI -->
  </ToolPageLayout>
</template>

<script setup lang="ts">
// SEO 설정
useHead({
  title: '도구 이름',
})

// 도구 로직
</script>
```

### Composables 사용

```typescript
// 즐겨찾기 관리
const { favorites, toggleFavorite, isFavorite } = useToolFavorites()

// 로컬 스토리지 저장
const { savedData, save, load } = useToolStorage('tool-key')

// 토스트 알림
const toast = useCustomToast()
toast.success('성공!')
toast.error('오류 발생')
```

### 다국어 지원

번역 파일 위치: `locales/{언어코드}.ts`

```typescript
// locales/ko.ts
export default {
  tools: {
    newTool: {
      title: '새 도구',
      description: '도구 설명',
    },
  },
}
```

## 테스트

### 테스트 실행

```bash
# watch 모드
yarn test

# 1회 실행
yarn test:run

# 커버리지 포함
yarn test:coverage
```

### 테스트 파일 위치

- `tests/` 디렉토리
- 파일명: `*.test.ts` 또는 `*.spec.ts`

### 테스트 커버리지 대상

- `pages/tools/**/*.vue`
- `composables/**/*.ts`

## CI/CD

### GitHub Actions

**CI 워크플로우** (`.github/workflows/ci.yml`)
- 트리거: `main`, `dev` 브랜치 푸시/PR
- 작업:
  - 테스트 (Node 18.x, 20.x)
  - 빌드
  - 타입 체크

**PR 체크 워크플로우** (`.github/workflows/pr-check.yml`)
- 트리거: PR 생성/업데이트
- 작업: 테스트 + 빌드 + 결과 코멘트

### AWS Amplify 배포

`amplify.yml` 설정에 따라 자동 배포:
- Node.js 20 사용
- 메모리: 6GB (`NODE_OPTIONS="--max-old-space-size=6144"`)
- 캐시: `node_modules/`, `.nuxt/`

## 성능 최적화

### 빌드 최적화

`nuxt.config.ts`에서 청크 분리:
- `monaco-editor`: 별도 청크
- `nuxt-ui`: 별도 청크
- 기타 `node_modules`: vendor 청크

### 이미지 최적화

`@nuxt/image` 모듈 사용:
- 포맷: WebP, AVIF
- 품질: 80%
- 반응형 크기 지원

## 트러블슈팅

### 포트 충돌

개발 서버가 실행되지 않으면 기존 프로세스 종료:
```bash
lsof -ti:3500 | xargs kill -9
```
(`yarn dev` 스크립트에 자동 포함)

### 빌드 메모리 부족

`NODE_OPTIONS` 환경변수 설정:
```bash
export NODE_OPTIONS="--max-old-space-size=6144"
yarn build
```

### HMR 연결 실패

Vite HMR 포트(25500)가 사용 중인지 확인:
```bash
lsof -i:25500
```

## 코드 스타일

- TypeScript 사용
- Vue 3 Composition API (`<script setup>`)
- Nuxt 4 자동 import 활용
- Tailwind CSS 유틸리티 클래스

## 참고 문서

- [Nuxt 4 문서](https://nuxt.com/docs)
- [Nuxt UI 문서](https://ui.nuxt.com)
- [Vue 3 문서](https://vuejs.org)
- [Pinia 문서](https://pinia.vuejs.org)
- [Vitest 문서](https://vitest.dev)
