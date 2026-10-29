const localized = (ko: string, en: string, zh: string, ja: string) => ({ ko, en, zh, ja })

export const memberResearch: Record<string, ReturnType<typeof localized>[]> = {
  '정예환': [localized('인공지능 기반 진단·감별', 'AI-based Diagnosis and Differential Diagnosis', '人工智能诊断与鉴别诊断', 'AIによる診断・鑑別診断')],
  '최기호': [localized('바이오센서·의료 AI 융합 및 연속 모니터링', 'Biosensor–Medical AI Integration and Continuous Monitoring', '生物传感器与医疗AI融合及连续监测', 'バイオセンサー・医療AI融合と連続モニタリング')],
  '박성욱': [localized('바이오센서·의료 AI 융합 정밀진단', 'Precision Diagnostics through Biosensor–Medical AI Integration', '生物传感器与医疗AI融合精准诊断', 'バイオセンサー・医療AI融合による精密診断')],
  '김현노': [localized('지능형 바이오센서', 'Intelligent Biosensors', '智能生物传感器', '知能型バイオセンサー')],
  '하현우': [localized('바이오센서 데이터 기반 생체분자 분석 기술', 'Biosensor Data-driven Biomolecular Analysis', '基于生物传感器数据的生物分子分析技术', 'バイオセンサーデータに基づく生体分子分析技術')],
  '국다경': [localized('바이오센서 기반 생체분자 분석', 'Biosensor-based Biomolecular Analysis', '基于生物传感器的生物分子分析', 'バイオセンサーによる生体分子分析')],
  '박지수': [localized('바이오마커 기반 진단 기술', 'Biomarker-based Diagnostic Technologies', '基于生物标志物的诊断技术', 'バイオマーカーに基づく診断技術')],
  '박형준': [localized('바이오센서 · CRISPR · 머신러닝', 'Biosensors · CRISPR · Machine Learning', '生物传感器 · CRISPR · 机器学习', 'バイオセンサー · CRISPR · 機械学習')],
}
