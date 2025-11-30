<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $brand->name }} — Brand</title>
    @vite('resources/css/app.css')
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
 <body class="font-sans text-gray-900 bg-brandPink-50 dark:bg-[#0E0E0D] dark:text-[#EDEDEC] min-h-screen flex flex-col">
    <x-header />

    <main class="ui-container ui-stack relative flex-1">
        <div class="brand-blob p1 absolute -top-10 -left-10"></div>
        <div class="brand-blob p2 absolute -bottom-12 -right-12"></div>
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="ui-h1">Brand: {{ $brand->name }}</h1>
                <p class="text-gray-600 dark:text-[#9A9A9A]">Menampilkan gadget dari brand ini.</p>
            </div>
            <form method="get" class="flex gap-2">
                <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari di brand ini..." class="border rounded px-3 py-2 w-64 border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312] text-gray-900 dark:text-[#EDEDEC] placeholder:text-gray-500 dark:placeholder:text-[#8A8A8A]" />
                <button class="ui-button ui-button-sm ui-button-primary">Cari</button>
            </form>
        </div>

        <section class="ui-grid-cards">
            @forelse ($gadgets as $g)
                <x-gadget-card :gadget="$g" compact="true" />
            @empty
                <p class="text-gray-700 dark:text-[#A1A1A1]">Tidak ada gadget untuk brand ini.</p>
            @endforelse
        </section>

        <div class="mt-8">
            {{ $gadgets->links() }}
        </div>
    </main>

    <x-footer />
    @vite('resources/js/app.js')
</body>
</html>
