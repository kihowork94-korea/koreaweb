import type { LabMember } from '~/types/lab'

// ─────────────────────────────────────────────
// 구성원 목록
//
// role 표시 순서:
//   professor > postdoc > phd > combined > ms > undergraduate > alumni
//
// publicationIds: publications.ts의 id와 연결됩니다.
//   예) publicationIds: [1, 3, 5] → 해당 id의 논문이 프로필에 표시됨
// ─────────────────────────────────────────────

export const members: LabMember[] = [

  // ════════════════════════════════════════════
  // 교수
  // ════════════════════════════════════════════
  {
    id: 1,
    name: {
      ko: '이관희',
      en: 'Kwanhee Lee',
      zh: '李冠熙',
      ja: 'イ・グァンヒ',
    },
    role: 'professor',
    imageUrl: '/images/members/professor-lee.jpg',
    email: 'kwanhyi@korea.ac.kr',

    bio: {
      ko: 'KIST 책임연구원 / UST 교수. 인공지능 기반 바이오센서 및 암·감염병 진단 기술을 연구합니다.',
      en: 'Principal Researcher at KIST / UST Professor. Research focuses on AI-based biosensors and cancer/infectious disease diagnostics.',
      zh: 'KIST首席研究员 / UST教授。研究方向为基于人工智能的生物传感器及癌症/传染病诊断技术。',
      ja: 'KIST主任研究員 / UST教授。AIベースのバイオセンサーおよびがん・感染症診断技術を研究。',
    },
    description: {
      ko: '이관희 교수는 KIST 생체분자인식연구센터 센터장이자 UST 교수로, 인공지능과 바이오센서 기술을 결합하여 암 및 감염병을 조기 진단하는 연구를 수행하고 있습니다.\n\n존스홉킨스대학교에서 나노바이오공학 박사학위를 취득하였으며, UIUC 및 존스홉킨스대에서 방문교수를 역임하였습니다. MIT Technology Review 글로벌패널 위원, 과학기술정보통신부 전문위원 등 다수의 학술·정책 활동을 병행하고 있습니다.',
      en: 'Prof. Kwanhee Lee serves as the Director of the Biomolecular Recognition Research Center at KIST and as a Professor at UST. His research combines artificial intelligence with biosensor technology to enable early diagnosis of cancer and infectious diseases.\n\nHe received his Ph.D. in Nano-Bioengineering from Johns Hopkins University and has served as a visiting professor at both UIUC and Johns Hopkins. He is a member of the MIT Technology Review Global Panel and serves as a specialist advisor to the Ministry of Science and ICT.',
      zh: '이관희教授担任KIST生物分子识别研究中心主任及UST教授，将人工智能与生物传感器技术相结合，开展癌症及传染病早期诊断研究。\n\n他在约翰斯·霍普金斯大学获得纳米生物工程博士学位，曾担任UIUC和约翰斯·霍普金斯大学访问教授，同时担任MIT技术评论全球专家组成员及韩国科学技术信息通信部专门委员。',
      ja: '이관희教授はKIST生体分子認識研究センター長およびUST教授を務め、人工知能とバイオセンサー技術を組み合わせたがんおよび感染症の早期診断研究を行っています。\n\nジョンズ・ホプキンス大学でナノバイオエンジニアリング博士号を取得し、UIUCおよびジョンズ・ホプキンス大学で訪問教授を歴任。MITテクノロジーレビューのグローバルパネル委員、科学技術情報通信部の専門委員を務めています。',
    },

    researchInterests: [
      { ko: '인공지능', en: 'Artificial Intelligence', zh: '人工智能', ja: '人工知能' },
      { ko: '바이오센서', en: 'Biosensors', zh: '生物传感器', ja: 'バイオセンサー' },
      { ko: '암 진단', en: 'Cancer Diagnostics', zh: '癌症诊断', ja: 'がん診断' },
      { ko: '감염병 진단', en: 'Infectious Disease Diagnostics', zh: '传染病诊断', ja: '感染症診断' },
      { ko: '지능형 바이오 모니터링', en: 'Intelligent Bio-Monitoring', zh: '智能生物监测', ja: '知的バイオモニタリング' },
    ],
    researchDescription: {
      ko: '인공지능 기반 바이오센서 개발과 암·감염병 조기 진단 시스템 구축을 핵심 연구 주제로 삼고 있습니다.',
      en: 'Core research themes include AI-based biosensor development and early diagnostic systems for cancer and infectious diseases.',
      zh: '核心研究方向包括基于人工智能的生物传感器开发以及癌症和传染病早期诊断系统的构建。',
      ja: 'AIベースのバイオセンサー開発とがん・感染症の早期診断システム構築を中心的な研究テーマとしています。',
    },

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工学博士', ja: '工学博士' },
        major: { ko: '나노바이오공학', en: 'Nano-Bioengineering', zh: '纳米生物工程', ja: 'ナノバイオエンジニアリング' },
        institution: { ko: '미국 존스홉킨스대학교', en: 'Johns Hopkins University, USA', zh: '美国约翰斯·霍普金斯大学', ja: '米国ジョンズ・ホプキンス大学' },
        year: 2010,
      },
      {
        degree: { ko: '공학석사', en: 'M.S.', zh: '工学硕士', ja: '工学修士' },
        major: { ko: '응용전기화학', en: 'Applied Electrochemistry', zh: '应用电化学', ja: '応用電気化学' },
        institution: { ko: '연세대학교', en: 'Yonsei University', zh: '延世大学', ja: '延世大学校' },
        year: 1998,
      },
      {
        degree: { ko: '공학사', en: 'B.S.', zh: '工学学士', ja: '工学士' },
        major: { ko: '재료공학', en: 'Materials Engineering', zh: '材料工程', ja: '材料工学' },
        institution: { ko: '연세대학교', en: 'Yonsei University', zh: '延世大学', ja: '延世大学校' },
        year: 1996,
      },
    ],

    publicationIds: [], // TODO: 논문 등록 후 id 연결

    achievements: [
      {
        year: 2022,
        title: { ko: 'KIST 연구개발팀상', en: 'KIST R&D Team Award', zh: 'KIST研发团队奖', ja: 'KIST研究開発チーム賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
      {
        year: 2021,
        title: { ko: '대한민국 10대 과학기술뉴스 선정 (인공지능 진단기술)', en: 'Top 10 Korean S&T News — AI Diagnostic Technology', zh: '韩国十大科技新闻（AI诊断技术）', ja: '韓国10大科学技術ニュース選定（AI診断技術）' },
        organizer: { ko: '과학기술정보통신부', en: 'Ministry of Science and ICT', zh: '科学技术信息通信部', ja: '科学技術情報通信部' },
      },
      {
        year: 2020,
        title: { ko: 'UST 최우수 교수상', en: 'UST Outstanding Professor Award', zh: 'UST最优秀教授奖', ja: 'UST最優秀教授賞' },
        organizer: { ko: 'UST', en: 'UST', zh: 'UST', ja: 'UST' },
      },
      {
        year: 2020,
        title: { ko: 'KIST 우수연구팀상', en: 'KIST Outstanding Research Team Award', zh: 'KIST优秀研究团队奖', ja: 'KIST優秀研究チーム賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
      {
        year: 2019,
        title: { ko: '대한민국 10대 과학기술뉴스 후보 (조류인플루엔자 진단기술)', en: 'Top 10 Korean S&T News Nominee — Avian Influenza Diagnostics', zh: '韩国十大科技新闻候选（禽流感诊断技术）', ja: '韓国10大科学技術ニュース候補（鳥インフルエンザ診断）' },
        organizer: { ko: '과학기술정보통신부', en: 'Ministry of Science and ICT', zh: '科学技术信息通信部', ja: '科学技術情報通信部' },
      },
      {
        year: 2017,
        title: { ko: '한국바이오칩학회 우수논문상', en: 'Korean BioChip Society Outstanding Paper Award', zh: '韩国生物芯片学会优秀论文奖', ja: '韓国バイオチップ学会 優秀論文賞' },
        organizer: { ko: '한국바이오칩학회', en: 'Korean BioChip Society', zh: '韩国生物芯片学会', ja: '韓国バイオチップ学会' },
      },
      {
        year: 2015,
        title: { ko: 'UST 우수연구지도상', en: 'UST Outstanding Research Mentoring Award', zh: 'UST优秀研究指导奖', ja: 'UST優秀研究指導賞' },
        organizer: { ko: 'UST', en: 'UST', zh: 'UST', ja: 'UST' },
      },
      {
        year: 2014,
        title: { ko: 'UST 우수논문지도상', en: 'UST Outstanding Thesis Mentoring Award', zh: 'UST优秀论文指导奖', ja: 'UST優秀論文指導賞' },
        organizer: { ko: 'UST', en: 'UST', zh: 'UST', ja: 'UST' },
      },
      {
        year: 2012,
        title: { ko: 'KIST Unsung Hero상', en: 'KIST Unsung Hero Award', zh: 'KIST无名英雄奖', ja: 'KISTアンサングヒーロー賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
      {
        year: 2012,
        title: { ko: 'KIST 우수연구팀상', en: 'KIST Outstanding Research Team Award', zh: 'KIST优秀研究团队奖', ja: 'KIST優秀研究チーム賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
      {
        year: 2010,
        title: { ko: '미국생체재료학회 STAR Award', en: 'Society for Biomaterials STAR Award', zh: '美国生物材料学会STAR奖', ja: '米国バイオマテリアル学会 STAR賞' },
        organizer: { ko: '미국생체재료학회', en: 'Society for Biomaterials', zh: '美国生物材料学会', ja: '米国バイオマテリアル学会' },
      },
      {
        year: 2009,
        title: { ko: '미국생체재료학회 STAR Award', en: 'Society for Biomaterials STAR Award', zh: '美国生物材料学会STAR奖', ja: '米国バイオマテリアル学会 STAR賞' },
        organizer: { ko: '미국생체재료학회', en: 'Society for Biomaterials', zh: '美国生物材料学会', ja: '米国バイオマテリアル学会' },
      },
      {
        year: 2002,
        title: { ko: 'KIST 우수연구팀상', en: 'KIST Outstanding Research Team Award', zh: 'KIST优秀研究团队奖', ja: 'KIST優秀研究チーム賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
    ],

    homepage: '',
    googleScholar: '',
    researchgate: '',
    orcid: '',
    cvUrl: '',
  },

  // ════════════════════════════════════════════
  // 박사과정
  // ════════════════════════════════════════════
  {
    id: 2,
    name: {
      ko: 'TODO: 이름',
      en: 'TODO: Name',
      zh: 'TODO: 姓名',
      ja: 'TODO: 名前',
    },
    role: 'phd',
    imageUrl: '/images/members/member2.jpg',
    email: 'TODO@kist.re.kr',

    bio: {
      ko: 'TODO: 한 줄 소개',
      en: 'TODO: Short bio',
      zh: 'TODO: 简介',
      ja: 'TODO: 一言紹介',
    },
    description: {
      ko: 'TODO: 상세 소개',
      en: 'TODO: Detailed bio',
      zh: 'TODO: 详细介绍',
      ja: 'TODO: 詳細紹介',
    },

    researchInterests: [
      { ko: 'TODO: 연구 분야', en: 'TODO: Research area', zh: 'TODO: 研究方向', ja: 'TODO: 研究テーマ' },
    ],
    researchDescription: {
      ko: 'TODO: 연구 내용 서술',
      en: 'TODO: Research description',
      zh: 'TODO: 研究内容描述',
      ja: 'TODO: 研究内容の説明',
    },

    education: [
      {
        degree: { ko: '박사과정', en: 'Ph.D. Candidate', zh: '博士在读', ja: '博士課程' },
        major: { ko: 'TODO: 전공', en: 'TODO: Major', zh: 'TODO: 专业', ja: 'TODO: 専攻' },
        institution: { ko: '고려대학교-KIST 융합대학원', en: 'KU-KIST Graduate School', zh: '高丽大学-KIST融合研究生院', ja: 'KU-KIST融合大学院' },
        year: 2027,
      },
      {
        degree: { ko: '학사', en: 'B.S.', zh: '学士', ja: '学士' },
        major: { ko: 'TODO: 전공', en: 'TODO: Major', zh: 'TODO: 专业', ja: 'TODO: 専攻' },
        institution: { ko: 'TODO: 대학교', en: 'TODO: University', zh: 'TODO: 大学', ja: 'TODO: 大学' },
        year: 2021,
      },
    ],

    publicationIds: [],
    achievements: [],

    github: '',
    googleScholar: '',
    orcid: '',
  },

  // ════════════════════════════════════════════
  // 석사과정
  // ════════════════════════════════════════════
  {
    id: 3,
    name: {
      ko: 'TODO: 이름',
      en: 'TODO: Name',
      zh: 'TODO: 姓名',
      ja: 'TODO: 名前',
    },
    role: 'ms',
    imageUrl: '/images/members/member3.jpg',
    email: 'TODO@kist.re.kr',

    bio: {
      ko: 'TODO: 한 줄 소개',
      en: 'TODO: Short bio',
      zh: 'TODO: 简介',
      ja: 'TODO: 一言紹介',
    },
    description: {
      ko: 'TODO: 상세 소개',
      en: 'TODO: Detailed bio',
      zh: 'TODO: 详细介绍',
      ja: 'TODO: 詳細紹介',
    },

    researchInterests: [
      { ko: 'TODO: 연구 분야', en: 'TODO: Research area', zh: 'TODO: 研究方向', ja: 'TODO: 研究テーマ' },
    ],

    education: [
      {
        degree: { ko: '석사과정', en: 'M.S. Candidate', zh: '硕士在读', ja: '修士課程' },
        major: { ko: 'TODO: 전공', en: 'TODO: Major', zh: 'TODO: 专业', ja: 'TODO: 専攻' },
        institution: { ko: '고려대학교-KIST 융합대학원', en: 'KU-KIST Graduate School', zh: '高丽大学-KIST融合研究生院', ja: 'KU-KIST融合大学院' },
        year: 2026,
      },
      {
        degree: { ko: '학사', en: 'B.S.', zh: '学士', ja: '学士' },
        major: { ko: 'TODO: 전공', en: 'TODO: Major', zh: 'TODO: 专业', ja: 'TODO: 専攻' },
        institution: { ko: 'TODO: 대학교', en: 'TODO: University', zh: 'TODO: 大学', ja: 'TODO: 大学' },
        year: 2024,
      },
    ],

    publicationIds: [],
    achievements: [],

    github: '',
  },

  // ════════════════════════════════════════════
  // 졸업생
  // ════════════════════════════════════════════
  {
    id: 100,
    name: {
      ko: 'TODO: 이름',
      en: 'TODO: Name',
      zh: 'TODO: 姓名',
      ja: 'TODO: 名前',
    },
    role: 'alumni',
    imageUrl: '/images/members/alumni1.jpg',
    email: '',

    bio: {
      ko: '',
      en: '',
      zh: '',
      ja: '',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '박사', en: 'Ph.D.', zh: '博士', ja: '博士' },
        major: { ko: 'TODO: 전공', en: 'TODO: Major', zh: 'TODO: 专业', ja: 'TODO: 専攻' },
        institution: { ko: '고려대학교-KIST 융합대학원', en: 'KU-KIST Graduate School', zh: '高丽大学-KIST融合研究生院', ja: 'KU-KIST融合大学院' },
        year: 2024,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2024,
    graduatedDegree: { ko: '박사', en: 'Ph.D.', zh: '博士', ja: '博士' },
    currentPosition: {
      ko: 'TODO: 직책 (예: 선임연구원)',
      en: 'TODO: Position (e.g., Senior Researcher)',
      zh: 'TODO: 职位',
      ja: 'TODO: 役職',
    },
    currentInstitution: {
      ko: 'TODO: 소속 기관 (예: 삼성전자 AI센터)',
      en: 'TODO: Institution (e.g., Samsung AI Center)',
      zh: 'TODO: 所属机构',
      ja: 'TODO: 所属機関',
    },
  },
]

// ─────────────────────────────────────────────
// 헬퍼 함수
// ─────────────────────────────────────────────

export const getMembersByRole = (role: LabMember['role']) =>
  members.filter(m => m.role === role)

export const currentMembers = members.filter(m => m.role !== 'alumni')

export const alumni = members.filter(m => m.role === 'alumni')

export const getMemberById = (id: number) =>
  members.find(m => m.id === id)

export const getMembersByPublicationId = (publicationId: number) =>
  members.filter(m => m.publicationIds?.includes(publicationId))
