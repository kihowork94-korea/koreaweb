-- =====================================================
-- 시드 데이터
-- =====================================================

-- lab_info
INSERT INTO lab_info (id, name, short_name, slogan, university, department, established, location, contact, sns) VALUES (
  1,
  '{"ko":"ARISE 연구실","en":"ARISE Lab","zh":"ARISE实验室","ja":"ARISEラボ"}',
  '{"ko":"ARISE 연구실","en":"ARISE Lab","zh":"ARISE实验室","ja":"ARISEラボ"}',
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

-- 박사후연구원
INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  1, 'postdoc',
  '{"ko":"박성욱","en":"Sungwook Park","zh":"朴成旭","ja":"パク・ソンウク"}',
  '/images/members/임시_swpark.jpg', 'swpark@kist.re.kr',
  '{"ko":"세종과학펠로우 & NRF 박사후연구원","en":"Sejong Post-Doc Fellow & NRF Fellow","zh":"世宗科학研究员 & NRF박사후연구원","ja":"セジョン科학フェロー & NRF博士後研究員"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"공학박사","en":"Ph.D."},"major":{"ko":"생체의공학","en":"Biomedical Engineering"},"institution":{"ko":"UST KIST School","en":"UST KIST School"},"year":2020},{"degree":{"ko":"학사","en":"B.S."},"major":{"ko":"화학공학 & 생명공학","en":"Chemical Engineering & Biotechnology"},"institution":{"ko":"한국기술교육대학교","en":"Tech University of Korea"},"year":2014}]',
  '[]'
);

-- 박사과정
INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  2, 'phd',
  '{"ko":"김현노","en":"Hyunro Kim","zh":"金贤老","ja":"キム・ヒョンノ"}',
  '/images/members/임시_kimhyunro.jpg', 'kimhyunro@kist.re.kr',
  '{"ko":"박사과정 (KU-KIST 융합대학원, 고려대학교)","en":"Ph.D. Student, KU-KIST Graduate School, Korea University","zh":"博士在读","ja":"博士課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"박사과정","en":"Ph.D. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2027}]',
  '[]'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  3, 'phd',
  '{"ko":"국다경","en":"Da Gyeong Guk","zh":"鞠多景","ja":"クク・ダギョン"}',
  '/images/members/임시_dagyeong.jpg', 'dagyeong@kist.re.kr',
  '{"ko":"박사과정 (KU-KIST 융합대학원, 고려대학교)","en":"Ph.D. Student, KU-KIST Graduate School, Korea University","zh":"博士在读","ja":"博士課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"박사과정","en":"Ph.D. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2027}]',
  '[]'
);

-- 석박통합과정
INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  4, 'combined',
  '{"ko":"박지수","en":"Ji Su Park","zh":"朴智秀","ja":"パク・ジス"}',
  '/images/members/임시_pgs1126.jpg', 'pgs1126@kist.re.kr',
  '{"ko":"석박통합과정 (KU-KIST 융합대학원, 고려대학교)","en":"Integrated M.S./Ph.D. Student, KU-KIST Graduate School, Korea University","zh":"硕博连读","ja":"修士・博士統合課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"석박통합과정","en":"Integrated M.S./Ph.D. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2028}]',
  '[]'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  5, 'combined',
  '{"ko":"박형준","en":"Hyung Joon Park","zh":"朴亨俊","ja":"パク・ヒョンジュン"}',
  '/images/members/임시_hosusu.jpg', 'hosusu@kist.re.kr',
  '{"ko":"석박통합과정 (KU-KIST 융합대학원, 고려대학교)","en":"Integrated M.S./Ph.D. Student, KU-KIST Graduate School, Korea University","zh":"硕博连读","ja":"修士・博士統合課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"석박통합과정","en":"Integrated M.S./Ph.D. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2028}]',
  '[]'
);

-- 석사과정
INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  6, 'ms',
  '{"ko":"하현우","en":"Hyunwoo Ha","zh":"河贤宇","ja":"ハ・ヒョンウ"}',
  '/images/members/임시_gkgusdn0904.jpg', 'gkgusdn0904@kist.re.kr',
  '{"ko":"석사과정 (KU-KIST 융합대학원, 고려대학교)","en":"M.S. Student, KU-KIST Graduate School, Korea University","zh":"硕士在读","ja":"修士課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"석사과정","en":"M.S. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2026}]',
  '[]'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, description, research_interests, education, achievements) VALUES (
  7, 'ms',
  '{"ko":"정예환","en":"Ye Hwan Jeong","zh":"郑礼桓","ja":"チョン・イェファン"}',
  '/images/members/임시_1263047.jpg', '1263047@kist.re.kr',
  '{"ko":"석사과정 (KU-KIST 융합대학원, 고려대학교)","en":"M.S. Student, KU-KIST Graduate School, Korea University","zh":"硕士在读","ja":"修士課程"}',
  '{"ko":"임시 - 실제 소개 입력 필요","en":"임시 - Please enter actual bio","zh":"임시","ja":"임시"}',
  '[{"ko":"임시 - 연구 분야 입력 필요","en":"임시 - Research interests needed","zh":"임시","ja":"임시"}]',
  '[{"degree":{"ko":"석사과정","en":"M.S. Candidate"},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"KU-KIST 융합대학원, 고려대학교","en":"KU-KIST Graduate School, Korea University"},"year":2026}]',
  '[]'
);

-- 졸업생
INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  101, 'alumni', '{"ko":"장건혁","en":"Gun Hyuk Jang","zh":"张建赫","ja":"チャン・ゴンヒョク"}',
  '/images/members/임시_ghjang.jpg', '',
  '{"ko":"현 씨젠(Seegene Inc.) 선임연구원","en":"Senior Researcher, Seegene Inc.","zh":"现任Seegene Inc.高级研究员","ja":"現Seegene Inc.上級研究員"}',
  '[]', '[{"degree":{"ko":"공학박사","en":"Ph.D."},"major":{"ko":"생체의공학","en":"Biomedical Engineering"},"institution":{"ko":"UST KIST School","en":"UST KIST School"},"year":2017}]',
  '[]', 2017, '{"ko":"박사","en":"Ph.D.","zh":"博士","ja":"博士"}',
  '{"ko":"선임연구원","en":"Senior Researcher","zh":"高级研究员","ja":"上級研究員"}',
  '{"ko":"씨젠(Seegene Inc.)","en":"Seegene Inc.","zh":"Seegene Inc.","ja":"Seegene Inc."}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  102, 'alumni', '{"ko":"전민홍","en":"Minhong Jeun","zh":"全民洪","ja":"チョン・ミンホン"}',
  '/images/members/임시_mhjeun.jpg', '',
  '{"ko":"현 부산과학기술기획평가원(BISTEP) 팀장","en":"Team Leader, BISTEP","zh":"现任BISTEP团队长","ja":"現BISTEPチーム長"}',
  '[]', '[{"degree":{"ko":"공학박사","en":"Ph.D."},"major":{"ko":"전기컴퓨터공학(나노의학)","en":"ECE (Nanomedicine)"},"institution":{"ko":"싱가포르국립대학교(NUS)","en":"NUS"},"year":2013}]',
  '[]', 2018, '{"ko":"박사후연구원 수료","en":"Post-Doc Completed","zh":"博士后完成","ja":"博士後研究員修了"}',
  '{"ko":"팀장","en":"Team Leader","zh":"团队长","ja":"チーム長"}',
  '{"ko":"부산과학기술기획평가원(BISTEP)","en":"BISTEP","zh":"BISTEP","ja":"BISTEP"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  103, 'alumni', '{"ko":"박재호","en":"Jea Ho Park","zh":"朴在浩","ja":"パク・ジェホ"}',
  '/images/members/임시_jhpark.jpg', '',
  '{"ko":"현 삼성전자 선임연구원","en":"Senior Researcher, Samsung Electronics","zh":"现任三星电子高级研究员","ja":"現サムスン電子上級研究員"}',
  '[]', '[{"degree":{"ko":"공학박사","en":"Ph.D."},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"미국 존스홉킨스대학교","en":"Johns Hopkins University, USA"},"year":2018}]',
  '[]', 2018, '{"ko":"박사","en":"Ph.D.","zh":"博士","ja":"博士"}',
  '{"ko":"선임연구원","en":"Senior Researcher","zh":"高级研究员","ja":"上級研究員"}',
  '{"ko":"삼성전자","en":"Samsung Electronics","zh":"三星电子","ja":"サムスン電子"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  104, 'alumni', '{"ko":"서정목","en":"Jungmok Seo","zh":"徐正穆","ja":"ソ・ジョンモク"}',
  '/images/members/임시_jmseo.jpg', '',
  '{"ko":"현 연세대학교 교수","en":"Professor, Yonsei University","zh":"现任延世大学교수","ja":"現延世大学校教授"}',
  '[]', '[{"degree":{"ko":"임시","en":"임시"},"major":{"ko":"임시","en":"임시"},"institution":{"ko":"임시","en":"임시"},"year":2019}]',
  '[]', 2019, '{"ko":"선임연구원 수료","en":"Research Scientist Completed","zh":"研究科学家完成","ja":"研究科学者修了"}',
  '{"ko":"교수","en":"Professor","zh":"教授","ja":"教授"}',
  '{"ko":"연세대학교","en":"Yonsei University","zh":"延世大学","ja":"延世大学校"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  105, 'alumni', '{"ko":"이효진","en":"Hyojin Lee","zh":"李孝珍","ja":"イ・ヒョジン"}',
  '/images/members/임시_hjlee.jpg', '',
  '{"ko":"현 KIST 선임연구원","en":"Senior Researcher, KIST","zh":"现任KIST高级研究员","ja":"現KIST上級研究員"}',
  '[]', '[{"degree":{"ko":"공학박사","en":"Ph.D."},"major":{"ko":"임시","en":"임시 - Major needed"},"institution":{"ko":"서울대학교","en":"Seoul National University"},"year":2018}]',
  '[]', 2018, '{"ko":"박사후연구원 수료","en":"Post-Doc Completed","zh":"博士后完成","ja":"博士後研究員修了"}',
  '{"ko":"선임연구원","en":"Senior Researcher","zh":"高级研究员","ja":"上級研究員"}',
  '{"ko":"KIST","en":"KIST","zh":"KIST","ja":"KIST"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  106, 'alumni', '{"ko":"김승회","en":"Seunghoe Kim","zh":"金承会","ja":"キム・スンフェ"}',
  '/images/members/임시_shkim.jpg', '',
  '{"ko":"현 삼성바이오에피스 연구원","en":"Researcher, Samsung Bioepis","zh":"现任三星Bioepis研究员","ja":"現サムスンバイオエピス研究員"}',
  '[]', '[{"degree":{"ko":"공학석사","en":"M.S."},"major":{"ko":"화학 & 생체분자공학","en":"Chemical & Biomolecular Engineering"},"institution":{"ko":"연세대학교","en":"Yonsei University"},"year":2019}]',
  '[]', 2019, '{"ko":"석사","en":"M.S.","zh":"硕士","ja":"修士"}',
  '{"ko":"연구원","en":"Researcher","zh":"研究员","ja":"研究員"}',
  '{"ko":"삼성바이오에피스","en":"Samsung Bioepis","zh":"三星Bioepis","ja":"サムスンバイオエピス"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  107, 'alumni', '{"ko":"우경민","en":"Kyungmin Woo","zh":"禹敬玟","ja":"ウ・ギョンミン"}',
  '/images/members/임시_kmwoo.jpg', '', '{"ko":"현 삼성전자 연구원","en":"Researcher, Samsung Electronics","zh":"现任三星电子研究员","ja":"現サムスン電子研究員"}',
  '[]', '[]', '[]', 2021, '{"ko":"임시","en":"임시 - Degree needed","zh":"임시","ja":"임시"}',
  '{"ko":"연구원","en":"Researcher","zh":"研究员","ja":"研究員"}',
  '{"ko":"삼성전자","en":"Samsung Electronics","zh":"三星电子","ja":"サムスン電子"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  108, 'alumni', '{"ko":"김민수","en":"Minsoo Kim","zh":"金珉洙","ja":"キム・ミンス"}',
  '/images/members/임시_mskim.jpg', '',
  '{"ko":"현 롯데정밀화학 연구원","en":"Researcher, Lotte Fine Chemical","zh":"现任乐天精密化学研究员","ja":"現ロッテファインケミカル研究員"}',
  '[]', '[{"degree":{"ko":"이학석사","en":"M.S."},"major":{"ko":"화학","en":"Chemistry"},"institution":{"ko":"한양대학교","en":"Hanyang University"},"year":2021}]',
  '[]', 2021, '{"ko":"석사","en":"M.S.","zh":"硕士","ja":"修士"}',
  '{"ko":"연구원","en":"Researcher","zh":"研究员","ja":"研究員"}',
  '{"ko":"롯데정밀화학","en":"Lotte Fine Chemical","zh":"乐天精密化学","ja":"ロッテファインケミカル"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  109, 'alumni', '{"ko":"최재원","en":"Jaewon Choi","zh":"崔在源","ja":"チェ・ジェウォン"}',
  '/images/members/임시_jwchoi.jpg', '',
  '{"ko":"현 서울대학교 연구원","en":"Researcher, Seoul National University","zh":"现任首尔大学研究员","ja":"現ソウル大学校研究員"}',
  '[]', '[{"degree":{"ko":"이학석사","en":"M.S."},"major":{"ko":"임시","en":"임시"},"institution":{"ko":"UST KIST School","en":"UST KIST School"},"year":2018},{"degree":{"ko":"학사","en":"B.S."},"major":{"ko":"임시","en":"임시"},"institution":{"ko":"미국 존스홉킨스대학교","en":"Johns Hopkins University, USA"},"year":2016}]',
  '[]', 2018, '{"ko":"석사","en":"M.S.","zh":"硕士","ja":"修士"}',
  '{"ko":"연구원","en":"Researcher","zh":"研究员","ja":"研究員"}',
  '{"ko":"서울대학교","en":"Seoul National University","zh":"首尔大学","ja":"ソウル大학校"}'
);

INSERT INTO members (sort_order, role, name, image_url, email, bio, research_interests, education, achievements, graduated_year, graduated_degree, current_position, current_institution) VALUES (
  110, 'alumni', '{"ko":"성태화","en":"Tae Wha Seong","zh":"成泰和","ja":"ソン・テファ"}',
  '/images/members/임시_twseong.jpg', '',
  '{"ko":"독일 하이델베르크대학교 박사과정","en":"Ph.D. Student, Heidelberg University, Germany","zh":"德国海德堡大学博士在读","ja":"ドイツ・ハイデルベルク大학博士課程"}',
  '[]', '[{"degree":{"ko":"박사과정","en":"Ph.D. Candidate"},"major":{"ko":"생화학","en":"Biochemistry"},"institution":{"ko":"독일 하이델베르크대학교","en":"Heidelberg University, Germany"},"year":2024},{"degree":{"ko":"학사","en":"B.S."},"major":{"ko":"생화학","en":"Biochemistry"},"institution":{"ko":"미국 노스웨스턴대학교","en":"Northwestern University, USA"},"year":2016}]',
  '[]', 2018, '{"ko":"연구원 수료","en":"Researcher Completed","zh":"研究员完成","ja":"研究員修了"}',
  '{"ko":"박사과정","en":"Ph.D. Candidate","zh":"博士在读","ja":"博士課程"}',
  '{"ko":"독일 하이델베르크대학교","en":"Heidelberg University, Germany","zh":"德国海德堡大학","ja":"ドイツ・ハイデルベルク大학"}'
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
INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'SARS-CoV-2 Variant Screening Using a Virus Receptor-Based Electrical Biosensor',
  ARRAY['S Park', 'H Kim', 'K Woo', 'J-M Kim', 'H-J Jo', 'Y Jeong', 'KH Lee'],
  'Nano Letters, 2022, 22 , 1 , 50–57',
  2022,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Structural optimization of 4-(imidazol-5-yl)pyridine derivatives affords broad-spectrum anticancer agents with selective B-RAFV600E/p38α kinase inhibitory activity: Synthesis, in vitro assays and in silico study',
  ARRAY['E Ali', 'K Mersal', 'U Ammard', 'S-O Zaraei', 'A-Maksoude', 'M El-Gamal', 'E Kim', 'J-S Lee', 'KH Lee', 'H-K Kim', 'C-H Oh'],
  'European Journal of Pharmaceutical Sciences, 2022, 171, 106115',
  2022,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Stimuli-responsive adaptive nanotoxin to directly penetrate the cellular membrane by molecular folding and unfolding',
  ARRAY['Y Jeong', 'S Jin', 'L Palanikumar', 'H Choi', 'E Shin', 'EM Go', 'C Keum', 'S Bang', 'D Kim', 'S Lee', 'M Kim', 'H Kim', 'KH Lee', 'B Jana', 'M-H Park', 'SK Kwak', 'C Kim', 'J-H Ryu'],
  'Journal of the American Chemical Society, 2022, accepted',
  2022,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Noninvasive Precision Screening of Prostate Cancer by Urinary Multimarker Sensor and Artificial Intelligence Analysis',
  ARRAY['H Kim', 'S Park', 'IG Jeong', 'SH Song', 'Y Jeong', 'CS Kim', 'KH Lee'],
  'ACS Nano, 15( 3) 4054',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Electrical Cartridge Sensor Enables Reliable and Direct Identification of MicroRNAs in Urine of Patients',
  ARRAY['S Kim', 'S Park', 'Y Cho', 'Y Kim', 'JH Tae', 'TI No', 'JS Shim', 'Y Jeong', 'SH Kang', 'KH Lee'],
  'ACS Sensors, 6(3), 833',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Design, synthesis, biological evaluation, and docking studies of novel (imidazol-5- yl)pyrimidine-based derivatives as dual BRAFV600E/p38α inhibitors',
  ARRAY['S Ali', 'R El-Telbany', 'M Abdel-Maksoud', 'U Ammar', 'K Mersal', 'S Zaraei', 'M ElGamal', 'S-I Choi', 'KT Lee', 'H Kim', 'KH Lee', 'C-H Oh'],
  'European Journal of Medicinal Chemistry, 2021, 215, 113277',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Drug resistance-free cytotoxic nanodrugs in composites for cancer therapy',
  ARRAY['B Jana', 'D Kim', 'H Choi', 'M Kim', 'K Kim', 'S Kim', 'S Jin', 'M-H Park', 'KH Lee', 'C Yoon', 'B Lee', 'M Kang', 'H Lim', 'E Park', 'Y Jeong', 'J-H Ryu', 'C Kim'],
  'Journal of Materials Chemistry B, 2021, 9(14), 3143',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Discovery of New Imidazo[2,1-b]thiazole Derivatives as Potent Pan-RAF Inhibitors with Promising In Vitro and In Vivo Anti-melanoma Activity',
  ARRAY['M Abdel-Maksoud', 'M El-Gamal', 'B Lee', 'M El-Din', 'H Jeon', 'D Kwon', 'U Ammar', 'K Mersal', 'E Ali', 'K Lee', 'KH Yoo', 'D Han', 'JK Lee', 'G Kim', 'H Choi', 'YJ Kwon', 'KH Lee', 'C-H Oh'],
  'Journal of Medicinal Chemistry, 2021, 64(10), 6877',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Ionic contrast across a lipid membrane for Debye length extension: towards an ultimate bioelectronics transducer',
  ARRAY['D Lee', 'S Jung', 'E Yu', 'T Lee', 'JH. Kim', 'HS Song', 'KH Lee', 'S Lee', 'S Han', 'MC Choi', 'DJ Ahn', 'Y Ryu', 'C. Kim'],
  'Nature Communications, 2021, 12, 374',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Design, synthesis, in vitro determination and molecular docking studies of 4-(1-(tert-butyl)-3-phenyl-1H-pyrazol-4-yl) pyridine derivatives with terminal sulfonamide derivatives in LPS-induced RAW264.7 macrophage cells',
  ARRAY['K Mersal', 'M Maksoud', 'E Ali', 'U Ammar', 'S Jarael', 'J-M Kim', 'S-Y Kim', 'K-T Lee', 'KH Lee', 'S-W Kim', 'H-M Park', 'M-J Ji', 'C-H Oh'],
  'Medicinal Chemistry Research, 2021, 30, 1925–1942',
  2021,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Unimolecular Polypeptide Micelles via Ultra-fast Polymerization of N-Carboxyanhydrides',
  ARRAY['S. Lv', 'H. Kim', 'F. Lin', 'Z. Song', 'Yang', 'Y. R. Baumgartner', 'S.J. Dillon', 'C. Leal', 'L. Yin', 'J. Cheng'],
  'Journal of the American Chemical Society, 2020, 142, 8570-8574',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Interfacial Force‐Focusing Effect in Mechanophore‐Linked Nanocomposites',
  ARRAY['T. A. Kim', 'C. Lamuta', 'H. Kim', 'C. Leal', 'N. R. Sottos'],
  'Advanced Science, 2020, 1903464',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'The structural fate of lipid nanoparticles in the extracellular matrix',
  ARRAY['S. Bandara', 'T. Molley', 'H. Kim', 'P. Bharath', 'K. Kilian and C. Leal'],
  'Materials Horizon, 7, 125-134',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tailoring H2O2 generation kinetics with magnesium alloys for efficient disinfection on titanium surface',
  ARRAY['J Park', 'GH Jang', 'YW Jung', 'H Seo', 'HS Han', 'J Lee', 'Y Seo', 'H Jeon', 'MR Ok', 'PR Cha', 'HK Seok', 'KH Lee YC Kim'],
  'Scientific Reports, 10, 6536',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Insight into the Electrical Double Layer of Ionic Liquids Revealed through Its Temporal Evolution',
  ARRAY['M Han', 'H Kim', 'C Leal', 'M Negrito', 'J Batteas', 'R Espinosa-Marzal'],
  'Advanced Materials Interfaces , 2020, 2001313',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Combinatorial Inhibition of Cell Surface Receptors Using Dual Aptamer-Functionalized Nanoconstructs for Cancer Treatment',
  ARRAY['H Lee', 'T Kim', 'D Park', 'M Jang', 'J Chung', 'S Kim', 'S-H Kim', 'KH Lee', 'Y Jung', 'SJ Oh'],
  'Pharmaceutics , 2020, 12, 689',
  2020,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Mixing oil and water with ionic liquids: bicontinuous microemulsions under confinement',
  ARRAY['H. Kim', 'H. Mengwei', 'S. Bandara', 'R. M. Espinosa-Marzal', 'C. Leal'],
  'Soft Matter , 15, 9609-9613',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Interfacial charge regulation of protein blocking layers in transistor biosensor for direct measurement in serum',
  ARRAY['S. Park', 'M. Kim', 'D. Kim', 'S. H. Kang', 'K. H. Lee', 'Y. Jeong'],
  'Biosensors and Bioelectronics, In Press',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Supramolecular protection-mediated one-pot synthesis of cationic gold nanoparticles',
  ARRAY['B. Jana', 'S. Kim', 'H. Choi', 'S. Jin', 'K. Kim', 'M. Kim', 'H. Lee', 'K. H. Lee', 'J. Lee', 'M.-H. Park', 'Y. Jeong', 'J.-H. Ryu', 'C. Kim'],
  'Journal of Industrial and Engineering Chemistry , In Press',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantitative single-cell-analysis of isolated cancer cells with microwell array',
  ARRAY['H. Kim', 'S. Park', 'B. Kang', 'Y. Jeong', 'H. Lee', 'K. H. Lee'],
  'ACS Comb Sci, 21, 98–104',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Non-invasive Molecular Barcode Assay for Diagnosis of Sex Hormones Correlated with Precocious Puberty',
  ARRAY['H Lee', 'KH Kim', 'KH Lee'],
  'Sensors and Actuators B, 282, 399-407',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Fully Packaged Portable Thin Film Biosensor for the Direct Detection of Highly Pathogenic Viruses from On-Site Samples',
  ARRAY['J Choi', 'M Jeun', 'S-S Yuk', 'S Park', 'J Choi', 'D Lee', 'H Shin', 'H. Kim', 'I. Cho', 'S.K. Kim', 'S Lee', 'C-S Song', 'KH Lee'],
  'ACS Nano, 13, 812-820',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'A Novel Blood-Based Colorectal Cancer Diagnostic Technology Using Electrical Detection of Colon Cancer Secreted Protein-2',
  ARRAY['M Jeun', 'H Lee', 'S Park', 'E Do', 'J Choi', 'Y Sung', 'S Hong', 'S Kim', 'D Kim', 'JY Kang', 'H Son', 'J Joo', 'EM Song', 'SW Hwang', 'SH Park', 'D Yang', 'BD Ye', 'J Byeon', 'J Choe', 'S Yang', 'H Moinova', 'S Markowitz', 'KH Lee and S-J Myung'],
  'Advanced Science, 2019, 1802115',
  2019,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Full length histone H3 conjugated electrochemical biosensor for extracellular proteolytic Cathepsin L activity detection',
  ARRAY['TW Seong', 'JM Seo', 'KH Lee'],
  'Sensors and Actuators B , 267: 237-244',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Rapid and background-free detection of avian influenza virus in opaque sample using NIR-to-NIR upconversion nanoparticle-based lateral flow immunoassay platform',
  ARRAY['J Kim', 'JH Kwon', 'J Jang', 'H Lee', 'S Kim', 'YK Hahn', 'SK Kim', 'KH Lee', 'S Lee', 'H Pyo', 'C-S Song', 'J Lee'],
  'Biosensors and Bioelectronics, 112: 209-215',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Microfluidics Synthesis of Gene Silencing Cubosomes',
  ARRAY['H. Kim', 'J. Sung', 'Y. Chang', 'A. Alfeche', 'C. Leal'],
  'ACS Nano , 12 (9), 9196–9205',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Transgenic zebrafish model for quantification and visualization of tissue toxicity caused by alloying elements in newly developed biodegradable metal',
  ARRAY['H-S Han', 'GH Jang', 'I Jun', 'H Seo', 'J Park', 'S Glyn-Jones', 'HK Seok', 'KH Lee', 'Y-C Kim', 'D Mantovani', 'J Edwards'],
  'Scientific Report , 8, 13818',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Initial Experience of Transperineal Biopsy After Multiparametric Magnetic Resonance Imaging in Korea; Comparison With Transrectal Biopsy',
  ARRAY['SG Yoon', 'HJ Jin', 'JH Tae', 'TI No', 'JY Kim', 'JH Pyun', 'JS Shim', 'J Cheon', 'JG Lee', 'JJ Kim', 'DJ Sung', 'KH Lee', 'SH Kang'],
  'Kor J Urol Oncol, 16(3), 110',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Synthesis of Fluorescent Au Nanocrystals-Silica Hybrid Nanocomposite (FLASH) with Enhanced Optical Features for Bio-imaging and Photodynamic Activity',
  ARRAY['T Kim', 'H Jang', 'S Kim', 'JH Lee', 'SY Kim', 'NL Jeon', 'JM Song and DH Min'],
  'Langmuir, 34, 173',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'BANF1, PLOD3, SF3B4 as Early-stage Cancer Detection Markers and Drivers of Hepatocellular Carcinoma',
  ARRAY['Q Shen', 'JW Eun', 'K Lee', 'HS Kim', 'HD Yang', 'SY Kim', 'EK Lee', 'T Kim', 'K Kang', 'S Kim', 'DH Min', 'SN Oh', 'YJ Lee', 'H Moon', 'SW Ro', 'WS Park', 'JY Lee', 'SW Nam'],
  'Hepatology, 67, 1360',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Morphology-Controlled Synthesis of Rhodium Nanoparticles for Cancer Phototherapy',
  ARRAY['S Kang', 'W Shin', 'MH Choi', 'M Ahn', 'YK Kim', 'S Kim', 'DH Min', 'H Jang'],
  'ACS Nano, 12, 6997',
  2018,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Optical coding of fusion genes using multicolor quantum dots for prostate cancer diagnosis',
  ARRAY['H Lee', 'C Kim', 'D Lee', 'JH Park', 'PC Searson', 'KH Lee'],
  'Int. J. Nanomedicine , 12: 4397-4407',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Zebrafish Models for Functional and Toxicological Screening of Nanoscale Drug Delivery Systems: Promoting Preclinical Applications',
  ARRAY['KY Lee', 'GH Jang', 'CH Byun', 'M Jeun', 'PC Searson', 'KH Lee'],
  'Bioscience Reports , 37(3): BSR20170199',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'A Strategy to Minimize the Sensing Voltage Drift Error in a Transistor Biosensor with a Nanoscale Sensing Gate',
  ARRAY['HW Son', 'M Jeun', 'J Choi', 'KH Lee'],
  'Int. J. Nanomedicine , 12: 2951-2956',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'High Throughput Differential Identification of TMPRSS2-ERG Fusion Genes in Prostate Cancer Patient Urine',
  ARRAY['H Lee', 'D Lee', 'JH Park', 'SH Song', 'IG Jeong', 'CS Kim', 'PC Searson', 'KH Lee'],
  'Biomaterials , 135: 23-29',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Self-normalized Detection of ANXA3 from Untreated Urine of Prostate Cancer Patients without Digital Rectal Examination',
  ARRAY['M Jeun', 'S Park', 'Y Kim', 'J Choi', 'SH Song', 'IG Jeong', 'CS Kim', 'KH Lee'],
  'Advanced Healthcare Materials , 6(17), 1700449',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Field-Effect Biosensors for On-site Detection: Recent Advances and Promising Targets',
  ARRAY['J Choi', 'TW Seong', 'M Jeun', 'KH Lee'],
  'Advanced Healthcare Materials , 6, 1700796',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Solubilization of Hydrophobic Catalysts Using Nanoparticle Hosts',
  ARRAY['Y Jeong', 'GY Tonga', 'B Duncan', 'B Yan', 'R Das', 'C Sahub', 'VM Rotello'],
  'Small , DOI 101002/smll201702198',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Super-swelled lyotropic single crystals',
  ARRAY['H. Kim', 'Z. Song', 'C. Leal'],
  'Proceedings of the National Academy of Sciences , 114 (41), 10834-10839',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Functional Manganese Dioxide Nanosheet for Targeted Photodynamic Therapy and Bioimaging In Vitro and In Vivo',
  ARRAY['S Kim', 'SM Ahn', 'JS Lee', 'TS Kim', 'DH Min'],
  '2D Materials 4,025069',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Highly Efficient Gene Silencing and Bioimaging based on Fluorescent Carbon Dot In Vitro and In Vivo',
  ARRAY['S Kim', 'Y Choi', 'G Park', 'C Won', 'YJ Park', 'Y Lee', 'BS Kim', 'DH Min'],
  'Nano Research 10, 503',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Highly Efficient and Rapid Neural Differentiation of Mouse Embryonic Stem Cells based on Retinoic Acid Encapsulated Porous Nanoparticle',
  ARRAY['SJ Park', 'S Kim', 'SY Kim', 'NL Jeon', 'JM Song', 'C Won', 'DH Min'],
  'ACS Applied Materials Interfaces 9, 34634',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Facile One-Pot Photosynthesis of Stable Ag@Graphene Oxide Nanocolloid Core@Shell Nanoparticles with Sustainable Localized Surface Plasmon Resonance Property under Harsh Conditions',
  ARRAY['YK Kim', 'S Kim', 'SP Cho', 'H Jang', 'H Huh', 'BH Hong', 'DH Min'],
  'Journal of Materials Chemistry C 5, 10016',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Highly Efficient Photocatalytic Performances of SnO2-Depostited ZnS Nanorods based on Interfacial Charge Transfer',
  ARRAY['J Lee', 'Y Kim', 'S Kim', 'JK Kim', 'DH Min', 'DJ Jang'],
  'Applied Catalysis B: Environment 205, 433',
  2017,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Predicting in vivo Non-specific Accumulation of Tumor-targeting Nanoparticles using in vitro Macrophage Uptake and in vivo Biodistribution in Zebrafish',
  ARRAY['H Chang', 'JY Yhee', 'GH Jang', 'DG You', 'JH Ryu', 'Y Choi', 'JH Na', 'JH Park', 'KH Lee', 'K Choi', 'K Kim', 'IC Kwon'],
  'J Controlled Release 244: 205-213',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Highly Sensitive Detection of Biomarkers via Nuclear Magnetic Resonance Biosensor with Magnetically Engineered Nanoferrite Particles',
  ARRAY['M Jeun', 'S Park', 'H Lee', 'KH Lee'],
  'Int. J. Nanomedicine 11: 5497-5503',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantum dot nanoprobe-based quantitative analysis for prostate cancer',
  ARRAY['JM Kang', 'GH Jang', 'S Park', 'KH Lee'],
  'Proc. SPIE 9930, Biosensing and Nanomedicine IX, 99300O (doi:10.1117/12.2237287)',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Multifaceted Toxicity Assessment of Catalyst Composites in Transgenic Zebrafish Embryos',
  ARRAY['GH Jang', 'KY Lee', 'J Choi', 'SH Kim', 'KH Lee'],
  'Environmental Pollution 216: 755-763',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Sequential Assessment via Daphnia and Zebrafish for Systematic Toxicity Screening of Heterogeneous Substances',
  ARRAY['GH Jang', 'CB Park', 'BJ Kang', 'YJ Kim', 'KH Lee'],
  'Environmental Pollution 216: 292-303',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Nanoparticle-Dendrimer Hybrid Nanocapsules for Therapeutic Delivery',
  ARRAY['Y Jeong', 'ST Kim', 'Y Jiang', 'B Duncan', 'C S Kim', 'K Saha', 'Y-C Yeh', 'B Yan', 'R Tang', 'S Hou', 'C Kim', 'M-H Park', 'VM Rotello'],
  'Nanomedicine , 11 (12), 1571–1578',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Self-organization of nucleic acids in lipid constructs',
  ARRAY['M. Kang', 'H. Kim', 'C. Leal'],
  'Current Opinion in Colloids & Interface Science, 26, 58-65',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Ethanol-induced whey protein gels as carriers for lutein droplets',
  ARRAY['S. Uzun', 'H. Kim', 'C. Leal', 'G. W. Padua'],
  'Food Hydrocolloids, 61, 426-432',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Effect of the environmental humidity on the bulk, interfacial and nanoconfined properties of an ionic liquid',
  ARRAY['L. A. Jurado', 'H. Kim', 'A. Rossi', 'A. Arcifa', 'J. K. Schuh', 'N. D. Spencer', 'C. Leal', 'R. H. Ewoldt', 'R. M. Espinosa-Marzal'],
  'Physical Chemistry Chemical Physics, 18 (32), 22719-22730',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'How the Size, Charge, and Shapes of Gold Nanoparticles Affect Amyloid β Aggregation on Brain Lipid Bilayer?',
  ARRAY['Y Kim', 'JH Park', 'H Lee', 'JM Nam'],
  'Scientific Reports, 6 , 19548',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'In-Depth Study of Gene Silencing Capability of Silica Nanoparticles with Fine Tuning of Pore Size: Degree and Duration of RNA Interference',
  ARRAY['S Kim', 'HK Na', 'C Won', 'DH Min'],
  'RSC Advances 6 , 27143',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'MAP4-regulated dynein-dependent trafficking of BTN3A1 controls the TBK1-IRF3 signaling axis',
  ARRAY['M Seo', 'SO Lee', 'JH Kim', 'S Kim', 'Y Kim', 'DH Min', 'YY Kong', 'J Shin', 'K Ahn'],
  'PNAS, 113 , 14390',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Biosensors based on Graphene Oxide and Its Biomedical Application',
  ARRAY['J Lee', 'J Kim', 'S Kim', 'DH Min'],
  'Advanced Drug Delivery Review 105, 275',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'MicroRNA-Responsive Drug Release System for Selective Fluorescence Imaging and Photodynamic Therapy In Vivo',
  ARRAY['JS Lee', 'S Kim', 'HK Na', 'DH Min'],
  'Advanced Healthcare Materials, 5, 2386',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'In-Depth Investigation of the Interaction between DNA and Nano-Sized Graphene Oxide',
  ARRAY['J Lee', 'Y Yim', 'S Kim', 'MH Choi', 'BS Choi', 'Y Lee', 'DH Min'],
  'Carbon, 97 , 92',
  2016,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Self-amplifying Transistor Immunosensor under Dual Gate Operation: Highly Sensitive Detection of Hepatitis B Surface Antigen',
  ARRAY['IK Lee', 'M Jeun', 'HJ Jang', 'WJ Cho', 'KH Lee'],
  'Nanoscale 7: 16789 - 16797',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Mg-corrosion triggered spontaneous generation of H2O2 on oxidized Ti for promoting angiogenesis',
  ARRAY['J Park', 'P Du', 'JK Jeon', 'GH Jang', 'MP Hwang', 'HS Han', 'K Park', 'KH Lee', 'JW Lee', 'H Jeon', 'YC Kim', 'HK Seok', 'MR Ok'],
  'Angewandte Chemie Int. Ed. 54: 14753-14757',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Diagnosis of Prostate Cancer via Nanotechnological Approach.',
  ARRAY['BJ Kang', 'M Jeun', 'GH Jang', 'SH Song', 'IG Jeong', 'CS Kim', 'PC Searson', 'KH Lee'],
  'International Journal of Nanomedicine 10: 6555-6569',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Enhanced Human Epidermal Growth Factor Receptor 2 Degradation in Breast Cancer Cells by Lysosome-Targeting Gold Nanoconstructs',
  ARRAY['H Lee', 'DH Dam', 'JW Ha', 'J Yue', 'TW Odom'],
  'ACS Nano 9: 9859-9867',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Mass spectrometry-based N-linked Glycomic Profiling as a Means for Tracking Pancreatic Cancer Metastasis',
  ARRAY['HM Park', 'M Hwang', 'YW Kim', 'KJ Kim', 'JM Jin', 'YH Kim', 'YH Yang', 'KH Lee', 'YG Kim'],
  'Carbohydrate Research 413: 5-11',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Electrical Signaling of Enzyme-Linked Immunosorbent Assays with an Ion-Sensitive Field-Effect Transistor',
  ARRAY['H-J Jang', 'J Ahn', 'M-G Kim', 'Y-B Shin', 'M Jeun', 'W-J Cho', 'KH Lee'],
  'Biosensors and Bioelectronics 64: 318–323',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Supramolecular Regulation of Bioorthogonal Catalysis in Cells Using Nanoparticle-Embedded Transition Metal Catalysts',
  ARRAY['GY Tonga', 'Y Jeong', 'B Duncan', 'T Mizuhara', 'R Mout', 'R Das', 'ST Kim', 'Y-C Yeh', 'B Yan', 'S Hou', 'VM Rotello (Co-first author)'],
  'Nature Chemistry , 7 (7), 597–603',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Co-Delivery of Protei n an d Small Molecule Therapeutics Using Nanoparticle-Stabilized Nanocapsules',
  ARRAY['C S Kim', 'R Mout', 'Y Zhao', 'Y-C Yeh', 'R Tang', 'Y Jeong', 'B Duncan', 'J A Hardy', 'VM Rotello'],
  'Bioconjugate Chemistry , 26 (5), 950–954',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'High-resolution patterns of quantum dots formed by electrohydrodynamic jet printing for light-emitting diodes',
  ARRAY['B. H. Kim', 'M. S. Onses', 'J. B. Lim', 'S. Nam', 'N. Oh', 'H. Kim', 'K. J. Yu', 'J. W. Lee', 'J. H. Kim', 'S. K. Kang', 'C. H. Lee', 'J. Lee', 'J. H. Shin', 'N. H. Kim', 'C. Leal', 'M. Shim', 'J. A. Rogers'],
  'Nano Letters, 15 (2), 969-973',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Irreversible structural change of a dry ionic liquid under nanoconfinement',
  ARRAY['L. A. Jurado', 'H. Kim', 'A. Arcifa', 'A. Rossi', 'C. Leal', 'N. D. Spencer', 'R. M. Espinosa-Marzal'],
  'Physical Chemistry Chemical Physics, 17 (20), 13613-13624',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Polypeptide vesicles with densely packed multilayer membranes',
  ARRAY['Z. Song', 'H. Kim', 'X. Ba', 'R. Baumgartner', 'J. S. Lee', 'H. Tang', 'C. Leal', 'J. Cheng'],
  'Soft Matter, 11 (20), 4091-4098',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Transparent, Nanoporous, and Transferable Membrane-Based Cell–Cell Paracrine Signaling Assay',
  ARRAY['Y Jang', 'H Lee', 'K Char and JM Nam'],
  'Advanced Materials, 27 , 1893-1899',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tunable Loading of Oligonucleotides with Secondary Structure on Gold Nanoparticles through a pH-driven Method',
  ARRAY['DH Dam', 'H Lee', 'RC Lee', 'KH Kim', 'NL Kelleher', 'TW Odom'],
  'Bioconjugate Chemistry, 26 (2), 279-285',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Biodistribution and in Vivo Toxicity of Aptamer-Loaded Gold Nanostars',
  ARRAY['DH Dam', 'KSB Culver', 'I Kandela', 'RC Lee', 'K Chandra', 'H Lee', 'C Mantis', 'A Ugolkov', 'AP Mazar', 'TW Odom'],
  'Nanomedicine NBM, 11 (3), 671-679',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'One Pot Synthesis of Multifunctional Au@Graphene Oxide Nanocolloid Core-Shell Nanoparticle for Raman Bioimaging, Photothermal and Photodynamic Therapy',
  ARRAY['YK Kim', 'HK Na', 'S Kim', 'H Jang', 'SJ Chang', 'DH Min'],
  'Small, 11 , 2527',
  2015,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Microwave Annealing Effect for Highly Reliable Biosensor: Dual-Gate Ion-Sensitive Field-Effect Transistor Using Amorphous-InGaZnO Thin-Film Transistor.',
  ARRAY['IK Lee', 'KH Lee', 'S Lee', 'WJ Cho'],
  'ACS Applied Materials & Interfaces , 6(24): 22680-22686',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tailoring MgxMn1-xFe2O4 Superparamagnetic Nanoferrites for Magnetic Fluid Hyperthermia Applications.',
  ARRAY['M Jeun', 'S Park', 'GH Jang', 'KH Lee'],
  'ACS Applied Materials & Interfaces 6(19): 16487-92',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Universal Antibody Conjugation To Nanoparticles Using The Fcγ Receptor I (FcγRI): Quantitative Profiling Of Membrane Biomarkers.',
  ARRAY['C Kim', 'J Galloway', 'KH Lee', 'P Searson'],
  'Bioconjugate Chemistry 25(10): 1893-1901',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Microdevices for examining immunological responses of single cells to HIV.',
  ARRAY['J Choi', 'Y Jeong', 'H Han', 'KH Lee'],
  'Bioscience Reports 34(4): 501-511',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Engineered Collagen Hydrogels for the Sustained Release of Biomolecules and Imaging Agents: Promoting the Growth of Human Gingival Cells.',
  ARRAY['J Choi', 'H Park', 'T Kim', 'W Kim', 'MH Oh', 'T Hyeon', 'A. Gilad', 'KH Lee'],
  'International Journal of Nanomedicine 9: 5189-5201',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'State-of-the-Art in Design Rules for Drug Delivery Platforms: Lessons from FDA-approved Nanomedicines.',
  ARRAY['CM Dawidczyk', 'C Kim', 'JH Park', 'LM Russell', 'KH Lee', 'MG Pomper', 'PC Searson.'],
  'Journal of Controlled Release 187: 133-144',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Technology Advancement for Integrative Stem Cell Analyses.',
  ARRAY['Y Jeong', 'J Choi', 'KH Lee'],
  'Tissue Engineering B 20 (6): 669-682',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'A glimpse into the interactions of cells in a microenvironment: the modulations of T cells by mesenchymal stem cells.',
  ARRAY['J Choi', 'MP Hwang', 'JW Lee', 'KH Lee'],
  'International Journal of Nanomedicine 9:127-139',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Electrochemical Synthesis of Red Fluorescent Silicon Nanoparticles.',
  ARRAY['J Choi', 'K Kim', 'HS Han', 'MP Hwang', 'KH Lee'],
  'Bulletin of the Korean Chemical Society 35(1):35-38',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Overview of current standpoints in profiling of circulating tumor cells.',
  ARRAY['K Kim', 'KH Lee', 'J Lee', 'J Choi .'],
  'Archives of Pharmacal Research 37(1):88-95',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'A systematic in-vivo toxicity evaluation of nanophosphor particles via zebrafish models.',
  ARRAY['GH Jang', 'MP Hwang', 'SY Kim', 'HS Jang', 'KH Lee'],
  'Biomaterials 35(1): 440-449',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Immobilization and Stabilization of Lipase (CaLB) Through Hierarchical Interfacial Assembly',
  ARRAY['J N Talbert', 'L-S Wang', 'B Duncan', 'Y Jeong', 'S M Andler', 'V M Rotello', 'J M Goddard'],
  'Biomacromolecules , 15 (11), 3915–3922',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tunable Elastic Modulus of Nanoparticle Monolayer Films by Host-Guest Chemistry',
  ARRAY['Y Jeong', 'Y-C Chen', 'MK Turksoy', 'S Rana', 'GY Tonga', 'B Creran', 'A Sanyal', 'AJ Crosby', 'VM Rotello'],
  'Advanced Materials , 26 (29), 5056–5061',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Fabrication of Multiresponsive Bioactive Nanocapsules Through Orthogonal Self-Assembly',
  ARRAY['Y-C Yeh', 'R Tang', 'R Mout', 'Y Jeong', 'V M Rotello'],
  'Angew. Chem. Int. Ed. 53 (20), 5137–5141',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Amyloid-β Aggregation with Gold Nanoparticles on Brain Lipid Bilayer',
  ARRAY['H Lee', 'Y Kim', 'A Park', 'JM Nam'],
  'Small. 10 (9), 1779–1789',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Bio-Barcode Gel Assay for microRNA',
  ARRAY['H Lee', 'J Park', 'JM Nam'],
  'Nature Communications, 5 (3367)',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Highly Biocompatible Carbon Nanodots for Simultaneous Bioimaging and Targeted Photodynamic Therapy In Vitro and In Vivo',
  ARRAY['Y Choi', 'S Kim', 'MH Choi', 'SR Ryoo', 'J Park', 'DH Min and BS Kim'],
  'Advanced Functional Materials, 24, 5781',
  2014,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Facile Solvothermal Preparation of Monodisperse Gold Nanoparticles and Their Engineered Assembly of Ferritin-Gold Nanoclusters.',
  ARRAY['J Choi', 'S Park', 'Z Stojanović', 'HS Han', 'J Lee', 'HK Seok', 'D Uskoković', 'KH Lee'],
  'Langmuir 29, 50, (15698-15703)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Nanoscale bacteriophage biosensors beyond phage display.',
  ARRAY['JW Lee', 'J Song', 'MP Hwang', 'KH Lee'],
  'International Journal of Nanomedicine 8, 1, (3917-3925)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantification of cardiovascular disease biomarkers via functionalized magnetic beads and on-demand detachable quantum dots.',
  ARRAY['H Park', 'JW Lee', 'MP Hwang', 'KH Lee'],
  'Nanoscale 5, 18, (8609-8615)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Think Modular: A Simple Apoferritin-Based Platform for the Multifaceted Detection of Pancreatic Cancer.',
  ARRAY['MP Hwang', 'JW Lee', 'KE Lee', 'KH Lee'],
  'ACS Nano 7, 9, (8167-8174)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Harnessing immunomagnetic separation and quantum dot-based quantification capacities for the enumeration of absolute levels of biomarker.',
  ARRAY['HY Park', 'MP Hwang', 'JW Lee', 'JH Choi', 'KH Lee'],
  'Nanotechnology 24, 28, (285103-1-285103-7)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Production of multiple transgenic Yucatan miniature pigs expressing human complement regulatory factors, human CD55, CD59, and H-transferase genes.',
  ARRAY['YH Jeong', 'CH Park', 'GH Jang', 'YI Jeong', 'IS Hwang', 'Y Jeong', 'YK Kim', 'T Shin', 'NH Kim', 'SH Hyun', 'EB Jeung', 'WS Hwang.'],
  'PLoS One 21;8(5):e63241',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Direct Delivery of Functional Proteins and Enzymes to the Cytosol Using Nanoparticle-Stabilized Nanocapsules',
  ARRAY['R Tang', 'C S Kim', 'D J Solfiell', 'S Rana', 'R Mout', 'E M Velázquez-Delgado', 'A Chompoosor', 'Y Jeong', 'B Yan', 'Z-J Zhu', 'C Kim', 'JA Hardy', 'VM Rotello'],
  'ACS Nano , 7 (8), 6667–6673',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Characterization of Surface Ligands on Functionalized Magnetic Nanoparticles Using Laser Desorption/Ionization Mass Spectrometry (LDI-MS)',
  ARRAY['B Yan', 'Y Jeong', 'LA Mercante', 'GY Tonga', 'C Kim', 'Z-J Zhu', 'RW Vachet', 'VM Rotello'],
  'Nanoscale , 5 (11), 5063–5066',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Fabrication of Stable Nanoparticle-Based Colloidal Microcapsules',
  ARRAY['Y Jeong', 'D Patra', 'A Sanyal', 'V M Rotello'],
  'Current Organic Chemistry 17(1), 49-57',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Replenishable Dendrimer-Nanoparticle Hybrid Membranes for Sustained Release of Therapeutics',
  ARRAY['M-H Park', 'ST Kim', 'S Rana', 'D Solfiell', 'Y Jeong', 'B Duncan', 'B Yan', 'B Aksoy', 'VM Rotello'],
  'Nanoscale, 5 (17), 7805–7808 7808',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Protein-Coated Nanofibers for Promotion of T cell Activity',
  ARRAY['T Kim', 'H Lee', 'Y Kim', 'NM Lee'],
  'Chemial Communications, 49, 3949-3951',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Deoxyribozyme-Loaded Nano-Graphene Oxide for Simultaneous Sensing and Silencing of Hepatitis C Virus Gene in Liver Cells',
  ARRAY['S Kim', 'SR Ryoo', 'HK Na', 'YK Kim', 'BS Choi', 'Y Lee', 'DE Kim', 'DH Min'],
  'Chemial Communications, 49, 8241',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Reusable Biocatalytic Crosslinked Microparticles Self-Assembled From Enzyme-Nanoparticle Complexes',
  ARRAY['Y Jeong', 'B Duncan', 'M-H Park', 'C Kim', 'VM Rotello'],
  'Chem. Commun., 47 (44), 12077–12079. 2011',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Nanoparticle-Functionalized Polymer Platform for Controlling Metastatic Cancer Cell Adhesion, Shape, and Motility',
  ARRAY['H Lee', 'Y Jang', 'J Seo', 'JM Nam and K Char'],
  'ACS Nano , 5 (7), 5444-5456',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Responsive Nematic Gels from the Self-Assembly of Aqueous Nanofibres',
  ARRAY['Z Huang', 'H Lee', 'E Lee', 'SK Kang', 'JM Nam and M Lee'],
  'Nature Communications , 2 (459)',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Biomimetic Nanopatterns as Enabling Tools for Analysis and Control of Live Cells',
  ARRAY['DH Kim', 'H Lee', 'YK Lee', 'JM Nam and A Levchenko'],
  'Advanced Materials , 22, 4551-4566',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tunable Layer-by-Layer Polyelectrolyte Platforms for Comparative Cell Assays',
  ARRAY['J Seo', 'H Lee', 'J Jeon', 'Y Jang', 'R Kim', 'K Char', 'JM Nam'],
  'Biomacromolecules , 10 (8), 2254-2260',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Restriction-Enzyme-Coded Gold-Nanoparticle Probes for Multiplexed DNA Detection',
  ARRAY['KJ Jang', 'H Lee', 'YH Park', 'HL Jin and JM Nam'],
  'Small , 5 (23), 2665-2668',
  2013,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantitative characterization of the lipid encapsulation of quantum dots for biomedical applications.',
  ARRAY['JF Galloway', 'A Winter', 'KH Lee', 'JH Park', 'CM Dvoracek', 'P Devreotes', 'PC Searson.'],
  'Nanomedicine-Nanotechnology, Biology and Medicine 8, 7, (1190-1199), 2012',
  2012,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantitative molecular profiling of biomarkers for pancreatic cancer with functionalized quantum dots.',
  ARRAY['KH Lee', 'JF Galloway', 'J Park', 'CM Dvoracek', 'M Dallas', 'K Konstantopoulos', 'A Maitra', 'PC Searson.'],
  'Nanomedicine-Nanotechnology, Biology and Medicine 8, 7, (1043-1051), 2012',
  2012,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Colorimetric Protein Sensing Using Catalytically Amplified Sensor Arrays',
  ARRAY['X Li', 'F Wen', 'B Creran', 'Y Jeong', 'X Zhang', 'VM Rotello'],
  'Small, 8 (23), 3589–3592. 2012',
  2012,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Quantitative molecular profiling of biomarkers for pancreatic cancer with quantum dots',
  ARRAY['PC Searson', 'KH Lee.'],
  'Cancer Research 71, 8, 5326, 2011',
  2011,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'CuInSe/ZnS Core/Shell NIR Quantum Dots for Biomedical Imaging.',
  ARRAY['JH Park', 'C Dvoracek', 'KH Lee', 'JF Galloway', 'HE Bhang', 'MG Pomper', 'PC Searson.'],
  'Small 7, 22, (3148-3152), 2011',
  2011,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Direct Fabrication of Functional and Biofunctional Nanostructures Through Reactive Imprinting',
  ARRAY['C Subramani', 'N Cengiz', 'K Saha', 'T N Gevrek', 'X Yu', 'Y Jeong', 'A Bajaj', 'A Sanyal', 'VM Rotello'],
  'Adv. Mater., 23 (28), 3165–3169. 2011',
  2011,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Molecular-Scale Investigation of Tolane Disulfide Self-Assembled Monolayers on Au(111) Using Scanning Tunneling Microscopy',
  ARRAY['T Park', 'H Kang', 'Y Jeong', 'C Lee', 'Y Lee', 'J Noh'],
  'J. Nanosci. Nanotechnol. , 11 (5), 4333–4337. 2011',
  2011,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Recognition-Mediated Assembly of Quantum Dot Polymer Conjugates with Controlled Morphology',
  ARRAY['V Nandwana', 'C Subramani', 'S Eymur', 'Y-C Yeh', 'GY Tonga', 'M Tonga', 'Y Jeong', 'B Yang', 'M D Barnes', 'G Cooke', 'VM Rotello'],
  'Int. J. Mol. Sci., 12 (9), 6357–6366. 2011',
  2011,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Molecular Recognition Induced Self-Assembly of Diblock Copolymers: Microspheres to Vesicles',
  ARRAY['O Uzun', 'A Sanyal', 'Y Jeong', 'VM Rotello'],
  'Macromol. Biosci ., 10 (5), 481–487. 2010',
  2010,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Exploiting Nucleation and Growth in the Synthesis and Electrical Passivation of CdSe Quantum Dots.',
  ARRAY['JF Galloway', 'J Park', 'KH Lee', 'D Wirtz', 'PC Searson.'],
  'Science of Advanced Materials 1, 1, (93-100), 2009',
  2009,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tunable Layer-by-Layer Polyelectrolyte Platforms for Comparative Cell Assays',
  ARRAY['J Seo', 'H Lee', 'J Jeon', 'Y Jang', 'R Kim', 'K Char', 'JM Nam'],
  'Biomacromolecules , 10, 2254-2260, 2009',
  2009,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Restriction -Enzyme-Coded Gold-Nanoparticle Probes for Multiplexed DNA Detection',
  ARRAY['KJ Jang', 'H Lee', 'YH Park', 'HL Jin', 'JM Nam'],
  'Small , 5, 2665-2668, 2009',
  2009,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Synthesis of Cadmium Selenide Quantum Dots from a Non-Coordinating Solvent: Growth Kinetics and Particle Size Distribution.',
  ARRAY['J Park', 'KH Lee', 'JF Galloway', 'PC Searson.'],
  'The journal of physical chemistry. C, Nanomaterials and Interfaces 112, 46, (17849-17854), 2008',
  2008,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Control of Two-Dimensional Structure of Tolanethioacetate Self-Assembled Monolayers on Au(111)',
  ARRAY['Y Jeong', 'H Chung', 'J Noh'],
  'Colloids and Surfaces A: Physicochemical and Engineering Aspects , 313-314, 608–611. 2008',
  2008,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Formation of Ordered Self-Assembled Monolayers by Adsorption of Octylthiocyanates on Au(111)',
  ARRAY['Y Choi', 'Y Jeong', 'H Chung', 'E Ito', 'M Hara', 'J Noh'],
  'Langmuir , 24 (1), 91–96. 2008',
  2008,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Unique Domain Structure of Pi-Conjugated Tolanethioacetate Self-Assembled Monolayers on Au(111)',
  ARRAY['Y Jeong', 'S Kwon', 'Y Kang', 'C Lee', 'E Ito', 'M Hara', 'J Noh'],
  'Ultramicroscopy , 107 (10-11), 1000–1003. 2007',
  2007,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Two-Dimensional Alignment of Imogolite on a Solid Surface',
  ARRAY['S Park', 'Y Lee', 'B Kim', 'J Lee', 'Y Jeong', 'J Noh', 'A Takahara', 'D Sohn'],
  'Chem. Commun. , 28, 2917–2919. 2007',
  2007,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Formation and Domain Structure of Self-Assembled Monolayers by Adsorption of Tetrahydrothiophene on Au(111)',
  ARRAY['J Noh', 'Y Jeong', 'E Ito', 'M Hara'],
  'J. Phys. Chem. C , 111 (6), 2691–2695. 2007',
  2007,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'New Superlattice of Cyclohexanethiol Self-Assembled Monolayers on Au(111) Formed at a Low Solution Temperature',
  ARRAY['S Kwon', 'Y Jeong', 'Y Lee', 'J Noh'],
  'Chem. Lett. 36 (3), 390–391. 2007',
  2007,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Formation and Annealing Effect of Tolanethioacetate Self-Assembled Monolayers on Au (111)',
  ARRAY['Y Jeong', 'J W Han', 'N Kim', 'Y Lee', 'C Lee J Noh'],
  'Bull. Korean Chem. Soc., 28(12), 2445-2448. 2007',
  2007,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Microstructure and magnetic properties of electrodeposited CoPtP alloys.',
  ARRAY['HD Park', 'KH Lee', 'KH Kim', 'WY Jung.'],
  'Journal of applied physics 99, (08N305-1-08N305-3), 2006',
  2006,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Time-Dependent Phase Transition of Self-Assembled Monolayers Formed by Thioacetyl-Terminated Tolanes on Au(111)',
  ARRAY['Y Jeong', 'C Lee', 'E Ito', 'M Hara', 'J Noh'],
  'Japanese Journal of Applied Physics , 45 (7), 5906–5910. 2006',
  2006,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Structure and Electrochemical Behavior of Aromatic Thiol Self-Assembled Monolayers on Au (111)',
  ARRAY['J Noh', 'H Park', 'Y Jeong', 'S Kwon'],
  'Bull. Korean Chem. Soc. , 27(3), 403-406. 2006',
  2006,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Magnetoresistance behavior in electroplated and sputtered Bi thin films.',
  ARRAY['MH Jeun', 'KI Lee', 'KH Lee', 'DY Kim', 'JY Jang', 'KH Shin', 'SH Han', 'JK Ha', 'WY Lee.'],
  'Journal of Magnetism and Magnetic Materials 272-276, (e1455-e1457), 2004',
  2004,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Tailoring the magnetic properties of CoFePtP alloys with variations in iron content.',
  ARRAY['JH Choi', 'KH Kim', 'KH Lee', 'WY Jung.'],
  'Journal of Magnetism and Magnetic Materials 272-276, suppl.1, (E507-E508), 2004',
  2004,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Fabrication of multi-layered CoPtP alloy with high coercivity and squareness by electrochemical deposition.',
  ARRAY['KH Lee', 'SW Kang', 'KH Kim', 'WY Jung.'],
  'Journal of Magnetism and Magnetic Materials 272-276, Suppl.1, (E925-E926), 2004',
  2004,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Epitaxial growth and magnetic properties of electrochemically multilayered [CoPtP/Cu]n films.',
  ARRAY['KH Lee', 'KH Kim', 'WY Jung.'],
  'Electrochemistry Communications 6, 2, (115-119), 2004',
  2004,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Dimensional and microstructural dependence of the magnetic properties of electrodeposited Co(P) nanowire arrays.',
  ARRAY['KH Lee', 'IJ Kim', 'WY Jung.'],
  'Materials science forum 437-438, (45-48), 2003',
  2003,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Formation and characterization of self-ordered ferromagnetic nanowires by AC electroforming.',
  ARRAY['KH Lee', 'KH Kim', 'IJ Kim', 'WY Jung.'],
  'Materials Science Forum 437-438, (499-502), 2003',
  2003,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Effects of an external magnetic field on the perpendicular magnetic anisotropy of electrodeposited micro-patterned arrays.',
  ARRAY['WY Jung', 'JH Choi', 'KH Lee.'],
  'Materials Science 21, 1, (147-154), 2003',
  2003,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Correlation between magnetic properties of electrodeposited Co(P) and NH₄Cl concentrations in the electrolyte.',
  ARRAY['KH Lee', 'KH Kim', 'WY Jung.'],
  'Electrochemistry Communications 4, 8, (605-609), 2002',
  2002,
  false,
  ARRAY[]::TEXT[]
);

INSERT INTO publications (type, title, authors, venue, year, is_highlighted, tags) VALUES (
  'journal',
  'Magnetic properties and crystal structures of self-ordered ferromagnetic nanowires by ac electroforming.',
  ARRAY['KH Lee', 'HY Lee', 'WY Jung', 'WY Lee.'],
  'Journal of Applied Physics 91, 10, (8513-8515), 2002',
  2002,
  false,
  ARRAY[]::TEXT[]
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

-- news (WordPress BnML 아카이브, 2014-2016, 36개)
INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Invited Talk]: 2014 ACS Annual Conference, Dallas, TX", "en": "[Invited Talk]: 2014 ACS Annual Conference, Dallas, TX", "zh": "[Invited Talk]: 2014 ACS Annual Conference, Dallas, TX", "ja": "[Invited Talk]: 2014 ACS Annual Conference, Dallas, TX"}'::jsonb,
  '{"ko": "Mr. Gun Hyuk Jang had attended the 2014 ACS Nano Conference held in Dallas, TX, \nand had given an invited talk entitled as below: \n\"Systematic Nanotoxicity Ev﻿aluation via Zebrafish Models\"\n \nCongratulations to him for such accomplishment!", "en": "Mr. Gun Hyuk Jang had attended the 2014 ACS Nano Conference held in Dallas, TX, \nand had given an invited talk entitled as below: \n\"Systematic Nanotoxicity Ev﻿aluation via Zebrafish Models\"\n \nCongratulations to him for such accomplishment!", "zh": "Mr. Gun Hyuk Jang had attended the 2014 ACS Nano Conference held in Dallas, TX, \nand had given an invited talk entitled as below: \n\"Systematic Nanotoxicity Ev﻿aluation via Zebrafish Models\"\n \nCongratulations to him for such accomplishment!", "ja": "Mr. Gun Hyuk Jang had attended the 2014 ACS Nano Conference held in Dallas, TX, \nand had given an invited talk entitled as below: \n\"Systematic Nanotoxicity Ev﻿aluation via Zebrafish Models\"\n \nCongratulations to him for such accomplishment!"}'::jsonb,
  '2014-03-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: A New BnML Member", "en": "[Welcome]: A New BnML Member", "zh": "[Welcome]: A New BnML Member", "ja": "[Welcome]: A New BnML Member"}'::jsonb,
  '{"ko": "We are please to introduce our new BnML team member Mr. Hyun-June Jang. \n\nHe received his master degree at Kwangwoon University and plans to pursue his Ph.D. \ndegree in his future academic endeavor. He has published a number of scientific \narticles in journals including Advanced Materials and ACS Applied Materials & Interfaces.\n\nPlease, let us welcome Mr. Hyun-June Jang to BnML.", "en": "We are please to introduce our new BnML team member Mr. Hyun-June Jang. \n\nHe received his master degree at Kwangwoon University and plans to pursue his Ph.D. \ndegree in his future academic endeavor. He has published a number of scientific \narticles in journals including Advanced Materials and ACS Applied Materials & Interfaces.\n\nPlease, let us welcome Mr. Hyun-June Jang to BnML.", "zh": "We are please to introduce our new BnML team member Mr. Hyun-June Jang. \n\nHe received his master degree at Kwangwoon University and plans to pursue his Ph.D. \ndegree in his future academic endeavor. He has published a number of scientific \narticles in journals including Advanced Materials and ACS Applied Materials & Interfaces.\n\nPlease, let us welcome Mr. Hyun-June Jang to BnML.", "ja": "We are please to introduce our new BnML team member Mr. Hyun-June Jang. \n\nHe received his master degree at Kwangwoon University and plans to pursue his Ph.D. \ndegree in his future academic endeavor. He has published a number of scientific \narticles in journals including Advanced Materials and ACS Applied Materials & Interfaces.\n\nPlease, let us welcome Mr. Hyun-June Jang to BnML."}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Invited Talk]: Special Lecture at Colloquium, Kookmin University", "en": "[Invited Talk]: Special Lecture at Colloquium, Kookmin University", "zh": "[Invited Talk]: Special Lecture at Colloquium, Kookmin University", "ja": "[Invited Talk]: Special Lecture at Colloquium, Kookmin University"}'::jsonb,
  '{"ko": "Dr. Kwan Hyi Lee was invited to give a special lecture at a colloquium held by Kookmin \nUniversity.  He gave a lecture, \"Nano and Electronic Physics & Nanomedicine\", to \nthe students of Kookmin University for which the colloquium was held.", "en": "Dr. Kwan Hyi Lee was invited to give a special lecture at a colloquium held by Kookmin \nUniversity.  He gave a lecture, \"Nano and Electronic Physics & Nanomedicine\", to \nthe students of Kookmin University for which the colloquium was held.", "zh": "Dr. Kwan Hyi Lee was invited to give a special lecture at a colloquium held by Kookmin \nUniversity.  He gave a lecture, \"Nano and Electronic Physics & Nanomedicine\", to \nthe students of Kookmin University for which the colloquium was held.", "ja": "Dr. Kwan Hyi Lee was invited to give a special lecture at a colloquium held by Kookmin \nUniversity.  He gave a lecture, \"Nano and Electronic Physics & Nanomedicine\", to \nthe students of Kookmin University for which the colloquium was held."}'::jsonb,
  '2014-03-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: The 9th Spring Symposium of Korean Society for BIOMATERIALS, Gwangju, Republic of Korea", "en": "[Conference]: The 9th Spring Symposium of Korean Society for BIOMATERIALS, Gwangju, Republic of Korea", "zh": "[Conference]: The 9th Spring Symposium of Korean Society for BIOMATERIALS, Gwangju, Republic of Korea", "ja": "[Conference]: The 9th Spring Symposium of Korean Society for BIOMATERIALS, Gwangju, Republic of Korea"}'::jsonb,
  '{"ko": "Ms. Hyun Jung Kim attended the 9th Spring Symposium of Korean Society for \nBIOMATERIALS held in Gwangju, Republic of Korea. Her presentation entitled, \n\"M13 Phage Display 기술을 활용한 암 표적 지향형 Targeting Moiety 개발\".\n\nCongratulation on her achievement.", "en": "Ms. Hyun Jung Kim attended the 9th Spring Symposium of Korean Society for \nBIOMATERIALS held in Gwangju, Republic of Korea. Her presentation entitled, \n\"M13 Phage Display 기술을 활용한 암 표적 지향형 Targeting Moiety 개발\".\n\nCongratulation on her achievement.", "zh": "Ms. Hyun Jung Kim attended the 9th Spring Symposium of Korean Society for \nBIOMATERIALS held in Gwangju, Republic of Korea. Her presentation entitled, \n\"M13 Phage Display 기술을 활용한 암 표적 지향형 Targeting Moiety 개발\".\n\nCongratulation on her achievement.", "ja": "Ms. Hyun Jung Kim attended the 9th Spring Symposium of Korean Society for \nBIOMATERIALS held in Gwangju, Republic of Korea. Her presentation entitled, \n\"M13 Phage Display 기술을 활용한 암 표적 지향형 Targeting Moiety 개발\".\n\nCongratulation on her achievement."}'::jsonb,
  '2014-03-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: 2014 Spring Symposium of The Korean BioChip Society, Jeju Island, Republic of Korea", "en": "[Conference]: 2014 Spring Symposium of The Korean BioChip Society, Jeju Island, Republic of Korea", "zh": "[Conference]: 2014 Spring Symposium of The Korean BioChip Society, Jeju Island, Republic of Korea", "ja": "[Conference]: 2014 Spring Symposium of The Korean BioChip Society, Jeju Island, Republic of Korea"}'::jsonb,
  '{"ko": "2014 Autumn Symposium of The Korean BioChip Society was held in Jeju Island, \nRepublic of Korea. Four members of BnML had presented their posters with the \ncorresponding titles as followings:\n\nMr. Gun Hyuk Jang\n\"In-vivo Toxicity of Magnetic Nanoparticles in Developing Zebrafish\"\n\nMr. Benedict Kang \n\"T7 Bacteriophage-based Biosensor: a Potential Device for Pathogen Surveillance\"\n\nMs. Hyun Jung Kim\n\"Targeted Quantitative Biomarker Analysis via Improvement in Binding Affinity of \nFerritin-based Nanoconstructs\"\n\nMr. Sung Wook Park\n\"Effects of Mg Cations in MgxMnf-xFe2O4 Superparamagnetic Nanoparticles on the \nMagnetic and AC Heating Properties and Biocompatibility for Hyperthermia Agent \nApplication\"", "en": "2014 Autumn Symposium of The Korean BioChip Society was held in Jeju Island, \nRepublic of Korea. Four members of BnML had presented their posters with the \ncorresponding titles as followings:\n\nMr. Gun Hyuk Jang\n\"In-vivo Toxicity of Magnetic Nanoparticles in Developing Zebrafish\"\n\nMr. Benedict Kang \n\"T7 Bacteriophage-based Biosensor: a Potential Device for Pathogen Surveillance\"\n\nMs. Hyun Jung Kim\n\"Targeted Quantitative Biomarker Analysis via Improvement in Binding Affinity of \nFerritin-based Nanoconstructs\"\n\nMr. Sung Wook Park\n\"Effects of Mg Cations in MgxMnf-xFe2O4 Superparamagnetic Nanoparticles on the \nMagnetic and AC Heating Properties and Biocompatibility for Hyperthermia Agent \nApplication\"", "zh": "2014 Autumn Symposium of The Korean BioChip Society was held in Jeju Island, \nRepublic of Korea. Four members of BnML had presented their posters with the \ncorresponding titles as followings:\n\nMr. Gun Hyuk Jang\n\"In-vivo Toxicity of Magnetic Nanoparticles in Developing Zebrafish\"\n\nMr. Benedict Kang \n\"T7 Bacteriophage-based Biosensor: a Potential Device for Pathogen Surveillance\"\n\nMs. Hyun Jung Kim\n\"Targeted Quantitative Biomarker Analysis via Improvement in Binding Affinity of \nFerritin-based Nanoconstructs\"\n\nMr. Sung Wook Park\n\"Effects of Mg Cations in MgxMnf-xFe2O4 Superparamagnetic Nanoparticles on the \nMagnetic and AC Heating Properties and Biocompatibility for Hyperthermia Agent \nApplication\"", "ja": "2014 Autumn Symposium of The Korean BioChip Society was held in Jeju Island, \nRepublic of Korea. Four members of BnML had presented their posters with the \ncorresponding titles as followings:\n\nMr. Gun Hyuk Jang\n\"In-vivo Toxicity of Magnetic Nanoparticles in Developing Zebrafish\"\n\nMr. Benedict Kang \n\"T7 Bacteriophage-based Biosensor: a Potential Device for Pathogen Surveillance\"\n\nMs. Hyun Jung Kim\n\"Targeted Quantitative Biomarker Analysis via Improvement in Binding Affinity of \nFerritin-based Nanoconstructs\"\n\nMr. Sung Wook Park\n\"Effects of Mg Cations in MgxMnf-xFe2O4 Superparamagnetic Nanoparticles on the \nMagnetic and AC Heating Properties and Biocompatibility for Hyperthermia Agent \nApplication\""}'::jsonb,
  '2014-04-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: 2014 Spring Symposium of The Korean Institute of Metals and Materials, Daegu, Republic of Korea", "en": "[Conference]: 2014 Spring Symposium of The Korean Institute of Metals and Materials, Daegu, Republic of Korea", "zh": "[Conference]: 2014 Spring Symposium of The Korean Institute of Metals and Materials, Daegu, Republic of Korea", "ja": "[Conference]: 2014 Spring Symposium of The Korean Institute of Metals and Materials, Daegu, Republic of Korea"}'::jsonb,
  '{"ko": "Mr. Gun Hyuk Jang attended 2014 Autumn Symposium of The Korean Institute of Metals \nand Materials held in Daegu, Republic of Korea.\n \nHe gave an oral presentation entitled, \"In-vivo Toxicity Evaluation for Nanophosphors as an Alternative to Quantum Dots in Developing Zebrafish Embryos\".\n \nCongratulation on his achievement.", "en": "Mr. Gun Hyuk Jang attended 2014 Autumn Symposium of The Korean Institute of Metals \nand Materials held in Daegu, Republic of Korea.\n \nHe gave an oral presentation entitled, \"In-vivo Toxicity Evaluation for Nanophosphors as an Alternative to Quantum Dots in Developing Zebrafish Embryos\".\n \nCongratulation on his achievement.", "zh": "Mr. Gun Hyuk Jang attended 2014 Autumn Symposium of The Korean Institute of Metals \nand Materials held in Daegu, Republic of Korea.\n \nHe gave an oral presentation entitled, \"In-vivo Toxicity Evaluation for Nanophosphors as an Alternative to Quantum Dots in Developing Zebrafish Embryos\".\n \nCongratulation on his achievement.", "ja": "Mr. Gun Hyuk Jang attended 2014 Autumn Symposium of The Korean Institute of Metals \nand Materials held in Daegu, Republic of Korea.\n \nHe gave an oral presentation entitled, \"In-vivo Toxicity Evaluation for Nanophosphors as an Alternative to Quantum Dots in Developing Zebrafish Embryos\".\n \nCongratulation on his achievement."}'::jsonb,
  '2014-04-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Dr. Jeun in Who''s Who in the World 2015", "en": "[Honors]: Dr. Jeun in Who''s Who in the World 2015", "zh": "[Honors]: Dr. Jeun in Who''s Who in the World 2015", "ja": "[Honors]: Dr. Jeun in Who''s Who in the World 2015"}'::jsonb,
  '{"ko": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2015 (32nd Edition) which is scheduled to be\npublished in November 2014.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "en": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2015 (32nd Edition) which is scheduled to be\npublished in November 2014.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "zh": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2015 (32nd Edition) which is scheduled to be\npublished in November 2014.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "ja": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2015 (32nd Edition) which is scheduled to be\npublished in November 2014.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement."}'::jsonb,
  '2015-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Mr. Hoyoung Park''s Best Paper Award from Korea University of Science and Technology", "en": "[Honors]: Mr. Hoyoung Park''s Best Paper Award from Korea University of Science and Technology", "zh": "[Honors]: Mr. Hoyoung Park''s Best Paper Award from Korea University of Science and Technology", "ja": "[Honors]: Mr. Hoyoung Park''s Best Paper Award from Korea University of Science and Technology"}'::jsonb,
  '{"ko": "I am pleased to announce that Mr. Hoyoung Park has been awarded with Best Paper Award from Korea University of Science and Technology (UST) for his outstanding academic and research achievements.\n\nCongratulations.", "en": "I am pleased to announce that Mr. Hoyoung Park has been awarded with Best Paper Award from Korea University of Science and Technology (UST) for his outstanding academic and research achievements.\n\nCongratulations.", "zh": "I am pleased to announce that Mr. Hoyoung Park has been awarded with Best Paper Award from Korea University of Science and Technology (UST) for his outstanding academic and research achievements.\n\nCongratulations.", "ja": "I am pleased to announce that Mr. Hoyoung Park has been awarded with Best Paper Award from Korea University of Science and Technology (UST) for his outstanding academic and research achievements.\n\nCongratulations."}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Mr. Gun Hyuk Jang''s Overseas Travel Award from Korea University of Science and Technology", "en": "[Honors]: Mr. Gun Hyuk Jang''s Overseas Travel Award from Korea University of Science and Technology", "zh": "[Honors]: Mr. Gun Hyuk Jang''s Overseas Travel Award from Korea University of Science and Technology", "ja": "[Honors]: Mr. Gun Hyuk Jang''s Overseas Travel Award from Korea University of Science and Technology"}'::jsonb,
  '{"ko": "As of March 31st, 2014, Mr. Gun Hyuk Jang has been selected as one of the recipients\nof Overseas Travel Award from  Korea University of Science and Technology.\n\nWith this financial support, he will attend a conference which will be held in Italy in mid June for his oral presentation.\n\nCongratulations!", "en": "As of March 31st, 2014, Mr. Gun Hyuk Jang has been selected as one of the recipients\nof Overseas Travel Award from  Korea University of Science and Technology.\n\nWith this financial support, he will attend a conference which will be held in Italy in mid June for his oral presentation.\n\nCongratulations!", "zh": "As of March 31st, 2014, Mr. Gun Hyuk Jang has been selected as one of the recipients\nof Overseas Travel Award from  Korea University of Science and Technology.\n\nWith this financial support, he will attend a conference which will be held in Italy in mid June for his oral presentation.\n\nCongratulations!", "ja": "As of March 31st, 2014, Mr. Gun Hyuk Jang has been selected as one of the recipients\nof Overseas Travel Award from  Korea University of Science and Technology.\n\nWith this financial support, he will attend a conference which will be held in Italy in mid June for his oral presentation.\n\nCongratulations!"}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: CIMTEC 2014 - 10th International Conference on Medical Applications of Novel Biomaterials and Nano-biotechnology,", "en": "[Conference]: CIMTEC 2014 - 10th International Conference on Medical Applications of Novel Biomaterials and Nano-biotechnology,", "zh": "[Conference]: CIMTEC 2014 - 10th International Conference on Medical Applications of Novel Biomaterials and Nano-biotechnology,", "ja": "[Conference]: CIMTEC 2014 - 10th International Conference on Medical Applications of Novel Biomaterials and Nano-biotechnology,"}'::jsonb,
  '{"ko": "Dr. Kwan Hyi Lee and Mr. Gun Hyuk Jang have attended and given talks at the 10th International Conference\non Medical Applications of Novel Biomaterials and Nano-biotechnology, one of the symposia of CIMTEC 2014, held in Montecatini Terme, Italy.", "en": "Dr. Kwan Hyi Lee and Mr. Gun Hyuk Jang have attended and given talks at the 10th International Conference\non Medical Applications of Novel Biomaterials and Nano-biotechnology, one of the symposia of CIMTEC 2014, held in Montecatini Terme, Italy.", "zh": "Dr. Kwan Hyi Lee and Mr. Gun Hyuk Jang have attended and given talks at the 10th International Conference\non Medical Applications of Novel Biomaterials and Nano-biotechnology, one of the symposia of CIMTEC 2014, held in Montecatini Terme, Italy.", "ja": "Dr. Kwan Hyi Lee and Mr. Gun Hyuk Jang have attended and given talks at the 10th International Conference\non Medical Applications of Novel Biomaterials and Nano-biotechnology, one of the symposia of CIMTEC 2014, held in Montecatini Terme, Italy."}'::jsonb,
  '2014-06-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Essay Contest 2014 (Best Lectures in UST) Award", "en": "[Honors]: Essay Contest 2014 (Best Lectures in UST) Award", "zh": "[Honors]: Essay Contest 2014 (Best Lectures in UST) Award", "ja": "[Honors]: Essay Contest 2014 (Best Lectures in UST) Award"}'::jsonb,
  '{"ko": "I am pleased to announce that University of Science and Technology (UST) has awarded \nMr. Gun Hyuk Jang for winning a second place in Essay Contest 2014  (Best Lectures in \nUST) for writing an essay about his experience in the \"Nanomedicine\" course lectured by Dr. Kwan Hyi Lee and Dr. Minhong Jeun past semester.  \n\nThe award ceremony will be held at 4 pm, June 30th in UST science hall at Daejeon, Korea.\n\nCongratulations on his achievement.", "en": "I am pleased to announce that University of Science and Technology (UST) has awarded \nMr. Gun Hyuk Jang for winning a second place in Essay Contest 2014  (Best Lectures in \nUST) for writing an essay about his experience in the \"Nanomedicine\" course lectured by Dr. Kwan Hyi Lee and Dr. Minhong Jeun past semester.  \n\nThe award ceremony will be held at 4 pm, June 30th in UST science hall at Daejeon, Korea.\n\nCongratulations on his achievement.", "zh": "I am pleased to announce that University of Science and Technology (UST) has awarded \nMr. Gun Hyuk Jang for winning a second place in Essay Contest 2014  (Best Lectures in \nUST) for writing an essay about his experience in the \"Nanomedicine\" course lectured by Dr. Kwan Hyi Lee and Dr. Minhong Jeun past semester.  \n\nThe award ceremony will be held at 4 pm, June 30th in UST science hall at Daejeon, Korea.\n\nCongratulations on his achievement.", "ja": "I am pleased to announce that University of Science and Technology (UST) has awarded \nMr. Gun Hyuk Jang for winning a second place in Essay Contest 2014  (Best Lectures in \nUST) for writing an essay about his experience in the \"Nanomedicine\" course lectured by Dr. Kwan Hyi Lee and Dr. Minhong Jeun past semester.  \n\nThe award ceremony will be held at 4 pm, June 30th in UST science hall at Daejeon, Korea.\n\nCongratulations on his achievement."}'::jsonb,
  '2014-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Invited Talk]: 2014 International Symposium & Annual Meeting of the Korean Society for Microbiology and B", "en": "[Invited Talk]: 2014 International Symposium & Annual Meeting of the Korean Society for Microbiology and B", "zh": "[Invited Talk]: 2014 International Symposium & Annual Meeting of the Korean Society for Microbiology and B", "ja": "[Invited Talk]: 2014 International Symposium & Annual Meeting of the Korean Society for Microbiology and B"}'::jsonb,
  '{"ko": "Dr. Kwan Hyi Lee has given an invited lecture at 2014 International Symposium & Annual \nMeeting of the Korean Society for Microbiology and Biotechnology held in BEXCO, Busan, South Korea. His lecture entitles as below:\n\n\"Bacteriophage-based Biosensors: Potential Surveillance of Biohazard Agents\"", "en": "Dr. Kwan Hyi Lee has given an invited lecture at 2014 International Symposium & Annual \nMeeting of the Korean Society for Microbiology and Biotechnology held in BEXCO, Busan, South Korea. His lecture entitles as below:\n\n\"Bacteriophage-based Biosensors: Potential Surveillance of Biohazard Agents\"", "zh": "Dr. Kwan Hyi Lee has given an invited lecture at 2014 International Symposium & Annual \nMeeting of the Korean Society for Microbiology and Biotechnology held in BEXCO, Busan, South Korea. His lecture entitles as below:\n\n\"Bacteriophage-based Biosensors: Potential Surveillance of Biohazard Agents\"", "ja": "Dr. Kwan Hyi Lee has given an invited lecture at 2014 International Symposium & Annual \nMeeting of the Korean Society for Microbiology and Biotechnology held in BEXCO, Busan, South Korea. His lecture entitles as below:\n\n\"Bacteriophage-based Biosensors: Potential Surveillance of Biohazard Agents\""}'::jsonb,
  '2014-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: Summer Intern, Soobin Ahn", "en": "[Welcome]: Summer Intern, Soobin Ahn", "zh": "[Welcome]: Summer Intern, Soobin Ahn", "ja": "[Welcome]: Summer Intern, Soobin Ahn"}'::jsonb,
  '{"ko": "BnML welcomes Soobin Ahn from University of Maryland.\nShe will learn and get trained during her internship program at BnML.", "en": "BnML welcomes Soobin Ahn from University of Maryland.\nShe will learn and get trained during her internship program at BnML.", "zh": "BnML welcomes Soobin Ahn from University of Maryland.\nShe will learn and get trained during her internship program at BnML.", "ja": "BnML welcomes Soobin Ahn from University of Maryland.\nShe will learn and get trained during her internship program at BnML."}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes a new BnML member, Keon Yong Lee", "en": "[Welcome]: BnML welcomes a new BnML member, Keon Yong Lee", "zh": "[Welcome]: BnML welcomes a new BnML member, Keon Yong Lee", "ja": "[Welcome]: BnML welcomes a new BnML member, Keon Yong Lee"}'::jsonb,
  '{"ko": "Keon Yong Lee has joined BnML starting from July 16th, 2014.\nHe has received his undergraduate education from Northwestern University in Chicago, IL.\n\nPlease, let us welcome the new BnML team member!!!", "en": "Keon Yong Lee has joined BnML starting from July 16th, 2014.\nHe has received his undergraduate education from Northwestern University in Chicago, IL.\n\nPlease, let us welcome the new BnML team member!!!", "zh": "Keon Yong Lee has joined BnML starting from July 16th, 2014.\nHe has received his undergraduate education from Northwestern University in Chicago, IL.\n\nPlease, let us welcome the new BnML team member!!!", "ja": "Keon Yong Lee has joined BnML starting from July 16th, 2014.\nHe has received his undergraduate education from Northwestern University in Chicago, IL.\n\nPlease, let us welcome the new BnML team member!!!"}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Outstanding Research Adviser Award", "en": "[Honors]: Outstanding Research Adviser Award", "zh": "[Honors]: Outstanding Research Adviser Award", "ja": "[Honors]: Outstanding Research Adviser Award"}'::jsonb,
  '{"ko": "Korea University of Science and Technology (UST) has awarded Outstanding Research Adviser \naward to  Dr. Kwan Hyi Lee.\n\nCongratulations!", "en": "Korea University of Science and Technology (UST) has awarded Outstanding Research Adviser \naward to  Dr. Kwan Hyi Lee.\n\nCongratulations!", "zh": "Korea University of Science and Technology (UST) has awarded Outstanding Research Adviser \naward to  Dr. Kwan Hyi Lee.\n\nCongratulations!", "ja": "Korea University of Science and Technology (UST) has awarded Outstanding Research Adviser \naward to  Dr. Kwan Hyi Lee.\n\nCongratulations!"}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: 59th Annual Magnetism and Magnetic Materials (MMM) Conference, Honolulu, Hawaii, USA", "en": "[Conference]: 59th Annual Magnetism and Magnetic Materials (MMM) Conference, Honolulu, Hawaii, USA", "zh": "[Conference]: 59th Annual Magnetism and Magnetic Materials (MMM) Conference, Honolulu, Hawaii, USA", "ja": "[Conference]: 59th Annual Magnetism and Magnetic Materials (MMM) Conference, Honolulu, Hawaii, USA"}'::jsonb,
  '{"ko": "Dr. Minhong Jeun will attend the upcoming 59th Annual Magnetism and Magnetic Materials (MMM) Conference that will be held in Honolulu, Hawaii, USA.  The conference will start on November 13th, 2014 and continue until the following 7th of the month.  \n\nAt the conference, he will present his research entitled, \"Improvement of Heat Shock Proteins 72 Induction using Nanofluid Hyperthermia for Ocular Neuroprotection in Glaucoma\" to the attendees of the conference.", "en": "Dr. Minhong Jeun will attend the upcoming 59th Annual Magnetism and Magnetic Materials (MMM) Conference that will be held in Honolulu, Hawaii, USA.  The conference will start on November 13th, 2014 and continue until the following 7th of the month.  \n\nAt the conference, he will present his research entitled, \"Improvement of Heat Shock Proteins 72 Induction using Nanofluid Hyperthermia for Ocular Neuroprotection in Glaucoma\" to the attendees of the conference.", "zh": "Dr. Minhong Jeun will attend the upcoming 59th Annual Magnetism and Magnetic Materials (MMM) Conference that will be held in Honolulu, Hawaii, USA.  The conference will start on November 13th, 2014 and continue until the following 7th of the month.  \n\nAt the conference, he will present his research entitled, \"Improvement of Heat Shock Proteins 72 Induction using Nanofluid Hyperthermia for Ocular Neuroprotection in Glaucoma\" to the attendees of the conference.", "ja": "Dr. Minhong Jeun will attend the upcoming 59th Annual Magnetism and Magnetic Materials (MMM) Conference that will be held in Honolulu, Hawaii, USA.  The conference will start on November 13th, 2014 and continue until the following 7th of the month.  \n\nAt the conference, he will present his research entitled, \"Improvement of Heat Shock Proteins 72 Induction using Nanofluid Hyperthermia for Ocular Neuroprotection in Glaucoma\" to the attendees of the conference."}'::jsonb,
  '2015-01-20',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: 49th Anniversary of the Foundation of KIST Excellence Research Award", "en": "[Honors]: 49th Anniversary of the Foundation of KIST Excellence Research Award", "zh": "[Honors]: 49th Anniversary of the Foundation of KIST Excellence Research Award", "ja": "[Honors]: 49th Anniversary of the Foundation of KIST Excellence Research Award"}'::jsonb,
  '{"ko": "KIST has just announced that Mr. Gun Hyuk Jang is the recipient of the excellence research award for graduate students at KIST.\n\nPlease, join us to congratulate Mr. Jang for his achievement!", "en": "KIST has just announced that Mr. Gun Hyuk Jang is the recipient of the excellence research award for graduate students at KIST.\n\nPlease, join us to congratulate Mr. Jang for his achievement!", "zh": "KIST has just announced that Mr. Gun Hyuk Jang is the recipient of the excellence research award for graduate students at KIST.\n\nPlease, join us to congratulate Mr. Jang for his achievement!", "ja": "KIST has just announced that Mr. Gun Hyuk Jang is the recipient of the excellence research award for graduate students at KIST.\n\nPlease, join us to congratulate Mr. Jang for his achievement!"}'::jsonb,
  '2015-02-03',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes a new BnML member, Yukyung Shin", "en": "[Welcome]: BnML welcomes a new BnML member, Yukyung Shin", "zh": "[Welcome]: BnML welcomes a new BnML member, Yukyung Shin", "ja": "[Welcome]: BnML welcomes a new BnML member, Yukyung Shin"}'::jsonb,
  '{"ko": "Yukyung Shin has joined BnML in March 9th, 2015. \nShe is currently an undergraduate student at the University of Seoul and joined BnML to pursue her interest in the field of biomedical engineering.\n\nPlease, welcome Yookyung as our team member!", "en": "Yukyung Shin has joined BnML in March 9th, 2015. \nShe is currently an undergraduate student at the University of Seoul and joined BnML to pursue her interest in the field of biomedical engineering.\n\nPlease, welcome Yookyung as our team member!", "zh": "Yukyung Shin has joined BnML in March 9th, 2015. \nShe is currently an undergraduate student at the University of Seoul and joined BnML to pursue her interest in the field of biomedical engineering.\n\nPlease, welcome Yookyung as our team member!", "ja": "Yukyung Shin has joined BnML in March 9th, 2015. \nShe is currently an undergraduate student at the University of Seoul and joined BnML to pursue her interest in the field of biomedical engineering.\n\nPlease, welcome Yookyung as our team member!"}'::jsonb,
  '2015-03-10',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Best Poster Award at the NANO KOREA 2015 of The 13th International Nanotech Symposium.", "en": "[Honors]: Best Poster Award at the NANO KOREA 2015 of The 13th International Nanotech Symposium.", "zh": "[Honors]: Best Poster Award at the NANO KOREA 2015 of The 13th International Nanotech Symposium.", "ja": "[Honors]: Best Poster Award at the NANO KOREA 2015 of The 13th International Nanotech Symposium."}'::jsonb,
  '{"ko": "Congradulations to Mr. Sungwook Park for his Best Poster Award at the NANO KOREA 2015, which was held in COEX, Seoul.\n\nThe title of the poster was \"Biocompatibility of Superparamagnetic Ferrite Nanoparticles for in-vivo Hyperthermia Agent Applications\".", "en": "Congradulations to Mr. Sungwook Park for his Best Poster Award at the NANO KOREA 2015, which was held in COEX, Seoul.\n\nThe title of the poster was \"Biocompatibility of Superparamagnetic Ferrite Nanoparticles for in-vivo Hyperthermia Agent Applications\".", "zh": "Congradulations to Mr. Sungwook Park for his Best Poster Award at the NANO KOREA 2015, which was held in COEX, Seoul.\n\nThe title of the poster was \"Biocompatibility of Superparamagnetic Ferrite Nanoparticles for in-vivo Hyperthermia Agent Applications\".", "ja": "Congradulations to Mr. Sungwook Park for his Best Poster Award at the NANO KOREA 2015, which was held in COEX, Seoul.\n\nThe title of the poster was \"Biocompatibility of Superparamagnetic Ferrite Nanoparticles for in-vivo Hyperthermia Agent Applications\"."}'::jsonb,
  '2015-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Outstanding Research Adviser Award", "en": "[Honors]: Outstanding Research Adviser Award", "zh": "[Honors]: Outstanding Research Adviser Award", "ja": "[Honors]: Outstanding Research Adviser Award"}'::jsonb,
  '{"ko": "Many congratulations to Dr. Kwan Hyi Lee for receiving Outstanding Academic Adviser Award from Korea University Science and Technology (UST) in recognition of his achievement!", "en": "Many congratulations to Dr. Kwan Hyi Lee for receiving Outstanding Academic Adviser Award from Korea University Science and Technology (UST) in recognition of his achievement!", "zh": "Many congratulations to Dr. Kwan Hyi Lee for receiving Outstanding Academic Adviser Award from Korea University Science and Technology (UST) in recognition of his achievement!", "ja": "Many congratulations to Dr. Kwan Hyi Lee for receiving Outstanding Academic Adviser Award from Korea University Science and Technology (UST) in recognition of his achievement!"}'::jsonb,
  '2015-08-25',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Best Paper Award from Korea University of Science and Technology", "en": "[Honors]: Best Paper Award from Korea University of Science and Technology", "zh": "[Honors]: Best Paper Award from Korea University of Science and Technology", "ja": "[Honors]: Best Paper Award from Korea University of Science and Technology"}'::jsonb,
  '{"ko": "Mr. Gun Hyuk Jang has recieved Best Paper Award from Korea University of Science and Technology (UST) in recognition of his outstanding research achievements.\n\nCongratulations!", "en": "Mr. Gun Hyuk Jang has recieved Best Paper Award from Korea University of Science and Technology (UST) in recognition of his outstanding research achievements.\n\nCongratulations!", "zh": "Mr. Gun Hyuk Jang has recieved Best Paper Award from Korea University of Science and Technology (UST) in recognition of his outstanding research achievements.\n\nCongratulations!", "ja": "Mr. Gun Hyuk Jang has recieved Best Paper Award from Korea University of Science and Technology (UST) in recognition of his outstanding research achievements.\n\nCongratulations!"}'::jsonb,
  '2015-08-25',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: \"2000 Outstanding Intellectuals of the 21st Century 9th Edition\" of International Biological Centre", "en": "[Honors]: \"2000 Outstanding Intellectuals of the 21st Century 9th Edition\" of International Biological Centre", "zh": "[Honors]: \"2000 Outstanding Intellectuals of the 21st Century 9th Edition\" of International Biological Centre", "ja": "[Honors]: \"2000 Outstanding Intellectuals of the 21st Century 9th Edition\" of International Biological Centre"}'::jsonb,
  '{"ko": "Dr. Jeun has been included in 2000 Outstanding Intellectuals of the 21st Century of International Biographical Centre. \n\nCongratulations on his inclusion!", "en": "Dr. Jeun has been included in 2000 Outstanding Intellectuals of the 21st Century of International Biographical Centre. \n\nCongratulations on his inclusion!", "zh": "Dr. Jeun has been included in 2000 Outstanding Intellectuals of the 21st Century of International Biographical Centre. \n\nCongratulations on his inclusion!", "ja": "Dr. Jeun has been included in 2000 Outstanding Intellectuals of the 21st Century of International Biographical Centre. \n\nCongratulations on his inclusion!"}'::jsonb,
  '2015-08-31',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes new members", "en": "[Welcome]: BnML welcomes new members", "zh": "[Welcome]: BnML welcomes new members", "ja": "[Welcome]: BnML welcomes new members"}'::jsonb,
  '{"ko": "We welcome the new team members, Mr. Yongdeok Kim, Mr. Dongjin Lee, and Mr. Young-Hoon Kim.\n\nMr. Yongdeok Kim is from Hanyang University, Seoul, from which he received his undergraduate and master degrees.\nHis background is material engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nMr. Dongjin Lee went to Kyungpook National University, Daegu. He received his undergraduate and master degrees from the University.\nHe has research background in bioengineering and pharmarcology.\nHis hobbies are play the guitar and watching TV for his leisure time.\n\nMr. Young-Hoon Kim is from Seoul National University and studied material science and engineering for his undergraduate degree.\nHis favorite sport is basket ball.\n\nPlease, let us welcome the new team members.", "en": "We welcome the new team members, Mr. Yongdeok Kim, Mr. Dongjin Lee, and Mr. Young-Hoon Kim.\n\nMr. Yongdeok Kim is from Hanyang University, Seoul, from which he received his undergraduate and master degrees.\nHis background is material engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nMr. Dongjin Lee went to Kyungpook National University, Daegu. He received his undergraduate and master degrees from the University.\nHe has research background in bioengineering and pharmarcology.\nHis hobbies are play the guitar and watching TV for his leisure time.\n\nMr. Young-Hoon Kim is from Seoul National University and studied material science and engineering for his undergraduate degree.\nHis favorite sport is basket ball.\n\nPlease, let us welcome the new team members.", "zh": "We welcome the new team members, Mr. Yongdeok Kim, Mr. Dongjin Lee, and Mr. Young-Hoon Kim.\n\nMr. Yongdeok Kim is from Hanyang University, Seoul, from which he received his undergraduate and master degrees.\nHis background is material engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nMr. Dongjin Lee went to Kyungpook National University, Daegu. He received his undergraduate and master degrees from the University.\nHe has research background in bioengineering and pharmarcology.\nHis hobbies are play the guitar and watching TV for his leisure time.\n\nMr. Young-Hoon Kim is from Seoul National University and studied material science and engineering for his undergraduate degree.\nHis favorite sport is basket ball.\n\nPlease, let us welcome the new team members.", "ja": "We welcome the new team members, Mr. Yongdeok Kim, Mr. Dongjin Lee, and Mr. Young-Hoon Kim.\n\nMr. Yongdeok Kim is from Hanyang University, Seoul, from which he received his undergraduate and master degrees.\nHis background is material engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nMr. Dongjin Lee went to Kyungpook National University, Daegu. He received his undergraduate and master degrees from the University.\nHe has research background in bioengineering and pharmarcology.\nHis hobbies are play the guitar and watching TV for his leisure time.\n\nMr. Young-Hoon Kim is from Seoul National University and studied material science and engineering for his undergraduate degree.\nHis favorite sport is basket ball.\n\nPlease, let us welcome the new team members."}'::jsonb,
  '2015-09-08',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes Dr. Hyojin Lee, a new member", "en": "[Welcome]: BnML welcomes Dr. Hyojin Lee, a new member", "zh": "[Welcome]: BnML welcomes Dr. Hyojin Lee, a new member", "ja": "[Welcome]: BnML welcomes Dr. Hyojin Lee, a new member"}'::jsonb,
  '{"ko": "We welcome Dr. Hyojin Lee as a new team member of BnML.\n\nDr. Hyojin Lee received her Ph.D. degree in Chemistry at Seoul National University.\n\nDuring her postdoctoral experience, she worked with Prof. Teri W. Odom of Department of Chemistry at Northwestern University.\n\nHer primary research interest is cancer biology with nanotechnology approach.\n\nPlease, join us to welcome her to BnML!", "en": "We welcome Dr. Hyojin Lee as a new team member of BnML.\n\nDr. Hyojin Lee received her Ph.D. degree in Chemistry at Seoul National University.\n\nDuring her postdoctoral experience, she worked with Prof. Teri W. Odom of Department of Chemistry at Northwestern University.\n\nHer primary research interest is cancer biology with nanotechnology approach.\n\nPlease, join us to welcome her to BnML!", "zh": "We welcome Dr. Hyojin Lee as a new team member of BnML.\n\nDr. Hyojin Lee received her Ph.D. degree in Chemistry at Seoul National University.\n\nDuring her postdoctoral experience, she worked with Prof. Teri W. Odom of Department of Chemistry at Northwestern University.\n\nHer primary research interest is cancer biology with nanotechnology approach.\n\nPlease, join us to welcome her to BnML!", "ja": "We welcome Dr. Hyojin Lee as a new team member of BnML.\n\nDr. Hyojin Lee received her Ph.D. degree in Chemistry at Seoul National University.\n\nDuring her postdoctoral experience, she worked with Prof. Teri W. Odom of Department of Chemistry at Northwestern University.\n\nHer primary research interest is cancer biology with nanotechnology approach.\n\nPlease, join us to welcome her to BnML!"}'::jsonb,
  '2015-09-10',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Dr. Jeun in Who''s Who in the World 2016", "en": "[Honors]: Dr. Jeun in Who''s Who in the World 2016", "zh": "[Honors]: Dr. Jeun in Who''s Who in the World 2016", "ja": "[Honors]: Dr. Jeun in Who''s Who in the World 2016"}'::jsonb,
  '{"ko": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2016 (33rd Edition) which is scheduled to be\npublished in November 2015.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "en": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2016 (33rd Edition) which is scheduled to be\npublished in November 2015.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "zh": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2016 (33rd Edition) which is scheduled to be\npublished in November 2015.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement.", "ja": "I am pleased to announce that the biography of Dr. Jeun, Minhong will be on the \nupcoming Who''s Who in the World 2016 (33rd Edition) which is scheduled to be\npublished in November 2015.\n \nWho''s Who in the World is a renown source of biographical information in which\nthe world''s most distiguished individuals are being introduced to its readers \nthroughout the globe.\n\nPlease, join me to congratulate Dr. Jeun on his achievement."}'::jsonb,
  '2016-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: IUMARS-ICAM 2015 - International Conference on Advanced Materials, ICC Jeju, Republic of Korea", "en": "[Conference]: IUMARS-ICAM 2015 - International Conference on Advanced Materials, ICC Jeju, Republic of Korea", "zh": "[Conference]: IUMARS-ICAM 2015 - International Conference on Advanced Materials, ICC Jeju, Republic of Korea", "ja": "[Conference]: IUMARS-ICAM 2015 - International Conference on Advanced Materials, ICC Jeju, Republic of Korea"}'::jsonb,
  '{"ko": "Form Oct. 25th to Oct. 29th, the conference was held in ICC Jeju, Republic of Korea.\n\nMr. Benedict Kang and Mr. Keon Yong Lee had their debut oral presentations with the following titles at an international conference, IUMRS-ICAM 2015. \n\n\"Quantitative Molecular Profiling for Prostate Cancer Stratification\" by Benedict Kang et al.\n\n\"A Biocompatible Protein Nanoprobe: Ferritin-AcGFP\" by Keon Yong Lee et al.\n\n\nMr. Gun Hyuk Jang and Mr. Sungwook Park posted their posters and presented their recent research works and scientific findings.\n\n\"Sensitive and Biocompatible Organic Nanoprobes Composed of Fluorescent Protein and Ferritin\" by Gun Hyuk Jang et al.\n\n\"Magnetic Hyperthermia with MgMnFe2O4 Superparamagnetic Nanoferrite for Melanoma under Low AC Magnetic Field\" by Sungwook Park et al.", "en": "Form Oct. 25th to Oct. 29th, the conference was held in ICC Jeju, Republic of Korea.\n\nMr. Benedict Kang and Mr. Keon Yong Lee had their debut oral presentations with the following titles at an international conference, IUMRS-ICAM 2015. \n\n\"Quantitative Molecular Profiling for Prostate Cancer Stratification\" by Benedict Kang et al.\n\n\"A Biocompatible Protein Nanoprobe: Ferritin-AcGFP\" by Keon Yong Lee et al.\n\n\nMr. Gun Hyuk Jang and Mr. Sungwook Park posted their posters and presented their recent research works and scientific findings.\n\n\"Sensitive and Biocompatible Organic Nanoprobes Composed of Fluorescent Protein and Ferritin\" by Gun Hyuk Jang et al.\n\n\"Magnetic Hyperthermia with MgMnFe2O4 Superparamagnetic Nanoferrite for Melanoma under Low AC Magnetic Field\" by Sungwook Park et al.", "zh": "Form Oct. 25th to Oct. 29th, the conference was held in ICC Jeju, Republic of Korea.\n\nMr. Benedict Kang and Mr. Keon Yong Lee had their debut oral presentations with the following titles at an international conference, IUMRS-ICAM 2015. \n\n\"Quantitative Molecular Profiling for Prostate Cancer Stratification\" by Benedict Kang et al.\n\n\"A Biocompatible Protein Nanoprobe: Ferritin-AcGFP\" by Keon Yong Lee et al.\n\n\nMr. Gun Hyuk Jang and Mr. Sungwook Park posted their posters and presented their recent research works and scientific findings.\n\n\"Sensitive and Biocompatible Organic Nanoprobes Composed of Fluorescent Protein and Ferritin\" by Gun Hyuk Jang et al.\n\n\"Magnetic Hyperthermia with MgMnFe2O4 Superparamagnetic Nanoferrite for Melanoma under Low AC Magnetic Field\" by Sungwook Park et al.", "ja": "Form Oct. 25th to Oct. 29th, the conference was held in ICC Jeju, Republic of Korea.\n\nMr. Benedict Kang and Mr. Keon Yong Lee had their debut oral presentations with the following titles at an international conference, IUMRS-ICAM 2015. \n\n\"Quantitative Molecular Profiling for Prostate Cancer Stratification\" by Benedict Kang et al.\n\n\"A Biocompatible Protein Nanoprobe: Ferritin-AcGFP\" by Keon Yong Lee et al.\n\n\nMr. Gun Hyuk Jang and Mr. Sungwook Park posted their posters and presented their recent research works and scientific findings.\n\n\"Sensitive and Biocompatible Organic Nanoprobes Composed of Fluorescent Protein and Ferritin\" by Gun Hyuk Jang et al.\n\n\"Magnetic Hyperthermia with MgMnFe2O4 Superparamagnetic Nanoferrite for Melanoma under Low AC Magnetic Field\" by Sungwook Park et al."}'::jsonb,
  '2015-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Invited Lecture]: ICAMD 2015 - The 9th International Conference on Advanced Materials and Devices, Ramada Plaza Jeju Hotel, Je", "en": "[Invited Lecture]: ICAMD 2015 - The 9th International Conference on Advanced Materials and Devices, Ramada Plaza Jeju Hotel, Je", "zh": "[Invited Lecture]: ICAMD 2015 - The 9th International Conference on Advanced Materials and Devices, Ramada Plaza Jeju Hotel, Je", "ja": "[Invited Lecture]: ICAMD 2015 - The 9th International Conference on Advanced Materials and Devices, Ramada Plaza Jeju Hotel, Je"}'::jsonb,
  '{"ko": "Dr. Kwan Hyi Lee was invited to give a lecture at the ICAMD 2015 conference meeting which was held in Jeju Island, Republic of Korea. \n\nMr. Benedict Kang and Dr. Kwan Hyi Lee have given the lecture on the 7th of December. The title of the talk was \"FET based Biosensors for Biomedical Nano-monitoring.\"\n\nDr. Minhong Jeun, Mr. Sungwook Park, and Mr. Yongdeok Kim also gave poster presentations at the ICAMD 2015.", "en": "Dr. Kwan Hyi Lee was invited to give a lecture at the ICAMD 2015 conference meeting which was held in Jeju Island, Republic of Korea. \n\nMr. Benedict Kang and Dr. Kwan Hyi Lee have given the lecture on the 7th of December. The title of the talk was \"FET based Biosensors for Biomedical Nano-monitoring.\"\n\nDr. Minhong Jeun, Mr. Sungwook Park, and Mr. Yongdeok Kim also gave poster presentations at the ICAMD 2015.", "zh": "Dr. Kwan Hyi Lee was invited to give a lecture at the ICAMD 2015 conference meeting which was held in Jeju Island, Republic of Korea. \n\nMr. Benedict Kang and Dr. Kwan Hyi Lee have given the lecture on the 7th of December. The title of the talk was \"FET based Biosensors for Biomedical Nano-monitoring.\"\n\nDr. Minhong Jeun, Mr. Sungwook Park, and Mr. Yongdeok Kim also gave poster presentations at the ICAMD 2015.", "ja": "Dr. Kwan Hyi Lee was invited to give a lecture at the ICAMD 2015 conference meeting which was held in Jeju Island, Republic of Korea. \n\nMr. Benedict Kang and Dr. Kwan Hyi Lee have given the lecture on the 7th of December. The title of the talk was \"FET based Biosensors for Biomedical Nano-monitoring.\"\n\nDr. Minhong Jeun, Mr. Sungwook Park, and Mr. Yongdeok Kim also gave poster presentations at the ICAMD 2015."}'::jsonb,
  '2015-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Personnel Exchange]: Jea Ho Park from the Johns Hopkins University, USA", "en": "[Personnel Exchange]: Jea Ho Park from the Johns Hopkins University, USA", "zh": "[Personnel Exchange]: Jea Ho Park from the Johns Hopkins University, USA", "ja": "[Personnel Exchange]: Jea Ho Park from the Johns Hopkins University, USA"}'::jsonb,
  '{"ko": "Mr. Jea Ho Park was sent from the Johns Hopkins University for collaboration between BnML and Searson group.\n\nBnML warmly welcomes Jea Ho.", "en": "Mr. Jea Ho Park was sent from the Johns Hopkins University for collaboration between BnML and Searson group.\n\nBnML warmly welcomes Jea Ho.", "zh": "Mr. Jea Ho Park was sent from the Johns Hopkins University for collaboration between BnML and Searson group.\n\nBnML warmly welcomes Jea Ho.", "ja": "Mr. Jea Ho Park was sent from the Johns Hopkins University for collaboration between BnML and Searson group.\n\nBnML warmly welcomes Jea Ho."}'::jsonb,
  '2016-02-22',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes a new member", "en": "[Welcome]: BnML welcomes a new member", "zh": "[Welcome]: BnML welcomes a new member", "ja": "[Welcome]: BnML welcomes a new member"}'::jsonb,
  '{"ko": "We welcome a new team member, Mr. Tae Hoo Chang.\n\nMr. Tae Hoo Chang is from Yeonsei University, Seoul, from which he received his undergraduate and master degrees.\nHis background is materials science and engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nPlease, let us welcome Tae Hoo.", "en": "We welcome a new team member, Mr. Tae Hoo Chang.\n\nMr. Tae Hoo Chang is from Yeonsei University, Seoul, from which he received his undergraduate and master degrees.\nHis background is materials science and engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nPlease, let us welcome Tae Hoo.", "zh": "We welcome a new team member, Mr. Tae Hoo Chang.\n\nMr. Tae Hoo Chang is from Yeonsei University, Seoul, from which he received his undergraduate and master degrees.\nHis background is materials science and engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nPlease, let us welcome Tae Hoo.", "ja": "We welcome a new team member, Mr. Tae Hoo Chang.\n\nMr. Tae Hoo Chang is from Yeonsei University, Seoul, from which he received his undergraduate and master degrees.\nHis background is materials science and engineering and he has joined our team with his extended interest in biomedical applications with his research and academic background.\n\nPlease, let us welcome Tae Hoo."}'::jsonb,
  '2016-02-22',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Welcome]: BnML welcomes a new member", "en": "[Welcome]: BnML welcomes a new member", "zh": "[Welcome]: BnML welcomes a new member", "ja": "[Welcome]: BnML welcomes a new member"}'::jsonb,
  '{"ko": "We welcome a new team member, Mr. Hyun Woo Son.\n\nMr. Hyun Woo Son attends Kwangwoon University for his undergraduate study.\nHis academic background is in materials and electronic engineering and he has joined our team with his excitement in getting research experience.\n\nBnML welcomes Hyun Woo.", "en": "We welcome a new team member, Mr. Hyun Woo Son.\n\nMr. Hyun Woo Son attends Kwangwoon University for his undergraduate study.\nHis academic background is in materials and electronic engineering and he has joined our team with his excitement in getting research experience.\n\nBnML welcomes Hyun Woo.", "zh": "We welcome a new team member, Mr. Hyun Woo Son.\n\nMr. Hyun Woo Son attends Kwangwoon University for his undergraduate study.\nHis academic background is in materials and electronic engineering and he has joined our team with his excitement in getting research experience.\n\nBnML welcomes Hyun Woo.", "ja": "We welcome a new team member, Mr. Hyun Woo Son.\n\nMr. Hyun Woo Son attends Kwangwoon University for his undergraduate study.\nHis academic background is in materials and electronic engineering and he has joined our team with his excitement in getting research experience.\n\nBnML welcomes Hyun Woo."}'::jsonb,
  '2016-02-22',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Invited Lecture]: The 2016 EMN Meeting on Field-Effect Transistors, Lees Hotel, Kaohsiung, Taiwan.", "en": "[Invited Lecture]: The 2016 EMN Meeting on Field-Effect Transistors, Lees Hotel, Kaohsiung, Taiwan.", "zh": "[Invited Lecture]: The 2016 EMN Meeting on Field-Effect Transistors, Lees Hotel, Kaohsiung, Taiwan.", "ja": "[Invited Lecture]: The 2016 EMN Meeting on Field-Effect Transistors, Lees Hotel, Kaohsiung, Taiwan."}'::jsonb,
  '{"ko": "Dr. Kwan Hyi Lee was invited to give a lecture at The 2016 EMN Meeting on Field-Effect Transistors conference meeting which was held in Lees Hotel, Kaohsiung, Taiwan.\n\nMr. Minhong Jeun has given the lecture on behalf of Dr. Kwan Hyi Lee.", "en": "Dr. Kwan Hyi Lee was invited to give a lecture at The 2016 EMN Meeting on Field-Effect Transistors conference meeting which was held in Lees Hotel, Kaohsiung, Taiwan.\n\nMr. Minhong Jeun has given the lecture on behalf of Dr. Kwan Hyi Lee.", "zh": "Dr. Kwan Hyi Lee was invited to give a lecture at The 2016 EMN Meeting on Field-Effect Transistors conference meeting which was held in Lees Hotel, Kaohsiung, Taiwan.\n\nMr. Minhong Jeun has given the lecture on behalf of Dr. Kwan Hyi Lee.", "ja": "Dr. Kwan Hyi Lee was invited to give a lecture at The 2016 EMN Meeting on Field-Effect Transistors conference meeting which was held in Lees Hotel, Kaohsiung, Taiwan.\n\nMr. Minhong Jeun has given the lecture on behalf of Dr. Kwan Hyi Lee."}'::jsonb,
  '2016-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Dr. Hyojin Lee, the President Post Doc Fellow", "en": "[Honors]: Dr. Hyojin Lee, the President Post Doc Fellow", "zh": "[Honors]: Dr. Hyojin Lee, the President Post Doc Fellow", "ja": "[Honors]: Dr. Hyojin Lee, the President Post Doc Fellow"}'::jsonb,
  '{"ko": "BnML congratulates Dr. Hyojin Lee for winning President Post Doc fellowship.\n\nShe will start her project in June and aim to develop an assay for sexual precocity.\n\nCongratulation to the big winner!", "en": "BnML congratulates Dr. Hyojin Lee for winning President Post Doc fellowship.\n\nShe will start her project in June and aim to develop an assay for sexual precocity.\n\nCongratulation to the big winner!", "zh": "BnML congratulates Dr. Hyojin Lee for winning President Post Doc fellowship.\n\nShe will start her project in June and aim to develop an assay for sexual precocity.\n\nCongratulation to the big winner!", "ja": "BnML congratulates Dr. Hyojin Lee for winning President Post Doc fellowship.\n\nShe will start her project in June and aim to develop an assay for sexual precocity.\n\nCongratulation to the big winner!"}'::jsonb,
  '2016-05-30',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'event',
  '{"ko": "[Conference]: Biosensor 2016, Sweden", "en": "[Conference]: Biosensor 2016, Sweden", "zh": "[Conference]: Biosensor 2016, Sweden", "ja": "[Conference]: Biosensor 2016, Sweden"}'::jsonb,
  '{"ko": "Biosensor 2016 conference was held in Sweden.\n\nDr. Kwan Hyi Lee, and Dr. Minhong Jeun attended the conference meeting.", "en": "Biosensor 2016 conference was held in Sweden.\n\nDr. Kwan Hyi Lee, and Dr. Minhong Jeun attended the conference meeting.", "zh": "Biosensor 2016 conference was held in Sweden.\n\nDr. Kwan Hyi Lee, and Dr. Minhong Jeun attended the conference meeting.", "ja": "Biosensor 2016 conference was held in Sweden.\n\nDr. Kwan Hyi Lee, and Dr. Minhong Jeun attended the conference meeting."}'::jsonb,
  '2016-01-01',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'announcement',
  '{"ko": "[Celebration]: Mr. Taehoo Chang''s Wedding", "en": "[Celebration]: Mr. Taehoo Chang''s Wedding", "zh": "[Celebration]: Mr. Taehoo Chang''s Wedding", "ja": "[Celebration]: Mr. Taehoo Chang''s Wedding"}'::jsonb,
  '{"ko": "On June 26th, Mr. Taehoo Chang married his bride. He enjoyed the day as he took it as one of his milestone of his life. He has now opened a next chapter of his life and we, BnML, contragulate for the happy occasion.\n\nWe wish Mr. Chang and his new family for many blessings!", "en": "On June 26th, Mr. Taehoo Chang married his bride. He enjoyed the day as he took it as one of his milestone of his life. He has now opened a next chapter of his life and we, BnML, contragulate for the happy occasion.\n\nWe wish Mr. Chang and his new family for many blessings!", "zh": "On June 26th, Mr. Taehoo Chang married his bride. He enjoyed the day as he took it as one of his milestone of his life. He has now opened a next chapter of his life and we, BnML, contragulate for the happy occasion.\n\nWe wish Mr. Chang and his new family for many blessings!", "ja": "On June 26th, Mr. Taehoo Chang married his bride. He enjoyed the day as he took it as one of his milestone of his life. He has now opened a next chapter of his life and we, BnML, contragulate for the happy occasion.\n\nWe wish Mr. Chang and his new family for many blessings!"}'::jsonb,
  '2016-06-27',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: UST Overseas Travel Award", "en": "[Honors]: UST Overseas Travel Award", "zh": "[Honors]: UST Overseas Travel Award", "ja": "[Honors]: UST Overseas Travel Award"}'::jsonb,
  '{"ko": "Mr. Benedict JM Kang has received the UST Overseas Travel Award.\n\nHe will attend the SPIE Nanoscience + Engineering conference meeting which will be held in San Diego, CA.\n\nYay~!", "en": "Mr. Benedict JM Kang has received the UST Overseas Travel Award.\n\nHe will attend the SPIE Nanoscience + Engineering conference meeting which will be held in San Diego, CA.\n\nYay~!", "zh": "Mr. Benedict JM Kang has received the UST Overseas Travel Award.\n\nHe will attend the SPIE Nanoscience + Engineering conference meeting which will be held in San Diego, CA.\n\nYay~!", "ja": "Mr. Benedict JM Kang has received the UST Overseas Travel Award.\n\nHe will attend the SPIE Nanoscience + Engineering conference meeting which will be held in San Diego, CA.\n\nYay~!"}'::jsonb,
  '2016-07-04',
  false
);

INSERT INTO news (category, title, content, date, is_pinned) VALUES (
  'award',
  '{"ko": "[Honors]: Best Poster Award at the NANO KOREA 2016 of The 14th International Nanotech Symposium.", "en": "[Honors]: Best Poster Award at the NANO KOREA 2016 of The 14th International Nanotech Symposium.", "zh": "[Honors]: Best Poster Award at the NANO KOREA 2016 of The 14th International Nanotech Symposium.", "ja": "[Honors]: Best Poster Award at the NANO KOREA 2016 of The 14th International Nanotech Symposium."}'::jsonb,
  '{"ko": "Congradulations to Mr. Gun Hyuk Jang and Mr. Benedict Kang for their Best Poster Award at the NANO KOREA 2016 held at KINTEX, in Republic of Korea.\n\nThe title of the poster was \"Sequential assessment via daphnia and zebrafish for systematic toxicity screening of heterogeneous substances\".", "en": "Congradulations to Mr. Gun Hyuk Jang and Mr. Benedict Kang for their Best Poster Award at the NANO KOREA 2016 held at KINTEX, in Republic of Korea.\n\nThe title of the poster was \"Sequential assessment via daphnia and zebrafish for systematic toxicity screening of heterogeneous substances\".", "zh": "Congradulations to Mr. Gun Hyuk Jang and Mr. Benedict Kang for their Best Poster Award at the NANO KOREA 2016 held at KINTEX, in Republic of Korea.\n\nThe title of the poster was \"Sequential assessment via daphnia and zebrafish for systematic toxicity screening of heterogeneous substances\".", "ja": "Congradulations to Mr. Gun Hyuk Jang and Mr. Benedict Kang for their Best Poster Award at the NANO KOREA 2016 held at KINTEX, in Republic of Korea.\n\nThe title of the poster was \"Sequential assessment via daphnia and zebrafish for systematic toxicity screening of heterogeneous substances\"."}'::jsonb,
  '2016-01-01',
  false
);
