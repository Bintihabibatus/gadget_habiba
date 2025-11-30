import { defineConfig, presetUno, presetAttributify, presetIcons } from 'unocss';

export default defineConfig({
  // Pastikan UnoCSS memindai utilitas di Blade & sumber frontend
  content: {
    filesystem: [
      'resources/views/**/*.blade.php',
      'resources/js/**/*.{js,ts,vue,svelte,jsx,tsx}',
      'resources/css/**/*.{css,scss}',
    ],
  },
  theme: {
    colors: {
      brandPink: {
        50: '#fff1f5',
        100: '#ffe4e6',
        200: '#fecdd3',
        300: '#fda4af',
        400: '#fb7185',
        500: '#f43f5e',
        600: '#e11d48',
        700: '#be123c',
        800: '#9f1239',
        900: '#881337',
      },
    },
  },
  presets: [
    presetUno(),
    presetAttributify(),
    presetIcons(),
  ],
});
