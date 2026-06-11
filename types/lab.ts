/**
 * 연구실 홈페이지 타입 정의
 *
 * 나중에 서버 API로 교체할 때는 이 타입들을 그대로 유지하고
 * data/ 폴더의 데이터 파일만 API 호출로 교체하면 됩니다.
 */

// ─────────────────────────────────────────────
// 공통: 다국어 문자열 (ko/en/zh/ja)
// ─────────────────────────────────────────────

export interface LocalizedString {
  ko: string
  en: string
  zh: string
  ja: string
}

// ─────────────────────────────────────────────
// 연구실 기본 정보
// ─────────────────────────────────────────────

export interface LabInfo {
  name: LocalizedString
  shortName: LocalizedString       // 약칭 (예: "NIAL")
  slogan: LocalizedString          // 한 줄 슬로건
  description: LocalizedString     // 연구실 소개 본문
  university: LocalizedString      // 소속 대학교
  department: LocalizedString      // 소속 학과
  established: number              // 설립 연도 (예: 2015)
  logoUrl: string                  // 연구실 로고 이미지
  heroImageUrl: string             // 메인 배경 이미지
  location: LabLocation
  contact: LabContact
  sns: LabSns
}

export interface LabLocation {
  address: LocalizedString         // 전체 주소
  building: LocalizedString        // 건물명
  room: string                     // 호실 (예: "301호")
  mapUrl: string                   // 카카오맵/구글맵 링크
  lat: number                      // 위도 (지도 임베드용)
  lng: number                      // 경도 (지도 임베드용)
}

export interface LabContact {
  email: string
  phone: string
  fax: string
}

export interface LabSns {
  github?: string
  youtube?: string
  twitter?: string
  linkedin?: string
  researchgate?: string
}

// ─────────────────────────────────────────────
// 연혁
// ─────────────────────────────────────────────

export interface LabHistory {
  year: number
  month: number
  content: LocalizedString
}

// ─────────────────────────────────────────────
// 구성원
// ─────────────────────────────────────────────

export type MemberRole =
  | 'professor'       // 교수
  | 'postdoc'         // 박사후연구원
  | 'phd'             // 박사과정
  | 'combined'        // 석박통합과정
  | 'ms'              // 석사과정
  | 'undergraduate'   // 학부연구생
  | 'alumni'          // 졸업생

// 학력 항목
export interface MemberEducation {
  degree: LocalizedString        // 예: "박사", "Ph.D."
  major: LocalizedString         // 전공
  institution: LocalizedString   // 학교/기관명
  year: number                   // 졸업(예정) 연도
}

// 수상/성과 항목
export interface MemberAchievement {
  year: number
  title: LocalizedString         // 수상명 또는 성과 제목
  organizer?: LocalizedString    // 수여 기관/주최
}

export interface LabMember {
  id: number
  name: LocalizedString
  role: MemberRole
  imageUrl: string
  email: string

  // 소개
  bio: LocalizedString                       // 한 줄 소개 (카드에 표시)
  description?: LocalizedString             // 상세 소개 (개인 상세 페이지용, 여러 문단 가능)

  // 연구
  researchInterests: LocalizedString[]      // 연구 관심사 태그 (예: HCI, LLM, XR)
  researchDescription?: LocalizedString     // 연구 내용 자유 서술

  // 학력 (최신순)
  education?: MemberEducation[]

  // 논문 연결 — publications.ts의 Publication.id 배열
  publicationIds?: number[]

  // 수상/성과
  achievements?: MemberAchievement[]

  // 링크
  homepage?: string
  github?: string
  googleScholar?: string
  researchgate?: string
  linkedin?: string
  orcid?: string                            // ORCID ID (https://orcid.org/0000-...)
  cvUrl?: string                            // CV PDF 링크

  // 졸업생 전용
  graduatedYear?: number
  graduatedDegree?: LocalizedString         // 예: "박사", "석사"
  currentPosition?: LocalizedString         // 현재 소속 직책
  currentInstitution?: LocalizedString      // 현재 소속 기관
}

// ─────────────────────────────────────────────
// 연구 분야
// ─────────────────────────────────────────────

export interface ResearchArea {
  id: number
  title: LocalizedString
  description: LocalizedString
  keywords: LocalizedString[]
  iconName: string                       // @nuxt/ui 아이콘 이름
  imageUrl?: string
}

// ─────────────────────────────────────────────
// 논문/출판물
// ─────────────────────────────────────────────

export type PublicationType =
  | 'journal'          // 저널 논문 (SCI, SCIE, KCI 등)
  | 'conference'       // 학회 논문 (CVPR, CHI, NeurIPS 등)
  | 'patent'           // 특허 (국내/국제)
  | 'preprint'         // 프리프린트 (arXiv, bioRxiv 등)
  | 'book'             // 단행본 / 챕터

// 수상 (Best Paper 등)
export interface PublicationAward {
  title: LocalizedString       // 예: "Best Paper Award", "Honorable Mention"
  organizer?: LocalizedString  // 수여 기관/학회
}

export interface Publication {
  id: number
  type: PublicationType
  title: string                          // 논문 제목 (보통 영어)
  authors: string[]                      // 저자 목록 — 연구실 구성원은 이름 그대로 입력
  venue: string                          // 저널명 또는 학회명 (예: "CHI 2025", "IEEE TVCG")
  year: number
  month?: number
  volume?: string                        // 저널 권호 (예: "Vol. 42, No. 3")
  pages?: string                         // 페이지 범위 (예: "123-145")
  articleNumber?: string                 // 아티클 번호 (페이지 대신 쓰는 저널용)
  publisher?: string                     // 출판사 (예: "ACM", "IEEE", "Springer")

  // 링크
  doi?: string                           // DOI (예: "10.1145/1234567.1234568")
  pdfUrl?: string                        // PDF 직접 다운로드 링크
  projectUrl?: string                    // 프로젝트 페이지 (데모 사이트 등)
  codeUrl?: string                       // GitHub / GitLab 코드 링크
  dataUrl?: string                       // 데이터셋 링크
  slidesUrl?: string                     // 발표 슬라이드 링크
  posterUrl?: string                     // 포스터 파일 링크
  videoUrl?: string                      // 데모 영상 링크 (YouTube 등)
  arxivUrl?: string                      // arXiv 링크

  // 부가 정보
  abstract?: string                      // 초록 (영어)
  award?: PublicationAward               // 수상 (Best Paper 등)
  isHighlighted: boolean                 // 메인 페이지 대표 논문 노출 여부
  tags: string[]                         // 분야 태그 (예: ["HCI", "XR", "LLM"])

  // 특허 전용
  patentNumber?: string                  // 특허 번호
  patentCountry?: string                 // 등록 국가 (예: "KR", "US")
  patentStatus?: 'registered' | 'pending' // 등록 여부
}

// ─────────────────────────────────────────────
// 프로젝트
// ─────────────────────────────────────────────

export type ProjectStatus = 'ongoing' | 'completed'

export interface Project {
  id: number
  title: LocalizedString
  description: LocalizedString
  status: ProjectStatus
  startYear: number
  endYear?: number                       // 진행 중이면 undefined
  fundingAgency?: LocalizedString        // 지원 기관 (예: NRF, IITP, ETRI)
  fundingAmount?: string                 // 연구비 (예: "5억원", 선택 표시)
  memberIds: number[]                    // 참여 구성원 id (LabMember.id 참조)
  tags: string[]
  githubUrl?: string
  websiteUrl?: string
  imageUrl?: string
}

// ─────────────────────────────────────────────
// 뉴스/공지
// ─────────────────────────────────────────────

export type NewsCategory =
  | 'announcement'    // 공지
  | 'award'           // 수상
  | 'press'           // 언론보도
  | 'recruitment'     // 모집 (대학원생, 연구원)
  | 'event'           // 행사/세미나

export interface LabNews {
  id: number
  category: NewsCategory
  title: LocalizedString
  content: LocalizedString             // 본문 (마크다운 지원)
  date: string                         // ISO 날짜 문자열 (예: "2025-03-15")
  imageUrl?: string
  externalUrl?: string                 // 외부 링크 (언론보도 등)
  isPinned: boolean                    // 상단 고정 여부
}
