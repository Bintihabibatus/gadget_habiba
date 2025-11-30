<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $gadget->name }} — Detail Gadget</title>
    @vite('resources/css/app.css')

    <script>
      // Dark mode init
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

<body class="font-sans antialiased theme-transition bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">
    <x-header />

    <main class="ui-container ui-stack">
        {{-- STATUS MESSAGE --}}
        @if (session('status'))
            <div class="p-3 rounded bg-green-100 text-green-800">{{ session('status') }}</div>
        @endif

        {{-- DETAIL GADGET --}}
        <section class="bg-white dark:bg-[#131312] rounded shadow p-6 border border-transparent dark:border-[#2A2A28]">
            <div class="grid md:grid-cols-2 gap-6 items-start">
                <div class="grid gap-3">

                    {{-- ✅ LOGIKA GAMBAR --}}
                    @php
                        $images = $gadget->images->sortBy('position')->values();
                        $placeholder = asset('images/fallback.svg');

                        $getSrc = function($img) use ($placeholder) {
                            if (!$img || !$img->path) return $placeholder;
                            return \Illuminate\Support\Str::startsWith($img->path, 'http')
                                ? $img->path
                                : asset('storage/'.$img->path);
                        };

                        $src1 = $getSrc($images->get(0));
                        $src2 = $getSrc($images->get(1));
                        $src3 = $getSrc($images->get(2));
                    @endphp

                    {{-- ✅ GAMBAR UTAMA --}}
                    <figure class="relative w-full aspect-video rounded-2xl overflow-hidden bg-gray-50 dark:bg-[#111] border border-brandPink-100 dark:border-[#2A2A28]">
                        <img 
                            src="{{ $src1 }}" 
                            alt="{{ $gadget->name }}"
                            class="w-full h-full object-cover transition duration-500 ease-out hover:scale-105"
                            onerror="this.src='{{ $placeholder }}'">
                    </figure>

                    {{-- ✅ THUMBNAIL --}}
                    @if($images->count() > 1)
                        <div class="grid grid-cols-4 gap-2">
                            @foreach($images as $idx => $img)
                                @php $thumbSrc = $getSrc($img); @endphp
                                <div class="relative">
                                    <img 
                                        src="{{ $thumbSrc }}" 
                                        alt="{{ $img->caption ?? $gadget->name }}" 
                                        class="w-full h-20 object-cover rounded-xl border border-brandPink-100 dark:border-[#2A2A28] 
                                               hover:opacity-80 cursor-pointer transition"
                                        onerror="this.src='{{ $placeholder }}'">
                                    <span class="absolute top-1 left-1 text-[10px] leading-none px-1.5 py-0.5 rounded-full bg-white/80 dark:bg-[#131312] text-gray-700 dark:text-white">Image {{ $idx + 1 }}</span>
                                </div>
                            @endforeach
                        </div>
                    @endif
                </div>

                {{-- INFO GADGET --}}
                <div class="grid gap-3">
                    <h1 class="text-2xl font-700 dark:text-white">{{ $gadget->name }}</h1>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-[12px] px-2 py-0.5 rounded-full bg-brandPink-50 text-brandPink-700 dark:bg-[#131312] dark:text-white">{{ $gadget->brand->name }}</span>
                        <span class="text-[12px] px-2 py-0.5 rounded-full bg-brandPink-50 text-brandPink-700 dark:bg-[#131312] dark:text-white">{{ $gadget->category->name }}</span>
                    </div>

                    {{-- HARGA DAN RATING --}}
                    <div class="flex items-center gap-3 flex-wrap">
                        <span class="text-brandPink-700 dark:text-white text-xl font-800">Rp {{ number_format($gadget->price,0,',','.') }}</span>
                        @if($gadget->release_date)
                            <span class="text-xs px-2 py-1 rounded-full bg-brandPink-50 text-brandPink-700 dark:bg-[#131312] dark:text-brandPink-300">Rilis {{ $gadget->release_date->format('d M Y') }}</span>
                        @endif

                        @php $rating = (int) round($gadget->rating_avg ?? 0); @endphp
                        <span class="flex items-center gap-1 text-brandPink-600 dark:text-white">
                            @for($i=1; $i<=5; $i++)
                                <span class="text-sm {{ $i <= $rating ? 'text-brandPink-600' : 'text-brandPink-300' }}">★</span>
                            @endfor
                            @if($gadget->rating_avg)
                                <span class="text-xs text-gray-600 dark:text-white ml-1">{{ number_format($gadget->rating_avg,1) }}</span>
                            @endif
                        </span>
                    </div>

                    {{-- DESKRIPSI --}}
                    <p class="text-gray-700 leading-6 dark:text-[#9A9A9A]">{{ $gadget->description }}</p>

                    <div class="flex gap-3 mt-2 flex-wrap">
                        <span class="px-3 py-1 rounded-full bg-brandPink-50 text-xs text-brandPink-700 dark:bg-[#131312] dark:text-white">Model: {{ $gadget->model }}</span>
                        <span class="px-3 py-1 rounded-full bg-brandPink-50 text-xs text-brandPink-700 dark:bg-[#131312] dark:text-white">Stok: {{ $gadget->stock }}</span>
                    </div>
                </div>
            </div>
        </section>

        {{-- SPESIFIKASI --}}
        <section class="bg-white dark:bg-[#131312] rounded shadow p-6 border border-transparent dark:border-[#2A2A28] mt-8">
            <h2 class="text-xl font-600 mb-3">Spesifikasi</h2>
            @php
                $specs = $gadget->specs->pluck('value','key');
                $cat = \Illuminate\Support\Str::slug($gadget->category->slug ?? $gadget->category->name);
            @endphp
            @if($gadget->specs->isEmpty())
                <p class="text-gray-600 dark:text-[#9A9A9A]">Belum ada spesifikasi.</p>
            @else
                <div class="grid md:grid-cols-2 gap-4">
                    @foreach($specs as $key => $val)
                        <div class="border border-brandPink-100 dark:border-[#2A2A28] rounded-xl p-3 dark:bg-[#131312]">
                            <div class="text-xs text-gray-600 dark:text-[#9A9A9A]">{{ $key }}</div>
                            <div class="font-600 text-gray-900 dark:text-white">{{ $val ?? '-' }}</div>
                        </div>
                    @endforeach
                </div>
            @endif
        </section>

        {{-- DESKRIPSI DETAIL --}}
        <section class="bg-white dark:bg-[#131312] rounded shadow p-6 border border-transparent dark:border-[#2A2A28] mt-8">
            <h2 class="text-xl font-600 mb-3">Deskripsi Detail</h2>
            @php
                $detailSpec = $gadget->specs->firstWhere('key', 'detail_path');
                $detailHtml = null;
                if ($detailSpec && $detailSpec->value) {
                    try {
                        $path = (string) $detailSpec->value;
                        $allowedPrefixes = ['private/gadget_details/', 'private/tests/'];
                        $isAllowed = collect($allowedPrefixes)->contains(fn($prefix) => \Illuminate\Support\Str::startsWith($path, $prefix));
                        $hasTraversal = \Illuminate\Support\Str::contains($path, '..');
                        if ($isAllowed && !$hasTraversal) {
                            $md = \Illuminate\Support\Facades\Storage::disk('local')->get($path);
                            $converter = new League\CommonMark\GithubFlavoredMarkdownConverter([
                                'html_input' => 'strip',
                                'allow_unsafe_links' => false,
                            ]);
                            $detailHtml = $converter->convert($md)->getContent();
                        }
                    } catch (\Throwable $e) {
                        $detailHtml = '<p class="text-gray-600 dark:text-[#9A9A9A]">Gagal memuat deskripsi detail.</p>';
                    }
                }
            @endphp
            {!! $detailHtml ?? '<p class="text-gray-600 dark:text-[#9A9A9A]">Belum ada deskripsi detail.</p>' !!}
        </section>

        {{-- ULASAN PENGGUNA --}}
        <section class="bg-white dark:bg-[#111] rounded shadow p-6 border border-transparent dark:border-[#1f1f1f] mt-8">
            <h2 class="text-xl font-600 mb-3">Ulasan Pengguna</h2>

            {{-- DAFTAR REVIEW --}}
            <div class="grid gap-4">
                @forelse($gadget->reviews as $rev)
                    <article class="border rounded p-4 border-brandPink-100 dark:border-[#1f1f1f] bg-white dark:bg-[#111]">
                        <div class="mb-2">
                            <span class="font-600 dark:text-[#EDEDEC]">{{ $rev->user?->name ?? $rev->guest_name ?? 'Guest' }}</span>
                            <span class="text-sm text-gray-600 dark:text-[#B4B4B0]">({{ $rev->user?->email ?? $rev->guest_email ?? 'Guest' }})</span>
                        </div>
                        <div class="flex items-center gap-2 mb-2">
                            <span class="text-sm text-gray-600">Rating:</span>
                            <span class="font-600">{{ $rev->rating }}/5</span>
                        </div>
                        <p class="text-gray-800 dark:text-[#C7C7C7]">{{ $rev->body }}</p>
                    </article>
                @empty
                    <p class="text-gray-600 dark:text-[#9A9A9A]">Belum ada ulasan.</p>
                @endforelse
            </div>

            <hr class="my-6">

            {{-- FORM REVIEW --}}
            <h3 class="text-lg font-600 mb-2">Tulis Ulasan</h3>
            @guest
                <div class="mb-3 p-3 rounded border border-brandPink-200 dark:border-[#3E3E3A] bg-brandPink-50 dark:bg-[#161615] text-brandPink-800 dark:text-[#EDEDEC]">
                    Anda bisa menulis ulasan sebagai tamu
                    @if (Route::has('login'))
                        atau <a href="{{ route('login', [], false) }}" class="underline text-brandPink-700 dark:text-[#EDEDEC] hover:text-brandPink-900">masuk</a>
                    @endif
                    untuk mengaitkan ulasan ke akun Anda.
                </div>
            @endguest

            <form method="post" action="{{ route('gadgets.reviews.store', $gadget->slug, false) }}" class="grid md:grid-cols-2 gap-3">
                @csrf
                <div>
                    <label class="block text-sm mb-1">Nama</label>
                    <input type="text" name="name" value="{{ old('name') }}" class="w-full px-3 py-2 border rounded border-brandPink-200 dark:border-[#262626] bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">
                    @error('name')<div class="text-red-600 text-xs mt-1">{{ $message }}</div>@enderror
                </div>
                <div>
                    <label class="block text-sm mb-1">Email</label>
                    <input type="email" name="email" value="{{ old('email') }}" class="w-full px-3 py-2 border rounded border-brandPink-200 dark:border-[#262626] bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">
                    @error('email')<div class="text-red-600 text-xs mt-1">{{ $message }}</div>@enderror
                </div>
                <div>
                    <label class="block text-sm mb-1">Rating (1-5)</label>
                    <input type="number" name="rating" min="1" max="5" value="{{ old('rating', 5) }}" class="w-full px-3 py-2 border rounded border-brandPink-200 dark:border-[#262626] bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">
                    @error('rating')<div class="text-red-600 text-xs mt-1">{{ $message }}</div>@enderror
                </div>
                <div class="md:col-span-2">
                    <label class="block text-sm mb-1">Ulasan</label>
                    <textarea name="body" rows="4" class="w-full px-3 py-2 border rounded border-brandPink-200 dark:border-[#262626] bg-white dark:bg-[#0f0f0f] text-gray-900 dark:text-[#EDEDEC]">{{ old('body') }}</textarea>
                    @error('body')<div class="text-red-600 text-xs mt-1">{{ $message }}</div>@enderror
                </div>
                <div class="md:col-span-2">
                    <button class="ui-button ui-button-sm ui-button-primary"><span class="btn-text">Kirim Ulasan</span></button>
                </div>
            </form>
        </section>

        @vite('resources/js/app.js')
    </main>
</body>
</html>
