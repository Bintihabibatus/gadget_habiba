<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\{BrandSeeder, CategorySeeder, GadgetSeeder, ReviewSeeder};

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Buat user dummy
        $user = User::firstOrCreate(['email' => 'test@example.com'], [
            'name' => 'Test User',
            'password' => bcrypt('password'),
        ]);

        $this->call([BrandSeeder::class, CategorySeeder::class, GadgetSeeder::class, BulkGadgetSeeder::class, ReviewSeeder::class]);
    }
}
