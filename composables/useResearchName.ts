const researchNames: Record<string, { zh: string; ja: string }> = {
  'AI-Enabled Ward': { zh: '人工智能病房', ja: 'AI特化病棟' },
  'Smart Ward': { zh: '智慧病房', ja: 'スマート病棟' },
  Myokine: { zh: '肌肉因子', ja: 'マイオカイン' },
  Secretome: { zh: '分泌组', ja: 'セクレトーム' },
  'Johns Hopkins': { zh: '约翰斯·霍普金斯大学', ja: 'ジョンズ・ホプキンス大学' },
  'Harvard Medical': { zh: '哈佛医学院', ja: 'ハーバード大学医学部' },
  UIUC: { zh: '伊利诺伊大学厄巴纳-香槟分校（UIUC）', ja: 'イリノイ大学アーバナ・シャンペーン校（UIUC）' },
  'IBENS, France': { zh: '法国IBENS', ja: 'フランスIBENS' },
  'Horizon Europe': { zh: '地平线欧洲', ja: 'Horizon Europe' },
  'KIST Europe': { zh: 'KIST欧洲研究所', ja: 'KIST欧州研究所' },
  'National NanoFab Center': { zh: '韩国国家纳米加工中心', ja: '韓国ナノ総合技術院' },
  'Ewha Womans University': { zh: '梨花女子大学', ja: '梨花女子大学' },
  'Incheon National University': { zh: '仁川大学', ja: '仁川大学' },
  'KU Anam Hospital': { zh: '高丽大学安岩医院', ja: '高麗大学安岩病院' },
  'Asan Medical Center': { zh: '首尔峨山医院', ja: 'ソウル峨山病院' },
  'JBNU Hospital': { zh: '全北大学医院', ja: '全北大学病院' },
  'Samsung Medical Center': { zh: '三星首尔医院', ja: 'サムスンソウル病院' },
  'SNU Hospital': { zh: '首尔大学医院', ja: 'ソウル大学病院' },
}
export function useResearchName() {
  const { locale } = useI18n()
  return (item: { ko: string; en: string }) => locale.value === 'ko'
    ? item.ko
    : locale.value === 'zh' || locale.value === 'ja'
      ? researchNames[item.en]?.[locale.value] || item.en
      : item.en
}
