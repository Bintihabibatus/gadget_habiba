import '@unocss/reset/tailwind.css';
import 'uno.css';
import './bootstrap';

// Initialize theme from localStorage or OS preference
(function initTheme() {
  try {
    const saved = localStorage.getItem('theme');
    const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    const shouldDark = saved ? saved === 'dark' : prefersDark;
    const root = document.documentElement;
    if (shouldDark) root.classList.add('dark'); else root.classList.remove('dark');
  } catch (e) { /* noop */ }
})();

// Fade-in images marked with data-fade
document.addEventListener('DOMContentLoaded', () => {
  // Fade-in images marked with data-fade
  const imgs = document.querySelectorAll('img[data-fade]');
  imgs.forEach((img) => {
    const show = () => img.classList.add('opacity-100');
    if (img.complete) show(); else img.addEventListener('load', show, { once: true });
  });

  // Global theme toggle handler
  const btn = document.getElementById('theme-toggle');
  if (btn) {
    const root = document.documentElement;
    const label = document.getElementById('theme-toggle-label');
    // Init label on load if exists
    if (label) label.textContent = root.classList.contains('dark') ? 'Gelap' : 'Terang';
    const contrastGuard = () => {
      try {
        const isDark = root.classList.contains('dark');
        if (!isDark) return;
        // Jaga keterbacaan hanya pada permukaan benar-benar putih (bg-white token),
        // dan jangan override elemen yang punya aturan dark:* spesifik.
        const whiteBgCandidates = document.querySelectorAll('[class~="bg-white"]');
        whiteBgCandidates.forEach((el) => {
          const cls = el.className || '';
          // Hindari override jika punya kelas dark:bg*, dark:text*, atau sudah putih eksplisit
          if (/dark:bg|dark:text|ui-button-primary|text-white/.test(cls)) return;
          el.style.color = '#1A1A18';
        });
        const inputs = document.querySelectorAll('input.bg-white, select.bg-white, textarea.bg-white');
        inputs.forEach((el) => { el.style.color = '#1A1A18'; });
      } catch {}
    };
    // Run once on load
    contrastGuard();
    btn.addEventListener('click', () => {
      const nowDark = root.classList.toggle('dark');
      try { localStorage.setItem('theme', nowDark ? 'dark' : 'light'); } catch (e) {}
      if (label) label.textContent = nowDark ? 'Gelap' : 'Terang';
      // Re-apply contrast guard after theme switch
      contrastGuard();
    });
  }

  // Prefetch detail pages dengan fetch yang dapat dibatalkan
  const prefetchLinks = document.querySelectorAll('a[data-prefetch]');
  const canPrefetch = () => {
    try {
      const conn = navigator.connection;
      if (conn && (conn.saveData || /2g/.test(conn.effectiveType || ''))) return false;
      return !document.hidden;
    } catch { return true; }
  };
  const startPrefetch = (el) => {
    try {
      if (el.dataset.prefetched === '1' || !canPrefetch()) return;
      const href = el.getAttribute('href');
      if (!href) return;
      // Hindari cross-origin
      const isAbsolute = /^(https?:)?\/\//.test(href);
      if (isAbsolute && !href.startsWith(location.origin)) return;
      // Jadwalkan prefetch ringan dan bisa dibatalkan
      const controller = new AbortController();
      el._prefetchController = controller;
      el._prefetchTimer = setTimeout(() => {
        fetch(href, {
          method: 'GET',
          headers: { 'Accept': 'text/html' },
          signal: controller.signal,
          cache: 'force-cache',
        }).catch(() => { /* swallow errors */ }).finally(() => {
          el.dataset.prefetched = '1';
          el._prefetchController = null;
        });
      }, 200);
    } catch (e) { /* noop */ }
  };
  const cancelPrefetch = (el) => {
    try {
      if (el._prefetchTimer) { clearTimeout(el._prefetchTimer); el._prefetchTimer = null; }
      const c = el._prefetchController;
      if (c) { c.abort(); el._prefetchController = null; }
    } catch (e) { /* noop */ }
  };
  prefetchLinks.forEach((el) => {
    el.addEventListener('mouseenter', () => startPrefetch(el));
    el.addEventListener('mouseleave', () => cancelPrefetch(el));
    el.addEventListener('focus', () => startPrefetch(el));
    el.addEventListener('blur', () => cancelPrefetch(el));
    // Tidak lagi melakukan prefetch otomatis saat idle untuk mengurangi noise log
  });

  // Toggle visual selection on gadget cards when checkbox is checked
  const checkboxToggles = document.querySelectorAll('article input.compare-toggle');
  checkboxToggles.forEach((cb) => {
    const card = cb.closest('article');
    const apply = () => {
      if (cb.checked) card?.classList.add('compare-selected');
      else card?.classList.remove('compare-selected');
    };
    cb.addEventListener('change', apply);
    apply();
  });

  // Toggle selection via button (Tambah ke Compare)
  const storageKey = 'compareSelectedSlugs';
  const loadSet = () => {
    try { return new Set(JSON.parse(localStorage.getItem(storageKey) || '[]')); } catch { return new Set(); }
  };
  const saveSet = (set) => {
    try { localStorage.setItem(storageKey, JSON.stringify([...set])); } catch {}
  };
  const selectedSet = loadSet();

  // Get configurable compare max from header data attribute
  const getCompareMax = () => {
    const link = document.getElementById('compare-summary');
    const val = Number(link?.dataset?.compareMax);
    return Number.isFinite(val) && val > 0 ? val : 4;
  };

  // Update header compare summary
  const updateCompareSummary = () => {
    const link = document.getElementById('compare-summary');
    const countEl = document.getElementById('compare-count');
    if (!link || !countEl) return;
    const n = selectedSet.size;
    countEl.textContent = String(n);
    link.setAttribute('aria-label', `Bandingkan gadget terpilih (${n})`);
    const base = link.dataset.baseUrl || link.href;
    const href = n > 0 ? `${base}?compare=${[...selectedSet].join(',')}` : base;
    link.href = href;
  };
  updateCompareSummary();

  const buttonToggles = document.querySelectorAll('article [data-compare-toggle]');
  buttonToggles.forEach((btn) => {
    const card = btn.closest('article');
    const slug = card?.dataset?.gadgetSlug;
    const badge = card?.querySelector('.ui-selected-badge');
    const textEl = btn.querySelector('.compare-btn-text');
    const MAX_COMPARE = getCompareMax();

    const showToast = (msg) => {
      try {
        const toast = document.createElement('div');
        toast.textContent = msg;
        toast.setAttribute('role', 'status');
        toast.setAttribute('aria-live', 'polite');
        toast.className = 'fixed bottom-4 left-1/2 -translate-x-1/2 bg-brandPink-700 text-white px-3 py-2 rounded shadow z-50';
        document.body.appendChild(toast);
        setTimeout(() => {
          toast.classList.add('opacity-0');
          setTimeout(() => toast.remove(), 200);
        }, 1500);
      } catch {}
    };

    const applyState = (pressed, skipSave = false) => {
      btn.setAttribute('aria-pressed', pressed ? 'true' : 'false');
      if (pressed) card?.classList.add('compare-selected');
      else card?.classList.remove('compare-selected');
      if (badge) badge.style.display = pressed ? 'inline-flex' : '';
      if (textEl) textEl.textContent = pressed ? 'Batalkan Compare' : 'Tambah ke Compare';
      if (!skipSave && slug) {
        if (pressed) selectedSet.add(slug); else selectedSet.delete(slug);
        saveSet(selectedSet);
      }
    };

    // Initialize from storage
    const initialPressed = slug ? selectedSet.has(slug) : false;
    applyState(initialPressed, true);
    updateCompareSummary();

    btn.addEventListener('click', () => {
      const current = btn.getAttribute('aria-pressed') === 'true';
      if (!current && selectedSet.size >= MAX_COMPARE && !(slug && selectedSet.has(slug))) {
        // feedback singkat ketika mencapai batas
        btn.classList.add('shake');
        setTimeout(() => btn.classList.remove('shake'), 300);
        btn.title = `Maksimal ${MAX_COMPARE} item untuk compare`;
        showToast(`Maksimal ${MAX_COMPARE} item untuk compare`);
        return;
      }
      applyState(!current);
      updateCompareSummary();
    });
  });
});
