@props([
  'src1' => null,
  'src2' => null,
  'src3' => null,
  'alt' => '',
  'width' => null,
  'height' => null,
  'class' => '',
  'srcset' => null,
  'sizes' => null,
  'sizesPreset' => null,
])

@php
  $placeholder = asset('images/fallback.svg');
  $chosen = $src1 ?? $src2 ?? $src3 ?? $placeholder;
  $w = $width ?? 416;
  $h = $height ?? 208;

  // Build responsive srcset automatically for Unsplash URLs when not provided
  $autoSrcset = null;
  $isUnsplash = \Illuminate\Support\Str::startsWith($chosen, 'https://images.unsplash.com/');
  if (!$srcset && $isUnsplash) {
    $sizesArr = [480, 768, 1200];
    $variants = [];
    foreach ($sizesArr as $size) {
      // Replace or append the width parameter "w" in the query string
      if (preg_match('/([?&])w=\d+/', $chosen)) {
        $url = preg_replace('/([?&])w=\d+/', '$1w=' . $size, $chosen);
      } else {
        $url = (str_contains($chosen, '?') ? ($chosen . '&w=' . $size) : ($chosen . '?w=' . $size));
      }
      $variants[] = $url . ' ' . $size . 'w';
    }
    $autoSrcset = implode(', ', $variants);
  }
  $finalSrcset = $srcset ?? $autoSrcset;
  // Map preset sizes
  $presetMap = [
    'homeGrid' => '(max-width: 640px) 50vw, (max-width: 1024px) 33vw, 17vw',
    'catalogGrid' => '(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw',
    'fullWidth' => '100vw',
  ];
  $presetSizes = $sizesPreset && isset($presetMap[$sizesPreset]) ? $presetMap[$sizesPreset] : null;
  $finalSizes = $sizes ?? $presetSizes ?? '(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 33vw';

  // Proxy only Unsplash image URLs via local route to avoid ORB blocking
  $proxify = function ($url) {
    if (!$url || !\Illuminate\Support\Str::startsWith($url, 'http')) return $url;
    $isUnsplash = \Illuminate\Support\Str::contains($url, 'images.unsplash.com') || \Illuminate\Support\Str::contains($url, 'plus.unsplash.com');
      return $isUnsplash ? route('image.proxy', ['url' => $url], false) : $url;
  };

  $renderSrc = $proxify($chosen);
  $renderFallback2 = $src2 ? $proxify($src2) : null;
  $renderFallback3 = $src3 ? $proxify($src3) : null;

  $renderSrcset = null;
  if ($finalSrcset) {
    $parts = array_map('trim', explode(',', $finalSrcset));
    $proxParts = [];
    foreach ($parts as $p) {
      $spacePos = strpos($p, ' ');
      if ($spacePos !== false) {
        $u = substr($p, 0, $spacePos);
        $suf = substr($p, $spacePos);
      } else {
        $u = $p; $suf = '';
      }
      $proxParts[] = $proxify($u) . $suf;
    }
    $renderSrcset = implode(', ', $proxParts);
  }
@endphp

@php
  // Default onload: tandai img sebagai loaded, sembunyikan skeleton terdekat,
  // dan tandai kartu sebagai loaded agar CSS `.loaded .ui-skeleton-text` hilang.
  $defaultOnload = "this.classList.add('loaded'); const rel=this.closest('.relative'); rel?.querySelector('.ui-skeleton')?.classList.add('hidden'); const card=this.closest('article'); card?.classList.add('loaded')";
@endphp

<img
  src="{{ $renderSrc }}"
  alt="{{ $alt }}"
  class="{{ $class }}"
  loading="lazy"
  decoding="async"
  width="{{ $w }}"
  height="{{ $h }}"
  @if($renderSrcset) srcset="{{ $renderSrcset }}" sizes="{{ $finalSizes }}" @endif
  @if($renderFallback2) data-fallback2="{{ $renderFallback2 }}" @endif
  @if($renderFallback3) data-fallback3="{{ $renderFallback3 }}" @endif
  {{ $attributes->except('onload') }}
  onload="{{ $attributes->get('onload') ?? $defaultOnload }}"
  onerror="if(this.dataset.fallback2){ this.src=this.dataset.fallback2; this.dataset.fallback2=''; } else if(this.dataset.fallback3){ this.src=this.dataset.fallback3; this.dataset.fallback3=''; } else { this.src='{{ $placeholder }}'; }"
>
