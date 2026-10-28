<script setup lang="ts">
import { researchFlow, clinicalApplications } from '~/data/research-flow'
const { locale, t } = useI18n()
const themeStore = useThemeStore()
const isDark = computed(() => themeStore.isDark)
usePageSeo('research')

const loc = (f: Record<string, string> | null | undefined) => f ? (f[locale.value as keyof typeof f] || f.en || '') : ''
const researchAreas = researchFlow.slice(0, 3)

const applications = clinicalApplications
const partners = [
  { ko: '고려대 안암병원', en: 'KU Anam Hospital' },
  { ko: '존스홉킨스대학교', en: 'Johns Hopkins' },
  { ko: '하버드 의과대학', en: 'Harvard Medical' },
  { ko: 'UIUC', en: 'UIUC' },
  { ko: '프랑스 IBENS', en: 'IBENS, France' },
  { ko: 'Horizon Europe', en: 'Horizon Europe' },
  { ko: 'KIST 유럽연구소', en: 'KIST Europe' },
  { ko: '나노종합기술원', en: 'National NanoFab Center' },
  { ko: '이화여자대학교', en: 'Ewha Womans University' },
  { ko: '인천대학교', en: 'Incheon National University' },
  { ko: '서울아산병원', en: 'Asan Medical Center' },
  { ko: '전북대병원', en: 'JBNU Hospital' },
  { ko: '서울대병원', en: 'SNU Hospital' },
]
const name = useResearchName()
</script>

<template>
  <div class="px-4 pb-28 pt-20">
    <header class="mx-auto mb-6 max-w-[760px] text-center">
      <p class="mb-3 text-xs font-extrabold uppercase tracking-[0.28em]" :class="isDark ? 'text-[#a5b4fc]' : 'text-[#4f46e5]'">ARISE Research Vision</p>
      <h1 class="text-5xl font-extrabold mobile:text-3xl" :class="isDark ? 'text-white' : 'text-gray-900'">{{ t('lab.nav.research') }}</h1>
      <p class="mt-4 text-xs leading-relaxed tracking-[0.08em]" :class="isDark ? 'text-white/55' : 'text-gray-500'">DISCOVER → SENSE → EXPLAIN → TRANSLATE</p>
    </header>

    <div class="vision-map" :class="isDark ? 'map-dark' : 'map-light'">
      <div class="mesh" />
      <div class="glow glow-a"/><div class="glow glow-b"/><div class="glow glow-c"/>

      <svg class="map-lines" viewBox="0 0 1200 1080" preserveAspectRatio="none" aria-hidden="true">
        <defs>
          <linearGradient id="visionLine" x1="0" y1="0" x2="0" y2="1"><stop stop-color="#94a3b8" stop-opacity=".25"/><stop offset=".5" stop-color="#6366f1" stop-opacity=".72"/><stop offset="1" stop-color="#14b8a6" stop-opacity=".16"/></linearGradient>
          <filter id="lineGlow"><feGaussianBlur stdDeviation="3" result="blur"/><feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge></filter>
        </defs>
        <g class="branches">
          <path d="M170 150 C170 250 600 225 600 315"/><path d="M600 150 L600 315"/><path d="M1030 150 C1030 250 600 225 600 315"/>
          <path d="M600 455 C600 520 160 505 160 620"/><path d="M600 455 C600 520 455 515 455 620"/><path d="M600 455 C600 520 745 515 745 620"/><path d="M600 455 C600 520 1040 505 1040 620"/>
          <path d="M600 710 L600 790"/>
        </g>
        <g class="moving-dots"><circle r="5"><animateMotion dur="4s" repeatCount="indefinite" path="M170 150 C170 250 600 225 600 315"/></circle><circle r="5"><animateMotion dur="4.8s" repeatCount="indefinite" path="M1030 150 C1030 250 600 225 600 315"/></circle><circle r="5"><animateMotion dur="3.5s" repeatCount="indefinite" path="M600 455 C600 520 160 505 160 620"/></circle><circle r="5"><animateMotion dur="4.3s" repeatCount="indefinite" path="M600 455 C600 520 1040 505 1040 620"/></circle></g>
      </svg>

      <section class="tech-zone" aria-label="Core technology">
        <p class="zone-title"><span>01</span> CORE TECHNOLOGY</p>
        <div v-for="(area, i) in researchAreas.slice(0, 3)" :key="area.id" class="tech-cluster" :class="`tech-${i + 1}`">
          <div class="tech-main">
            <UIcon :name="area.iconName" class="tech-icon"/>
            <small class="axis-label">{{ area.label }}</small>
            <strong><template v-for="(line, index) in loc(area.lines!).split('|')" :key="line"><br v-if="index" />{{ line }}</template></strong>
          </div>
          <div class="keyword-row">
            <span v-for="kw in area.keywords.slice(0, 3)" :key="loc(kw)" class="satellite">{{ loc(kw) }}</span>
          </div>
        </div>
      </section>

      <section class="core-zone">
        <div class="orbit orbit-a"><i/></div><div class="orbit orbit-b"><i/></div><div class="orbit orbit-c"/>
        <div class="vision-core"><AriseLogo style="height: 78px" /></div>
      </section>

      <section class="application-zone" aria-label="Clinical applications">
        <p class="zone-title"><span>02</span> CLINICAL VISION</p>
        <div v-for="(app, i) in applications" :key="app.en" class="app-bubble" :class="`app-${i + 1}`">
          <span class="material-icons">{{ app.icon }}</span><strong>{{ loc(app) }}</strong>
        </div>
      </section>

      <section class="network-zone" aria-label="Collaboration network">
        <p class="zone-title"><span>03</span> GLOBAL NETWORK</p>
        <div class="network-center"><AriseLogo style="height: 54px" /></div>
        <svg class="network-lines" viewBox="0 0 1000 330" preserveAspectRatio="none" aria-hidden="true"><g><path d="M500 20 C500 100 90 80 90 250"/><path d="M500 20 C500 100 220 80 220 300"/><path d="M500 20 C500 130 365 100 365 250"/><path d="M500 20 L500 310"/><path d="M500 20 C500 130 635 100 635 250"/><path d="M500 20 C500 100 780 80 780 300"/><path d="M500 20 C500 100 910 80 910 250"/></g></svg>
        <div class="partner-field"><span v-for="(partner, i) in partners" :key="partner.en" class="partner" :class="`partner-${i + 1}`"><i/>{{ name(partner) }}</span></div>
      </section>

    </div>
  </div>
</template>

<style scoped>
.axis-label { color: #2563eb; font-size: .6rem; font-weight: 800; letter-spacing: .04em; white-space: nowrap; }
.tech-main { gap: .35rem !important; }
.tech-main strong { max-width: 95% !important; word-break: keep-all; overflow-wrap: normal; font-size: .76rem !important; }
.map-dark .axis-label { color: #93c5fd; }
@media(max-width:800px) { .tech-main { width: 122px !important; height: 122px !important; } .tech-cluster { grid-template-columns: 122px minmax(0,1fr) !important; } .tech-main strong { font-size: .66rem !important; } }
.vision-map{position:relative;width:min(1240px,100%);height:1120px;margin:0 auto;overflow:hidden;border-radius:3rem;isolation:isolate}.map-light{background:radial-gradient(circle at 50% 31%,#fafafa 0,#ffffff 34%,#f8fafc 76%)}.map-dark{background:radial-gradient(circle at 50% 31%,#18181b 0,#111113 38%,#090a0d 78%)}.mesh{position:absolute;inset:0;z-index:-3;opacity:.38;background-image:radial-gradient(rgba(39,39,42,.25) 1px,transparent 1px);background-size:24px 24px;mask-image:radial-gradient(ellipse at center,black,transparent 75%)}.glow{position:absolute;z-index:-2;border-radius:50%;filter:blur(80px);animation:breathe 6s ease-in-out infinite alternate}.glow-a{top:20%;left:36%;width:340px;height:340px;background:rgba(113,113,122,.13)}.glow-b{top:58%;left:5%;width:260px;height:260px;background:rgba(161,161,170,.1);animation-delay:-2s}.glow-c{right:5%;bottom:8%;width:320px;height:320px;background:rgba(39,39,42,.09);animation-delay:-4s}.map-lines{position:absolute;inset:0;z-index:-1;width:100%;height:100%}.branches path,.network-lines path{fill:none;stroke:url(#visionLine);stroke-width:2;stroke-dasharray:6 8;animation:dash 16s linear infinite}.moving-dots circle{fill:#71717a;filter:url(#lineGlow)}.zone-title{position:absolute;left:4%;top:0;display:flex;align-items:center;gap:.6rem;color:#3f3f46;font-size:.68rem;font-weight:900;letter-spacing:.17em}.zone-title span{display:grid;width:30px;height:30px;place-items:center;border-radius:50%;background:rgba(82,82,91,.12);letter-spacing:0}.tech-zone{position:absolute;inset:50px 0 auto;height:310px}.tech-cluster{position:absolute;width:29%;height:230px}.tech-1{left:3%}.tech-2{left:35.5%}.tech-3{right:3%}.tech-main{position:absolute;left:50%;top:47%;display:flex;width:145px;height:145px;transform:translate(-50%,-50%);flex-direction:column;align-items:center;justify-content:center;gap:.65rem;border:1px solid rgba(39,39,42,.27);border-radius:50%;background:rgba(255,255,255,.68);text-align:center;box-shadow:0 18px 55px rgba(63,63,70,.08),inset 0 0 25px rgba(82,82,91,.06);backdrop-filter:blur(12px);transition:.35s}.map-dark .tech-main{background:rgba(255,255,255,.045)}.tech-main:hover{transform:translate(-50%,-50%) scale(1.08);box-shadow:0 0 0 12px rgba(82,82,91,.06),0 22px 60px rgba(63,63,70,.15)}.tech-main strong{max-width:110px;font-size:.9rem;line-height:1.3}.tech-icon{width:28px;height:28px;color:#27272a}.keyword-row{position:absolute;left:0;right:0;bottom:0;display:flex;min-height:48px;align-items:flex-start;justify-content:center;gap:.4rem;flex-wrap:wrap;padding:0 .35rem}.satellite{display:inline-flex;max-width:100%;align-items:center;justify-content:center;padding:.42rem .68rem;border-radius:999px;background:rgba(82,82,91,.09);color:#3f3f46;font-size:.7rem;font-weight:800;line-height:1.25;text-align:center;white-space:normal;overflow-wrap:anywhere}.core-zone{position:absolute;top:270px;left:50%;width:280px;height:280px;transform:translateX(-50%)}.vision-core{position:absolute;inset:70px;display:flex;flex-direction:column;align-items:center;justify-content:center;border-radius:50%;background:radial-gradient(circle at 35% 28%,#d4d4d8,#3f3f46 72%);color:white;box-shadow:0 0 0 15px rgba(82,82,91,.055),0 24px 70px rgba(39,39,42,.26)}.vision-core small{display:none}.vision-core strong{font-size:1.35rem;font-weight:950;letter-spacing:.04em}.vision-core span{margin-top:.15rem;font-size:.72rem;font-weight:800;letter-spacing:.22em}.orbit{position:absolute;border:1px solid rgba(39,39,42,.23);border-radius:50%;animation:spin 15s linear infinite}.orbit i{position:absolute;top:-4px;left:50%;width:8px;height:8px;border-radius:50%;background:#52525b;box-shadow:0 0 12px #52525b}.orbit-a{inset:42px}.orbit-b{inset:20px;animation-duration:22s;animation-direction:reverse}.orbit-c{inset:0;border-style:dashed;animation-duration:30s}.application-zone{position:absolute;top:535px;left:0;width:100%;height:230px}.application-zone .zone-title{top:-20px}.app-bubble{position:absolute;top:58px;display:flex;width:145px;height:145px;flex-direction:column;align-items:center;justify-content:center;gap:.55rem;border:1px solid rgba(39,39,42,.22);border-radius:50%;background:rgba(255,255,255,.65);text-align:center;box-shadow:0 18px 45px rgba(68,46,28,.06);backdrop-filter:blur(10px);transition:.3s}.map-dark .app-bubble{background:rgba(255,255,255,.04)}.app-bubble:hover{transform:scale(1.1);border-color:#52525b}.app-bubble .material-icons{color:#27272a;font-size:1.65rem}.app-bubble strong{max-width:105px;font-size:.8rem}.app-1{left:6%}.app-2{left:31%;top:76px}.app-3{right:31%;top:76px}.app-4{right:6%}.network-zone{position:absolute;left:4%;right:4%;top:770px;height:300px}.network-center{position:absolute;z-index:2;top:42px;left:50%;display:flex;transform:translateX(-50%);align-items:center;gap:.55rem;color:#3f3f46;font-size:.66rem;letter-spacing:.12em}.network-center .material-icons{font-size:1.4rem}.network-lines{position:absolute;left:5%;top:58px;width:90%;height:210px}.partner-field{position:absolute;inset:88px 0 0}.partner{position:absolute;display:flex;align-items:center;gap:.45rem;color:#52525b;font-size:.7rem;font-weight:850;white-space:nowrap}.map-dark .partner{color:rgba(255,255,255,.64)}.partner i{width:7px;height:7px;border-radius:50%;background:#52525b;box-shadow:0 0 9px #52525b}.partner-1{left:1%;top:82px}.partner-2{left:13%;top:145px}.partner-3{left:30%;top:72px}.partner-4{left:41%;top:160px}.partner-5{right:34%;top:78px}.partner-6{right:17%;top:145px}.partner-7{right:1%;top:82px}.partner-8{left:50%;top:112px;transform:translateX(-50%)}.confirm-note{position:absolute;bottom:26px;width:100%;text-align:center;color:#a1a1aa;font-size:.62rem}@keyframes dash{to{stroke-dashoffset:-140}}@keyframes spin{to{transform:rotate(360deg)}}@keyframes breathe{to{transform:scale(1.25);opacity:.65}}
@media(max-width:800px){.vision-map{height:1320px;border-radius:2rem}.map-lines{display:none}.tech-zone{height:520px}.tech-cluster{left:50%!important;right:auto!important;width:88%;height:155px;transform:translateX(-50%)}.tech-1{top:10px}.tech-2{top:150px}.tech-3{top:290px}.tech-main{top:35%;width:100px;height:100px}.keyword-row{bottom:0;gap:.3rem;padding:0}.satellite{font-size:.66rem;padding:.34rem .5rem}.core-zone{top:470px;transform:translateX(-50%) scale(.82)}.application-zone{top:730px;height:360px}.app-bubble{width:118px;height:118px}.app-1{left:8%;top:50px}.app-2{left:auto;right:8%;top:50px}.app-3{left:8%;right:auto;top:200px}.app-4{right:8%;top:200px}.network-zone{top:1020px}.network-lines{display:none}.network-center{top:45px}.partner-field{display:flex;inset:105px 0 auto;flex-wrap:wrap;justify-content:center;gap:1rem 1.3rem}.partner{position:static!important;transform:none!important}.confirm-note{padding:0 1rem}.zone-title{left:5%}}
/* Readability and responsive world-network layer */
.map-light .tech-main,
.map-light .app-bubble {
  background: #ffffff;
  border-color: rgba(79, 70, 229, .28);
  box-shadow: 0 16px 40px rgba(30, 41, 59, .10);
}
.map-dark .tech-main,
.map-dark .app-bubble {
  background: #171923;
  border-color: rgba(129, 140, 248, .38);
}
.map-light .tech-main strong,
.map-light .app-bubble strong { color: #111827; }
.map-dark .tech-main strong,
.map-dark .app-bubble strong { color: #f8fafc; }
.map-dark .zone-title,
.map-dark .network-center,
.map-dark .tech-icon,
.map-dark .app-bubble .material-icons { color: #d4d4d8; }
.map-light .satellite {
  background: #f4f4f5;
  color: #3f3f46;
}
.map-dark .satellite {
  background: #27272a;
  color: #e4e4e7;
}
.world-wrap {
  position: absolute;
  top: 64px;
  left: 50%;
  width: min(100%, 980px);
  height: 225px;
  transform: translateX(-50%);
}
.world-map { width: 100%; height: 100%; overflow: visible; }
.continents path { fill: rgba(99, 102, 241, .065); stroke: rgba(79, 70, 229, .22); stroke-width: 1.5; }
.map-dark .continents path { fill: rgba(129, 140, 248, .08); stroke: rgba(165, 180, 252, .24); }
.map-routes path { fill: none; stroke: #52525b; stroke-width: 1.7; stroke-dasharray: 5 6; marker-end: url(#arrowHead); opacity: .72; }
.map-points circle { fill: #71717a; stroke: #fff; stroke-width: 2; filter: url(#mapGlow); }
.map-points .home-point { fill: #27272a; stroke-width: 3; }
.map-label { position: absolute; display: flex; align-items: center; gap: .3rem; color: #334155; font-size: .62rem; font-weight: 800; white-space: nowrap; }
.map-dark .map-label { color: #e2e8f0; }
.map-label b { display: grid; width: 18px; height: 18px; place-items: center; border-radius: 50%; background: #27272a; color: white; font-size: .48rem; }
.label-jhu { left: 18%; top: 40%; }
.label-harvard { left: 20%; top: 22%; }
.label-europe { left: 40%; top: 22%; }
.label-kist-eu { left: 50%; top: 36%; }
.label-ku { right: 1%; top: 29%; }
.label-asan { right: 0; top: 47%; }
.label-jbnu { right: 5%; top: 66%; }
.label-snu { right: 19%; top: 75%; }
.home-label { position: absolute; left: 78.2%; top: 40%; transform: translate(-50%, -100%); color: #3f3f46; font-size: .58rem; font-weight: 950; letter-spacing: .08em; white-space: nowrap; }
.map-legend { display: none; }
@media (max-width: 800px) {
  .vision-map { height: 1370px; }
  .network-zone { height: 280px; }
  .world-wrap { top: 72px; width: 108%; height: 170px; }
  .map-label { display: none; }
  .home-label { font-size: .5rem; }
  .map-legend { position: absolute; top: 225px; left: 0; right: 0; display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: .35rem .7rem; }
  .map-legend span { display: flex; min-width: 0; align-items: center; gap: .35rem; color: #64748b; font-size: .56rem; font-weight: 750; }
  .map-dark .map-legend span { color: #cbd5e1; }
  .map-legend b { color: #27272a; font-size: .52rem; }
  .confirm-note { bottom: 12px; }
}

/* Restrained color accents and redesigned central research core */
.moving-dots circle { fill: #14b8a6; }
.tech-icon { color: #0f766e; }
.app-bubble .material-icons { color: #4f46e5; }
.zone-title span { background: rgba(79, 70, 229, .09); color: #4f46e5; }
.network-center { color: #475569; }
.partner i { background: #14b8a6; box-shadow: 0 0 8px rgba(20, 184, 166, .42); }
.map-dark .zone-title span { background: rgba(165, 180, 252, .12); color: #c7d2fe; }
.map-dark .tech-icon { color: #5eead4; }
.map-dark .app-bubble .material-icons { color: #a5b4fc; }
.map-dark .network-center { color: #cbd5e1; }

.core-zone {
  top: 300px;
  width: 340px;
  height: 210px;
}
.vision-core {
  inset: auto;
  left: 50%;
  top: 58px;
  z-index: 3;
  width: 190px;
  height: 94px;
  transform: translateX(-50%);
  border: 1px solid rgba(79, 70, 229, .22);
  border-radius: 26px;
  background: rgba(255, 255, 255, .94);
  color: #18181b;
  box-shadow: 0 20px 55px rgba(15, 23, 42, .12), inset 0 1px 0 #fff;
  backdrop-filter: blur(18px);
}
.vision-core::before {
  content: '';
  position: absolute;
  top: 0;
  left: 34px;
  right: 34px;
  height: 2px;
  border-radius: 999px;
  background: linear-gradient(90deg, #14b8a6, #6366f1);
}
.vision-core strong { font-size: 1.22rem; letter-spacing: .13em; }
.vision-core span { margin-top: .2rem; color: #64748b; font-size: .61rem; letter-spacing: .34em; }
.map-dark .vision-core {
  border-color: rgba(165, 180, 252, .25);
  background: rgba(24, 24, 27, .94);
  color: #fafafa;
  box-shadow: 0 20px 60px rgba(0, 0, 0, .35), inset 0 1px 0 rgba(255,255,255,.08);
}
.map-dark .vision-core span { color: #a1a1aa; }
.orbit {
  border-radius: 38px;
  animation: none;
}
.orbit i { display: none; }
.orbit-a {
  inset: 44px 18px;
  transform: rotate(7deg);
  border-color: rgba(20, 184, 166, .25);
}
.orbit-b {
  inset: 44px 18px;
  transform: rotate(-7deg);
  border-color: rgba(99, 102, 241, .25);
}
.orbit-c {
  inset: 28px 54px;
  border-radius: 32px;
  border-color: rgba(100, 116, 139, .2);
}
@media (max-width: 800px) {
  .core-zone { top: 490px; transform: translateX(-50%) scale(.82); }
}

/* Responsive layout: switch from coordinates to a readable vertical tree. */
@media (max-width: 800px) {
  .vision-map {
    display: flex;
    width: 100%;
    height: auto;
    min-height: 0;
    flex-direction: column;
    gap: 28px;
    padding: 28px 18px 24px;
    border-radius: 2rem;
  }
  .map-lines,
  .glow { display: none; }
  .tech-zone,
  .core-zone,
  .application-zone,
  .network-zone {
    position: relative;
    inset: auto;
    top: auto;
    left: auto;
    right: auto;
    width: 100%;
    height: auto;
    transform: none;
  }
  .zone-title,
  .application-zone .zone-title {
    position: relative;
    top: auto;
    left: auto;
    margin-bottom: 20px;
  }
  .tech-cluster {
    position: relative;
    top: auto;
    left: auto !important;
    right: auto !important;
    display: grid;
    width: 100%;
    height: auto;
    min-height: 108px;
    grid-template-columns: 104px minmax(0, 1fr);
    align-items: center;
    gap: 12px;
    margin-bottom: 14px;
    transform: none;
  }
  .tech-main {
    position: relative;
    top: auto;
    left: auto;
    width: 104px;
    height: 104px;
    transform: none;
  }
  .tech-main:hover { transform: scale(1.03); }
  .keyword-row {
    position: relative;
    inset: auto;
    min-width: 0;
    min-height: 0;
    justify-content: flex-start;
    padding: 0;
  }
  .satellite {
    max-width: 100%;
    white-space: normal;
    overflow-wrap: anywhere;
  }
  .core-zone {
    width: 280px;
    height: 170px;
    margin: 0 auto;
  }
  .application-zone {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 14px;
  }
  .application-zone .zone-title { grid-column: 1 / -1; }
  .app-bubble {
    position: relative;
    inset: auto;
    top: auto;
    left: auto;
    right: auto;
    width: 110px;
    height: 110px;
    margin: auto;
  }
  .network-zone { padding-top: 0; }
  .network-center {
    position: relative;
    top: auto;
    left: auto;
    margin: 0 auto;
    transform: none;
    justify-content: center;
  }
  .network-lines { display: none; }
  .partner-field {
    position: relative;
    inset: auto;
    display: flex;
    margin-top: 20px;
    flex-wrap: wrap;
    justify-content: center;
    gap: .8rem 1rem;
  }
  .partner {
    position: static !important;
    transform: none !important;
    font-size: .62rem;
  }
  .confirm-note {
    position: relative;
    bottom: auto;
    width: 100%;
    padding: 0;
  }
}

@media (min-width: 801px) and (max-width: 1050px) {
  .vision-map { height: 1080px; }
  .tech-main { width: 128px; height: 128px; }
  .satellite { padding: .34rem .48rem; font-size: .62rem; }
  .app-bubble { width: 125px; height: 125px; }
  .partner { font-size: .62rem; }
}

/* Partner names use natural flow so additional institutions never overlap. */
.network-lines { display: none; }
.partner-field {
  position: absolute;
  top: 100px;
  left: 3%;
  right: 3%;
  display: flex;
  flex-wrap: wrap;
  align-content: flex-start;
  justify-content: center;
  gap: 1rem 1.7rem;
}
.partner {
  position: static !important;
  display: flex;
  min-width: 0;
  transform: none !important;
  align-items: center;
  gap: .45rem;
  line-height: 1.35;
  text-align: left;
  white-space: normal;
}
.partner i { flex: none; }
@media (max-width: 800px) {
  .partner-field {
    position: relative;
    top: auto;
    left: auto;
    right: auto;
    margin-top: 20px;
    gap: .8rem 1rem;
  }
}
@media (min-width: 801px) and (max-width: 1050px) {
  .partner-field { left: 5%; right: 5%; gap: .8rem 1.1rem; }
}
</style>
