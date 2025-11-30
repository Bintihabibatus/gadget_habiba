<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\{Gadget, Brand, Category, GadgetSpec, GadgetImage};
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class BulkGadgetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Target total item gadget setelah seeding
        $targetTotal = 80;
        $existingTotal = Gadget::count();
        // Pastikan brand dan kategori tersedia
        $brands = Brand::all();
        $categories = Category::all();
        if ($brands->isEmpty() || $categories->isEmpty()) {
            // Jika tidak ada, buat minimal
            $brands = collect([
                Brand::firstOrCreate(['slug' => 'apple'], ['name' => 'Apple']),
                Brand::firstOrCreate(['slug' => 'samsung'], ['name' => 'Samsung']),
                Brand::firstOrCreate(['slug' => 'xiaomi'], ['name' => 'Xiaomi']),
                Brand::firstOrCreate(['slug' => 'sony'], ['name' => 'Sony']),
                Brand::firstOrCreate(['slug' => 'asus'], ['name' => 'Asus']),
            ]);
            $categories = collect([
                Category::firstOrCreate(['slug' => 'smartphone'], ['name' => 'Smartphone']),
                Category::firstOrCreate(['slug' => 'laptop'], ['name' => 'Laptop']),
                Category::firstOrCreate(['slug' => 'tablet'], ['name' => 'Tablet']),
                Category::firstOrCreate(['slug' => 'wearable'], ['name' => 'Wearable']),
            ]);
        }

        // Koleksi nama produk contoh per brand & kategori
        $samples = [
            'apple' => [
                'smartphone' => ['iPhone 14', 'iPhone 15', 'iPhone SE 3'],
                'laptop' => ['MacBook Air M2', 'MacBook Pro 14'],
                'tablet' => ['iPad Air 5', 'iPad Pro 11'],
                'wearable' => ['Apple Watch Series 9', 'AirPods Pro 2'],
            ],
            'samsung' => [
                'smartphone' => ['Galaxy S23', 'Galaxy A54'],
                'laptop' => ['Galaxy Book3'],
                'tablet' => ['Galaxy Tab S9', 'Galaxy Tab A9'],
                'wearable' => ['Galaxy Watch6', 'Galaxy Buds2 Pro'],
            ],
            'xiaomi' => [
                'smartphone' => ['Redmi Note 13', 'Xiaomi 13'],
                'laptop' => ['Mi Notebook Pro'],
                'tablet' => ['Mi Pad 6'],
                'wearable' => ['Mi Band 8'],
            ],
            'sony' => [
                'smartphone' => ['Xperia 5 V'],
                'laptop' => ['VAIO Z'],
                'tablet' => ['Xperia Tablet Z4'],
                'wearable' => ['WH-1000XM5', 'WF-1000XM5'],
            ],
            'asus' => [
                'smartphone' => ['ROG Phone 7'],
                'laptop' => ['ROG Zephyrus G14', 'ZenBook 14'],
                'tablet' => ['ASUS ZenPad 3S 10'],
                'wearable' => ['ASUS VivoWatch 5'],
            ],
        ];

        // URL gambar relevan (unsplash) per kategori
        $imageByCategory = [
            'smartphone' => 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop',
            'laptop' => 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop',
            'tablet' => 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop',
            'wearable' => 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop',
        ];

        // Variasi URL gambar per kategori (agar tiap item berbeda)
        $imagesPool = [
            'smartphone' => [
                'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop',
            ],
            'laptop' => [
                'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop',
            ],
            'tablet' => [
                'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop',
            ],
            'wearable' => [
                'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop',
            ],
        ];

        // Rentang harga realistis per kategori (IDR)
        $priceRange = [
            'smartphone' => [2000000, 30000000],
            'laptop' => [5000000, 40000000],
            'tablet' => [1500000, 20000000],
            'wearable' => [500000, 8000000],
        ];

        $countCreated = 0;
        foreach ($brands as $brand) {
            foreach ($categories as $category) {
                $brandKey = Str::slug($brand->slug ?: $brand->name);
                $catKey = Str::slug($category->slug ?: $category->name);
                $names = $samples[$brandKey][$catKey] ?? [];
                // Buat 4 varian per kombinasi; tetap memperkaya item yang sudah ada meski target tercapai
                for ($i = 0; $i < 4; $i++) {
                    $baseName = $names[$i % max(1, count($names))] ?? ucfirst($brand->name).' '.ucfirst($category->name);
                    $variantSuffix = ' (Varian '.($i+1).')';
                    $name = trim($brand->name.' '.$baseName.$variantSuffix);
                    $slug = Str::slug($name);

                    $allowedCreate = (($existingTotal + $countCreated) < $targetTotal);

                    $min = $priceRange[$catKey][0];
                    $max = $priceRange[$catKey][1];
                    $price = random_int($min, $max);
                    $stock = random_int(0, 100);
                    $release = now()->subDays(random_int(30, 365*5))->format('Y-m-d');
                    $rating = random_int(0, 5);
                    $model = strtoupper(Str::random(4)).'-'.random_int(1000, 9999);

                    if ($allowedCreate) {
                        $gadget = Gadget::firstOrCreate(['slug' => $slug], [
                            'name' => $name,
                            'model' => $model,
                            'description' => 'Deskripsi singkat: '.$name.' adalah perangkat '.$category->name.' dari '.$brand->name.' dengan fitur unggulan dan performa solid.',
                            'price' => $price,
                            'stock' => $stock,
                            'release_date' => $release,
                            'published' => true,
                            'brand_id' => $brand->id,
                            'category_id' => $category->id,
                            'rating_avg' => $rating,
                        ]);
                    } else {
                        // Jika target tercapai, jangan buat item baru. Hanya perbarui jika itemnya sudah ada.
                        $gadget = Gadget::where('slug', $slug)->first();
                        if (!$gadget) {
                            continue; // lewati varian yang belum ada
                        }
                    }

                    // Tulis deskripsi detail ke file markdown di storage/app/private
                    $detailPath = 'private/gadget_details/'.$slug.'.md';
                    $detailContent = "# $name\n\n".
                        "## Ikhtisar\n".
                        "Perangkat ini dirancang untuk memberikan pengalaman terbaik di kelasnya. Cocok untuk pengguna harian maupun power user.\n\n".
                        "## Fitur Utama\n".
                        "- Layar tajam dan responsif\n".
                        "- Baterai tahan lama\n".
                        "- Performa kencang untuk multitasking\n".
                        "- Desain modern dengan material berkualitas\n\n".
                        "## Detail Teknis\n".
                        "Spesifikasi lengkap tersedia di tabel spesifikasi. Harga dapat berubah sesuai promo/varian penyimpanan.\n";
                    Storage::disk('local')->put($detailPath, $detailContent);

                    // Simpan path file detail sebagai spec
                    GadgetSpec::firstOrCreate([
                        'gadget_id' => $gadget->id,
                        'key' => 'detail_path',
                    ], ['value' => $detailPath]);

                    // Buat spesifikasi lebih kaya sesuai kategori
                    $specs = [];
                    if ($catKey === 'smartphone' || $catKey === 'tablet') {
                        $chipsets = ['Snapdragon 8 Gen 2', 'Apple A17 Pro', 'Dimensity 9200', 'Exynos 2200'];
                        $chip = $chipsets[($i + $countCreated) % count($chipsets)];
                        $mainCam = [50, 64, 108][($i + $countCreated) % 3];
                        $ultra = [8, 12][($i) % 2];
                        $screenSize = [6.1, 6.4, 6.7, 11.0][($i + $countCreated) % 4];
                        $hz = [60, 90, 120][($i) % 3];
                        $specs = [
                            ['key' => 'Chipset', 'value' => $chip],
                            ['key' => 'CPU', 'value' => 'Octa-core'],
                            ['key' => 'RAM', 'value' => random_int(4, 12).'GB'],
                            ['key' => 'Storage', 'value' => random_int(64, 512).'GB'],
                            ['key' => 'Camera', 'value' => $mainCam.'MP + '.$ultra.'MP (Ultra-wide)'],
                            ['key' => 'Battery', 'value' => random_int(3500, 6000).' mAh'],
                            ['key' => 'Display', 'value' => $screenSize.'" OLED '.$hz.'Hz'],
                            ['key' => 'Connectivity', 'value' => '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C'],
                        ];
                    } elseif ($catKey === 'laptop') {
                        $cpus = ['Intel Core i7-13700H', 'Intel Core i5-13500H', 'AMD Ryzen 7 7840U'];
                        $gpus = ['NVIDIA RTX 4050', 'NVIDIA RTX 4060', 'Radeon 780M', 'Intel Iris Xe'];
                        $cpu = $cpus[($i + $countCreated) % count($cpus)];
                        $gpu = $gpus[($i) % count($gpus)];
                        $hz = [60, 120, 165][($i + $countCreated) % 3];
                        $size = [14, 15.6][($i) % 2];
                        $specs = [
                            ['key' => 'CPU', 'value' => $cpu],
                            ['key' => 'RAM', 'value' => random_int(8, 32).'GB'],
                            ['key' => 'Storage', 'value' => random_int(256, 1024).'GB SSD'],
                            ['key' => 'GPU', 'value' => $gpu],
                            ['key' => 'Display', 'value' => $size.'" IPS '.$hz.'Hz'],
                            ['key' => 'Ports', 'value' => 'USB‑C, Thunderbolt 4, HDMI, microSD'],
                            ['key' => 'Connectivity', 'value' => 'Wi‑Fi 6E, Bluetooth 5.3'],
                        ];
                    } else { // wearable
                        $batteryDays = random_int(5, 14);
                        $specs = [
                            ['key' => 'Sensors', 'value' => 'Heart rate, SpO2, GPS, ECG'],
                            ['key' => 'Battery', 'value' => random_int(200, 600).' mAh'],
                            ['key' => 'Battery Life', 'value' => $batteryDays.' hari'],
                            ['key' => 'Water Resistance', 'value' => '5 ATM'],
                            ['key' => 'Connectivity', 'value' => 'Bluetooth 5.x, LTE (opsional)'],
                        ];
                    }
                    foreach ($specs as $spec) {
                        GadgetSpec::updateOrCreate([
                            'gadget_id' => $gadget->id,
                            'key' => $spec['key'],
                        ], ['value' => $spec['value']]);
                    }

                    // Tambah 4 gambar relevan (URL eksternal) per item untuk galeri lebih kaya
                    $pool = $imagesPool[$catKey] ?? [$imageByCategory[$catKey] ?? $imageByCategory['smartphone']];
                    $pcount = count($pool);
                    for ($pos = 0; $pos < 4; $pos++) {
                        $idx = (($i * ($pos + 1)) + $countCreated + $pos) % $pcount;
                        $img = $pool[$idx];
                        GadgetImage::firstOrCreate([
                            'gadget_id' => $gadget->id,
                            'path' => $img,
                        ], ['caption' => $name.' Image '.($pos+1), 'position' => $pos]);
                    }

                    if ($allowedCreate) {
                        $countCreated++;
                    }
                }
            }
        }

        // Informasi hasil seeding
        $this->command?->info("BulkGadgetSeeder: menambah $countCreated gadget (target total $targetTotal).");
    }
}
