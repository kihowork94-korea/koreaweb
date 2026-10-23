const labels = {
  ko: { principal: '지도교수', channels: '온라인 채널', reset: '필터 초기화', filter: '필터', count: '건' },
  en: { principal: 'Principal Investigator', channels: 'Online Channels', reset: 'Reset filters', filter: 'Filter', count: 'results' },
  zh: { principal: '指导教授', channels: '在线渠道', reset: '重置筛选', filter: '筛选', count: '项结果' },
  ja: { principal: '指導教授', channels: 'オンラインチャンネル', reset: '絞り込みを解除', filter: '絞り込み', count: '件' },
}
export function useLocalizedLabels() {
  const { locale } = useI18n()
  return computed(() => labels[locale.value as keyof typeof labels] || labels.en)
}
