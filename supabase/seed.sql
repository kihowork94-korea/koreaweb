-- =====================================================
-- 시드 데이터
-- =====================================================

-- lab_info
INSERT INTO lab_info (id, name, short_name, slogan, university, department, established, location, contact, sns) VALUES (
  1,
  '{"ko":"지능형 바이오 모니터링 연구실","en":"Intelligent Bio-Monitoring Lab","zh":"智能生物监测实验室","ja":"知的バイオモニタリング研究室"}',
  '{"ko":"이관희 연구실","en":"Lee Kwanhee Lab","zh":"李冠熙实验室","ja":"イ・グァンヒ研究室"}',
  '{"ko":"AI와 바이오센서로 암·감염병 진단의 미래를 열다","en":"Advancing Cancer & Infectious Disease Diagnostics with AI and Biosensors","zh":"以人工智能与生物传感器，开创癌症与感染病诊断的未来","ja":"AIとバイオセンサーで、がん・感染症診断の未来を切り拓く"}',
  '{"ko":"KU-KIST 융합대학원","en":"KU-KIST Graduate School of Converging Science and Technology","zh":"高丽大学-KIST融合研究生院","ja":"KU-KIST融合大学院"}',
  '{"ko":"융합대학원","en":"Graduate School of Converging Science and Technology","zh":"融合研究生院","ja":"融合大学院"}',
  2018,
  '{"address":{"ko":"서울특별시 성북구 화랑로 14길 5 한국과학기술연구원(KIST)","en":"5, Hwarang-ro 14-gil, Seongbuk-gu, Seoul, KIST"},"building":{"ko":"KIST 본원","en":"KIST Main Campus"},"room":"L0-420","lat":37.6027,"lng":127.0586}',
  '{"email":"kwanhyi@korea.ac.kr","phone":"02-958-6804","fax":"02-958-5308"}',
  '{}'
);

-- lab_history
INSERT INTO lab_history (year, month, content) VALUES
  (2018, 3,  '{"ko":"연구실 설립 — KU-KIST 융합대학원","en":"Lab established at KU-KIST Graduate School"}'),
  (2020, 6,  '{"ko":"KIST 우수연구팀상 수상","en":"KIST Outstanding Research Team Award"}'),
  (2022, 3,  '{"ko":"한국연구재단(NRF) 다중 암 조기진단 주요과제 수주","en":"NRF Major Research Grant awarded for multi-cancer early detection"}'),
  (2024, 2,  '{"ko":"Biosensors and Bioelectronics 논문 게재","en":"Paper published in Biosensors and Bioelectronics"}'),
  (2025, 9,  '{"ko":"연구실 확장 — 신규 연구원 합류","en":"Lab expansion with new members"}');

-- members
INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements, google_scholar, orcid) VALUES (
  0,
  'professor',
  '{"ko":"이관희","en":"Kwanhee Lee","zh":"李冠熙","ja":"イ・グァンヒ"}',
  '/images/members/professor-lee.jpg',
  'kwanhyi@korea.ac.kr',
  '{"ko":"KIST 책임연구원 / UST 교수. AI 기반 바이오센서 및 암·감염병 진단 기술 연구.","en":"Principal Researcher at KIST / UST Professor. Research on AI-based biosensors and cancer/infectious disease diagnostics.","zh":"KIST首席研究员/UST教授。研究方向为AI生物传感器及癌症/传染病诊断。","ja":"KIST主任研究員/UST教授。AIバイオセンサーとがん・感染症診断技術を研究。"}',
  '{"ko":"이관희 교수는 KIST 생체분자인식연구센터 센터장이자 UST 교수로, 인공지능과 바이오센서 기술을 결합하여 암 및 감염병을 조기 진단하는 연구를 수행하고 있습니다. 존스홉킨스대학교에서 나노바이오공학 박사학위를 취득하였으며, UIUC 및 존스홉킨스대에서 방문교수를 역임하였습니다.","en":"Prof. Kwanhee Lee serves as the Director of the Biomolecular Recognition Research Center at KIST and as a UST Professor. He received his Ph.D. in Nano-Bioengineering from Johns Hopkins University and has served as a visiting professor at UIUC and Johns Hopkins."}',
  '[{"ko":"인공지능","en":"Artificial Intelligence","zh":"人工智能","ja":"人工知能"},{"ko":"바이오센서","en":"Biosensors","zh":"生物传感器","ja":"バイオセンサー"},{"ko":"암 진단","en":"Cancer Diagnostics","zh":"癌症诊断","ja":"がん診断"},{"ko":"감염병 진단","en":"Infectious Disease Diagnostics","zh":"传染病诊断","ja":"感染症診断"}]',
  '[{"degree":{"ko":"공학박사","en":"Ph.D.","zh":"工学博士","ja":"工学博士"},"major":{"ko":"나노바이오공학","en":"Nano-Bioengineering","zh":"纳米生物工程","ja":"ナノバイオエンジニアリング"},"institution":{"ko":"미국 존스홉킨스대학교","en":"Johns Hopkins University, USA","zh":"美国约翰斯·霍普金斯大学","ja":"米国ジョンズ・ホプキンス大学"},"year":2010},{"degree":{"ko":"공학석사","en":"M.S.","zh":"工学硕士","ja":"工学修士"},"major":{"ko":"응용전기화학","en":"Applied Electrochemistry","zh":"应用电化学","ja":"応用電気化学"},"institution":{"ko":"연세대학교","en":"Yonsei University","zh":"延世大学","ja":"延世大学校"},"year":1998},{"degree":{"ko":"공학사","en":"B.S.","zh":"工学学士","ja":"工学士"},"major":{"ko":"재료공학","en":"Materials Engineering","zh":"材料工程","ja":"材料工学"},"institution":{"ko":"연세대학교","en":"Yonsei University","zh":"延世大学","ja":"延世大学校"},"year":1996}]',
  '[{"title":{"ko":"KIST 우수연구팀상","en":"KIST Outstanding Research Team Award"},"year":2024},{"title":{"ko":"한국센서학회 우수논문상","en":"Korean Sensor Society Best Paper Award"},"year":2022}]',
  '',
  ''
);

INSERT INTO members (sort_order, role, name, email, bio, research_interests, education) VALUES (
  1,
  'phd',
  '{"ko":"김지원","en":"Jiwon Kim","zh":"金智媛","ja":"キム・ジウォン"}',
  'jwkim@kist.re.kr',
  '{"ko":"딥러닝 기반 전기화학 바이오센서 신호 처리 및 암 바이오마커 검출 연구","en":"Research on deep learning-based electrochemical biosensor signal processing and cancer biomarker detection"}',
  '[{"ko":"딥러닝","en":"Deep Learning"},{"ko":"전기화학센서","en":"Electrochemical Biosensor"},{"ko":"암 바이오마커","en":"Cancer Biomarker"}]',
  '[{"degree":{"ko":"박사과정","en":"Ph.D. Candidate"},"major":{"ko":"융합과학기술","en":"Convergence Science and Technology"},"institution":{"ko":"KU-KIST 융합대학원","en":"KU-KIST Graduate School"},"year":2027},{"degree":{"ko":"학사","en":"B.S."},"major":{"ko":"전기전자공학","en":"Electrical Engineering"},"institution":{"ko":"서울대학교","en":"Seoul National University"},"year":2022}]'
);

INSERT INTO members (sort_order, role, name, email, bio, research_interests, education) VALUES (
  2,
  'ms',
  '{"ko":"박민준","en":"Minjun Park","zh":"朴珉俊","ja":"パク・ミンジュン"}',
  'mjpark@kist.re.kr',
  '{"ko":"광학 바이오센서 및 CRISPR 기반 감염병 현장진단 연구","en":"Research on optical biosensors and CRISPR-based point-of-care infectious disease diagnosis"}',
  '[{"ko":"광학센서","en":"Optical Biosensor"},{"ko":"CRISPR 진단","en":"CRISPR Diagnostics"},{"ko":"현장진단","en":"Point-of-Care"}]',
  '[{"degree":{"ko":"석사과정","en":"M.S. Candidate"},"major":{"ko":"융합과학기술","en":"Convergence Science and Technology"},"institution":{"ko":"KU-KIST 융합대학원","en":"KU-KIST Graduate School"},"year":2026},{"degree":{"ko":"학사","en":"B.S."},"major":{"ko":"화학생명공학","en":"Chemical and Biomolecular Engineering"},"institution":{"ko":"카이스트","en":"KAIST"},"year":2024}]'
);

INSERT INTO members (sort_order, role, name, bio, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  100,
  'alumni',
  '{"ko":"이서연","en":"Seoyeon Lee","zh":"李书妍","ja":"イ・ソヨン"}',
  '{"ko":"박사 졸업 후 삼성전자 종합기술원 선임연구원으로 재직 중","en":"Currently Senior Researcher at Samsung Advanced Institute of Technology after PhD"}',
  2024,
  '{"ko":"박사","en":"Ph.D.","zh":"博士","ja":"博士"}',
  '{"ko":"선임연구원","en":"Senior Researcher","zh":"高级研究员","ja":"上級研究員"}',
  '{"ko":"삼성전자 종합기술원(SAIT)","en":"Samsung Advanced Institute of Technology (SAIT)","zh":"三星电子综合技术院","ja":"サムスン電子総合技術院"}'
);

-- research_areas
INSERT INTO research_areas (sort_order, title, description, keywords, icon_name, image_url) VALUES
(
  1,
  '{"ko":"인공지능 기반 진단","en":"AI-Based Diagnostics","zh":"基于人工智能的诊断","ja":"AIベース診断"}',
  '{"ko":"딥러닝 및 머신러닝 알고리즘을 활용하여 암과 감염병을 조기에 정확하게 진단하는 인공지능 시스템을 개발합니다. 대규모 생체 데이터 분석을 통해 높은 민감도와 특이도를 갖는 진단 모델을 구현합니다.","en":"We develop AI systems using deep learning and machine learning algorithms for early and accurate diagnosis of cancer and infectious diseases. High-sensitivity and high-specificity diagnostic models are built through large-scale biodata analysis.","zh":"利用深度学习和机器学习算法开发人工智能系统，实现癌症和传染病的早期准确诊断。通过大规模生物数据分析构建具有高灵敏度和特异性的诊断模型。","ja":"深層学習・機械学習アルゴリズムを活用し、がんおよび感染症の早期かつ正確な診断を行うAIシステムを開発します。大規模な生体データ分析を通じて高感度・高特異度の診断モデルを構築します。"}',
  '[{"ko":"딥러닝","en":"Deep Learning","zh":"深度学习","ja":"深層学習"},{"ko":"머신러닝","en":"Machine Learning","zh":"机器学习","ja":"機械学習"},{"ko":"암 조기 진단","en":"Early Cancer Detection","zh":"癌症早期检测","ja":"がん早期診断"},{"ko":"감염병 진단","en":"Infectious Disease Diagnosis","zh":"传染病诊断","ja":"感染症診断"},{"ko":"의료 데이터 분석","en":"Medical Data Analysis","zh":"医疗数据分析","ja":"医療データ解析"}]',
  'i-heroicons-cpu-chip',
  '/images/research/ai-diagnostics.jpg'
),
(
  2,
  '{"ko":"바이오센서 기술","en":"Biosensor Technology","zh":"生物传感器技术","ja":"バイオセンサー技術"}',
  '{"ko":"나노바이오 기술을 기반으로 고감도 바이오센서를 설계·제작합니다. 전기화학적 및 광학적 신호 변환 원리를 적용하여 소량의 시료에서도 목표 바이오마커를 신속하고 정밀하게 검출합니다.","en":"We design and fabricate high-sensitivity biosensors based on nanobio technology. Electrochemical and optical signal transduction principles are applied to rapidly and precisely detect target biomarkers from minimal sample volumes.","zh":"基于纳米生物技术设计并制备高灵敏度生物传感器。应用电化学和光学信号转换原理，从微量样本中快速精准地检测目标生物标志物。","ja":"ナノバイオ技術をベースに高感度バイオセンサーを設計・製作します。電気化学的・光学的な信号変換原理を適用し、微量サンプルからターゲットバイオマーカーを迅速かつ精密に検出します。"}',
  '[{"ko":"나노바이오공학","en":"Nano-Bioengineering","zh":"纳米生物工程","ja":"ナノバイオエンジニアリング"},{"ko":"전기화학센서","en":"Electrochemical Sensor","zh":"电化学传感器","ja":"電気化学センサー"},{"ko":"광학센서","en":"Optical Sensor","zh":"光学传感器","ja":"光学センサー"},{"ko":"바이오마커 검출","en":"Biomarker Detection","zh":"生物标志物检测","ja":"バイオマーカー検出"},{"ko":"현장진단(POC)","en":"Point-of-Care (POC)","zh":"即时诊断(POC)","ja":"ポイントオブケア(POC)"}]',
  'i-heroicons-beaker',
  '/images/research/biosensor.jpg'
),
(
  3,
  '{"ko":"지능형 바이오 모니터링","en":"Intelligent Bio-Monitoring","zh":"智能生物监测","ja":"知的バイオモニタリング"}',
  '{"ko":"바이오센서와 IoT, 클라우드 플랫폼을 연계한 실시간 생체 모니터링 시스템을 구축합니다. 연속적인 생체 신호 수집과 AI 분석을 통해 질병 상태를 선제적으로 감지하고 예방합니다.","en":"We build real-time bio-monitoring systems that integrate biosensors with IoT and cloud platforms. Continuous biosignal acquisition combined with AI analysis enables proactive detection and prevention of disease states.","zh":"构建将生物传感器与物联网和云平台相结合的实时生物监测系统。通过持续采集生物信号并进行AI分析，实现疾病状态的主动检测与预防。","ja":"バイオセンサーとIoT・クラウドプラットフォームを連携したリアルタイム生体モニタリングシステムを構築します。連続的な生体信号収集とAI解析により、疾患状態を先制的に検知・予防します。"}',
  '[{"ko":"실시간 모니터링","en":"Real-Time Monitoring","zh":"实时监测","ja":"リアルタイムモニタリング"},{"ko":"IoT 헬스케어","en":"IoT Healthcare","zh":"IoT医疗","ja":"IoTヘルスケア"},{"ko":"웨어러블 센서","en":"Wearable Sensor","zh":"可穿戴传感器","ja":"ウェアラブルセンサー"},{"ko":"생체신호 분석","en":"Biosignal Analysis","zh":"生物信号分析","ja":"生体信号解析"},{"ko":"예측 진단","en":"Predictive Diagnostics","zh":"预测诊断","ja":"予測診断"}]',
  'i-heroicons-signal',
  '/images/research/monitoring.jpg'
);

-- publications
INSERT INTO publications (type, title, authors, venue, year, month, volume, pages, doi, abstract, is_highlighted, tags, publisher) VALUES (
  'journal',
  'Deep Learning-Enhanced Electrochemical Biosensor Array for Simultaneous Detection of Multiple Cancer Biomarkers in Human Serum',
  ARRAY['Kwanhee Lee', 'Jiwon Kim', 'Sangwon Oh', 'Hyesung Choi', 'Taeyoon Kwon'],
  'Biosensors and Bioelectronics',
  2024, 2,
  'Vol. 247',
  '115932',
  '10.1016/j.bios.2023.115932',
  'Simultaneous detection of multiple cancer biomarkers from a single serum sample is critical for improving diagnostic accuracy. We present an electrochemical biosensor array integrated with a deep learning classification model enabling simultaneous detection of AFP, CEA, and PSA with detection limits of 0.02, 0.05, and 0.01 ng/mL respectively. The deep learning model achieves 96.3% classification accuracy in discriminating cancer patients from healthy controls across 248 serum samples.',
  true,
  ARRAY['biosensor', 'deep learning', 'cancer biomarker', 'electrochemical'],
  'Elsevier'
);

INSERT INTO publications (type, title, authors, venue, year, month, volume, pages, doi, abstract, is_highlighted, tags, publisher) VALUES (
  'journal',
  'Smartphone-Integrated Plasmonic Optical Sensor for Rapid Point-of-Care Diagnosis of Respiratory Pathogens Including SARS-CoV-2',
  ARRAY['Kwanhee Lee', 'Jiwon Kim', 'Minjun Park', 'Dahyun Yoon'],
  'ACS Nano',
  2023, 8,
  'Vol. 17, No. 15',
  '14903-14915',
  '10.1021/acsnano.3c03142',
  'Rapid and accurate detection of respiratory pathogens is essential for managing infectious disease outbreaks. We developed a smartphone-integrated surface plasmon resonance sensor capable of simultaneously detecting influenza A and SARS-CoV-2 within 15 minutes with sensitivities of 10 TCID50/mL and 50 copies/mL respectively. Clinical validation using 312 samples demonstrated 94.8% sensitivity and 97.2% specificity.',
  true,
  ARRAY['optical biosensor', 'COVID-19', 'point-of-care', 'plasmonic'],
  'ACS'
);

INSERT INTO publications (type, title, authors, venue, year, month, volume, pages, doi, abstract, is_highlighted, tags, publisher) VALUES (
  'journal',
  'CRISPR-Cas12a-Assisted Electrochemical Detection of Pancreatic Cancer Exosomal miRNA with Machine Learning Signal Analysis',
  ARRAY['Kwanhee Lee', 'Hyesung Choi', 'Sangwon Oh'],
  'Analytical Chemistry',
  2022, 11,
  'Vol. 94, No. 43',
  '14891-14901',
  '10.1021/acs.analchem.2c02987',
  'Exosomal miRNAs are emerging biomarkers for early-stage pancreatic cancer. We developed a CRISPR-Cas12a-based electrochemical biosensor detecting miR-196a and miR-217 with attomolar sensitivity. A random forest model trained on 192 patient samples achieved 93.8% accuracy in distinguishing pancreatic cancer from healthy controls.',
  true,
  ARRAY['CRISPR', 'cancer', 'machine learning', 'miRNA', 'electrochemical'],
  'ACS'
);

INSERT INTO publications (type, title, authors, venue, year, month, doi, abstract, is_highlighted, tags, publisher) VALUES (
  'conference',
  'Attention-Gated Graph Neural Network for Wearable Biosignal-Based Real-Time Health Status Monitoring',
  ARRAY['Kwanhee Lee', 'Minjun Park', 'Jiyeon Han'],
  '2023 45th Annual International Conference of the IEEE Engineering in Medicine and Biology Society (EMBC)',
  2023, 7,
  '10.1109/EMBC40787.2023.10340123',
  'We propose an attention-gated graph neural network for real-time health status monitoring using wearable biosensors. The model processes multi-modal physiological signals and achieves 91.2% accuracy on a benchmark dataset.',
  false,
  ARRAY['graph neural network', 'wearable', 'biosignal', 'health monitoring'],
  'IEEE'
);

INSERT INTO publications (type, title, authors, venue, year, month, patent_number, patent_country, patent_status, is_highlighted, tags) VALUES (
  'patent',
  '인공지능 기반 전기화학 바이오센서를 이용한 다중 암 바이오마커 동시 분석 방법 및 장치',
  ARRAY['Kwanhee Lee', 'Jiwon Kim'],
  '특허청',
  2023, 6,
  '10-2601234',
  'KR',
  'registered',
  false,
  ARRAY['patent', 'biosensor', 'cancer diagnostics', 'AI']
);

-- projects
INSERT INTO projects (title, description, status, start_year, funding_agency, funding_amount, member_ids, tags) VALUES (
  '{"ko":"인공지능 기반 다중 암 조기 진단 플랫폼 개발 및 임상 검증","en":"Development and Clinical Validation of AI-Based Multi-Cancer Early Detection Platform","zh":"基于AI的多癌早期诊断平台开发与临床验证","ja":"AIベース多重がん早期診断プラットフォーム開発・臨床検証"}',
  '{"ko":"나노바이오 기술과 인공지능을 융합하여 혈액 한 방울로 5종 이상의 암을 동시에 조기 진단할 수 있는 차세대 플랫폼을 개발합니다.","en":"This project develops a next-generation platform for simultaneous early detection of more than 5 cancer types from a single blood drop by integrating nanobio technology with AI."}',
  'ongoing',
  2022,
  '{"ko":"한국연구재단 (NRF)","en":"National Research Foundation of Korea (NRF)"}',
  '연 250,000천원',
  ARRAY[1, 2],
  ARRAY['AI', 'cancer diagnostics', 'biosensor', 'NRF']
);

INSERT INTO projects (title, description, status, start_year, funding_agency, funding_amount, member_ids, tags) VALUES (
  '{"ko":"IoT 연계 실시간 감염병 현장진단 시스템 개발","en":"Development of IoT-Integrated Real-Time Point-of-Care Infectious Disease Diagnosis System"}',
  '{"ko":"스마트폰과 IoT 기기를 활용한 휴대형 바이오센서 플랫폼으로 현장에서 신속한 감염병 진단이 가능한 시스템을 개발합니다.","en":"Develops a portable biosensor platform using smartphones and IoT devices for rapid point-of-care infectious disease diagnosis."}',
  'ongoing',
  2023,
  '{"ko":"정보통신기획평가원 (IITP)","en":"Institute of Information and Communications Technology Planning and Evaluation (IITP)"}',
  '연 180,000천원',
  ARRAY[1, 3],
  ARRAY['IoT', 'infectious disease', 'point-of-care', 'IITP']
);

INSERT INTO projects (title, description, status, start_year, end_year, funding_agency, funding_amount, member_ids, tags) VALUES (
  '{"ko":"웨어러블 전기화학 바이오센서를 이용한 연속 혈당·젖산 모니터링 시스템","en":"Continuous Glucose and Lactate Monitoring System Using Wearable Electrochemical Biosensors"}',
  '{"ko":"유연 전극 기반 웨어러블 전기화학 바이오센서를 제작하고 머신러닝 기반 신호 보정 알고리즘을 적용하여 운동 중 실시간 혈당·젖산 모니터링 시스템을 개발하였습니다.","en":"Developed flexible electrode-based wearable electrochemical biosensors with machine learning signal correction for real-time glucose and lactate monitoring during exercise."}',
  'completed',
  2020,
  2022,
  '{"ko":"한국과학기술연구원 (KIST)","en":"Korea Institute of Science and Technology (KIST)"}',
  '총 180,000천원',
  ARRAY[1],
  ARRAY['wearable', 'biosensor', 'glucose', 'KIST']
);

-- news
INSERT INTO news (category, date, is_pinned, title, content) VALUES (
  'recruitment',
  '2026-03-01',
  true,
  '{"ko":"2026년 석/박사 연구원 모집","en":"Recruiting MS/PhD Students for 2026","zh":"2026年招募硕士/博士研究生","ja":"2026年修士・博士課程学生募集"}',
  '{"ko":"지능형 바이오 모니터링 연구실에서 2026년 석사 및 박사 과정 연구원을 모집합니다.\n\n**모집 분야**\n- 인공지능 기반 바이오센서\n- 나노바이오 전기화학\n- IoT 헬스케어 시스템\n\n**지원 방법**\n이력서 및 연구계획서를 이메일로 제출하세요: kwanhyi@korea.ac.kr","en":"We are recruiting MS and PhD students for 2026.\n\n**Research Areas**\n- AI-based biosensors\n- Nano-bio electrochemistry\n- IoT healthcare systems\n\n**How to apply**\nSend your CV and research statement to: kwanhyi@korea.ac.kr"}'
);

INSERT INTO news (category, date, is_pinned, title, content) VALUES (
  'award',
  '2024-12-15',
  false,
  '{"ko":"KIST 우수연구팀상 수상","en":"KIST Outstanding Research Team Award","zh":"荣获KIST优秀研究团队奖","ja":"KIST優秀研究チーム賞受賞"}',
  '{"ko":"이관희 교수 연구팀이 2024년도 KIST 우수연구팀상을 수상하였습니다. AI 기반 바이오센서 진단 기술 개발의 탁월한 성과를 인정받은 결과입니다.","en":"Prof. Kwanhee Lee''s research team received the 2024 KIST Outstanding Research Team Award, recognizing their outstanding achievements in AI-based biosensor diagnostic technology."}'
);

INSERT INTO news (category, date, is_pinned, title, content) VALUES (
  'press',
  '2024-02-05',
  false,
  '{"ko":"Biosensors and Bioelectronics 논문 게재","en":"Paper Published in Biosensors and Bioelectronics"}',
  '{"ko":"딥러닝 기반 다중 암 바이오마커 동시 검출 연구가 국제 저명 학술지 Biosensors and Bioelectronics (IF: 10.7)에 게재되었습니다. 전기화학 바이오센서 어레이와 딥러닝 분류 모델을 통합하여 AFP, CEA, PSA를 96.3% 정확도로 동시 검출하는 성과를 달성하였습니다.","en":"Our research on deep learning-based simultaneous multi-cancer biomarker detection has been published in Biosensors and Bioelectronics (IF: 10.7). The study integrates an electrochemical biosensor array with a deep learning classifier to achieve 96.3% accuracy for simultaneous AFP, CEA, and PSA detection."}'
);

INSERT INTO news (category, date, is_pinned, title, content) VALUES (
  'event',
  '2025-06-10',
  false,
  '{"ko":"바이오센서·AI 융합 국제 세미나 개최","en":"International Seminar on Biosensor-AI Convergence Technology"}',
  '{"ko":"본 연구실 주관으로 바이오센서와 인공지능 융합 기술에 관한 국제 세미나가 KIST 국제협력관에서 개최됩니다.\n\n**일시:** 2025년 6월 25일(수) 14:00–17:00\n**장소:** KIST 국제협력관 대회의실","en":"An international seminar on biosensor-AI convergence technology organized by our lab will be held at KIST.\n\n**Date:** Wednesday, June 25, 2025, 14:00–17:00\n**Venue:** KIST International Conference Hall"}'
);

INSERT INTO news (category, date, is_pinned, title, content) VALUES (
  'announcement',
  '2025-03-02',
  false,
  '{"ko":"2025년 신규 연구원 오리엔테이션 안내","en":"2025 New Member Orientation"}',
  '{"ko":"2025년 새로 합류한 신규 대학원생 및 연구원 여러분을 환영합니다. 연구실 오리엔테이션은 3월 5일(수) 오전 10시 KIST L0-420 연구실에서 진행됩니다.","en":"We warmly welcome all new graduate students and researchers joining in 2025. The lab orientation will be held on Wednesday, March 5 at 10:00 AM in KIST L0-420."}'
);
