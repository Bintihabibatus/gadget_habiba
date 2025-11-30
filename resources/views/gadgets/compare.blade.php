<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perbandingan Gadget</title>
    @vite('resources/css/app.css')
    <style>
      /* Highlight perbedaan nilai spesifikasi antar gadget */
      .diff-cell { background-color: #fff9c4; }
      .dark .diff-cell { background-color: rgba(255, 235, 59, 0.15); }
      .no-highlight .diff-cell { background: transparent !important; }

      /* Sticky header untuk tabel spesifikasi saat scroll */
      table thead th {
        position: sticky;
        top: 0;
        z-index: 2;
        background: #ffffff;
        box-shadow: 0 1px 0 rgba(0,0,0,0.05);
      }
      .dark table thead th {
        background: #131312;
        box-shadow: 0 1px 0 rgba(255,255,255,0.06);
      }

      /* Sticky kolom pertama (label kunci) agar tetap terlihat saat scroll horizontal) */
      table th:first-child,
      table td:first-child {
        position: sticky;
        left: 0;
        z-index: 1;
        background: #ffffff;
      }
      .dark table th:first-child,
      .dark table td:first-child {
        background: #131312;
      }

      /* Sembunyikan baris yang nilainya sama seluruh gadget */
      .hide-equal tbody tr.row-equal { display: none; }

      /* Zebra striping untuk keterbacaan baris */
      .spec-table tbody tr:nth-child(even) { background-color: #fafafa; }
      .dark .spec-table tbody tr:nth-child(even) { background-color: rgba(255,255,255,0.03); }

      /* Kontrol compare */
      .compare-controls { display: flex; gap: .5rem; align-items: center; margin-bottom: .75rem; }
      .compare-controls button { border: 1px solid #ddd; padding: .4rem .6rem; border-radius: .5rem; background: #fff; }
      .dark .compare-controls button { border-color: #2A2A28; background: #131312; color: #EDEDEC; }
      .compare-controls button[aria-pressed="true"] { border-color: #f59e0b; background: #fff7ed; color: #b45309; }
      .dark .compare-controls button[aria-pressed="true"] { border-color: #f59e0b; background: rgba(245, 158, 11, 0.12); color: #fbbf24; }
      .compare-controls .copy-status { font-size: .85rem; color: #16a34a; }
    </style>
    <script>
      (function(){
        try {
          var saved = localStorage.getItem('theme');
          var prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
          var enableDark = saved ? saved === 'dark' : prefersDark;
          var root = document.documentElement;
          if (enableDark) root.classList.add('dark');
        } catch (e) {}
      })();
    </script>
</head>
<body class="font-sans antialiased theme-transition min-h-screen flex flex-col">
    <x-header />
    <main class="max-w-7xl mx-auto p-6 grid gap-6 relative flex-1">
        <div id="conn-banner" class="hidden mb-4 p-3 rounded border border-yellow-300 bg-yellow-50 text-yellow-900">
          Tidak dapat memuat preview? Coba akses melalui `http://127.0.0.1:8001` atau pastikan server backend aktif. Jika tetap gagal di `localhost`, kemungkinan masalah resolusi IPv6.
        </div>
        <div class="brand-blob p1 absolute -top-12 -left-12 dark:hidden"></div>
        <div class="brand-blob p3 absolute -bottom-16 -right-16 dark:hidden"></div>
        @if($gadgets->isEmpty())
          <section class="bg-white/95 dark:bg-[#161615] border border-brandPink-100 dark:border-[#3E3E3A] rounded-2xl p-6">
            <h1 class="ui-h2 mb-2">Perbandingan Gadget</h1>
            <p class="text-sm text-gray-700 dark:text-[#EDEDEC]">Belum ada gadget dipilih untuk dibandingkan. Kamu bisa memilih hingga {{ config('app.compare_max') }} gadget di Katalog lalu klik tombol Compare.</p>
            <div class="mt-4 flex gap-2">
              <a href="{{ route('gadgets.index', [], false) }}" class="ui-button ui-button-sm ui-button-primary"><span class="i-heroicons-square-2-stack-20-solid"></span> Mulai Pilih Gadget</a>
              <a href="{{ route('home', [], false) }}" class="ui-button ui-button-sm ui-button-ghost">Kembali ke Beranda</a>
            </div>
          </section>
        @else
          <section class="bg-white dark:bg-[#131312] rounded shadow p-6 border border-transparent dark:border-[#2A2A28]">
              <h1 class="text-2xl font-700 mb-4 brand-gradient-title">Perbandingan Gadget</h1>
              <div class="grid grid-cols-1 md:grid-cols-{{ max(2, $gadgets->count()) }} gap-4">
                  @foreach($gadgets as $g)
                      <article class="border border-brandPink-100 dark:border-[#2A2A28] rounded-2xl p-4 grid gap-2 bg-white dark:bg-[#131312] shadow hover:shadow-md transition" data-gadget-slug="{{ $g->slug }}">
                          <div class="text-lg font-600 dark:text-white">{{ $g->name }}</div>
                          <div class="text-sm text-gray-600 dark:text-[#9A9A9A]">{{ $g->brand->name }} • {{ $g->category->name }}</div>
                          <div class="flex items-center gap-3">
                              <span class="text-brandPink-700 dark:text-white font-800">Rp {{ number_format($g->price,0,',','.') }}</span>
                              @if($g->release_date)
              <span class="text-xs px-2 py-1 rounded-full bg-brandPink-50 text-brandPink-700 dark:bg-[#131312] dark:text-white">{{ $g->release_date->format('Y') }}</span>
                              @endif
                          </div>
            <a href="{{ route('gadgets.show', $g->slug, false) }}" class="text-brandPink-700 hover:text-brandPink-900 dark:text-[#EDEDEC] dark:hover:text-white">Lihat detail</a>
            <div class="flex gap-2 mt-2">
              <button type="button" data-remove-from-compare class="px-3 py-1 rounded border border-red-300 text-red-600 hover:bg-red-50 dark:text-red-400">Hapus dari Compare</button>
            </div>
                      </article>
                  @endforeach
              </div>
          </section>

          <section class="bg-white dark:bg-[#131312] rounded shadow p-6 overflow-x-auto border border-transparent dark:border-[#2A2A28]">
              <h2 class="text-xl font-600 mb-3 brand-gradient-title">Spesifikasi</h2>
              <div class="compare-controls">
                <button type="button" id="toggle-highlight" aria-pressed="true">Sorot Perbedaan</button>
                <button type="button" id="toggle-hide-equal" aria-pressed="false">Sembunyikan yang Sama</button>
                <button type="button" id="copy-link">Bagikan Tautan</button>
                <button type="button" id="reset-view">Tampilkan Semua</button>
                <span id="copy-status" class="copy-status" style="display:none;">Tautan disalin</span>
              </div>
              <table class="min-w-full border-collapse spec-table" id="spec-table">
                  <thead>
                      <tr>
                          <th class="text-left p-2 border border-brandPink-100 dark:border-[#2A2A28]">Kunci</th>
                          @foreach($gadgets as $g)
                              <th class="text-left p-2 border border-brandPink-100 dark:border-[#2A2A28] dark:text-white">{{ $g->name }}</th>
                          @endforeach
                      </tr>
                  </thead>
                  <tbody>
                      @foreach($allKeys as $key)
                          <tr>
                              <td class="p-2 border border-brandPink-100 dark:border-[#2A2A28] text-gray-600 dark:text-[#9A9A9A]">{{ $key }}</td>
                              @foreach($gadgets as $g)
                                  <td class="p-2 border border-brandPink-100 dark:border-[#2A2A28]">{{ $specMap[$g->id][$key] ?? '-' }}</td>
                              @endforeach
                          </tr>
                      @endforeach
                  </tbody>
              </table>
          </section>
        @endif
    </main>
    <x-footer />
    @vite('resources/js/app.js')
    <script>
      // Health check & fallback UI when service appears unavailable in webview
      (function(){
        const banner = document.getElementById('conn-banner');
        const showBanner = () => { if (banner) banner.classList.remove('hidden'); };
        try {
          // Only run on localhost to surface common IDE webview issues
          if (location.hostname === 'localhost') {
            fetch('/healthz', { method: 'GET', cache: 'no-store' })
              .then(r => { if (!r.ok) throw new Error('bad status'); })
              .catch(() => showBanner());
          }
        } catch(e){ showBanner(); }
      })();

      // Remove-from-compare actions: update localStorage and navigate to new compare URL
      document.addEventListener('DOMContentLoaded', () => {
        const storageKey = 'compareSelectedSlugs';
        const link = document.getElementById('compare-summary');
        const baseUrl = (link && (link.dataset.baseUrl || link.getAttribute('href'))) || "{{ route('gadgets.compare', [], false) }}";
        const toSet = (arr) => new Set(arr);
        const saveSet = (set) => { try { localStorage.setItem(storageKey, JSON.stringify([...set])); } catch {} };

        // Derive current selection from rendered compare cards
        const currentSlugs = Array.from(document.querySelectorAll('article[data-gadget-slug]')).map(el => el.dataset.gadgetSlug).filter(Boolean);
        let selected = toSet(currentSlugs);

        document.querySelectorAll('[data-remove-from-compare]').forEach((btn) => {
          btn.addEventListener('click', () => {
            const card = btn.closest('article[data-gadget-slug]');
            const slug = card && card.dataset.gadgetSlug;
            if (!slug) return;
            selected.delete(slug);
            saveSet(selected);
            const next = selected.size > 0 ? `${baseUrl}?compare=${[...selected].join(',')}` : baseUrl;
            // Navigate to updated compare page (server keeps authoritative spec table)
            window.location.assign(next);
          });
        });

        // Sorot perbedaan pada tabel spesifikasi
        try {
          const tables = document.querySelectorAll('table.spec-table');
          tables.forEach((table) => {
            const rows = table.querySelectorAll('tbody tr');
            rows.forEach((row) => {
              const tds = Array.from(row.querySelectorAll('td'));
              if (tds.length <= 2) return; // minimal: label + 2 gadget kolom
              const valueCells = tds.slice(1); // kolom nilai per gadget, skip label
              const normalized = valueCells.map((c) => (c.textContent || '').trim().toLowerCase().replace(/\s+/g, ' '));
              const first = normalized[0];
              const allEqual = normalized.every((v) => v === first);
              if (!allEqual) {
                row.classList.add('row-diff');
                valueCells.forEach((c) => c.classList.add('diff-cell'));
              } else {
                row.classList.add('row-equal');
              }
            });
          });
        } catch (e) {
          // noop
        }

        // Toggle highlight & hide equal
        const specTable = document.getElementById('spec-table');
        const btnHighlight = document.getElementById('toggle-highlight');
        const btnHideEqual = document.getElementById('toggle-hide-equal');
        const copyBtn = document.getElementById('copy-link');
        const copyStatus = document.getElementById('copy-status');
        const resetBtn = document.getElementById('reset-view');

        const hlKey = 'compareHighlightOn';
        const hideKey = 'compareHideEqualsOn';
        const readBool = (k, d) => {
          try { const v = localStorage.getItem(k); if (v === null) return d; return v === 'true'; } catch { return d; }
        };
        const writeBool = (k, v) => { try { localStorage.setItem(k, v ? 'true' : 'false'); } catch {} };

        let highlightOn = readBool(hlKey, true);
        let hideEqualsOn = readBool(hideKey, false);

        const applyToggles = () => {
          if (!specTable) return;
          specTable.classList.toggle('no-highlight', !highlightOn);
          specTable.classList.toggle('hide-equal', hideEqualsOn);
          if (btnHighlight) btnHighlight.setAttribute('aria-pressed', String(highlightOn));
          if (btnHideEqual) btnHideEqual.setAttribute('aria-pressed', String(hideEqualsOn));
        };
        applyToggles();

        if (btnHighlight) {
          btnHighlight.addEventListener('click', () => {
            highlightOn = !highlightOn;
            writeBool(hlKey, highlightOn);
            applyToggles();
          });
        }

        if (btnHideEqual) {
          btnHideEqual.addEventListener('click', () => {
            hideEqualsOn = !hideEqualsOn;
            writeBool(hideKey, hideEqualsOn);
            applyToggles();
          });
        }

        if (copyBtn) {
          copyBtn.addEventListener('click', async () => {
            try {
              await navigator.clipboard.writeText(window.location.href);
              if (copyStatus) {
                copyStatus.style.display = 'inline';
                setTimeout(() => { copyStatus.style.display = 'none'; }, 1500);
              }
            } catch (e) {
              // fallback
              alert('Gagal menyalin tautan');
            }
          });
        }

        if (resetBtn) {
          resetBtn.addEventListener('click', () => {
            // Kembalikan ke default: highlight ON, hide equals OFF
            highlightOn = true;
            hideEqualsOn = false;
            writeBool(hlKey, highlightOn);
            writeBool(hideKey, hideEqualsOn);
            applyToggles();
          });
        }
      });
    </script>
</body>
</html>
