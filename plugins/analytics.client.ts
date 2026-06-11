/**
 * 분석 도구 통합 플러그인 (클라이언트 전용)
 * - Google Tag Manager (GTM)
 * - Microsoft Clarity
 * - Meta Pixel (Facebook)
 * - Naver Analytics
 * - Beusable
 * - Mixpanel
 */
export default defineNuxtPlugin(() => {
  const config = useRuntimeConfig()

  // Production 환경 체크
  const siteUrl = config.public.siteUrl as string
  const isProd = !!siteUrl && !siteUrl.includes('localhost')

  // GTM 초기화 (모든 환경)
  if (config.public.gtmId) {
    initGTM(config.public.gtmId as string)
  }

  // === Production 전용 Analytics ===
  if (isProd) {
    // Microsoft Clarity 초기화
    if (config.public.clarityId) {
      initClarity(config.public.clarityId as string)
    }

    // Naver Analytics 초기화
    if (config.public.naverAnalyticsId) {
      initNaverAnalytics(config.public.naverAnalyticsId as string)
    }

    // Beusable 초기화
    if (config.public.beusableId) {
      initBeusable(config.public.beusableId as string)
    }

    // Mixpanel 초기화
    if (config.public.mixpanelToken) {
      initMixpanel(config.public.mixpanelToken as string)
    }
  }

  // Meta Pixel 초기화 (모든 환경)
  if (config.public.metaPixelId) {
    initMetaPixel(config.public.metaPixelId as string)
  }
})

/**
 * Google Tag Manager 초기화
 */
function initGTM(gtmId: string) {
  // GTM Script
  const script = document.createElement('script')
  script.innerHTML = `
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','${gtmId}');
  `
  document.head.appendChild(script)

  // GTM noscript (for users with JS disabled)
  const noscript = document.createElement('noscript')
  const iframe = document.createElement('iframe')
  iframe.src = `https://www.googletagmanager.com/ns.html?id=${gtmId}`
  iframe.height = '0'
  iframe.width = '0'
  iframe.style.display = 'none'
  iframe.style.visibility = 'hidden'
  noscript.appendChild(iframe)
  document.body.insertBefore(noscript, document.body.firstChild)
}

/**
 * Microsoft Clarity 초기화
 */
function initClarity(clarityId: string) {
  const script = document.createElement('script')
  script.innerHTML = `
    (function(c,l,a,r,i,t,y){
      c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
      t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
      y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
    })(window, document, "clarity", "script", "${clarityId}");
  `
  document.head.appendChild(script)
}

/**
 * Meta Pixel (Facebook) 초기화
 */
function initMetaPixel(pixelId: string) {
  const script = document.createElement('script')
  script.innerHTML = `
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '${pixelId}');
    fbq('track', 'PageView');
  `
  document.head.appendChild(script)

  // noscript fallback
  const noscript = document.createElement('noscript')
  const img = document.createElement('img')
  img.height = 1
  img.width = 1
  img.style.display = 'none'
  img.src = `https://www.facebook.com/tr?id=${pixelId}&ev=PageView&noscript=1`
  noscript.appendChild(img)
  document.body.appendChild(noscript)
}

/**
 * Naver Analytics 초기화
 */
function initNaverAnalytics(analyticsId: string) {
  const script = document.createElement('script')
  script.src = `https://wcs.naver.net/wcslog.js`
  script.onload = () => {
    const initScript = document.createElement('script')
    initScript.innerHTML = `
      if(!wcs_add) var wcs_add = {};
      wcs_add["wa"] = "${analyticsId}";
      if(window.wcs) {
        wcs_do();
      }
    `
    document.head.appendChild(initScript)
  }
  document.head.appendChild(script)
}

/**
 * Beusable 초기화
 */
function initBeusable(beusableId: string) {
  const script = document.createElement('script')
  script.innerHTML = `
    (function(w, d, a){
      w.__beusablerumclient__ = {
        load : function(src){
          var b = d.createElement("script");
          b.src = src; b.async=true; b.type = "text/javascript";
          d.getElementsByTagName("head")[0].appendChild(b);
        }
      };w.__beusablerumclient__.load(a + "?url=" + encodeURIComponent(d.URL));
    })(window, document, "//rum.beusable.net/load/${beusableId}");
  `
  document.head.appendChild(script)
}

/**
 * Mixpanel 초기화
 */
function initMixpanel(token: string) {
  const script = document.createElement('script')
  script.innerHTML = `
    (function(f,b){if(!b.__SV){var e,g,i,h;window.mixpanel=b;b._i=[];b.init=function(e,f,c){function g(a,d){var b=d.split(".");2==b.length&&(a=a[b[0]],d=b[1]);a[d]=function(){a.push([d].concat(Array.prototype.slice.call(arguments,0)))}}var a=b;"undefined"!==typeof c?a=b[c]=[]:c="mixpanel";a.people=a.people||[];a.toString=function(a){var d="mixpanel";"mixpanel"!==c&&(d+="."+c);a||(d+=" (stub)");return d};a.people.toString=function(){return a.toString(1)+".people (stub)"};i="disable time_event track track_pageview track_links track_forms track_with_groups add_group set_group remove_group register register_once alias unregister identify name_tag set_config reset opt_in_tracking opt_out_tracking has_opted_in_tracking has_opted_out_tracking clear_opt_in_out_tracking start_batch_senders people.set people.set_once people.unset people.increment people.append people.union people.track_charge people.clear_charges people.delete_user people.remove".split(" ");for(h=0;h<i.length;h++)g(a,i[h]);var j="set set_once union unset remove delete".split(" ");a.get_group=function(){function b(c){d[c]=function(){call2_args=arguments;call2=[c].concat(Array.prototype.slice.call(call2_args,0));a.push([e,call2])}}for(var d={},e=["get_group"].concat(Array.prototype.slice.call(arguments,0)),c=0;c<j.length;c++)b(j[c]);return d};b._i.push([e,f,c])};b.__SV=1.2;e=f.createElement("script");e.type="text/javascript";e.async=!0;e.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?MIXPANEL_CUSTOM_LIB_URL:"file:"===f.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\\/\\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";g=f.getElementsByTagName("script")[0];g.parentNode.insertBefore(e,g)}})(document,window.mixpanel||[]);
    mixpanel.init("${token}", {track_pageview: true});
  `
  document.head.appendChild(script)
}
