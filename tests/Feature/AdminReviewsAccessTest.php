<?php

namespace Tests\Feature;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Tests\TestCase;

class AdminReviewsAccessTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();

        // Ensure the minimal 'reviews' table exists so controller queries don't fail
        if (! Schema::hasTable('reviews')) {
            Schema::create('reviews', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('gadget_id')->nullable();
                $table->unsignedBigInteger('user_id')->nullable();
                $table->text('body')->nullable();
                $table->boolean('approved')->default(false);
                $table->timestamps();
            });
        }
    }

    public function test_admin_reviews_forbidden_without_token(): void
    {
        // In testing env, middleware should block when no token is provided
        $response = $this->get('/admin/reviews');
        $response->assertStatus(403);
    }

    public function test_admin_reviews_allowed_with_valid_token_header(): void
    {
        // Provide a token via env and header, expect 200
        $_ENV['ADMIN_TOKEN'] = 'test-token-123';
        $response = $this->get('/admin/reviews', [
            'X-Admin-Token' => 'test-token-123',
        ]);
        $response->assertStatus(200);
    }
}

