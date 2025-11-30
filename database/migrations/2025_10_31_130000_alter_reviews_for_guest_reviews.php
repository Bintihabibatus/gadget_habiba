<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // SQLite does not support altering nullability easily; recreate table safely.
        // Ensure idempotency: if reviews_old already exists, skip rename
        if (!Schema::hasTable('reviews_old') && Schema::hasTable('reviews')) {
            Schema::rename('reviews', 'reviews_old');
        }

        // Drop foreign keys on the old table to avoid duplicate constraint names in MySQL
        // Drop foreign keys by raw SQL to avoid Schema builder batching issues
        try { DB::statement('ALTER TABLE reviews_old DROP FOREIGN KEY reviews_gadget_id_foreign'); } catch (\Throwable $e) {}
        try { DB::statement('ALTER TABLE reviews_old DROP FOREIGN KEY reviews_user_id_foreign'); } catch (\Throwable $e) {}
        try { DB::statement('ALTER TABLE reviews_old DROP FOREIGN KEY reviews_old_gadget_id_foreign'); } catch (\Throwable $e) {}
        try { DB::statement('ALTER TABLE reviews_old DROP FOREIGN KEY reviews_old_user_id_foreign'); } catch (\Throwable $e) {}

        if (!Schema::hasTable('reviews')) {
            Schema::create('reviews', function (Blueprint $table) {
                $table->id();
                $table->foreignId('gadget_id')->constrained()->cascadeOnDelete();
                $table->foreignId('user_id')->nullable()->constrained()->cascadeOnDelete();
                $table->string('guest_name')->nullable();
                $table->string('guest_email')->nullable();
                $table->unsignedTinyInteger('rating');
                $table->text('body');
                $table->boolean('approved')->default(false);
                $table->timestamps();
            });

            // Copy existing data
            if (Schema::hasTable('reviews_old')) {
                DB::statement('INSERT INTO reviews (id, gadget_id, user_id, rating, body, approved, created_at, updated_at)
                                SELECT id, gadget_id, user_id, rating, body, approved, created_at, updated_at FROM reviews_old');
            }

            // Drop old table
            if (Schema::hasTable('reviews_old')) {
                Schema::drop('reviews_old');
            }
        } else {
            // Ensure columns exist and user_id is nullable
            if (!Schema::hasColumn('reviews', 'guest_name')) {
                Schema::table('reviews', function (Blueprint $table) {
                    $table->string('guest_name')->nullable();
                });
            }
            if (!Schema::hasColumn('reviews', 'guest_email')) {
                Schema::table('reviews', function (Blueprint $table) {
                    $table->string('guest_email')->nullable();
                });
            }
            try {
                DB::statement('ALTER TABLE reviews MODIFY COLUMN user_id BIGINT UNSIGNED NULL');
            } catch (\Throwable $e) {}

            // Cleanup old table if still present
            if (Schema::hasTable('reviews_old')) {
                Schema::drop('reviews_old');
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Recreate old schema without guest fields and non-nullable user_id
        Schema::rename('reviews', 'reviews_new');

        Schema::create('reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('gadget_id')->constrained()->cascadeOnDelete();
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->unsignedTinyInteger('rating');
            $table->text('body');
            $table->boolean('approved')->default(false);
            $table->timestamps();
        });

        DB::statement('INSERT INTO reviews (id, gadget_id, user_id, rating, body, approved, created_at, updated_at)
                        SELECT id, gadget_id, user_id, rating, body, approved, created_at, updated_at FROM reviews_new');

        Schema::drop('reviews_new');
    }
};
