/**
 * 데이터 중앙 관리 파일
 *
 * 모든 데이터는 여기서 import해서 사용하세요.
 *
 * 나중에 서버 API로 교체할 때:
 *   각 파일의 export를 API 호출 함수로 교체하면 됩니다.
 *   사용하는 컴포넌트/페이지 코드는 수정할 필요 없습니다.
 */

export { labInfo, labHistory } from './lab'
export { members, getMembersByRole, getMemberById } from './members'
export { researchAreas } from './research'
export { publications, highlightedPublications, getPublicationsByYear } from './publications'
export { projects, ongoingProjects, completedProjects } from './projects'
export { news, recentNews } from './news'
