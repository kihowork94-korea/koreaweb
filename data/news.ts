import type { LabNews } from '~/types/lab'

// ─────────────────────────────────────────────
// 뉴스/공지 목록
// TODO: 실제 뉴스로 채워주세요 (최신순 정렬 권장)
//
// category 종류:
//   announcement - 일반 공지
//   award        - 수상 소식
//   press        - 언론 보도
//   recruitment  - 대학원생/연구원 모집
//   event        - 세미나/행사
//
// content: 마크다운 문법 지원 (줄바꿈은 \n\n 사용)
// isPinned: true 이면 목록 최상단 고정
// ─────────────────────────────────────────────

export const news: LabNews[] = [
  {
    id: 1,
    category: 'recruitment',
    title: {
      ko: '2026년 석/박사 연구원 모집',
      en: 'Recruiting MS/PhD Students for 2026',
      zh: '2026年招募硕士/博士研究生',
      ja: '2026年修士・博士課程学生募集',
    },
    content: {
      ko: 'TODO: 모집 공고 본문\n\n**지원 자격:** TODO\n\n**지원 방법:** TODO',
      en: 'TODO: Recruitment notice content\n\n**Requirements:** TODO\n\n**How to apply:** TODO',
      zh: 'TODO: 招募公告内容',
      ja: 'TODO: 募集案内の本文',
    },
    date: '2026-03-01',
    isPinned: true,
    imageUrl: '',
    externalUrl: '',
  },
  {
    id: 2,
    category: 'award',
    title: {
      ko: 'TODO: 수상 내용',
      en: 'TODO: Award content',
      zh: 'TODO: 获奖内容',
      ja: 'TODO: 受賞内容',
    },
    content: {
      ko: 'TODO: 수상 상세 내용',
      en: 'TODO: Award details',
      zh: 'TODO: 获奖详情',
      ja: 'TODO: 受賞の詳細',
    },
    date: '2025-11-20',
    isPinned: false,
    imageUrl: '',
    externalUrl: '',
  },
  {
    id: 3,
    category: 'announcement',
    title: {
      ko: 'TODO: 공지 제목',
      en: 'TODO: Announcement title',
      zh: 'TODO: 公告标题',
      ja: 'TODO: お知らせのタイトル',
    },
    content: {
      ko: 'TODO: 공지 본문',
      en: 'TODO: Announcement content',
      zh: 'TODO: 公告内容',
      ja: 'TODO: お知らせの本文',
    },
    date: '2025-09-01',
    isPinned: false,
  },
]

// 메인 페이지용: 고정글 우선, 최신 3개
export const recentNews = [...news]
  .sort((a, b) => {
    if (a.isPinned !== b.isPinned) return a.isPinned ? -1 : 1
    return new Date(b.date).getTime() - new Date(a.date).getTime()
  })
  .slice(0, 3)
