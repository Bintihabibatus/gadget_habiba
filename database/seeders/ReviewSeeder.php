<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\{Gadget, Review, User};

class ReviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = User::first();
        $gadget = Gadget::first();
        if ($user && $gadget) {
            Review::firstOrCreate([
                'gadget_id' => $gadget->id,
                'user_id' => $user->id,
            ], [
                'rating' => 5,
                'body' => 'Produk sangat bagus, performa cepat dan kamera tajam.',
                'approved' => true,
            ]);
        }
    }
}
