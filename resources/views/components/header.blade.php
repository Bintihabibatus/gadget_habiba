@props(['narrow' => false])
<header class="ui-header px-6 py-4 border-b border-brandPink-200 dark:border-[#2A2A28] sticky top-0 z-20">
  <div class="{{ $narrow ? 'ui-container ui-container-narrow' : 'ui-container' }} flex items-center justify-between">
    <a href="{{ route('home', [], false) }}" class="font-800 text-lg md:text-xl text-brandPink-700 dark:text-[#EDEDEC]">Habibah Gadget</a>
    <nav class="flex items-center gap-4 text-sm">
      <a href="{{ route('gadgets.index', [], false) }}" class="text-brandPink-700 dark:text-[#EDEDEC] hover:text-brandPink-900 dark:hover:text-white transition {{ request()->routeIs('gadgets.*') ? 'font-700 underline underline-offset-4 decoration-brandPink-400' : '' }}" aria-current="{{ request()->routeIs('gadgets.*') ? 'page' : 'false' }}">Katalog</a>
      <a href="{{ route('brands.index', [], false) }}" class="text-brandPink-700 dark:text-[#EDEDEC] hover:text-brandPink-900 dark:hover:text-white transition {{ request()->routeIs('brands.*') ? 'font-700 underline underline-offset-4 decoration-brandPink-400' : '' }}" aria-current="{{ request()->routeIs('brands.*') ? 'page' : 'false' }}">Brand</a>
      <a href="{{ route('categories.index', [], false) }}" class="text-brandPink-700 dark:text-[#EDEDEC] hover:text-brandPink-900 dark:hover:text-white transition {{ request()->routeIs('categories.*') ? 'font-700 underline underline-offset-4 decoration-brandPink-400' : '' }}" aria-current="{{ request()->routeIs('categories.*') ? 'page' : 'false' }}">Kategori</a>
      <!-- <a id="compare-summary" data-base-url="{{ route('gadgets.compare', [], false) }}" data-compare-max="{{ config('app.compare_max') }}" href="{{ route('gadgets.compare', [], false) }}" class="inline-flex items-center gap-2 px-4 py-2 rounded-full border border-brandPink-200 dark:border-[#2A2A28] bg-white/70 dark:bg-[#131312]/70 text-brandPink-700 dark:text-[#EDEDEC] hover:(bg-white dark:bg-[#151514]) transition" aria-label="Bandingkan gadget terpilih">
        <span class="i-heroicons-scale-20-solid"></span>
        <span>Compare</span>
        <span id="compare-count" class="ui-chip">0</span>
      </a> -->
      <button id="theme-toggle"
  type="button"
  class="ml-2 inline-flex items-center gap-2 px-4 py-2 rounded-full border border-brandPink-200 dark:border-[#2A2A28]
         bg-white dark:bg-[#1b1b1b] text-brandPink-700 dark:text-[#EDEDEC]
         hover:(bg-brandPink-50 dark:bg-[#2A2A2A]) transition duration-300 ease-out shadow-sm"
  aria-label="Toggle theme">
  
  {{-- Ikon: Matahari untuk terang, Bulan untuk gelap --}}
  <svg id="icon-sun" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-yellow-500 dark:hidden transition-transform duration-300" viewBox="0 0 20 20" fill="currentColor">
    <path d="M10 3.75a.75.75 0 01.75.75v1a.75.75 0 01-1.5 0v-1A.75.75 0 0110 3.75zM10 14.5a4.5 4.5 0 100-9 4.5 4.5 0 000 9zm6.25-4.5a.75.75 0 010 1.5h-1a.75.75 0 010-1.5h1zM4.75 10a.75.75 0 010 1.5h-1a.75.75 0 010-1.5h1zm9.596-4.096a.75.75 0 011.06 1.06l-.707.707a.75.75 0 11-1.06-1.06l.707-.707zm-8.182 8.182a.75.75 0 011.06 1.06l-.707.707a.75.75 0 11-1.06-1.06l.707-.707zm9.242.707a.75.75 0 010 1.06l-.707.707a.75.75 0 01-1.06-1.06l.707-.707a.75.75 0 011.06 0zM5.39 5.39a.75.75 0 010 1.06L4.683 7.157a.75.75 0 01-1.06-1.06l.707-.707a.75.75 0 011.06 0z" />
  </svg>

  <svg id="icon-moon" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 hidden dark:inline text-blue-300 transition-transform duration-300" viewBox="0 0 20 20" fill="currentColor">
    <path d="M17.293 13.293a8 8 0 01-10.586-10.586A8 8 0 1017.293 13.293z" />
  </svg>

  <span id="theme-toggle-label" class="text-sm font-semibold text-gray-800 dark:text-gray-100">Terang</span>
</button>

    </nav>
  </div>
</header>
