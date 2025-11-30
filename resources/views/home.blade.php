<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Beranda | Habiba Gadget</title>
  @vite(['resources/css/app.css', 'resources/js/app.js'])
  <script>
    // Inisialisasi tema lebih awal untuk mencegah FOUC
    (function(){
      try {
        var saved = localStorage.getItem('theme');
        var prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
        var enableDark = saved ? saved === 'dark' : prefersDark;
        var root = document.documentElement;
        if (enableDark) root.classList.add('dark'); else root.classList.remove('dark');
      } catch (e) {}
    })();
  </script>
</head>
<body class="font-sans antialiased theme-transition min-h-screen flex flex-col">
  <x-header narrow="true" />

  <main class="flex-1">
    <!-- Hero -->
    <section class="relative overflow-hidden ui-section brand-gradient-bg">
      <div class="brand-blob p1 absolute -top-20 -left-20 dark:hidden"></div>
      <div class="brand-blob p2 absolute -bottom-24 -right-24 dark:hidden"></div>
      <div class="ui-container ui-container-narrow ui-hero-grid">
        <div>
          <h1 class="ui-h1">Temukan gadget terbaik, lucu dan kece!</h1>
          <p class="mt-4 text-gray-700 dark:text-[#9A9A9A]">Jelajahi katalog lengkap berdasarkan brand, kategori, rating, dan spesifikasi. Desain modern, clean, dominan pink.</p>
          <div class="mt-6 ui-row">
            <a href="{{ route('gadgets.index', [], false) }}" class="inline-block px-5 py-2.5 rounded-full bg-brandPink-600 text-white hover:bg-brandPink-700 transition shadow-md">Jelajahi Gadget</a>
            <a href="{{ route('brands.index', [], false) }}" class="ui-button ui-button-sm ui-button-ghost"><span class="btn-text">Lihat Brand</span><span class="btn-text-xs">Brand</span></a>
          </div>
          <!-- Quick Search -->
          <form action="{{ route('gadgets.index', [], false) }}" method="get" class="mt-4 ui-form-row">
            <label for="home-search" class="sr-only">Cari gadget</label>
            <p id="home-search-desc" class="sr-only">Cari berdasarkan nama atau model gadget.</p>
            <input id="home-search" type="text" name="q" aria-describedby="home-search-desc" placeholder="Cari gadget (contoh: iPhone 15, Galaxy S24)..." class="flex-1 border border-brandPink-200 dark:border-[#2A2A28] rounded px-3 py-2 bg-white dark:bg-[#131312] text-gray-900 dark:text-[#EDEDEC] placeholder:text-gray-500" />
            <button class="ui-button ui-button-sm ui-button-primary">Cari</button>
          </form>
          <p class="mt-1 text-xs text-gray-600 dark:text-[#9A9A9A]">Tekan Enter untuk mencari cepat. Coba kata kunci populer di bawah.</p>
          <!-- Jelajahi Cepat -->
          <div class="mt-3 flex flex-wrap gap-2">
          <a href="{{ route('gadgets.index', ['sort' => 'rating_avg', 'dir' => 'desc'], false) }}" class="ui-pill"><span class="i-heroicons-sparkles-20-solid"></span> Rating tinggi</a>
            <a href="{{ route('gadgets.index', ['sort' => 'price', 'dir' => 'asc'], false) }}" class="ui-pill"><span class="i-heroicons-currency-dollar-20-solid"></span> Termurah</a>
            <a href="{{ route('gadgets.index', ['sort' => 'release_date', 'dir' => 'desc'], false) }}" class="ui-pill"><span class="i-heroicons-clock-20-solid"></span> Terbaru</a>
            <a href="{{ route('gadgets.index', ['q' => 'iPhone'], false) }}" class="ui-pill"><span class="i-heroicons-device-phone-mobile-20-solid"></span> iPhone</a>
            <a href="{{ route('gadgets.index', ['brand' => 'samsung'], false) }}" class="ui-pill"><span class="i-heroicons-building-storefront-20-solid"></span> Samsung</a>
            <a href="{{ route('categories.show', 'wearable', false) }}" class="ui-pill"><span class="i-heroicons-tag-20-solid"></span> Wearable</a>
          </div>
        </div>
        <div class="ui-desktop-only">
          <figure class="w-full aspect-video rounded-2xl overflow-hidden bg-white dark:bg-[#131312] shadow border border-brandPink-200 dark:border-[#2A2A28]">
            <img src="https://i.pinimg.com/736x/69/4f/51/694f518a2b8dab0d287224eed62a6a06.jpg"
     alt="Ilustrasi gadget di tangan"
     class="w-full h-full object-cover"
     loading="lazy">

          </figure>
        </div>
      </div>
    </section>

    <!-- Gadget Terbaru -->
    <section class="ui-section">
      <div class="ui-container ui-container-narrow">
        <div class="ui-between">
          <h2 class="ui-h2">Gadget Terbaru</h2>
          <a href="{{ route('gadgets.index', [], false) }}" class="ui-link">Lihat semua</a>
        </div>
        <div class="ui-grid-cards mt-6">
          @forelse($latestGadgets as $g)
            <x-gadget-card :gadget="$g" compact="true" />
          @empty
            <p class="text-sm text-gray-600">Belum ada data gadget.</p>
          @endforelse
        </div>
      </div>
    </section>

    <!-- Gadget Teratas -->
    <section class="ui-section ui-section-muted">
      <div class="ui-container ui-container-narrow">
        <div class="ui-between">
          <h2 class="ui-h2">Gadget Teratas</h2>
          <a href="{{ route('gadgets.index', [], false) }}" class="ui-link">Lihat semua</a>
        </div>
        <div class="ui-grid-cards mt-6">
          @forelse($topRatedGadgets as $g)
            <x-gadget-card :gadget="$g" compact="true" />
          @empty
            <p class="text-sm text-gray-600">Belum ada data rating.</p>
          @endforelse
        </div>
      </div>
    </section>

    <!-- Teaser Bandingkan Gadget -->
    <section class="ui-section">
      <div class="ui-container ui-container-narrow ui-card ui-card-pad ui-teaser">
        <div>
          <h2 class="ui-h2">Bandingkan Gadget dengan Sekali Klik</h2>
          <p class="mt-2 text-sm text-gray-700 dark:text-[#9A9A9A]">Centang "Pilih untuk compare" pada beberapa kartu, lalu buka halaman katalog untuk mulai membandingkan spesifikasi berdampingan.</p>
        </div>
        <div>
          <a href="{{ route('gadgets.index', [], false) }}" class="ui-button ui-button-sm ui-button-primary"><span class="i-heroicons-square-2-stack-20-solid"></span> <span class="btn-text">Mulai Bandingkan</span><span class="btn-text-xs">Bandingkan</span></a>
        </div>
      </div>
    </section>

    <!-- Brand Populer -->
    
    <section class="ui-section">
      <div class="ui-container ui-container-narrow">
        <div class="ui-between">
          <h2 class="ui-h2">Brand Populer</h2>
            <a href="{{ route('brands.index', [], false) }}" class="ui-link">Lihat semua brand</a>
        </div>
        <div class="ui-grid-cards mt-6">
          @forelse($popularBrands as $b)
            <a href="{{ route('brands.show', $b->slug, false) }}" class="ui-card ui-card-compact block p-3 border border-brandPink-100 dark:border-[#2A2A28] dark:bg-[#131312] dark:hover:bg-[#151514] transition" data-prefetch="hover">
              <div class="text-sm font-700 text-brandPink-900 dark:text-[#EDEDEC]">{{ $b->name }}</div>
              <div class="mt-1"><span class="ui-chip">{{ $b->gadgets_count }} gadget</span></div>
            </a>
          @empty
            <p class="text-sm text-gray-600">Belum ada data brand.</p>
          @endforelse
        </div>
      </div>
    </section>

    <!-- Kategori Populer -->
    <section class="ui-section ui-section-muted">
      <div class="ui-container ui-container-narrow">
        <div class="ui-between">
          <h2 class="ui-h2">Kategori Populer</h2>
            <a href="{{ route('categories.index', [], false) }}" class="ui-link">Lihat semua kategori</a>
        </div>
        <div class="ui-grid-cards mt-6">
          @forelse($popularCategories as $c)
            <a href="{{ route('categories.show', $c->slug, false) }}" class="ui-card ui-card-compact block p-3 border border-brandPink-100 dark:border-[#2A2A28] dark:bg-[#131312] dark:hover:bg-[#151514] transition" data-prefetch="hover">
              <div class="text-sm font-700 text-brandPink-900 dark:text-[#EDEDEC]">{{ $c->name }}</div>
              <div class="mt-1"><span class="ui-chip">{{ $c->gadgets_count }} gadget</span></div>
            </a>
          @empty
            <p class="text-sm text-gray-600">Belum ada data kategori.</p>
          @endforelse
        </div>
      </div>
    </section>
  </main>

  <x-footer />

</body>
</html>
