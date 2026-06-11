import type { Project } from '~/types/lab'

// ─────────────────────────────────────────────
// 프로젝트 목록
// TODO: 실제 프로젝트로 채워주세요
//
// status:
//   ongoing   - 진행 중
//   completed - 완료
//
// fundingAgency 예시: NRF(한국연구재단), IITP, ETRI, DARPA, 기업명 등
// memberIds: members.ts의 id 값과 연결됨
// ─────────────────────────────────────────────

export const projects: Project[] = [
  {
    id: 1,
    title: {
      ko: 'TODO: 과제명 (한국어)',
      en: 'TODO: Project Title (English)',
      zh: 'TODO: 项目名称',
      ja: 'TODO: プロジェクト名',
    },
    description: {
      ko: 'TODO: 프로젝트 설명',
      en: 'TODO: Project description',
      zh: 'TODO: 项目描述',
      ja: 'TODO: プロジェクトの説明',
    },
    status: 'ongoing',
    startYear: 2024,
    endYear: undefined,  // 진행 중이면 undefined
    fundingAgency: {
      ko: 'TODO: 지원 기관 (예: 한국연구재단)',
      en: 'TODO: Funding agency (e.g., NRF)',
      zh: 'TODO: 资助机构',
      ja: 'TODO: 助成機関',
    },
    fundingAmount: '',   // TODO: 예) '3억원' (공개 원치 않으면 빈 문자열)
    memberIds: [1, 2],   // TODO: 참여 구성원 id
    tags: ['TODO: Tag'],
    githubUrl: '',
    websiteUrl: '',
    imageUrl: '/images/projects/project1.jpg',
  },
  {
    id: 2,
    title: {
      ko: 'TODO: 과제명',
      en: 'TODO: Project Title',
      zh: 'TODO: 项目名称',
      ja: 'TODO: プロジェクト名',
    },
    description: {
      ko: 'TODO: 프로젝트 설명',
      en: 'TODO: Project description',
      zh: 'TODO: 项目描述',
      ja: 'TODO: プロジェクトの説明',
    },
    status: 'completed',
    startYear: 2022,
    endYear: 2023,
    fundingAgency: {
      ko: 'TODO: 지원 기관',
      en: 'TODO: Funding agency',
      zh: 'TODO: 资助机构',
      ja: 'TODO: 助成機関',
    },
    memberIds: [1, 3],
    tags: ['TODO: Tag'],
  },
]

// 진행 중 / 완료 필터 헬퍼
export const ongoingProjects = projects.filter(p => p.status === 'ongoing')
export const completedProjects = projects.filter(p => p.status === 'completed')
