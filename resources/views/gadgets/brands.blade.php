<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daftar Brand</title>
    @vite(['resources/css/app.css','resources/js/app.js'])

    <script>
      // Inisialisasi tema lebih awal (hindari flicker)
      (function(){
        try {
          const saved = localStorage.getItem('theme');
          const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
          const enableDark = saved ? saved === 'dark' : prefersDark;
          document.documentElement.classList.toggle('dark', enableDark);
        } catch(e){}
      })();
    </script>
</head>

<body class="font-sans antialiased theme-transition min-h-screen flex flex-col bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">
    <x-header />

    <main class="ui-container ui-stack flex-1">
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="ui-h1">Daftar Brand</h1>
                <p class="text-gray-600 dark:text-[#9A9A9A]">
                    Telusuri brand dan lihat gadget yang tersedia.
                </p>
            </div>

            <form method="get" class="flex gap-2">
                <input type="text" 
                       name="q" 
                       value="{{ request('q') }}" 
                       placeholder="Cari brand..." 
                       class="border border-brandPink-200 dark:border-[#2A2A28] rounded px-3 py-2 w-64 bg-white dark:bg-[#131312] text-gray-900 dark:text-[#EDEDEC] placeholder:text-gray-500" />
                <button class="ui-button ui-button-sm ui-button-primary">Cari</button>
            </form>
        </div>

        {{-- ✅ GRID BRAND --}}
        <section class="ui-grid-cards">
            @php
                $placeholder = asset('images/fallback.svg');

                $getSrc = function($logo) use ($placeholder) {
                    if (!$logo) return $placeholder;

                    // Jika sudah berupa URL lengkap (http / https), gunakan langsung
                    if (\Illuminate\Support\Str::startsWith($logo, ['http://', 'https://'])) {
                        return $logo;
                    }

                    // Kalau path-nya lokal (misal: 'logos/apple.png'), ambil dari storage
                    if (file_exists(public_path('storage/' . $logo))) {
                        return asset('storage/' . $logo);
                    }

                    // Jika tidak ada di storage tapi mungkin di public/images/
                    if (file_exists(public_path('images/' . $logo))) {
                        return asset('images/' . $logo);
                    }

                    // Fallback terakhir
                    return $placeholder;
                };
            @endphp

            @forelse ($brands as $b)
                @php
                    $logoSrc = $getSrc($b->logo_path ?? null);

                @endphp

                <a href="{{ route('brands.show', $b->slug, false) }}"
                   class="ui-card ui-card-compact block p-3 border border-brandPink-100 dark:border-[#2A2A28] 
                          dark:bg-[#131312] dark:hover:bg-[#151514] transition rounded-xl overflow-hidden"
                   data-prefetch="hover">

                    {{-- ✅ LOGO BRAND --}}
                    <div class="aspect-square w-full bg-gray-50 dark:bg-[#1a1a1a] rounded-lg flex items-center justify-center overflow-hidden border border-brandPink-100 dark:border-[#2A2A28] mb-2">
                        <img src="{{ $logoSrc }}" 
                             alt="{{ $b->name }}" 
                             class="w-full h-full object-contain p-3 transition duration-300 ease-out hover:scale-105"
                             onerror="this.src='{{ $placeholder }}'">
                    </div>

                    {{-- ✅ INFO BRAND --}}
                    <div class="text-sm font-700 text-brandPink-900 dark:text-[#EDEDEC] text-center">{{ $b->name }}</div>
                    <div class="mt-1 text-center">
                        <span class="ui-chip">{{ $b->gadgets_count }} gadget</span>
                    </div>
                </a>
            @empty
                <p>Tidak ada brand ditemukan.</p>
            @endforelse
        </section>

        <div class="mt-8">
            {{ $brands->links() }}
        </div>
    </main>

    <x-footer />
    @vite('resources/js/app.js')
</body>
</html>
