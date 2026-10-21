<script setup lang="ts">
import { useIntersectionObserver } from '@vueuse/core'

const { locale, t } = useI18n()
const localePath = useLocalePath()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)
const loc = (field: Record<string, string> | null | undefined) => field ? (field[locale.value as keyof typeof field] || field.en || '') : ''
const { data: areasRaw } = useLabResearch()
const researchAreas = computed<any[]>(() => ((areasRaw.value as any[]) ?? []).slice(0, 3))
const applications = [
  { icon: 'local_hospital', ko: 'AI 특화병동', en: 'AI-Enabled Ward' },
  { icon: 'monitor_heart', ko: '스마트병동', en: 'Smart Ward' },
  { icon: 'fitness_center', ko: '마이오카인', en: 'Myokine' },
  { icon: 'biotech', ko: 'Secretome', en: 'Secretome' },
]
const partners = [
  { ko: '존스홉킨스대학교', en: 'Johns Hopkins' }, { ko: '하버드 의과대학', en: 'Harvard Medical' },
  { ko: 'Horizon Europe', en: 'Horizon Europe' }, { ko: 'KIST 유럽연구소', en: 'KIST Europe' },
  { ko: '고려대 안암병원', en: 'KU Anam Hospital' }, { ko: '서울아산병원', en: 'Asan Medical Center' },
  { ko: '삼성서울병원', en: 'Samsung Medical Center' }, { ko: '전북대학교병원', en: 'JBNU Hospital' },
  { ko: '서울대병원', en: 'SNU Hospital' },
]
const name = (item: { ko: string; en: string }) => locale.value === 'ko' ? item.ko : item.en
const sectionRef = ref<HTMLElement | null>(null)
const isVisible = ref(false)
useIntersectionObserver(sectionRef, ([entry]) => { if (entry.isIntersecting) isVisible.value = true }, { threshold: 0.08 })
</script>

<template>
  <section id="research" ref="sectionRef" class="relative px-6 py-24 mobile:px-4 mobile:py-16">
    <div class="mx-auto max-w-[1200px]">
      <div class="animate-item mb-10 text-center" :class="{ 'is-visible': isVisible }">
        <p class="mb-3 text-xs font-extrabold uppercase tracking-[0.28em] text-[#6366f1]">ARISE Research Vision</p>
        <h2 class="text-4xl font-bold mobile:text-2xl" :class="isDark ? 'text-white' : 'text-gray-900'">{{ t('lab.nav.research') }}</h2>
        <p class="mt-3 text-xs font-semibold tracking-[0.18em]" :class="isDark ? 'text-white/35' : 'text-gray-400'">TECHNOLOGY → TRANSLATION → IMPACT</p>
      </div>

      <div class="research-tree animate-item" :class="[{ 'is-visible': isVisible }, isDark ? 'tree-dark' : 'tree-light']">
        <div class="tree-mesh" />
        <div class="tree-line line-tech" /><div class="tree-line line-core" /><div class="tree-line line-app" />
        <section class="tree-zone technology-zone" aria-label="Core technology">
          <p class="zone-label"><span>01</span> CORE TECHNOLOGY</p>
          <div class="technology-grid">
            <div v-for="area in researchAreas" :key="area.id" class="technology-node">
              <div class="node-orbit"><UIcon :name="area.iconName" class="h-7 w-7" /><strong>{{ loc(area.title) }}</strong></div>
              <div class="keyword-list"><span v-for="keyword in area.keywords.slice(0, 3)" :key="loc(keyword)">{{ loc(keyword) }}</span></div>
            </div>
          </div>
        </section>
        <div class="arise-core" aria-label="ARISE Lab"><strong>ARISE</strong><span>LAB</span></div>
        <section class="tree-zone application-zone" aria-label="Clinical vision">
          <p class="zone-label"><span>02</span> CLINICAL VISION</p>
          <div class="application-grid">
            <div v-for="application in applications" :key="application.en" class="application-node"><span class="material-icons">{{ application.icon }}</span><strong>{{ name(application) }}</strong></div>
          </div>
        </section>
        <section class="tree-zone network-zone" aria-label="Global network">
          <p class="zone-label"><span>03</span> GLOBAL NETWORK</p>
          <div class="network-hub"><span class="material-icons">hub</span> ARISE LAB</div>
          <div class="partner-list"><span v-for="partner in partners" :key="partner.en"><i />{{ name(partner) }}</span></div>
        </section>
      </div>
      <div class="mt-9 text-center"><NuxtLink :to="localePath('/research')" class="inline-flex items-center gap-2 text-sm font-bold text-[#4f46e5] transition-all hover:gap-3">{{ t('lab.common.viewAll') }}<span class="material-icons text-[18px]">arrow_forward</span></NuxtLink></div>
    </div>
  </section>
</template>

<style scoped>
.research-tree{position:relative;min-height:890px;overflow:hidden;border:1px solid rgba(100,116,139,.14);border-radius:2.5rem;isolation:isolate}.tree-light{background:radial-gradient(circle at 50% 35%,#fff 0,#fafafa 42%,#f8fafc 100%)}.tree-dark{background:radial-gradient(circle at 50% 35%,#18181b 0,#111113 46%,#090a0d 100%)}.tree-mesh{position:absolute;inset:0;z-index:-2;opacity:.34;background-image:radial-gradient(rgba(100,116,139,.35) 1px,transparent 1px);background-size:24px 24px;mask-image:radial-gradient(ellipse at center,black,transparent 78%)}.tree-line{position:absolute;left:50%;z-index:-1;width:1px;transform:translateX(-50%);border-left:2px dashed rgba(99,102,241,.32)}.line-tech{top:245px;height:92px}.line-core{top:430px;height:82px}.line-app{top:650px;height:66px}.tree-zone{position:absolute;left:4%;right:4%}.zone-label{display:flex;align-items:center;gap:.55rem;color:#52525b;font-size:.66rem;font-weight:900;letter-spacing:.15em}.tree-dark .zone-label{color:#d4d4d8}.zone-label span{display:grid;width:28px;height:28px;place-items:center;border-radius:50%;background:rgba(99,102,241,.1);color:#4f46e5;letter-spacing:0}.technology-zone{top:34px}.technology-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:5%;margin-top:22px}.technology-node{text-align:center}.node-orbit{display:flex;width:144px;height:144px;margin:0 auto;flex-direction:column;align-items:center;justify-content:center;gap:.6rem;border:1px solid rgba(79,70,229,.23);border-radius:50%;background:#fff;color:#4338ca;box-shadow:0 16px 42px rgba(15,23,42,.08)}.tree-dark .node-orbit{background:#17171c;color:#a5b4fc}.node-orbit strong{max-width:108px;color:#18181b;font-size:.82rem;line-height:1.35}.tree-dark .node-orbit strong{color:#f4f4f5}.keyword-list{display:flex;min-height:46px;margin-top:12px;align-items:flex-start;justify-content:center;gap:.35rem;flex-wrap:wrap}.keyword-list span{padding:.35rem .58rem;border-radius:999px;background:#f1f5f9;color:#475569;font-size:.64rem;font-weight:750}.tree-dark .keyword-list span{background:#27272a;color:#d4d4d8}.arise-core{position:absolute;top:328px;left:50%;display:flex;width:190px;height:96px;transform:translateX(-50%);flex-direction:column;align-items:center;justify-content:center;border:1px solid rgba(79,70,229,.25);border-radius:26px;background:rgba(255,255,255,.96);box-shadow:0 20px 60px rgba(15,23,42,.14)}.arise-core::before{content:'';position:absolute;top:0;left:34px;right:34px;height:2px;background:linear-gradient(90deg,#14b8a6,#6366f1)}.arise-core strong{font-size:1.22rem;letter-spacing:.13em}.arise-core span{margin-top:.15rem;color:#64748b;font-size:.61rem;font-weight:800;letter-spacing:.34em}.tree-dark .arise-core{background:#18181b;color:#fafafa}.application-zone{top:475px}.application-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:4%;margin-top:20px}.application-node{display:flex;width:120px;height:120px;margin:auto;flex-direction:column;align-items:center;justify-content:center;gap:.45rem;border:1px solid rgba(20,184,166,.25);border-radius:50%;background:#fff;box-shadow:0 15px 38px rgba(15,23,42,.07);text-align:center}.tree-dark .application-node{background:#17171c}.application-node .material-icons{color:#0f766e;font-size:1.55rem}.application-node strong{max-width:92px;font-size:.72rem}.network-zone{top:688px}.network-hub{display:flex;margin:14px auto 0;align-items:center;justify-content:center;gap:.45rem;color:#475569;font-size:.66rem;font-weight:900;letter-spacing:.12em}.tree-dark .network-hub{color:#cbd5e1}.network-hub .material-icons{font-size:1.15rem}.partner-list{display:flex;margin:28px auto 0;max-width:900px;flex-wrap:wrap;justify-content:center;gap:.85rem 1.4rem}.partner-list span{display:flex;align-items:center;gap:.4rem;color:#52525b;font-size:.68rem;font-weight:800}.tree-dark .partner-list span{color:#d4d4d8}.partner-list i{width:6px;height:6px;border-radius:50%;background:#14b8a6;box-shadow:0 0 8px rgba(20,184,166,.45)}
@media(max-width:800px){.research-tree{min-height:1180px;border-radius:1.75rem}.technology-grid{grid-template-columns:1fr;gap:15px}.technology-zone{top:28px}.technology-node{display:grid;grid-template-columns:108px 1fr;align-items:center;text-align:left}.node-orbit{width:104px;height:104px}.node-orbit strong{max-width:84px;font-size:.7rem}.keyword-list{margin:0;justify-content:flex-start}.line-tech{top:410px}.arise-core{top:438px}.line-core{top:534px;height:72px}.application-zone{top:580px}.application-grid{grid-template-columns:repeat(2,1fr);gap:14px}.application-node{width:108px;height:108px}.line-app{top:860px;height:70px}.network-zone{top:910px}.partner-list{gap:.7rem 1rem;padding:0 .5rem}.partner-list span{font-size:.61rem}}

/* Mobile: fixed coordinates are replaced with a natural vertical flow. */
@media(max-width:800px){
  .research-tree{display:flex;min-height:0;flex-direction:column;gap:28px;padding:28px 18px 32px}
  .tree-line{display:none}
  .tree-zone{position:relative;inset:auto;width:100%}
  .technology-zone,.application-zone,.network-zone{top:auto}
  .technology-grid{margin-top:22px}
  .technology-node{grid-template-columns:104px minmax(0,1fr);gap:12px}
  .node-orbit{margin:0}
  .keyword-list{min-width:0;align-content:center}
  .keyword-list span{max-width:100%;white-space:normal;overflow-wrap:anywhere}
  .arise-core{position:relative;top:auto;left:auto;flex:none;margin:2px auto;transform:none}
  .application-grid{margin-top:22px}
  .network-hub{margin-top:18px}
  .partner-list{margin-top:20px}
}

@media(min-width:801px) and (max-width:1050px){
  .research-tree{min-height:850px}
  .technology-grid{gap:2%}
  .node-orbit{width:128px;height:128px}
  .keyword-list span{padding:.3rem .45rem;font-size:.58rem}
  .application-node{width:108px;height:108px}
  .network-zone{top:665px}
}
</style>
