<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GadgetController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ImageProxyController;

Route::get('/', [HomeController::class, 'index'])->name('home');


Route::get('/gadgets', [GadgetController::class, 'index'])->name('gadgets.index');
Route::get('/gadgets/{slug}', [GadgetController::class, 'show'])->name('gadgets.show');
Route::get('/gadgets/compare', [GadgetController::class, 'compare'])->name('gadgets.compare');
Route::post('/gadgets/{slug}/reviews', [GadgetController::class, 'storeReview'])->name('gadgets.reviews.store');

// Brand and Category pages
Route::get('/brands/{slug}', [GadgetController::class, 'brand'])->name('brands.show');
Route::get('/categories/{slug}', [GadgetController::class, 'category'])->name('categories.show');

// Brand & Category index
Route::get('/brands', [GadgetController::class, 'brands'])->name('brands.index');
Route::get('/categories', [GadgetController::class, 'categories'])->name('categories.index');

// Admin reviews (protected)
Route::middleware('admin.token')->group(function () {
    Route::get('/admin/reviews', [GadgetController::class, 'adminReviews'])->name('admin.reviews.index');
    Route::post('/admin/reviews/{id}/approve', [GadgetController::class, 'approveReview'])->name('admin.reviews.approve');
});

// Image proxy to avoid ORB blocking on external image requests
Route::get('/image-proxy', [ImageProxyController::class, 'show'])->name('image.proxy');

// Lightweight health endpoint for connectivity checks
Route::get('/healthz', function () {
    return response()->json(['ok' => true]);
})->name('healthz');
