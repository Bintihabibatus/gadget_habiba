# UI/UX Redesign — Katalog Gadget

Dokumentasi ringkas untuk perubahan visual, interaksi, dan spesifikasi teknis pada halaman katalog gadget.

## Overview
- Tujuan: tampilan profesional, modern, mobile-first; fokus pada konversi (lihat detail, compare) dan kejelasan informasi.
- Pendekatan: micro-animasi ringan, skeleton loading, hierarki tipografi jelas, kontras baik di light/dark mode.

## Layout
- Header: judul dengan gradient, copy pendamping singkat, quick-links ke Brand/Kategori/Compare.
- Grid: `1/2/3` kolom (mobile/tablet/desktop) — kelas utilitas Tailwind/UnoCSS yang sudah ada di proyek.
- Trust strip: tiga poin (Original, Cepat, Responsif) di bagian bawah grid.

## Komponen
### Kartu Produk
- Visual: gambar `416x208` rasio `2:1`, skeleton bergerak, badge harga kaca (backdrop blur ringan).
- Informasi: nama (line-clamp 2), brand, kategori, tahun rilis, checkbox untuk compare.
- CTA: tombol primer “Lihat Detail” (brandPink), tombol sekunder “Tambah ke Compare”.
- Interaksi: hover naik tipis dan `scale 1.01` pada gambar; fokus terlihat untuk aksesibilitas.

### Header & Navigasi
- Quick-links: `Brand`, `Kategori`, `Compare` sebagai pill chips.
- Ikon: heroicons sesuai util-classes yang tersedia (lihat `unocss.config.ts`).

### Trust Badges
- 3 item dengan ikon: Shield (Original), Bolt (Muat Cepat), Mobile (Responsif).
- Copy ringkas dan kontras warna sesuai mode.

## Interaksi & Aksesibilitas
- Focus-visible pada input/checkbox dan tombol.
- Skeleton disembunyikan saat `onload` gambar.
- Kontras teks di dark mode menggunakan warna netral (`#EDEDEC`, `#9A9A9A`).

## Responsivitas
- Breakpoints: mobile default (1 kolom), `sm` (2 kolom), `lg` (3 kolom).
- Tap target tombol minimal ~40px tinggi; spacing konsisten 8/12/16.

## Style Guide
- Warna: `brandPink` sebagai aksen; netral untuk teks/border. Light/dark disesuaikan.
- Tipografi: judul `text-2xl/3xl` (font-800), body `text-sm`, meta `text-[12px]`.
- Spacing & Radius: `rounded-2xl/3xl`, grid gap `6`, padding kartu `p-4`.
- Ikonografi: heroicons 20-solid; gunakan sesuai semantik.

## Gambar & Performa
- Komponen `x-gadget-image` untuk konsistensi dan proxy.
- Proxy dibatasi ke `images.unsplash.com` dan `plus.unsplash.com` untuk mencegah ORB.
- Fallback: `source.unsplash.com` berdasarkan brand/kategori bila gambar kosong.

## Spesifikasi Teknis (Ringkas)
- Blade: perubahan utama di `resources/views/gadgets/index.blade.php`.
- Event: `onload` pada `<x-gadget-image>` menyembunyikan skeleton.
- Aksesibilitas: checkbox compare memiliki `focus-visible` outline.

## Rencana Lanjutan (Opsional)
- Filter bar (brand/kategori/harga) dengan collapse pada mobile.
- Persist pilihan compare (query string atau localStorage).
- Penyesuaian animasi (durasi/easing) untuk fluidity.

