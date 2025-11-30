<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\{Gadget, Brand, Category, GadgetSpec, GadgetImage};
use Illuminate\Support\Str;

class GadgetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $brand = Brand::firstOrCreate(['slug' => 'apple'], ['name' => 'Apple']);
        $category = Category::firstOrCreate(['slug' => 'smartphone'], ['name' => 'Smartphone']);

        $gadgets = [
            [
                'name' => 'iPhone 15 Pro',
                'model' => 'A3101',
                'description' => 'Smartphone flagship dengan chip A17 Pro.',
                'price' => 19999000,
                'stock' => 25,
                'release_date' => '2023-09-22',
                'published' => true,
                'brand_id' => $brand->id,
                'category_id' => $category->id,
                'specs' => [
                    ['key' => 'RAM', 'value' => '8GB'],
                    ['key' => 'Storage', 'value' => '256GB'],
                    ['key' => 'CPU', 'value' => 'Apple A17 Pro'],
                    ['key' => 'Battery', 'value' => '3274 mAh'],
                    ['key' => 'Display', 'value' => '6.1" OLED 120Hz'],
                ],
                'images' => [
                    ['path' => 'images/iphone15pro-1.jpg', 'caption' => 'Depan'],
                    ['path' => 'images/iphone15pro-2.jpg', 'caption' => 'Belakang'],
                ],
            ],
            [
                'name' => 'iPhone 15',
                'model' => 'A3090',
                'description' => 'Varian standar iPhone.
                ',
                'price' => 13999000,
                'stock' => 40,
                'release_date' => '2023-09-22',
                'published' => true,
                'brand_id' => $brand->id,
                'category_id' => $category->id,
                'specs' => [
                    ['key' => 'RAM', 'value' => '6GB'],
                    ['key' => 'Storage', 'value' => '128GB'],
                    ['key' => 'CPU', 'value' => 'Apple A16'],
                    ['key' => 'Battery', 'value' => '3349 mAh'],
                    ['key' => 'Display', 'value' => '6.1" OLED 60Hz'],
                ],
                'images' => [
                    ['path' => 'images/iphone15-1.jpg', 'caption' => 'Depan'],
                ],
            ],
        ];

        foreach ($gadgets as $g) {
            $slug = Str::slug($g['name']);
            $gadget = Gadget::firstOrCreate(['slug' => $slug], [
                'name' => $g['name'],
                'model' => $g['model'] ?? null,
                'description' => $g['description'] ?? null,
                'price' => $g['price'] ?? null,
                'stock' => $g['stock'] ?? 0,
                'release_date' => $g['release_date'] ?? null,
                'published' => $g['published'] ?? true,
                'brand_id' => $g['brand_id'],
                'category_id' => $g['category_id'],
                'rating_avg' => 0,
            ]);

            foreach ($g['specs'] as $spec) {
                GadgetSpec::firstOrCreate([
                    'gadget_id' => $gadget->id,
                    'key' => $spec['key'],
                ], ['value' => $spec['value']]);
            }

            foreach ($g['images'] as $img) {
                GadgetImage::firstOrCreate([
                    'gadget_id' => $gadget->id,
                    'path' => $img['path'],
                ], ['caption' => $img['caption'] ?? null, 'position' => 0]);
            }
        }
    }
}
