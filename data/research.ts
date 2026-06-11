import type { ResearchArea } from '~/types/lab'

// ─────────────────────────────────────────────
// 연구 분야
// iconName: https://icones.js.org 에서 heroicons 아이콘 검색
// ─────────────────────────────────────────────

export const researchAreas: ResearchArea[] = [
  {
    id: 1,
    title: {
      ko: '인공지능 기반 진단',
      en: 'AI-Based Diagnostics',
      zh: '基于人工智能的诊断',
      ja: 'AIベース診断',
    },
    description: {
      ko: '딥러닝 및 머신러닝 알고리즘을 활용하여 암과 감염병을 조기에 정확하게 진단하는 인공지능 시스템을 개발합니다. 대규모 생체 데이터 분석을 통해 높은 민감도와 특이도를 갖는 진단 모델을 구현합니다.',
      en: 'We develop AI systems using deep learning and machine learning algorithms for early and accurate diagnosis of cancer and infectious diseases. High-sensitivity and high-specificity diagnostic models are built through large-scale biodata analysis.',
      zh: '利用深度学习和机器学习算法开发人工智能系统，实现癌症和传染病的早期准确诊断。通过大规模生物数据分析构建具有高灵敏度和特异性的诊断模型。',
      ja: '深層学習・機械学習アルゴリズムを活用し、がんおよび感染症の早期かつ正確な診断を行うAIシステムを開発します。大規模な生体データ分析を通じて高感度・高特異度の診断モデルを構築します。',
    },
    keywords: [
      { ko: '딥러닝', en: 'Deep Learning', zh: '深度学习', ja: '深層学習' },
      { ko: '머신러닝', en: 'Machine Learning', zh: '机器学习', ja: '機械学習' },
      { ko: '암 조기 진단', en: 'Early Cancer Detection', zh: '癌症早期检测', ja: 'がん早期診断' },
      { ko: '감염병 진단', en: 'Infectious Disease Diagnosis', zh: '传染病诊断', ja: '感染症診断' },
      { ko: '의료 데이터 분석', en: 'Medical Data Analysis', zh: '医疗数据分析', ja: '医療データ解析' },
    ],
    iconName: 'i-heroicons-cpu-chip',
    imageUrl: '/images/research/ai-diagnostics.jpg',
  },
  {
    id: 2,
    title: {
      ko: '바이오센서 기술',
      en: 'Biosensor Technology',
      zh: '生物传感器技术',
      ja: 'バイオセンサー技術',
    },
    description: {
      ko: '나노바이오 기술을 기반으로 고감도 바이오센서를 설계·제작합니다. 전기화학적 및 광학적 신호 변환 원리를 적용하여 소량의 시료에서도 목표 바이오마커를 신속하고 정밀하게 검출합니다.',
      en: 'We design and fabricate high-sensitivity biosensors based on nanobio technology. Electrochemical and optical signal transduction principles are applied to rapidly and precisely detect target biomarkers from minimal sample volumes.',
      zh: '基于纳米生物技术设计并制备高灵敏度生物传感器。应用电化学和光学信号转换原理，从微量样本中快速精准地检测目标生物标志物。',
      ja: 'ナノバイオ技術をベースに高感度バイオセンサーを設計・製作します。電気化学的・光学的な信号変換原理を適用し、微量サンプルからターゲットバイオマーカーを迅速かつ精密に検出します。',
    },
    keywords: [
      { ko: '나노바이오공학', en: 'Nano-Bioengineering', zh: '纳米生物工程', ja: 'ナノバイオエンジニアリング' },
      { ko: '전기화학센서', en: 'Electrochemical Sensor', zh: '电化学传感器', ja: '電気化学センサー' },
      { ko: '광학센서', en: 'Optical Sensor', zh: '光学传感器', ja: '光学センサー' },
      { ko: '바이오마커 검출', en: 'Biomarker Detection', zh: '生物标志物检测', ja: 'バイオマーカー検出' },
      { ko: '현장진단(POC)', en: 'Point-of-Care (POC)', zh: '即时诊断(POC)', ja: 'ポイントオブケア(POC)' },
    ],
    iconName: 'i-heroicons-beaker',
    imageUrl: '/images/research/biosensor.jpg',
  },
  {
    id: 3,
    title: {
      ko: '지능형 바이오 모니터링',
      en: 'Intelligent Bio-Monitoring',
      zh: '智能生物监测',
      ja: '知的バイオモニタリング',
    },
    description: {
      ko: '바이오센서와 IoT, 클라우드 플랫폼을 연계한 실시간 생체 모니터링 시스템을 구축합니다. 연속적인 생체 신호 수집과 AI 분석을 통해 질병 상태를 선제적으로 감지하고 예방합니다.',
      en: 'We build real-time bio-monitoring systems that integrate biosensors with IoT and cloud platforms. Continuous biosignal acquisition combined with AI analysis enables proactive detection and prevention of disease states.',
      zh: '构建将生物传感器与物联网和云平台相结合的实时生物监测系统。通过持续采集生物信号并进行AI分析，实现疾病状态的主动检测与预防。',
      ja: 'バイオセンサーとIoT・クラウドプラットフォームを連携したリアルタイム生体モニタリングシステムを構築します。連続的な生体信号収集とAI解析により、疾患状態を先制的に検知・予防します。',
    },
    keywords: [
      { ko: '실시간 모니터링', en: 'Real-Time Monitoring', zh: '实时监测', ja: 'リアルタイムモニタリング' },
      { ko: 'IoT 헬스케어', en: 'IoT Healthcare', zh: 'IoT医疗', ja: 'IoTヘルスケア' },
      { ko: '웨어러블 센서', en: 'Wearable Sensor', zh: '可穿戴传感器', ja: 'ウェアラブルセンサー' },
      { ko: '생체신호 분석', en: 'Biosignal Analysis', zh: '生物信号分析', ja: '生体信号解析' },
      { ko: '예측 진단', en: 'Predictive Diagnostics', zh: '预测诊断', ja: '予測診断' },
    ],
    iconName: 'i-heroicons-signal',
    imageUrl: '/images/research/monitoring.jpg',
  },
]
