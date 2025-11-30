<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Smartphone', 'slug' => 'smartphone'],
            ['name' => 'Laptop', 'slug' => 'laptop'],
            ['name' => 'Tablet', 'slug' => 'tablet'],
            ['name' => 'Wearable', 'slug' => 'wearable'],
        ];

        foreach ($categories as $c) {
            Category::firstOrCreate(['slug' => $c['slug']], [
                'name' => $c['name'],
                'description' => null,
            ]);
        }
    }
}
