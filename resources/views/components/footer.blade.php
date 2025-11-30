@props(['narrow' => false])
<footer role="contentinfo" class="px-6 md:px-8 py-[5em] border-t border-brandPink-200 dark:border-[#2A2A28] bg-gradient-to-b from-[#FFF4F1] to-[#FFECE6] dark:from-[#121212] dark:to-[#0f0f0f] text-sm text-gray-700 dark:text-[#9A9A9A]">
  <div class="{{ $narrow ? 'ui-container ui-container-narrow' : 'ui-container' }}">
    <!-- Top divider accent removed per request -->

    <!-- Grid 4 kolom: responsif, modern, clean -->
    <div>
      <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-12 xl:gap-16 items-start" role="group" aria-label="Kolom footer">
      <!-- Brand & tagline -->
      <section class="snap-start ui-footer-brand ui-footer-col space-y-3 md:space-y-4" aria-labelledby="footer-brand-title">
        <h2 id="footer-brand-title" class="text-brandPink-900 dark:text-[#EDEDEC] text-base md:text-lg font-700 inline-flex items-center gap-2">Habiba Gadget <span aria-hidden="true" class="i-heroicons-sparkles-20-solid text-brandPink-600"></span></h2>
        <p class="text-sm leading-relaxed text-gray-600 dark:text-[#9A9A9A] max-w-[42ch]">Tempat membandingkan gadget dengan cepat dan mudah. Temukan, bandingkan, dan pilih gadget terbaik untuk kebutuhanmu.</p>
        <nav class="flex items-center gap-5 text-brandPink-700 dark:text-[#EDEDEC]" aria-label="Navigasi utama footer">
          <a href="{{ url('/') }}" class="ui-link inline-flex items-center gap-1 hover:underline underline-offset-4 decoration-brandPink-400"><span aria-hidden="true" class="i-heroicons-home-20-solid"></span> Beranda</a>
  <a href="{{ route('gadgets.index', [], false) }}" class="ui-link inline-flex items-center gap-1 hover:underline underline-offset-4 decoration-brandPink-400"><span aria-hidden="true" class="i-heroicons-square-2-stack-20-solid"></span> Katalog</a>
        </nav>
      </section>

      <!-- Navigasi -->
      <section class="snap-start ui-footer-col space-y-3 md:space-y-4" aria-labelledby="footer-explore-title">
        <h2 id="footer-explore-title" class="ui-footer-heading inline-flex items-center gap-2">Jelajahi <span aria-hidden="true" class="i-heroicons-compass-20-solid text-brandPink-600"></span></h2>
        <nav aria-label="Jelajahi">
          <ul role="list" class="ui-footer-list">
    <li><a href="{{ route('gadgets.index', [], false) }}" class="ui-link hover:underline underline-offset-4 decoration-brandPink-400">Gadget</a></li>
    <li><a href="{{ route('brands.index', [], false) }}" class="ui-link hover:underline underline-offset-4 decoration-brandPink-400">Brand</a></li>
    <li><a href="{{ route('categories.index', [], false) }}" class="ui-link hover:underline underline-offset-4 decoration-brandPink-400">Kategori</a></li>
          </ul>
        </nav>
      </section>

      <!-- Lainnya -->
      <section class="snap-start ui-footer-col space-y-3 md:space-y-4" aria-labelledby="footer-other-title">
        <h2 id="footer-other-title" class="ui-footer-heading inline-flex items-center gap-2">Lainnya <span aria-hidden="true" class="i-heroicons-sparkles-20-solid text-brandPink-600"></span></h2>
        <ul role="list" class="ui-footer-list">
          <li><a href="#" class="ui-link hover:underline underline-offset-4 decoration-brandPink-400">Tentang</a></li>
          <li><a href="#" class="ui-link hover:underline underline-offset-4 decoration-brandPink-400">Bantuan</a></li>
        </ul>
        <nav aria-label="Media sosial">
          <ul role="list" class="flex items-center gap-5 text-brandPink-700 dark:text-[#EDEDEC]">
            <li><a href="#" aria-label="Instagram" class="ui-link hover:text-brandPink-900 dark:hover:text-white transition"><span aria-hidden="true" class="i-heroicons-camera-20-solid"></span></a></li>
            <li><a href="#" aria-label="Twitter" class="ui-link hover:text-brandPink-900 dark:hover:text-white transition"><span aria-hidden="true" class="i-heroicons-chat-bubble-left-right-20-solid"></span></a></li>
            <li><a href="#" aria-label="GitHub" class="ui-link hover:text-brandPink-900 dark:hover:text-white transition"><span aria-hidden="true" class="i-heroicons-code-bracket-20-solid"></span></a></li>
          </ul>
        </nav>
      </section>

      <!-- Get In Touch -->
      <section class="snap-start ui-footer-col space-y-3 md:space-y-4" aria-labelledby="footer-contact-title">
        <h2 id="footer-contact-title" class="ui-footer-heading inline-flex items-center gap-2">Get In Touch <span aria-hidden="true" class="i-heroicons-phone-20-solid text-brandPink-600"></span></h2>
        <div class="text-brandPink-900 dark:text-[#EDEDEC] font-700">PT. HABIBA GADGET</div>
        <address class="not-italic grid gap-4 text-gray-700 dark:text-[#9A9A9A]">
          <div class="inline-flex items-start gap-2"><span aria-hidden="true" class="i-heroicons-map-pin-20-solid mt-0.5"></span> Jl. Contoh Alamat No. 27, Denpasar</div>
          <div class="inline-flex items-center gap-2"><span aria-hidden="true" class="i-heroicons-envelope-20-solid"></span> <a class="ui-link" href="mailto:info@habibagadget.co.id">info@habibagadget.co.id</a></div>
          <div class="inline-flex items-center gap-2"><span aria-hidden="true" class="i-heroicons-phone-20-solid"></span> <a class="ui-link" href="tel:+62811556651000">+62-811-5566-51000</a></div>
        </address>
      </section>
      </div>
    </div>

    <!-- Bottom bar -->
    <div class="mt-14 flex flex-wrap items-center justify-between gap-6 border-t border-brandPink-100 dark:border-[#2A2A28] pt-10">
      <div class="flex items-center gap-3 text-brandPink-700 dark:text-[#EDEDEC]">
        <span>© {{ date('Y') }} Habiba Gadget</span>
        <span class="ui-chip inline-flex items-center gap-2"><span aria-hidden="true" class="i-heroicons-sparkles-20-solid"></span> Made with Habiba</span>
      </div>
      <nav class="flex items-center gap-3 text-brandPink-700 dark:text-[#EDEDEC]" aria-label="Kebijakan footer">
        <a href="#" class="hover:text-brandPink-900 dark:hover:text-white transition hover:underline underline-offset-4 decoration-brandPink-400">Kebijakan Privasi</a>
        <span>•</span>
        <a href="#" class="hover:text-brandPink-900 dark:hover:text-white transition hover:underline underline-offset-4 decoration-brandPink-400">Syarat dan Ketentuan</a>
        <span>•</span>
        <a href="#" class="hover:text-brandPink-900 dark:hover:text-white transition hover:underline underline-offset-4 decoration-brandPink-400">Disclaimer</a>
      </nav>
    </div>
  </div>
</footer>
