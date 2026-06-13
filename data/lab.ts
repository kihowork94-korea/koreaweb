import type { LabInfo, LabHistory } from '~/types/lab'

// ─────────────────────────────────────────────
// 연구실 기본 정보
// ─────────────────────────────────────────────

export const labInfo: LabInfo = {
  name: {
    ko: 'ARISE 연구실',
    en: 'ARISE Lab',
    zh: 'ARISE实验室',
    ja: 'ARISEラボ',
  },
  shortName: {
    ko: 'ARISE 연구실',
    en: 'ARISE Lab',
    zh: 'ARISE实验室',
    ja: 'ARISEラボ',
  },
  slogan: {
    ko: 'AI와 바이오센서로 암·감염병 진단의 미래를 열다',
    en: 'Advancing Cancer & Infectious Disease Diagnostics with AI and Biosensors',
    zh: '以人工智能与生物传感器，开创癌症与感染病诊断的未来',
    ja: 'AIとバイオセンサーで、がん・感染症診断の未来を切り拓く',
  },
  description: {
    ko: 'ARISE Lab은 고려대학교-KIST 융합대학원 소속으로, AI 통합 인식(AI-Integrated Recognition)과 지능형 센싱 공학(Intelligent Sensing Engineering)을 핵심 방향으로, 인공지능과 나노바이오 기술을 융합하여 암 및 감염병의 조기·정밀 진단을 실현하는 차세대 바이오 진단 연구를 수행합니다.\n\n전기화학·광학 바이오센서 설계, 딥러닝 기반 진단 알고리즘 개발, IoT 연계 실시간 모니터링 시스템 구축까지—질병 진단의 전 과정을 아우르는 융합 연구가 ARISE Lab의 정체성입니다.\n\nKIST 생체분자인식연구센터와 긴밀히 협력하며, 실험실 성과를 임상 현장에 실질적으로 적용하는 것을 목표로 합니다.',
    en: 'ARISE Lab — AI-Integrated Recognition and Intelligent Sensing Engineering — is part of the KU-KIST Graduate School of Converging Science and Technology. We pursue next-generation biodiagnostic research that fuses artificial intelligence with nanobio technology for early and accurate diagnosis of cancer and infectious diseases.\n\nTrue to our name, our work spans the full diagnostic pipeline: designing electrochemical and optical biosensors (Recognition & Sensing), developing deep learning-based diagnostic algorithms (AI-Integrated), and building IoT-integrated real-time monitoring systems (Engineering).\n\nWorking in close collaboration with the KIST Biomolecular Recognition Research Center, we are committed to translating laboratory breakthroughs into real-world clinical impact.',
    zh: 'ARISE实验室（AI集成识别与智能传感工程）隶属于高丽大学-KIST融合研究生院，以人工智能与纳米生物技术为核心，致力于实现癌症及传染病的早期精准诊断。\n\n正如实验室名称所示，我们的研究涵盖三大核心方向：电化学与光学生物传感器设计（识别与感知）、深度学习诊断算法开发（AI集成），以及物联网实时监测系统构建（工程实现）。\n\n与KIST生物分子识别研究中心密切合作，我们致力于将实验室成果转化为真实的临床应用。',
    ja: 'ARISEラボ（AI統合認識・知能センシングエンジニアリング）はKU-KIST融合大学院に所属し、人工知能とナノバイオ技術を融合させ、がんおよび感染症の早期・精密診断を実現する次世代バイオ診断研究を推進しています。\n\nその名が示すとおり、電気化学・光学バイオセンサーの設計（認識・センシング）、深層学習による診断アルゴリズムの開発（AI統合）、IoT連携リアルタイムモニタリングシステムの構築（エンジニアリング）という三つの軸で融合研究を展開しています。\n\nKIST生体分子認識研究センターと緊密に連携し、実験室の成果を臨床現場に実際に届けることを目指しています。',
  },
  university: {
    ko: 'KU-KIST 융합대학원',
    en: 'KU-KIST Graduate School of Converging Science and Technology',
    zh: '高丽大学-KIST融合研究生院',
    ja: 'KU-KIST融合大学院',
  },
  department: {
    ko: '융합대학원',
    en: 'Graduate School of Converging Science and Technology',
    zh: '融合研究生院',
    ja: '融合大学院',
  },
  established: 2018,
  logoUrl: '/images/lab/logo.png',
  heroImageUrl: '/images/lab/hero.jpg',
  location: {
    address: {
      ko: '서울특별시 성북구 화랑로 14길 5 한국과학기술연구원(KIST)',
      en: '5, Hwarang-ro 14-gil, Seongbuk-gu, Seoul, Korea Institute of Science and Technology (KIST)',
      zh: '首尔市城北区花郎路14街5号 韩国科学技术研究院(KIST)',
      ja: 'ソウル特別市城北区花郎路14街5 韓国科学技術研究院(KIST)',
    },
    building: {
      ko: 'KIST 본원',
      en: 'KIST Main Campus',
      zh: 'KIST主园区',
      ja: 'KIST本院',
    },
    room: 'L0-420',
    // 카카오맵: KIST 좌표 기반 링크
    mapUrl: 'https://map.kakao.com/link/map/한국과학기술연구원,37.6027,127.0586',
    lat: 37.6027,
    lng: 127.0586,
  },
  contact: {
    email: 'kwanhyi@kist.re.kr',
    phone: '02-958-6840',
    fax: '02-958-5308',
  },
  sns: {
    github: '',
    youtube: '',
    twitter: '',
    linkedin: '',
    researchgate: '',
  },
}

// ─────────────────────────────────────────────
// 연구실 연혁 (최신순)
// ─────────────────────────────────────────────

export const labHistory: LabHistory[] = [
  {
    year: 2026,
    month: 3,
    content: {
      ko: 'TODO: 2026년 연혁',
      en: 'TODO: 2026 history',
      zh: 'TODO: 2026年历史',
      ja: 'TODO: 2026年沿革',
    },
  },
  {
    year: 2025,
    month: 9,
    content: {
      ko: 'TODO: 2025년 연혁',
      en: 'TODO: 2025 history',
      zh: 'TODO: 2025年历史',
      ja: 'TODO: 2025年沿革',
    },
  },
  {
    year: 2024,
    month: 3,
    content: {
      ko: 'TODO: 2024년 연혁',
      en: 'TODO: 2024 history',
      zh: 'TODO: 2024年历史',
      ja: 'TODO: 2024年沿革',
    },
  },
  {
    year: 2022,
    month: 6,
    content: {
      ko: 'TODO: 2022년 연혁',
      en: 'TODO: 2022 history',
      zh: 'TODO: 2022年历史',
      ja: 'TODO: 2022年沿革',
    },
  },
  {
    year: 2018,
    month: 3,
    content: {
      ko: '연구실 설립 — 고려대학교-KIST 융합대학원',
      en: 'Lab established at KU-KIST Graduate School of Converging Science and Technology',
      zh: '实验室成立于高丽大学-KIST融合研究生院',
      ja: 'KU-KIST融合大学院にて研究室設立',
    },
  },
]
