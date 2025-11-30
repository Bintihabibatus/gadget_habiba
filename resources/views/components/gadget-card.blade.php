@props(['gadget', 'compact' => false])

<article class="group relative bg-white/98 dark:bg-[#131312] border border-brandPink-100 dark:border-[#2A2A28] rounded-3xl shadow hover:shadow-xl hover:-translate-y-[2px] transition overflow-hidden ring-1 ring-transparent hover:ring-brandPink-200 dark:hover:ring-[#2A2A28] ui-card {{ $compact ? 'ui-card-compact' : '' }}" data-gadget-slug="{{ $gadget->slug }}">
    @php
        use Illuminate\Support\Str;

        $images = $gadget->images->sortBy('position')->values();
        $img1 = $images->get(0);
        $img2 = $images->get(1);
        $img3 = $images->get(2);

        $placeholder = asset('images/fallback.svg');

        // fungsi aman buat generate path gambar
        $getSrc = function($img) use ($placeholder) {
            if (!$img || !$img->path) return $placeholder;
            $path = $img->path;

            // Jika URL penuh (misal: https://cdn.example.com/img.jpg)
            if (Str::startsWith($path, ['http://', 'https://'])) {
                return $path;
            }

            // Kalau file ada di storage/public/
            if (file_exists(public_path('storage/' . $path))) {
                return asset('storage/' . $path);
            }

            // Kalau file ada di public/images/
            if (file_exists(public_path('images/' . $path))) {
                return asset('images/' . $path);
            }

            // fallback
            return $placeholder;
        };

        $src1 = $getSrc($img1);
        $src2 = $getSrc($img2);
        $src3 = $getSrc($img3);
    @endphp

    <div class="relative">
        {{-- Skeleton saat loading --}}
        <div class="ui-skeleton absolute inset-0"></div>

        {{-- ✅ Gambar Utama --}}
        <a href="{{ route('gadgets.show', $gadget->slug, false) }}" class="block prefetch-link" aria-label="Lihat detail {{ $gadget->name }}" data-prefetch="hover">
            <img
              src="{{ $src1 }}"
              alt="{{ $gadget->name }}"
              class="w-full aspect-[2/1] object-cover opacity-0 transition-opacity duration-500 group-hover:scale-[1.01] group-focus:scale-[1.01]"
              loading="lazy"
              decoding="async"
              fetchpriority="low"
              onload="this.style.opacity='1'; const rel=this.closest('.relative'); rel?.querySelector('.ui-skeleton')?.classList.add('hidden'); const card=this.closest('article'); card?.classList.add('loaded')"
              onerror="this.src='{{ $placeholder }}'"
            >
        </a>

        {{-- ✅ Harga --}}
        <div class="absolute top-3 right-3 px-3 py-1.5 text-xs rounded-full bg-white/90 dark:bg-[#131312]/85 backdrop-blur border border-brandPink-100 dark:border-[#2A2A28] text-brandPink-700 dark:text-white shadow inline-flex items-center gap-1">
            <span class="i-heroicons-currency-dollar-20-solid text-brandPink-600"></span>
            Rp {{ number_format($gadget->price,0,',','.') }}
        </div>

        {{-- ✅ Overlay Nama --}}
        <div class="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/35 via-black/10 to-transparent p-3 text-white card-overlay">
            <a href="{{ route('gadgets.show', $gadget->slug, false) }}" class="block card-title line-clamp-2">
                {{ $gadget->name }} 
                <span class="align-middle ml-1 text-xs i-heroicons-sparkles-20-solid"></span>
            </a>
            <div class="text-[12px] text-white/80">
                {{ $gadget->brand->name }} • {{ $gadget->category->name }}
            </div>
        </div>
    </div>

    {{-- ✅ Body bawah --}}
    <div class="ui-card-body grid gap-3">
        <div class="flex items-center justify-between">
            <label class="flex items-center gap-2 text-sm">
                <input type="checkbox" name="ids[]" value="{{ $gadget->id }}" class="rounded ui-focus-visible dark:(bg-[#131312] border-[#2A2A28]) compare-toggle" aria-label="Pilih {{ $gadget->name }} untuk compare">
                <span>Pilih untuk compare</span>
            </label>
            <span class="text-xs px-2 py-1 rounded-full bg-brandPink-50 text-brandPink-700 dark:(bg-[#131312] text-white)">
                {{ $gadget->release_date?->format('Y') }}
            </span>
        </div>

        <div class="flex gap-2">
            <span class="ui-chip">{{ $gadget->brand->name }}</span>
            <span class="ui-chip">{{ $gadget->category->name }}</span>
        </div>

        <div class="flex items-center flex-wrap gap-2 pt-2">
            <a href="{{ route('gadgets.show', $gadget->slug, false) }}" class="ui-button ui-button-sm ui-button-primary whitespace-nowrap">
              <span class="i-heroicons-eye-20-solid"></span>
              <span>Lihat Detail</span>
            </a>
            <button type="button" class="ui-button ui-button-sm ui-button-secondary whitespace-nowrap compare-toggle" data-compare-toggle aria-pressed="false" title="Pilih untuk dibandingkan">
              <span class="i-heroicons-square-2-stack-20-solid"></span>
              Compare
            </button>
        </div>
    </div>
</article>
