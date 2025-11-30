@php
/** @var \Illuminate\Pagination\LengthAwarePaginator $gadgets */
@endphp
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Habiba Gadget — Katalog</title>
  @vite(['resources/css/app.css','resources/js/app.js'])
  <script>
    (function(){
      try {
        const saved = localStorage.getItem('theme');
        const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        document.documentElement.classList.toggle('dark', saved ? saved === 'dark' : prefersDark);
      } catch(e){}
    })();
  </script>
</head>

<body class="font-sans antialiased theme-transition min-h-screen flex flex-col">
  <x-header />

  <main class="ui-container ui-stack flex-1">

    <!-- Header -->
    <section class="mb-6">
      <div class="flex items-center justify-between">
        <div class="space-y-1">
          <h1 class="ui-h1">Katalog Gadget</h1>
          <p class="text-sm text-gray-600 dark:text-[#9A9A9A]">Telusuri dan bandingkan gadget favoritmu.</p>
        </div>
      </div>
    </section>

    <!-- Filter -->
    <section class="mb-6">
      <div class="bg-white/95 dark:bg-[#131312] border border-brandPink-100 dark:border-[#2A2A28] rounded-2xl p-4">
        <form method="get" action="{{ route('gadgets.index') }}" class="grid gap-3 md:grid-cols-12 md:items-end">

          <!-- Cari -->
          <div class="md:col-span-4">
            <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Cari</label>
            <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari nama atau model..."
              class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]" />
          </div>

          <!-- Brand -->
          <div class="md:col-span-2">
            <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Brand</label>
            <select name="brand" class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]">
              <option value="">Semua</option>
              @foreach($brands as $b)
                <option value="{{ $b->slug }}" @selected(request('brand') === $b->slug)>{{ $b->name }}</option>
              @endforeach
            </select>
          </div>

          <!-- Kategori -->
          <div class="md:col-span-2">
            <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Kategori</label>
            <select name="category" class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]">
              <option value="">Semua</option>
              @foreach($categories as $c)
                <option value="{{ $c->slug }}" @selected(request('category') === $c->slug)>{{ $c->name }}</option>
              @endforeach
            </select>
          </div>

          <!-- Harga -->
<div class="md:col-span-4 grid grid-cols-2 gap-3">
  <div>
    <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Harga Min</label>
    <input type="number" id="minPriceInput" name="min_price" min="0" step="1000"
      value="{{ request('min_price', 0) }}"
      placeholder="0"
      class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]" />
  </div>

  <div>
    <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Harga Max</label>
    <input type="number" id="maxPriceInput" name="max_price" min="0" step="1000"
      value="{{ request('max_price', 0) }}"
      placeholder="0"
      class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]" />
  </div>
</div>


          <!-- Sort -->
          <div class="md:col-span-2">
            <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Sort</label>
            <select name="sort" class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]">
              <option value="">Terbaru</option>
              <option value="price" @selected(request('sort')==='price')>Harga</option>
              <option value="release_date" @selected(request('sort')==='release_date')>Tanggal Rilis</option>
              <option value="rating_avg" @selected(request('sort')==='rating_avg')>Rating</option>
            </select>
          </div>

          <!-- Arah -->
          <div class="md:col-span-2">
            <label class="text-xs text-gray-600 dark:text-[#9A9A9A]">Arah</label>
            <select name="dir" class="w-full mt-1 px-3 py-2 rounded-lg border border-brandPink-200 dark:border-[#2A2A28] bg-white dark:bg-[#131312]">
              <option value="asc" @selected(request('dir')==='asc')>Naik</option>
              <option value="desc" @selected(request('dir')==='desc')>Turun</option>
            </select>
          </div>

          <!-- Tombol -->
          <div class="md:col-span-12 flex items-center gap-3 pt-2">
            <button class="ui-button ui-button-sm ui-button-primary">
              <span class="i-heroicons-adjustments-horizontal-20-solid"></span> Terapkan Filter
            </button>
            <a href="{{ route('gadgets.index') }}" class="ui-button ui-button-sm ui-button-ghost">
              <span class="i-heroicons-arrow-path-20-solid"></span> Reset
            </a>
            <span class="text-xs text-gray-600 dark:text-[#9A9A9A]">Menemukan {{ $gadgets->total() }} hasil</span>
          </div>
        </form>

        <!-- Filter aktif -->
        @php
          $filters = collect(['q','brand','category','min_price','max_price','sort','dir'])
            ->filter(fn($f)=>request($f) && request($f)!=='0');
        @endphp
        @if($filters->isNotEmpty())
          <div class="mt-3 flex flex-wrap gap-2 text-xs">
            @foreach($filters as $f)
              <a href="{{ route('gadgets.index', request()->except($f)) }}" class="ui-pill">
                {{ ucfirst(str_replace('_',' ',$f)) }}:
                {{ in_array($f,['min_price','max_price']) ? 'Rp '.number_format(request($f),0,',','.') : request($f) }}
                <span class="i-heroicons-x-mark-20-solid"></span>
              </a>
            @endforeach
          </div>
        @endif
      </div>
    </section>

    <script>
      // Sinkronisasi input & slider harga
      (function(){
        const minRange = document.getElementById('minPriceRange');
        const maxRange = document.getElementById('maxPriceRange');
        const minInput = document.getElementById('minPriceInput');
        const maxInput = document.getElementById('maxPriceInput');
        const sync = () => {
          const minVal = parseInt(minInput.value || 0);
          const maxVal = parseInt(maxInput.value || 0);
          minRange.value = minVal;
          maxRange.value = maxVal;
        };
        [minInput,maxInput,minRange,maxRange].forEach(el=>el.addEventListener('input',sync));
        sync();
      })();
    </script>

    <!-- Katalog -->
    <section class="ui-grid-cards">
      @forelse($gadgets as $g)
        <x-gadget-card :gadget="$g" />
      @empty
        <p class="text-gray-600 dark:text-[#9A9A9A]">Tidak ada gadget ditemukan.</p>
      @endforelse
    </section>

    <div class="mt-6">{{ $gadgets->links() }}</div>
  </main>

  <x-footer />
</body>
</html>
