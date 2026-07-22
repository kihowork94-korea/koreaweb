/**
 * DB에서 반환되는 snake_case 컬럼명을 페이지/컴포넌트가 기대하는 camelCase로 변환
 */

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
  return {
    ...rest,
    shortName: short_name,
    navVisibility: nav_visibility ?? {},
  }
}
