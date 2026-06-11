import type { Publication } from '~/types/lab'

// ─────────────────────────────────────────────
// 논문/출판물 목록 (최신순 정렬 권장)
//
// type 종류:
//   journal    - 저널 논문 (SCI, SCIE, KCI 등)
//   conference - 학회 논문 (CHI, UIST, CVPR, NeurIPS 등)
//   patent     - 특허
//   preprint   - 프리프린트 (arXiv 등)
//   book       - 단행본 / 챕터
//
// authors: 연구실 구성원 이름은 members.ts의 name.en 과 동일하게 작성
//          → 구성원 프로필과 자동 연결됩니다
//
// isHighlighted: true → 메인 페이지 대표 논문에 노출
// ─────────────────────────────────────────────

export const publications: Publication[] = [

  // ── 학회 논문 예시 ────────────────────────
  {
    id: 1,
    type: 'conference',
    title: 'TODO: Paper Title',
    authors: ['TODO: First Author', 'TODO: Second Author', 'Kwanhee Lee'],
    venue: 'TODO: Proceedings of the ACM CHI Conference on Human Factors in Computing Systems (CHI 2025)',
    year: 2025,
    month: 5,
    publisher: 'ACM',
    articleNumber: 'TODO: e.g., Article 123',
    pages: 'TODO: e.g., 1-14',

    doi: '',          // TODO: 예) 10.1145/1234567.1234568
    pdfUrl: '',       // TODO: PDF 직접 링크
    projectUrl: '',   // TODO: 프로젝트/데모 페이지
    codeUrl: '',      // TODO: GitHub 링크
    dataUrl: '',      // TODO: 데이터셋 링크
    slidesUrl: '',    // TODO: 슬라이드 링크
    posterUrl: '',    // TODO: 포스터 파일 링크
    videoUrl: '',     // TODO: 데모 영상 링크 (YouTube 등)
    arxivUrl: '',     // TODO: arXiv 링크

    abstract: 'TODO: Abstract text in English.',

    award: {
      title: { ko: 'Best Paper Award', en: 'Best Paper Award', zh: '最佳论文奖', ja: 'ベストペーパー賞' },
      organizer: { ko: 'ACM CHI 2025', en: 'ACM CHI 2025', zh: 'ACM CHI 2025', ja: 'ACM CHI 2025' },
    },  // TODO: 수상이 없으면 이 award 블록 전체 삭제

    isHighlighted: true,
    tags: ['HCI', 'TODO: Tag2'],
  },

  // ── 저널 논문 예시 ────────────────────────
  {
    id: 2,
    type: 'journal',
    title: 'TODO: Paper Title',
    authors: ['TODO: First Author', 'Kwanhee Lee'],
    venue: 'TODO: IEEE Transactions on Visualization and Computer Graphics (TVCG)',
    year: 2024,
    month: 10,
    publisher: 'IEEE',
    volume: 'TODO: Vol. 30, No. 10',
    pages: 'TODO: 1234-1247',

    doi: '',
    pdfUrl: '',
    projectUrl: '',
    codeUrl: '',
    videoUrl: '',
    arxivUrl: '',

    abstract: 'TODO: Abstract text.',

    isHighlighted: true,
    tags: ['TODO: Tag1', 'TODO: Tag2'],
  },

  // ── 프리프린트 예시 ───────────────────────
  {
    id: 3,
    type: 'preprint',
    title: 'TODO: Paper Title',
    authors: ['TODO: First Author', 'TODO: Second Author', 'Kwanhee Lee'],
    venue: 'arXiv',
    year: 2024,
    month: 8,

    arxivUrl: '',   // TODO: arXiv 링크
    pdfUrl: '',
    codeUrl: '',

    abstract: 'TODO: Abstract text.',

    isHighlighted: false,
    tags: ['TODO: Tag1'],
  },

  // ── 특허 예시 ─────────────────────────────
  {
    id: 4,
    type: 'patent',
    title: 'TODO: 특허명 (한국어 또는 영어)',
    authors: ['Kwanhee Lee', 'TODO: Co-inventor'],
    venue: '특허청',
    year: 2023,
    month: 6,

    patentNumber: 'TODO: 10-0000000',
    patentCountry: 'KR',
    patentStatus: 'registered',  // 'registered' | 'pending'

    isHighlighted: false,
    tags: ['TODO: Tag'],
  },
]

// ─────────────────────────────────────────────
// 헬퍼 함수
// ─────────────────────────────────────────────

// 메인 페이지용 대표 논문
export const highlightedPublications = publications.filter(p => p.isHighlighted)

// 종류별 필터
export const getPublicationsByType = (type: Publication['type']) =>
  publications.filter(p => p.type === type)

// 연도별 그룹화 (예: { 2025: [...], 2024: [...] })
export const getPublicationsByYear = (): Record<number, Publication[]> => {
  const grouped: Record<number, Publication[]> = {}
  for (const pub of publications) {
    if (!grouped[pub.year]) grouped[pub.year] = []
    grouped[pub.year].push(pub)
  }
  return grouped
}

// id로 단일 논문 조회
export const getPublicationById = (id: number) =>
  publications.find(p => p.id === id)

// 태그로 필터
export const getPublicationsByTag = (tag: string) =>
  publications.filter(p => p.tags.includes(tag))

// 수상 논문만
export const awardedPublications = publications.filter(p => p.award)
