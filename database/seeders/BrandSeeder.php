<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Brand;

class BrandSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $brands = [
            ['name' => 'Apple', 'slug' => 'apple'],
            ['name' => 'Samsung', 'slug' => 'samsung'],
            ['name' => 'Xiaomi', 'slug' => 'xiaomi'],
            ['name' => 'Sony', 'slug' => 'sony'],
            ['name' => 'Asus', 'slug' => 'asus'],
        ];

        foreach ($brands as $b) {
            Brand::firstOrCreate(['slug' => $b['slug']], [
                'name' => $b['name'],
                'description' => null,
                'logo_path' => null,
            ]);
        }
    }
}
