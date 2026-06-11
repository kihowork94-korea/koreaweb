import type { LabInfo, LabHistory } from '~/types/lab'

// ─────────────────────────────────────────────
// 연구실 기본 정보
// ─────────────────────────────────────────────

export const labInfo: LabInfo = {
  name: {
    ko: '지능형 바이오 모니터링 연구실',
    en: 'Intelligent Bio-Monitoring Lab',
    zh: '智能生物监测实验室',
    ja: '知的バイオモニタリング研究室',
  },
  shortName: {
    ko: '이관희 연구실',
    en: 'Lee Kwanhee Lab',
    zh: '李冠熙实验室',
    ja: 'イ・グァンヒ研究室',
  },
  slogan: {
    ko: 'AI와 바이오센서로 암·감염병 진단의 미래를 열다',
    en: 'Advancing Cancer & Infectious Disease Diagnostics with AI and Biosensors',
    zh: '以人工智能与生物传感器，开创癌症与感染病诊断的未来',
    ja: 'AIとバイオセンサーで、がん・感染症診断の未来を切り拓く',
  },
  description: {
    ko: '지능형 바이오 모니터링 연구실은 고려대학교-KIST 융합대학원 소속으로, 인공지능과 나노바이오 기술을 융합하여 암 및 감염병을 조기 진단하는 차세대 기술을 연구합니다.\n\n전기화학·광학 바이오센서 설계부터 딥러닝 기반 진단 알고리즘 개발, IoT 연계 실시간 모니터링 시스템 구축까지 질병 진단의 전 과정을 아우르는 융합 연구를 수행합니다.\n\nKIST 생체분자인식연구센터와 긴밀히 협력하며, 실험실 성과를 임상 현장에 실질적으로 적용하는 것을 목표로 합니다.',
    en: 'The Intelligent Bio-Monitoring Lab, part of the KU-KIST Graduate School of Converging Science and Technology, conducts next-generation research that fuses artificial intelligence with nanobio technology for early diagnosis of cancer and infectious diseases.\n\nOur work spans the full pipeline of disease diagnostics: from designing electrochemical and optical biosensors, to developing deep learning-based diagnostic algorithms, to building IoT-integrated real-time monitoring systems.\n\nWorking in close collaboration with the KIST Biomolecular Recognition Research Center, we aim to translate laboratory achievements into real-world clinical applications.',
    zh: '智能生物监测实验室隶属于高丽大学-KIST融合研究生院，融合人工智能与纳米生物技术，研究癌症及传染病早期诊断的下一代技术。\n\n我们的研究涵盖疾病诊断的全流程：从电化学和光学生物传感器的设计，到基于深度学习的诊断算法开发，再到与物联网集成的实时监测系统构建。\n\n与KIST生物分子识别研究中心密切合作，致力于将实验室成果切实应用于临床实践。',
    ja: '知的バイオモニタリング研究室はKU-KIST融合大学院に所属し、人工知能とナノバイオ技術を融合させ、がんおよび感染症の早期診断に向けた次世代技術を研究しています。\n\n電気化学・光学バイオセンサーの設計から、深層学習ベースの診断アルゴリズム開発、IoT連携リアルタイムモニタリングシステムの構築まで、疾患診断の全プロセスを網羅する融合研究を行っています。\n\nKIST生体分子認識研究センターと緊密に連携し、実験室の成果を臨床現場に実際に適用することを目指しています。',
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
    email: 'kwanhyi@korea.ac.kr',
    phone: '02-958-6804',
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
