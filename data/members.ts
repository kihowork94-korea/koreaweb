import type { LabMember } from '~/types/lab'

export const members: LabMember[] = [

  // ════════════════════════════════════════════
  // 교수
  // ════════════════════════════════════════════
  {
    id: 1,
    name: {
      ko: '이관희',
      en: 'Kwan Hyi Lee',
      zh: '李冠熙',
      ja: 'イ・グァンヒ',
    },
    role: 'professor',
    imageUrl: '/images/members/professor-lee.jpg',
    email: 'kwanhyi@kist.re.kr',

    bio: {
      ko: 'KIST 생체분자인식연구센터 센터장 / KU-KIST 융합대학원 교수',
      en: 'Director, Center for Advanced Biomolecular Recognition, KIST / Professor, KU-KIST Graduate School',
      zh: 'KIST生体分子识别研究中心主任 / KU-KIST融合研究生院教授',
      ja: 'KIST生体分子認識研究センター長 / KU-KIST融合大学院教授',
    },
    description: {
      ko: 'KIST 생체분자인식연구센터 센터장 및 KU-KIST 융합대학원 교수로 재직 중. 나노기술 기반 바이오센서를 이용한 병원체(바이러스·세균) 및 암·감염병 진단 연구를 수행하고 있습니다.\n\n재료과학, 화학, 물리, 생물학, 생체의공학을 융합하여 암, 줄기세포, 병리학, 공중보건 분야의 임상 문제를 해결하는 데 중점을 둡니다.',
      en: 'Director of the Center for Advanced Biomolecular Recognition at KIST and Professor at KU-KIST Graduate School of Converging Science and Technology, Korea University.\n\nResearch explores various tools of nanotechnology to employ them in biomedical applications for monitoring pathogens and human diseases. Applies concepts from material science, chemistry, physics, biology and biomedical engineering to address clinical questions in cancer, stem cell, pathology, and public health research.',
      zh: '担任KIST生体分子识别研究中心主任及KU-KIST融合研究生院教授。利用纳米技术开发生物传感器，用于病原体监测及癌症/感染病早期诊断研究，融合材料科学、化学、物理、生物学与生物医学工程解决临床问题。',
      ja: 'KIST生体分子認識研究センター長、KU-KIST融合大学院教授。ナノ技術をベースとしたバイオセンサーで病原体・癌・感染症の診断研究を推進。材料科学・化学・物理・生物学・生体医工学を融合し、癌・幹細胞・病理・公衆衛生の臨床課題に取り組む。',
    },

    researchInterests: [
      { ko: '나노바이오센서', en: 'Nano-Biosensors', zh: '纳米生物传感器', ja: 'ナノバイオセンサー' },
      { ko: '암 진단', en: 'Cancer Diagnostics', zh: '癌症诊断', ja: 'がん診断' },
      { ko: '감염병 진단', en: 'Infectious Disease Diagnostics', zh: '传染病诊断', ja: '感染症診断' },
      { ko: '바이오마커 검출', en: 'Biomarker Detection', zh: '生物标志物检测', ja: 'バイオマーカー検出' },
      { ko: '트랜지스터 바이오센서', en: 'Transistor Biosensors', zh: '晶体管生物传感器', ja: 'トランジスタバイオセンサー' },
    ],

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
        major: { ko: '재료공학', en: 'Materials Science and Engineering', zh: '材料工程', ja: '材料工学' },
        institution: { ko: '연세대학교', en: 'Yonsei University', zh: '延世大学', ja: '延世大学校' },
        year: 1996,
      },
    ],

    publicationIds: [],

    achievements: [
      {
        year: 2022,
        title: { ko: 'KIST 우수연구팀상', en: 'KIST Outstanding Research Team Award', zh: 'KIST优秀研究团队奖', ja: 'KIST優秀研究チーム賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
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
        year: 2015,
        title: { ko: 'UST 우수연구지도상', en: 'UST Outstanding Research Adviser Award', zh: 'UST优秀研究指导奖', ja: 'UST優秀研究指導賞' },
        organizer: { ko: 'UST', en: 'UST', zh: 'UST', ja: 'UST' },
      },
      {
        year: 2014,
        title: { ko: 'KIST 창립 49주년 우수연구상', en: 'KIST 49th Anniversary Excellence Research Award', zh: 'KIST创立49周年优秀研究奖', ja: 'KIST創立49周年優秀研究賞' },
        organizer: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
      },
    ],

    email: 'kwanhyi@kist.re.kr',
    homepage: '',
    googleScholar: '',
    researchgate: '',
    orcid: '',
    cvUrl: '',
  },

  // ════════════════════════════════════════════
  // 박사후연구원
  // ════════════════════════════════════════════
  {
    id: 2,
    name: {
      ko: '박성욱',
      en: 'Sungwook Park',
      zh: '朴成旭',
      ja: 'パク・ソンウク',
    },
    role: 'postdoc',
    imageUrl: '/images/members/임시_swpark.jpg',
    email: 'swpark@kist.re.kr',

    bio: {
      ko: '세종과학펠로우 & NRF 박사후연구원 (Post-Doc)',
      en: 'Sejong Post-Doc Fellow & NRF Fellow, Post-Doctoral Researcher',
      zh: '世宗科学研究员 & NRF博士后研究员',
      ja: 'セジョン科学フェロー & NRF博士後研究員',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工学博士', ja: '工学博士' },
        major: { ko: '생체의공학', en: 'Biomedical Engineering', zh: '生物医学工程', ja: '生体医工学' },
        institution: { ko: 'UST KIST School', en: 'UST KIST School, Seoul, Korea', zh: 'UST KIST School', ja: 'UST KIST School' },
        year: 2020,
      },
      {
        degree: { ko: '학사', en: 'B.S.', zh: '学士', ja: '学士' },
        major: { ko: '화학공학 & 생명공학', en: 'Chemical Engineering & Biotechnology', zh: '化学工程与生物技术', ja: '化学工学・バイオテクノロジー' },
        institution: { ko: '한국기술교육대학교', en: 'Tech University of Korea', zh: '韩国技术教育大学', ja: '韓国技術教育大学校' },
        year: 2014,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  // ════════════════════════════════════════════
  // 박사과정
  // ════════════════════════════════════════════
  {
    id: 3,
    name: {
      ko: '김현노',
      en: 'Hyunro Kim',
      zh: '金贤老',
      ja: 'キム・ヒョンノ',
    },
    role: 'phd',
    imageUrl: '/images/members/임시_kimhyunro.jpg',
    email: 'kimhyunro@kist.re.kr',

    bio: {
      ko: '박사과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'Ph.D. Student, KU-KIST Graduate School, Korea University',
      zh: '博士在读（KU-KIST融合研究生院，高丽大学）',
      ja: '博士課程（KU-KIST融合大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '박사과정', en: 'Ph.D. Candidate', zh: '博士在读', ja: '博士課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大学-KIST融合研究生院', ja: 'KU-KIST融合大学院、高麗大学' },
        year: 2027,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  {
    id: 4,
    name: {
      ko: '국다경',
      en: 'Da Gyeong Guk',
      zh: '鞠多景',
      ja: 'クク・ダギョン',
    },
    role: 'phd',
    imageUrl: '/images/members/임시_dagyeong.jpg',
    email: 'dagyeong@kist.re.kr',

    bio: {
      ko: '박사과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'Ph.D. Student, KU-KIST Graduate School, Korea University',
      zh: '博士在读（KU-KIST融합研究生院，高丽大学）',
      ja: '博士課程（KU-KIST融합大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '박사과정', en: 'Ph.D. Candidate', zh: '博士在读', ja: '博士課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大学-KIST融합研究生院', ja: 'KU-KIST融합大学院、高麗大学' },
        year: 2027,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  // ════════════════════════════════════════════
  // 석박통합과정
  // ════════════════════════════════════════════
  {
    id: 5,
    name: {
      ko: '박지수',
      en: 'Ji Su Park',
      zh: '朴智秀',
      ja: 'パク・ジス',
    },
    role: 'combined',
    imageUrl: '/images/members/임시_pgs1126.jpg',
    email: 'pgs1126@kist.re.kr',

    bio: {
      ko: '석박통합과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'Integrated M.S./Ph.D. Student, KU-KIST Graduate School, Korea University',
      zh: '硕博连读（KU-KIST융합研究生院，高丽大学）',
      ja: '修士・博士統合課程（KU-KIST融합大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '석박통합과정', en: 'Integrated M.S./Ph.D. Candidate', zh: '硕博连读在读', ja: '修士・博士統合課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大学-KIST融합研究生院', ja: 'KU-KIST融합大学院、高麗大学' },
        year: 2028,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  {
    id: 6,
    name: {
      ko: '박형준',
      en: 'Hyung Joon Park',
      zh: '朴亨俊',
      ja: 'パク・ヒョンジュン',
    },
    role: 'combined',
    imageUrl: '/images/members/임시_hosusu.jpg',
    email: 'hosusu@kist.re.kr',

    bio: {
      ko: '석박통합과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'Integrated M.S./Ph.D. Student, KU-KIST Graduate School, Korea University',
      zh: '硕博连读（KU-KIST融합研究生院，高丽大学）',
      ja: '修士・博士統合課程（KU-KIST融합大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '석박통합과정', en: 'Integrated M.S./Ph.D. Candidate', zh: '硕博连读在读', ja: '修士・博士統合課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大학-KIST融합研究生院', ja: 'KU-KIST融합大学院、高麗大学' },
        year: 2028,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  // ════════════════════════════════════════════
  // 석사과정
  // ════════════════════════════════════════════
  {
    id: 7,
    name: {
      ko: '하현우',
      en: 'Hyunwoo Ha',
      zh: '河贤宇',
      ja: 'ハ・ヒョンウ',
    },
    role: 'ms',
    imageUrl: '/images/members/임시_gkgusdn0904.jpg',
    email: 'gkgusdn0904@kist.re.kr',

    bio: {
      ko: '석사과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'M.S. Student, KU-KIST Graduate School, Korea University',
      zh: '硕士在读（KU-KIST融合研究生院，高丽大学）',
      ja: '修士課程（KU-KIST融합大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输入实际介绍',
      ja: '임시 - 実際の紹介を入력してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '석사과정', en: 'M.S. Candidate', zh: '硕士在读', ja: '修士課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大학-KIST융합研究生院', ja: 'KU-KIST융합大学院、高麗大学' },
        year: 2026,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  {
    id: 8,
    name: {
      ko: '정예환',
      en: 'Ye Hwan Jeong',
      zh: '郑礼桓',
      ja: 'チョン・イェファン',
    },
    role: 'ms',
    imageUrl: '/images/members/임시_1263047.jpg',
    email: '1263047@kist.re.kr',

    bio: {
      ko: '석사과정 (KU-KIST 융합대학원, 고려대학교)',
      en: 'M.S. Student, KU-KIST Graduate School, Korea University',
      zh: '硕士在读（KU-KIST融합研究生院，高丽大학）',
      ja: '修士課程（KU-KIST융합大学院、高麗大学）',
    },
    description: {
      ko: '임시 - 실제 소개 입력 필요',
      en: '임시 - Please enter actual bio',
      zh: '임시 - 请输입实际介绍',
      ja: '임시 - 実際の紹介を入力してください',
    },

    researchInterests: [
      { ko: '임시 - 연구 분야 입력 필요', en: '임시 - Research interests needed', zh: '임시', ja: '임시' },
    ],

    education: [
      {
        degree: { ko: '석사과정', en: 'M.S. Candidate', zh: '硕士在读', ja: '修士課程' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'KU-KIST 융합대학원, 고려대학교', en: 'KU-KIST Graduate School, Korea University', zh: '高丽大학-KIST융합研究生院', ja: 'KU-KIST융합大学院、高麗大学' },
        year: 2026,
      },
    ],

    publicationIds: [],
    achievements: [],
  },

  // ════════════════════════════════════════════
  // 졸업생
  // ════════════════════════════════════════════
  {
    id: 101,
    name: {
      ko: '장건혁',
      en: 'Gun Hyuk Jang',
      zh: '张建赫',
      ja: 'チャン・ゴンヒョク',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_ghjang.jpg',
    email: '',

    bio: {
      ko: '현 씨젠(Seegene Inc.) 선임연구원',
      en: 'Senior Researcher, Seegene Inc.',
      zh: '现任Seegene Inc.高级研究员',
      ja: '現Seegene Inc.上級研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工학博士', ja: '工学博士' },
        major: { ko: '생체의공학', en: 'Biomedical Engineering', zh: '生物医学工程', ja: '生体医工학' },
        institution: { ko: 'UST KIST School (한국과학기술연합대학원대학교)', en: 'Korea University of Science and Technology (UST), KIST School', zh: 'UST KIST School', ja: 'UST KIST School' },
        year: 2017,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2017,
    graduatedDegree: { ko: '박사', en: 'Ph.D.', zh: '博士', ja: '博士' },
    currentPosition: { ko: '선임연구원', en: 'Senior Researcher', zh: '高级研究员', ja: '上級研究員' },
    currentInstitution: { ko: '씨젠(Seegene Inc.)', en: 'Seegene Inc.', zh: 'Seegene Inc.', ja: 'Seegene Inc.' },
  },

  {
    id: 102,
    name: {
      ko: '전민홍',
      en: 'Minhong Jeun',
      zh: '全民洪',
      ja: 'チョン・ミンホン',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_mhjeun.jpg',
    email: '',

    bio: {
      ko: '현 부산과학기술기획평가원(BISTEP) 팀장',
      en: 'Team Leader, Busan Institute of S&T Evaluation and Planning (BISTEP)',
      zh: '现任釜山科学技术规划评价院(BISTEP)团队长',
      ja: '現釜山科学技術企画評価院(BISTEP)チーム長',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工学博士', ja: '工学博士' },
        major: { ko: '전기컴퓨터공학 (나노의학)', en: 'Electrical and Computer Engineering (Nanomedicine)', zh: '电气与计算机工程（纳米医学）', ja: '電気・コンピュータ工学（ナノメディスン）' },
        institution: { ko: '싱가포르 국립대학교 (NUS)', en: 'National University of Singapore (NUS)', zh: '新加坡国立大学(NUS)', ja: 'シンガポール国立大学(NUS)' },
        year: 2013,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2018,
    graduatedDegree: { ko: '박사후연구원 수료', en: 'Post-Doc Completed', zh: '博士后完成', ja: '博士後研究員修了' },
    currentPosition: { ko: '팀장', en: 'Team Leader', zh: '团队长', ja: 'チーム長' },
    currentInstitution: { ko: '부산과학기술기획평가원 (BISTEP)', en: 'Busan Institute of S&T Evaluation and Planning (BISTEP)', zh: '釜山科学技术规划评价院(BISTEP)', ja: '釜山科学技術企画評価院(BISTEP)' },
  },

  {
    id: 103,
    name: {
      ko: '박재호',
      en: 'Jea Ho Park',
      zh: '朴在浩',
      ja: 'パク・ジェホ',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_jhpark.jpg',
    email: '',

    bio: {
      ko: '현 삼성전자 선임연구원',
      en: 'Senior Researcher, Samsung Electronics',
      zh: '现任三星电子高级研究员',
      ja: '現サムスン電子上級研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工学博士', ja: '工学博士' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: '미국 존스홉킨스대학교', en: 'Johns Hopkins University, USA', zh: '美国约翰斯·霍普金斯大学', ja: '米国ジョンズ・ホプキンス大学' },
        year: 2018,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2018,
    graduatedDegree: { ko: '박사', en: 'Ph.D.', zh: '博士', ja: '博士' },
    currentPosition: { ko: '선임연구원', en: 'Senior Researcher', zh: '高级研究员', ja: '上級研究員' },
    currentInstitution: { ko: '삼성전자', en: 'Samsung Electronics', zh: '三星电子', ja: 'サムスン電子' },
  },

  {
    id: 104,
    name: {
      ko: '서정목',
      en: 'Jungmok Seo',
      zh: '徐正穆',
      ja: 'ソ・ジョンモク',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_jmseo.jpg',
    email: '',

    bio: {
      ko: '현 연세대학교 교수',
      en: 'Professor, Yonsei University',
      zh: '现任延世大学교授',
      ja: '現延世大学校교授',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '임시 - 학위 입력 필요', en: '임시 - Degree needed', zh: '임시', ja: '임시' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: '임시 - 기관 입력 필요', en: '임시 - Institution needed', zh: '임시', ja: '임시' },
        year: 2019,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2019,
    graduatedDegree: { ko: '선임연구원 수료', en: 'Senior Research Scientist Completed', zh: '高级研究科学家完成', ja: '上級研究科学者修了' },
    currentPosition: { ko: '교수', en: 'Professor', zh: '教授', ja: '教授' },
    currentInstitution: { ko: '연세대학교', en: 'Yonsei University', zh: '延世大学', ja: '延世大学校' },
  },

  {
    id: 105,
    name: {
      ko: '이효진',
      en: 'Hyojin Lee',
      zh: '李孝珍',
      ja: 'イ・ヒョジン',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_hjlee.jpg',
    email: '',

    bio: {
      ko: '현 KIST 선임연구원',
      en: 'Senior Researcher, KIST',
      zh: '现任KIST高级研究员',
      ja: '現KIST上級研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '공학박사', en: 'Ph.D.', zh: '工学博士', ja: '工学博士' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: '서울대학교', en: 'Seoul National University', zh: '首尔大学', ja: 'ソウル大学校' },
        year: 2018,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2018,
    graduatedDegree: { ko: '박사후연구원 수료', en: 'Post-Doc Completed', zh: '博士后完成', ja: '博士後研究員修了' },
    currentPosition: { ko: '선임연구원', en: 'Senior Researcher', zh: '高级研究员', ja: '上級研究員' },
    currentInstitution: { ko: 'KIST', en: 'KIST', zh: 'KIST', ja: 'KIST' },
  },

  {
    id: 106,
    name: {
      ko: '김승회',
      en: 'Seunghoe Kim',
      zh: '金承会',
      ja: 'キム・スンフェ',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_shkim.jpg',
    email: '',

    bio: {
      ko: '현 삼성바이오에피스 연구원',
      en: 'Researcher, Samsung Bioepis',
      zh: '现任三星Bioepis研究员',
      ja: '現サムスンバイオエピス研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '공학석사', en: 'M.S.', zh: '工学硕士', ja: '工学修士' },
        major: { ko: '화학 & 생체분자공학', en: 'Chemical & Biomolecular Engineering', zh: '化学与生物分子工程', ja: '化学・生体分子工학' },
        institution: { ko: '연세대학교', en: 'Yonsei University', zh: '延世大学', ja: '延世大学校' },
        year: 2019,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2019,
    graduatedDegree: { ko: '석사', en: 'M.S.', zh: '硕士', ja: '修士' },
    currentPosition: { ko: '연구원', en: 'Researcher', zh: '研究员', ja: '研究員' },
    currentInstitution: { ko: '삼성바이오에피스', en: 'Samsung Bioepis', zh: '三星Bioepis', ja: 'サムスンバイオエピス' },
  },

  {
    id: 107,
    name: {
      ko: '우경민',
      en: 'Kyungmin Woo',
      zh: '禹敬玟',
      ja: 'ウ・ギョンミン',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_kmwoo.jpg',
    email: '',

    bio: {
      ko: '현 삼성전자 연구원',
      en: 'Researcher, Samsung Electronics',
      zh: '现任三星电子研究员',
      ja: '現サムスン電子研究員',
    },

    researchInterests: [],
    education: [],
    publicationIds: [],
    achievements: [],

    graduatedYear: 2021,
    graduatedDegree: { ko: '임시 - 학위 입력 필요', en: '임시 - Degree needed', zh: '임시', ja: '임시' },
    currentPosition: { ko: '연구원', en: 'Researcher', zh: '研究员', ja: '研究員' },
    currentInstitution: { ko: '삼성전자', en: 'Samsung Electronics', zh: '三星电子', ja: 'サムスン電子' },
  },

  {
    id: 108,
    name: {
      ko: '김민수',
      en: 'Minsoo Kim',
      zh: '金珉洙',
      ja: 'キム・ミンス',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_mskim.jpg',
    email: '',

    bio: {
      ko: '현 롯데정밀화학 연구원',
      en: 'Researcher, Lotte Fine Chemical',
      zh: '现任乐天精密化学研究员',
      ja: '現ロッテファインケミカル研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '이학석사', en: 'M.S.', zh: '理学硕士', ja: '理学修士' },
        major: { ko: '화학', en: 'Chemistry', zh: '化学', ja: '化学' },
        institution: { ko: '한양대학교', en: 'Hanyang University', zh: '汉阳大学', ja: '漢陽大学校' },
        year: 2021,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2021,
    graduatedDegree: { ko: '석사', en: 'M.S.', zh: '硕士', ja: '修士' },
    currentPosition: { ko: '연구원', en: 'Researcher', zh: '研究员', ja: '研究員' },
    currentInstitution: { ko: '롯데정밀화학', en: 'Lotte Fine Chemical', zh: '乐天精密化学', ja: 'ロッテファインケミカル' },
  },

  {
    id: 109,
    name: {
      ko: '최재원',
      en: 'Jaewon Choi',
      zh: '崔在源',
      ja: 'チェ・ジェウォン',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_jwchoi.jpg',
    email: '',

    bio: {
      ko: '현 서울대학교 연구원',
      en: 'Researcher, Seoul National University',
      zh: '现任首尔大学研究员',
      ja: '現ソウル大学校研究員',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '이학석사', en: 'M.S.', zh: '理学硕士', ja: '理学修士' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: 'UST KIST School', en: 'UST KIST School', zh: 'UST KIST School', ja: 'UST KIST School' },
        year: 2018,
      },
      {
        degree: { ko: '학사', en: 'B.S.', zh: '学士', ja: '学士' },
        major: { ko: '임시 - 전공 입력 필요', en: '임시 - Major needed', zh: '임시', ja: '임시' },
        institution: { ko: '미국 존스홉킨스대학교', en: 'Johns Hopkins University, USA', zh: '美国约翰斯·霍普金斯大学', ja: '米国ジョンズ・ホプキンス大学' },
        year: 2016,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2018,
    graduatedDegree: { ko: '석사', en: 'M.S.', zh: '硕士', ja: '修士' },
    currentPosition: { ko: '연구원', en: 'Researcher', zh: '研究员', ja: '研究員' },
    currentInstitution: { ko: '서울대학교', en: 'Seoul National University', zh: '首尔大学', ja: 'ソウル大学校' },
  },

  {
    id: 110,
    name: {
      ko: '성태화',
      en: 'Tae Wha Seong',
      zh: '成泰和',
      ja: 'ソン・テファ',
    },
    role: 'alumni',
    imageUrl: '/images/members/임시_twseong.jpg',
    email: '',

    bio: {
      ko: '독일 하이델베르크대학교 박사과정',
      en: 'Ph.D. Student, Heidelberg University, Germany',
      zh: '德国海德堡大学博士在读',
      ja: 'ドイツ・ハイデルベルク大学博士課程',
    },

    researchInterests: [],

    education: [
      {
        degree: { ko: '박사과정', en: 'Ph.D. Candidate', zh: '博士在读', ja: '博士課程' },
        major: { ko: '생화학', en: 'Biochemistry', zh: '生物化학', ja: '生化学' },
        institution: { ko: '독일 하이델베르크대학교', en: 'Heidelberg University, Germany', zh: '德国海德堡大学', ja: 'ドイツ・ハイデルベルク大学' },
        year: 2024,
      },
      {
        degree: { ko: '학사', en: 'B.S.', zh: '学士', ja: '学士' },
        major: { ko: '생화학', en: 'Biochemistry', zh: '생화학', ja: '生化学' },
        institution: { ko: '미국 노스웨스턴대학교', en: 'Northwestern University, USA', zh: '美国西北大学', ja: '米国ノースウェスタン大学' },
        year: 2016,
      },
    ],

    publicationIds: [],
    achievements: [],

    graduatedYear: 2018,
    graduatedDegree: { ko: '연구원 수료', en: 'Researcher Completed', zh: '研究员完成', ja: '研究員修了' },
    currentPosition: { ko: '박사과정', en: 'Ph.D. Candidate', zh: '博士在读', ja: '博士課程' },
    currentInstitution: { ko: '독일 하이델베르크대학교', en: 'Heidelberg University, Germany', zh: '德국海德堡大学', ja: 'ドイツ・ハイデルベルク大학' },
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
