<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AdminTokenQueryParamTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function admin_reviews_are_accessible_with_valid_query_token()
    {
        // Ensure ADMIN_TOKEN is set for middleware (set in multiple env sources)
        putenv('ADMIN_TOKEN=secret-token-123');
        $_ENV['ADMIN_TOKEN'] = 'secret-token-123';
        $_SERVER['ADMIN_TOKEN'] = 'secret-token-123';

        // Create a sample review to ensure page has content
        $brand = \App\Models\Brand::create(['name' => 'BrandX', 'slug' => 'brandx']);
        $category = \App\Models\Category::create(['name' => 'CategoryY', 'slug' => 'categoryy']);
        $gadget = \App\Models\Gadget::create([
            'name' => 'G1',
            'slug' => 'g1',
            'brand_id' => $brand->id,
            'category_id' => $category->id,
            'price' => 500000,
        ]);

        $user = \App\Models\User::create([
            'name' => 'Alice',
            'email' => 'alice@example.com',
            'password' => bcrypt('password'),
        ]);

        \App\Models\Review::create([
            'gadget_id' => $gadget->id,
            'user_id' => $user->id,
            'rating' => 5,
            'body' => 'Great gadget!',
            'approved' => true,
        ]);

        // Hit admin reviews with query token
        $response = $this->get('/admin/reviews?admin_token=secret-token-123');

        $response->assertStatus(200);
        $response->assertSee('Ulasan Pending');
    }
}
