# Runners Web 개발 가이드

> Nuxt 4 + @nuxt/ui 기반 Runners 프론트엔드

## 기술 스택

| 구분 | 기술 |
|------|------|
| Framework | Nuxt 4.2 |
| UI | @nuxt/ui 4.2 |
| State | Pinia |
| i18n | @nuxtjs/i18n |
| 테스트 | Vitest |
| 배포 | AWS Amplify |

## 프로젝트 구조

```
runners-web/
├── components/        # UI 컴포넌트 (PascalCase)
├── composables/       # 커스텀 훅 (use* 네이밍)
├── pages/             # 파일 기반 라우팅 (kebab-case)
├── stores/            # Pinia 스토어
├── locales/           # i18n 번역 파일
├── layouts/           # 레이아웃
├── middleware/        # 라우트 미들웨어
├── plugins/           # Nuxt 플러그인
└── assets/css/        # 스타일
```

## 개발 명령어

```bash
yarn dev              # 개발 서버 (port 3500)
yarn build            # 프로덕션 빌드
yarn test             # Vitest
yarn test:run         # Vitest 단발 실행
yarn test:coverage    # 커버리지
yarn storybook        # Storybook (port 6500)
```

## 특수 도구 컴포넌트

runners-web은 온라인 도구 플랫폼. 각 도구가 페이지/컴포넌트로 구현됨:
- Monaco Editor: Vite ESM 번들 충돌로 `vite.optimizeDeps.exclude` 처리 필요
- html2canvas / jsPDF: PDF 내보내기
- XLSX: Excel 처리
- Mermaid: 다이어그램 렌더링

## 컨벤션

- Script에서 번역: `const { t } = useI18n()` (pudding-web과 동일)
- Template에서 번역: `$t('key')` 직접 사용
- 새 번역 키 추가 시 모든 로케일 파일에 동시 추가 필요
- 포트: dev 3500, Storybook 6500, HMR 25500
