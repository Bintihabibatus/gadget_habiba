<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daftar Kategori</title>
    @vite(['resources/css/app.css','resources/js/app.js'])
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
    <x-header />

    <main class="ui-container ui-stack flex-1">
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="ui-h1">Daftar Kategori</h1>
                <p class="text-gray-600 dark:text-[#9A9A9A]">Telusuri kategori dan lihat gadget terkait.</p>
            </div>
            <form method="get" class="flex gap-2">
                <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari kategori..." class="border border-brandPink-200 dark:border-[#2A2A28] rounded px-3 py-2 w-64 bg-white dark:bg-[#131312] text-gray-900 dark:text-[#EDEDEC] placeholder:text-gray-500" />
                <button class="ui-button ui-button-sm ui-button-primary">Cari</button>
            </form>
        </div>

        <section class="ui-grid-cards">
            @forelse ($categories as $c)
                <a href="{{ route('categories.show', $c->slug, false) }}" class="ui-card ui-card-compact block p-3 border border-brandPink-100 dark:border-[#2A2A28] dark:bg-[#131312] dark:hover:bg-[#151514] transition" data-prefetch="hover">
                  <div class="text-sm font-700 text-brandPink-900 dark:text-[#EDEDEC]">{{ $c->name }}</div>
                  <div class="mt-1"><span class="ui-chip">{{ $c->gadgets_count }} gadget</span></div>
                </a>
            @empty
                <p>Tidak ada kategori ditemukan.</p>
            @endforelse
        </section>

        <div class="mt-8">
            {{ $categories->links() }}
        </div>
    </main>

    <x-footer />
    @vite('resources/js/app.js')
</body>
</html>
