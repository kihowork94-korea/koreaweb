<script setup lang="ts">
const { t } = useI18n()
const route = useRoute()
const siteUrl = 'https://www.ariselab.kr'
const canonicalUrl = computed(() => `${siteUrl}${route.path === '/' ? '' : route.path}`)

useHead(() => ({
  titleTemplate: title => title || 'ARISE Lab — KIST 이관희 교수 연구실 | KU-KIST 융합대학원',
  link: [{ rel: 'canonical', href: canonicalUrl.value }],
  meta: [
    { property: 'og:url', content: canonicalUrl.value },
    { property: 'og:title', content: 'ARISE Lab — KIST 이관희 교수 연구실' },
    { property: 'og:description', content: 'KIST 이관희 교수 연구실. AI와 나노바이오센서 기반 암·감염병 조기진단 연구를 수행합니다.' },
  ],
  script: [{
    type: 'application/ld+json',
    innerHTML: JSON.stringify({
      '@context': 'https://schema.org',
      '@graph': [
        {
          '@type': 'WebSite',
          '@id': `${siteUrl}/#website`,
          url: siteUrl,
          name: 'ARISE Lab',
          alternateName: ['ARISE 연구실', 'AI-Integrated Recognition and Intelligent Sensing Engineering Lab'],
          inLanguage: ['ko-KR', 'en-US', 'zh-CN', 'ja-JP'],
        },
        {
          '@type': 'ResearchOrganization',
          '@id': `${siteUrl}/#organization`,
          name: 'ARISE Lab',
          alternateName: ['ARISE 연구실', 'KU-KIST ARISE Lab'],
          url: siteUrl,
          logo: `${siteUrl}/images/lab/logo.png`,
          description: 'KIST 이관희 교수가 이끄는 고려대학교 KU-KIST 융합대학원 연구실로, AI와 나노바이오센서 기반 암·감염병 조기진단을 연구합니다.',
          email: 'kwanhyi@korea.ac.kr',
          telephone: '+82-2-958-6804',
          address: {
            '@type': 'PostalAddress',
            streetAddress: '화랑로14길 5 한국과학기술연구원(KIST)',
            addressLocality: '성북구',
            addressRegion: '서울특별시',
            addressCountry: 'KR',
          },
          parentOrganization: [
            { '@type': 'CollegeOrUniversity', name: '고려대학교 KU-KIST 융합대학원' },
            { '@type': 'ResearchOrganization', name: '한국과학기술연구원(KIST)' },
          ],
          founder: {
            '@type': 'Person',
            '@id': `${siteUrl}/members#kwanhyi-lee`,
            name: '이관희',
            alternateName: ['Kwan Hyi Lee', 'KIST 이관희 교수'],
            jobTitle: '교수',
            affiliation: [
              { '@type': 'ResearchOrganization', name: '한국과학기술연구원(KIST)' },
              { '@type': 'CollegeOrUniversity', name: '고려대학교 KU-KIST 융합대학원' },
            ],
          },
        },
      ],
    }),
  }],
}))
</script>

<template>
  <UApp>
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
    <ClientOnly>
      <CustomToast />
    </ClientOnly>
  </UApp>
</template>
