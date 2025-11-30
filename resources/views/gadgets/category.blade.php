<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $category->name }} — Kategori</title>
    @vite('resources/css/app.css')
 </head>
 <body class="font-sans text-gray-900 dark:text-[#EDEDEC] bg-brandPink-50 dark:bg-[#0B0B09]">
    <x-header />

    <main class="ui-container ui-stack relative">
        <div class="brand-blob p3 absolute -top-10 -left-10"></div>
        <div class="brand-blob p2 absolute -bottom-12 -right-12"></div>
        <div class="flex items-center justify-between mb-6">
            <div>
                <h1 class="text-2xl md:text-3xl font-800 brand-gradient-title">Kategori: {{ $category->name }}</h1>
                <p class="text-gray-600 dark:text-[#B4B4B0]">Menampilkan gadget dalam kategori ini.</p>
            </div>
            <form method="get" class="flex gap-2">
                <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari di kategori ini..." class="border border-brandPink-200 dark:border-[#3E3E3A] rounded px-3 py-2 w-64 bg-white dark:bg-[#1b1b18] text-gray-900 dark:text-[#EDEDEC] placeholder:text-gray-500" />
                <button class="ui-button ui-button-sm ui-button-primary">Cari</button>
            </form>
        </div>

        <section class="ui-grid-cards">
            @forelse ($gadgets as $g)
                <x-gadget-card :gadget="$g" compact="true" />
            @empty
                <p>Tidak ada gadget untuk kategori ini.</p>
            @endforelse
        </section>

        <div class="mt-8">
            {{ $gadgets->links() }}
        </div>
    </main>

    
    @vite('resources/js/app.js')
</body>
</html>
