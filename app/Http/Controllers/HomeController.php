<?php

namespace App\Http\Controllers;

use App\Models\{Gadget, Brand, Category};

class HomeController extends Controller
{
    public function index()
    {
        $latestGadgets = Gadget::query()
            ->with(['brand', 'category', 'images'])
            ->latest('id')
            ->take(6)
            ->get();

        $topRatedGadgets = Gadget::query()
            ->with(['brand', 'category', 'images'])
            ->orderByDesc('rating_avg')
            ->take(6)
            ->get();

        $popularBrands = Brand::query()
            ->withCount('gadgets')
            ->orderByDesc('gadgets_count')
            ->orderBy('name')
            ->take(8)
            ->get();

        $popularCategories = Category::query()
            ->withCount('gadgets')
            ->orderByDesc('gadgets_count')
            ->orderBy('name')
            ->take(8)
            ->get();

        return view('home', compact(
            'latestGadgets', 'topRatedGadgets', 'popularBrands', 'popularCategories'
        ));
    }
}

