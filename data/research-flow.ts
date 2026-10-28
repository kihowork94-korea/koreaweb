const text = (ko: string, en: string, zh: string, ja: string) => ({ ko, en, zh, ja })
export const researchSlogan = text('생체신호를 읽고, 근거를 설명하고, 임상으로 잇다', 'Read biosignals. Explain the evidence. Connect to clinical care.', '解读生物信号，解释诊断依据，连接临床实践', '生体信号を読み、根拠を説明し、臨床へつなぐ')
export const researchFlow = [
  {
    id: 'discover', label: '01 DISCOVER', iconName: 'i-heroicons-beaker',
    title: text('멀티오믹스 바이오마커 발굴', 'Multi-omics Biomarker Discovery', '多组学生物标志物发现', 'マルチオミクスによるバイオマーカー探索'),
    lines: text('멀티오믹스|바이오마커 발굴', 'Multi-omics|Biomarker Discovery', '多组学|生物标志物发现', 'マルチオミクス|バイオマーカー探索'),
    description: text('노화·근감소/악액질, 암, 감염 질환의 멀티오믹스 데이터에서 진단 표적을 찾고, 센서로 측정 가능한 형태로 정의합니다.', 'We identify diagnostic targets in multi-omics data for aging, sarcopenia/cachexia, cancer, and infectious diseases, and define them in forms measurable by sensors.', '从衰老、肌少症/恶病质、癌症和感染性疾病的多组学数据中寻找诊断靶标，并将其定义为传感器可测量的形式。', '老化・サルコペニア／悪液質、がん、感染症のマルチオミクスデータから診断標的を見いだし、センサーで測定できる形に定義します。'),
    keywords: [text('멀티오믹스', 'Multi-omics', '多组学', 'マルチオミクス'), text('마이오카인', 'Myokine', '肌肉因子', 'マイオカイン'), text('Secretome', 'Secretome', '分泌组', 'セクレトーム')],
  },
  {
    id: 'sense', label: '02 SENSE', iconName: 'i-heroicons-signal',
    title: text('지능형 바이오센싱 플랫폼', 'Intelligent Biosensing Platforms', '智能生物传感平台', 'インテリジェント・バイオセンシング基盤'),
    lines: text('지능형|바이오센싱', 'Intelligent|Biosensing', '智能|生物传感', '知能型|バイオセンシング'),
    description: text('반도체(EG-FET)·전기화학·나노입자 기반 센싱 플랫폼을 개발합니다. 분자인식 소재와 신호변환 계면을 설계해 다양한 생체 표적을 고감도·고선택적으로 검출합니다.', 'We develop semiconductor (EG-FET), electrochemical, and nanoparticle-based sensing platforms. Molecular recognition materials and signal transduction interfaces enable highly sensitive and selective detection of diverse biological targets.', '开发基于半导体（EG-FET）、电化学和纳米颗粒的传感平台，设计分子识别材料与信号转换界面，实现对多种生物靶标的高灵敏度、高选择性检测。', '半導体（EG-FET）・電気化学・ナノ粒子を用いたセンシング基盤を開発します。分子認識材料と信号変換界面を設計し、多様な生体標的を高感度・高選択的に検出します。'),
    keywords: [text('EG-FET', 'EG-FET', 'EG-FET', 'EG-FET'), text('전기화학센서', 'Electrochemical Sensors', '电化学传感器', '電気化学センサー'), text('나노입자 센서', 'Nanoparticle Sensors', '纳米颗粒传感器', 'ナノ粒子センサー')],
  },
  {
    id: 'explain', label: '03 EXPLAIN', iconName: 'i-heroicons-cpu-chip',
    title: text('신뢰할 수 있는 의료 AI', 'Trustworthy Medical AI', '可信赖的医疗人工智能', '信頼できる医療AI'),
    lines: text('신뢰할 수 있는|의료 AI', 'Trustworthy|Medical AI', '可信赖的|医疗人工智能', '信頼できる|医療AI'),
    description: text('설명가능 인공지능(XAI)으로 진단 근거를 의료진이 이해할 수 있게 제시하고, 연합학습(Federated Learning)으로 환자 데이터를 반출하지 않고도 여러 기관이 함께 모델을 학습합니다.', 'Explainable AI (XAI) presents diagnostic evidence in a form clinicians can understand, while federated learning enables institutions to train models collaboratively without transferring patient data.', '通过可解释人工智能（XAI），以医务人员能够理解的方式呈现诊断依据；通过联邦学习，多家机构无需传出患者数据即可共同训练模型。', '説明可能AI（XAI）で診断の根拠を医療従事者が理解できる形で示し、連合学習により患者データを持ち出さずに複数機関が共同でモデルを学習します。'),
    keywords: [text('설명가능 AI (XAI)', 'Explainable AI (XAI)', '可解释人工智能（XAI）', '説明可能AI（XAI）'), text('연합학습', 'Federated Learning', '联邦学习', '連合学習'), text('위험도 예측', 'Risk Prediction', '风险预测', 'リスク予測')],
  },
  {
    id: 'translate', label: '04 TRANSLATE', iconName: 'i-heroicons-heart',
    title: text('임상 중개, 병원에서 가정까지', 'Clinical Translation, from Hospital to Home', '临床转化，从医院到家庭', '臨床への橋渡し、病院から家庭まで'),
    description: text('응급실의 신속 분류에서 AI 특화 병동, HOME 병동, 재난 현장까지 — 의료 현장 어디서든 끊김 없이 이어지는 지능형 진단·모니터링을 구현합니다.', 'From rapid triage in emergency departments to AI-enabled wards, HOME wards, and disaster sites, we deliver seamless intelligent diagnostics and monitoring across healthcare settings.', '从急诊快速分诊到人工智能病房、HOME居家病房及灾难现场，实现贯通各类医疗场景的智能诊断与监测。', '救急での迅速なトリアージからAI特化病棟、HOME病棟、災害現場まで、あらゆる医療現場を切れ目なくつなぐ知能型診断・モニタリングを実現します。'),
  },
]
export const clinicalApplications = [
  { icon: 'emergency', ko: '응급실 신속진단', en: 'Emergency Diagnostics', zh: '急诊快速诊断', ja: '救急迅速診断' },
  { icon: 'local_hospital', ko: 'AI 특화병동', en: 'AI-Enabled Ward', zh: '人工智能病房', ja: 'AI特化病棟' },
  { icon: 'home', ko: 'HOME 병동', en: 'HOME Ward', zh: 'HOME居家病房', ja: 'HOME病棟' },
  { icon: 'health_and_safety', ko: '재난의료 현장', en: 'Disaster Medicine', zh: '灾难医疗现场', ja: '災害医療現場' },
]
