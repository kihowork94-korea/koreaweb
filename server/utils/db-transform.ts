/**
 * DB에서 반환되는 snake_case 컬럼명을 페이지/컴포넌트가 기대하는 camelCase로 변환
 */

import { professorProfile } from '~/data/professor-profile'
import { profileTranslations } from '~/data/profile-translations'
import { memberResearch } from '~/data/member-research'

export function transformRows(table: string, rows: any[]): any[] {
  switch (table) {
    case 'members':       return rows.map(transformMember)
    case 'publications':  return rows.map(transformPublication)
    case 'research_areas': return rows.map(transformResearchArea)
    case 'projects':      return rows.map(transformProject)
    case 'news':          return rows.map(transformNews)
    case 'lab_info':      return rows.map(transformLabInfo)
    default:              return rows
  }
}

function transformMember(row: any) {
  const cleanText = (value: any): any => {
    if (typeof value === 'string') {
      if (/실제|입력|入력/.test(value)) return ''
      return value.replace(/임시/g, '').replace(/융합/g, '融合')
        .replace(/화학/g, '化学').replace(/학교수/g, '学教授').replace(/학/g, '学').trim()
    }
    if (Array.isArray(value)) return value.map(cleanText)
    if (value && typeof value === 'object') return Object.fromEntries(Object.entries(value).map(([key, text]) => [key, key === 'ko' ? text : cleanText(text)]))
    return value
  }
  row = cleanText(row)
  if (row.name?.ko === '최기호') {
    row = {
      ...row,
      role: 'combined',
      bio: {
        ko: '석박통합과정 (KU-KIST 융합대학원, 고려대학교)',
        en: 'Integrated M.S./Ph.D. Student, KU-KIST Graduate School, Korea University',
        zh: '硕博连读（KU-KIST融合研究生院，高丽大学）',
        ja: '修士・博士統合課程（KU-KIST融合大学院、高麗大学）',
      },
    }
  }
  if (memberResearch[row.name?.ko]) {
    row = { ...row, research_interests: memberResearch[row.name.ko] }
  }
  if (row.role === 'professor' && (row.name?.ko === '이관희' || row.name?.en === 'Kwan Hyi Lee')) {
    row = {
      ...row,
      bio: { ...row.bio, ...profileTranslations.affiliation, ko: professorProfile.affiliation },
      description: { ...row.description, ...profileTranslations.description, ko: professorProfile.description },
      research_interests: professorProfile.keywords,
    }
  }
  const {
    image_url, research_interests, research_description, google_scholar, cv_url,
    publication_ids, graduated_year, graduated_degree, current_position,
    current_institution, sort_order, created_at, updated_at, ...rest
  } = row
  return {
    ...rest,
    imageUrl: image_url ?? '',
    researchInterests: research_interests ?? [],
    researchDescription: research_description,
    googleScholar: google_scholar,
    cvUrl: cv_url,
    publicationIds: publication_ids ?? [],
    graduatedYear: graduated_year,
    graduatedDegree: graduated_degree,
    currentPosition: current_position,
    currentInstitution: current_institution,
  }
}

function transformPublication(row: any) {
  const {
    is_highlighted, article_number, patent_number, patent_country, patent_status,
    links, created_at, updated_at, ...rest
  } = row
  const l = (links ?? {}) as Record<string, string>
  return {
    ...rest,
    isHighlighted: is_highlighted ?? false,
    articleNumber: article_number,
    patentNumber: patent_number,
    patentCountry: patent_country,
    patentStatus: patent_status,
    pdfUrl:     l.pdf,
    codeUrl:    l.code,
    projectUrl: l.project,
    videoUrl:   l.video,
    slidesUrl:  l.slides,
    posterUrl:  l.poster,
    arxivUrl:   l.arxiv,
  }
}

function transformResearchArea(row: any) {
  const { icon_name, image_url, sort_order, created_at, updated_at, ...rest } = row
  return {
    ...rest,
    iconName:  icon_name ?? '',
    imageUrl: image_url,
  }
}

function transformProject(row: any) {
  const {
    start_year, end_year, funding_agency, funding_amount, member_ids, image_url, links,
    created_at, updated_at, ...rest
  } = row
  const l = (links ?? {}) as Record<string, string>
  return {
    ...rest,
    startYear:     start_year,
    endYear:       end_year,
    fundingAgency: funding_agency,
    fundingAmount: funding_amount,
    memberIds:     member_ids ?? [],
    imageUrl:      image_url,
    githubUrl:     l.github,
    websiteUrl:    l.website,
  }
}

function transformNews(row: any) {
  const { image_url, external_url, is_pinned, created_at, updated_at, ...rest } = row
  return {
    ...rest,
    imageUrl:    image_url,
    externalUrl: external_url,
    isPinned:    is_pinned ?? false,
  }
}

function transformLabInfo(row: any) {
  const { short_name, nav_visibility, updated_at, ...rest } = row
  const canonicalLocation = {
    ...(rest.location ?? {}),
    address: {
      ko: '서울특별시 성북구 화랑로 14길 5 한국과학기술연구원 L3연구동 3551',
      en: 'Room 3551, L3 Research Building, KIST, 5 Hwarang-ro 14-gil, Seongbuk-gu, Seoul',
      zh: '首尔特别市城北区花郎路14街5号 韩国科学技术研究院 L3研究楼 3551室',
      ja: 'ソウル特別市城北区花郎路14街5 韓国科学技術研究院 L3研究棟 3551号室',
    },
    building: { ko: '', en: '', zh: '', ja: '' },
    room: '',
  }
  return {
    ...rest,
    location: canonicalLocation,
    shortName: short_name,
    navVisibility: nav_visibility ?? {},
  }
}
