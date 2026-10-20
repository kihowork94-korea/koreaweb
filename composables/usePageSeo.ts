type SeoPage = 'home' | 'about' | 'members' | 'research' | 'publications' | 'projects' | 'news' | 'contact'
type SeoLocale = 'ko' | 'en' | 'zh' | 'ja'

const seoContent: Record<SeoPage, Record<SeoLocale, { title: string; description: string }>> = {
  home: {
    ko: { title: 'ARISE Lab — KIST 이관희 교수 연구실 | KU-KIST 융합대학원', description: 'KIST 이관희 교수가 이끄는 고려대학교 KU-KIST 융합대학원 ARISE Lab입니다. AI, 나노바이오센서, 암·감염병 조기진단 및 지능형 센싱을 연구합니다.' },
    en: { title: 'ARISE Lab — Prof. Kwan Hyi Lee | KIST & KU-KIST', description: 'ARISE Lab, led by Prof. Kwan Hyi Lee at KIST and KU-KIST, advances AI, nanobiosensors, intelligent sensing, and early diagnosis of cancer and infectious diseases.' },
    zh: { title: 'ARISE Lab — KIST 李官熙教授研究室 | KU-KIST', description: 'ARISE Lab由KIST李官熙教授领导，研究人工智能、纳米生物传感器、智能传感以及癌症与传染病的早期诊断。' },
    ja: { title: 'ARISE Lab — KIST イ・グァンヒ教授研究室 | KU-KIST', description: 'KISTのイ・グァンヒ教授が率いるARISE Labです。AI、ナノバイオセンサー、知能型センシング、がん・感染症の早期診断を研究しています。' },
  },
  about: {
    ko: { title: '연구실 소개 | KIST 이관희 교수 ARISE Lab', description: 'KIST 이관희 교수가 이끄는 ARISE Lab의 비전, 연구 방향과 지도교수 이력을 소개합니다. 고려대학교 KU-KIST 융합대학원 소속 연구실입니다.' },
    en: { title: 'About | ARISE Lab — Prof. Kwan Hyi Lee', description: 'Learn about the vision, research direction, and principal investigator of ARISE Lab at KIST and the KU-KIST Graduate School.' },
    zh: { title: '研究室介绍 | ARISE Lab — 李官熙教授', description: '了解KIST与KU-KIST ARISE Lab的愿景、研究方向以及负责人李官熙教授。' },
    ja: { title: '研究室紹介 | ARISE Lab — イ・グァンヒ教授', description: 'KIST・KU-KIST ARISE Labのビジョン、研究方針、指導教授イ・グァンヒの経歴をご紹介します。' },
  },
  members: {
    ko: { title: '구성원 | KIST 이관희 교수 연구실 — ARISE Lab', description: 'KIST 이관희 교수와 고려대학교 KU-KIST 융합대학원 ARISE Lab 연구진을 소개합니다. AI, 나노바이오센서, 암·감염병 진단 분야를 연구합니다.' },
    en: { title: 'Members | ARISE Lab — Prof. Kwan Hyi Lee', description: 'Meet Prof. Kwan Hyi Lee and the ARISE Lab researchers working in AI, nanobiosensors, and cancer and infectious disease diagnostics.' },
    zh: { title: '成员 | ARISE Lab — 李官熙教授研究室', description: '认识李官熙教授与ARISE Lab研究人员，团队致力于人工智能、纳米生物传感器及癌症与传染病诊断研究。' },
    ja: { title: 'メンバー | ARISE Lab — イ・グァンヒ教授研究室', description: 'AI、ナノバイオセンサー、がん・感染症診断を研究するイ・グァンヒ教授とARISE Labの研究員をご紹介します。' },
  },
  research: {
    ko: { title: '연구 분야 | AI·나노바이오센서 — ARISE Lab', description: 'ARISE Lab의 AI 기반 지능형 바이오 모니터링, 나노바이오공학, 전기화학센서와 암·감염병 조기진단 및 스마트병동 연구를 소개합니다.' },
    en: { title: 'Research | AI & Nanobiosensors — ARISE Lab', description: 'Explore ARISE Lab research in intelligent biomonitoring, nanobiotechnology, electrochemical sensors, early diagnosis, and AI-enabled smart wards.' },
    zh: { title: '研究领域 | AI与纳米生物传感器 — ARISE Lab', description: '探索ARISE Lab在智能生物监测、纳米生物技术、电化学传感器、早期诊断及AI智慧病房方面的研究。' },
    ja: { title: '研究分野 | AI・ナノバイオセンサー — ARISE Lab', description: '知能型バイオモニタリング、ナノバイオ工学、電気化学センサー、早期診断、AIスマート病棟の研究をご紹介します。' },
  },
  publications: {
    ko: { title: '논문 및 연구 성과 | ARISE Lab', description: 'KIST 이관희 교수 ARISE Lab의 AI, 바이오센서, 나노바이오공학, 암·감염병 진단 분야 논문과 학술 성과를 확인하세요.' },
    en: { title: 'Publications | ARISE Lab', description: 'Browse ARISE Lab publications and academic achievements in AI, biosensors, nanobiotechnology, and disease diagnostics.' },
    zh: { title: '论文与研究成果 | ARISE Lab', description: '查看ARISE Lab在人工智能、生物传感器、纳米生物技术及疾病诊断领域的论文与学术成果。' },
    ja: { title: '論文・研究成果 | ARISE Lab', description: 'AI、バイオセンサー、ナノバイオ工学、疾患診断分野におけるARISE Labの論文と研究成果をご覧ください。' },
  },
  projects: {
    ko: { title: '연구 프로젝트 | ARISE Lab', description: 'ARISE Lab이 수행하는 AI 헬스케어, 나노바이오센서, 조기진단 및 스마트병동 관련 진행·완료 연구 프로젝트를 소개합니다.' },
    en: { title: 'Research Projects | ARISE Lab', description: 'Discover ARISE Lab projects in AI healthcare, nanobiosensors, early diagnosis, and smart hospital systems.' },
    zh: { title: '研究项目 | ARISE Lab', description: '了解ARISE Lab在AI医疗、纳米生物传感器、早期诊断与智慧医院系统方面的研究项目。' },
    ja: { title: '研究プロジェクト | ARISE Lab', description: 'AIヘルスケア、ナノバイオセンサー、早期診断、スマート病院システムに関する研究プロジェクトをご紹介します。' },
  },
  news: {
    ko: { title: '연구실 소식 | ARISE Lab', description: 'KIST 이관희 교수 ARISE Lab의 연구 성과, 수상, 언론 보도, 채용 및 연구실 행사 소식을 전합니다.' },
    en: { title: 'News | ARISE Lab', description: 'Read the latest ARISE Lab research achievements, awards, media coverage, recruitment updates, and lab events.' },
    zh: { title: '研究室动态 | ARISE Lab', description: '了解ARISE Lab最新研究成果、获奖、媒体报道、招聘信息及研究室活动。' },
    ja: { title: '研究室ニュース | ARISE Lab', description: 'ARISE Labの最新研究成果、受賞、メディア掲載、採用情報、研究室イベントをお知らせします。' },
  },
  contact: {
    ko: { title: '연락처·대학원 지원 | KIST 이관희 교수 ARISE Lab', description: 'ARISE Lab 연구실 위치, 이관희 교수 이메일과 대학원 지원 문의 방법을 안내합니다. KIST L3연구동 3551호에 위치합니다.' },
    en: { title: 'Contact & Graduate Admission | ARISE Lab', description: 'Find ARISE Lab contact details, location at KIST L3 Building Room 3551, and graduate admission inquiry information.' },
    zh: { title: '联系方式与研究生申请 | ARISE Lab', description: '查看ARISE Lab联系方式、KIST L3研究楼3551室位置及研究生申请咨询信息。' },
    ja: { title: 'お問い合わせ・大学院進学 | ARISE Lab', description: 'ARISE Labの連絡先、KIST L3研究棟3551号室へのアクセス、大学院進学のお問い合わせ情報をご案内します。' },
  },
}

export function usePageSeo(page: SeoPage) {
  const { locale } = useI18n()
  const seo = computed(() => seoContent[page][(locale.value as SeoLocale) || 'ko'] || seoContent[page].ko)

  useSeoMeta({
    title: () => seo.value.title,
    description: () => seo.value.description,
    ogTitle: () => seo.value.title,
    ogDescription: () => seo.value.description,
    twitterTitle: () => seo.value.title,
    twitterDescription: () => seo.value.description,
  })
}
