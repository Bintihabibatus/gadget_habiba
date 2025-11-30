<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{Gadget, Brand, Category, Review, User};

class GadgetController extends Controller
{
    public function index(Request $request)
    {
        $query = Gadget::query()->with(['brand', 'category', 'images']);

        if ($search = $request->string('q')->toString()) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('model', 'like', "%{$search}%");
            });
        }

        if ($brand = $request->string('brand')->toString()) {
            $query->whereHas('brand', fn($q) => $q->where('slug', $brand));
        }

        if ($category = $request->string('category')->toString()) {
            $query->whereHas('category', fn($q) => $q->where('slug', $category));
        }

        if ($min = $request->float('min_price')) {
            $query->where('price', '>=', $min);
        }
        if ($max = $request->float('max_price')) {
            $query->where('price', '<=', $max);
        }

        $sort = $request->string('sort')->toString();
        $dir = $request->string('dir')->toString() ?: 'asc';
        if (in_array($sort, ['price', 'release_date', 'rating_avg'])) {
            $query->orderBy($sort, $dir === 'desc' ? 'desc' : 'asc');
        } else {
            $query->latest('id');
        }

        // Kumpulkan pilihan compare dari query string
        $compareParam = $request->string('compare')->toString();
        $compareSlugs = collect($request->input('slugs', []))
            ->filter()
            ->map(fn($s) => trim((string) $s));

        if ($compareSlugs->isEmpty() && $compareParam) {
            $compareSlugs = collect(explode(',', $compareParam))
                ->filter()
                ->map(fn($s) => trim((string) $s));
        }

        // Kecualikan gadget yang dipilih untuk compare dari daftar utama agar tidak duplikasi
        if ($compareSlugs->isNotEmpty()) {
            $query->whereNotIn('slug', $compareSlugs->all());
        }

        $gadgets = $query->paginate(12)->withQueryString();
        $brands = Brand::orderBy('name')->get();
        $categories = Category::orderBy('name')->get();

        // Dynamic bounds for price slider
        $priceMin = (int) floor(Gadget::min('price') ?? 0);
        $priceMax = (int) ceil(Gadget::max('price') ?? 50000000);

        // Ambil daftar gadget terpilih untuk ringkasan compare (urut mengikuti input slugs)
        $compareGadgets = collect();
        if ($compareSlugs->isNotEmpty()) {
            $ordered = $compareSlugs->values()->all();
            $compareGadgets = Gadget::query()
                ->with(['brand', 'category', 'images'])
                ->whereIn('slug', $ordered)
                ->get()
                ->sortBy(fn($g) => array_search($g->slug, $ordered));
        }

        return view('gadgets.index', compact(
            'gadgets', 'brands', 'categories', 'priceMin', 'priceMax', 'compareGadgets', 'compareSlugs'
        ));
    }

    public function show(string $slug)
    {
        $gadget = Gadget::with(['brand', 'category', 'images', 'specs', 'reviews' => function ($q) {
            $q->where('approved', true)->latest();
        }])->where('slug', $slug)->firstOrFail();

        return view('gadgets.show', compact('gadget'));
    }

    public function compare(Request $request)
    {
        $ids = collect($request->input('ids', []))->filter()->map('intval')->all();
        $slugs = collect($request->input('slugs', []))->filter()->map('strval')->all();
        $compareParam = $request->string('compare')->toString();
        if (empty($slugs) && $compareParam) {
            $slugs = collect(explode(',', $compareParam))
                ->filter()
                ->map(fn($s) => trim((string) $s))
                ->all();
        }

        // Enforce server-side maximum compare items
        $maxCompare = (int) config('app.compare_max', 4);
        if (!empty($ids)) {
            // Normalize, dedupe, and limit
            $ids = array_values(array_slice(array_unique(array_map('intval', $ids)), 0, $maxCompare));
        }
        if (!empty($slugs)) {
            // Normalize, dedupe, and limit
            $slugs = array_values(array_slice(array_unique(array_map('strval', $slugs)), 0, $maxCompare));
        }

        $query = Gadget::query()->with(['brand', 'category', 'specs']);
        if (!empty($ids)) {
            $query->whereIn('id', $ids);
        } elseif (!empty($slugs)) {
            $query->whereIn('slug', $slugs);
        } else {
            // Tidak ada input: tampilkan empty state di view yang sama
            $gadgets = collect();
            $allKeys = collect();
            $specMap = [];
            return view('gadgets.compare', compact('gadgets', 'allKeys', 'specMap'));
        }

        // Ambil hasil dan pertahankan urutan sesuai input (ids/slugs)
        $gadgets = $query->get();
        $ordered = !empty($slugs) ? $slugs : $ids;
        if (!empty($ordered)) {
            $gadgets = $gadgets->sortBy(function ($g) use ($ordered) {
                $key = isset($g->slug) ? $g->slug : $g->id;
                $pos = array_search($key, $ordered, true);
                return $pos === false ? PHP_INT_MAX : $pos;
            })->values();
        }
        if ($gadgets->isEmpty()) {
            abort(404);
        }

        // Gabungkan semua kunci spesifikasi dari gadget yang dipilih
        $allKeys = $gadgets->flatMap(fn($g) => $g->specs->pluck('key'))
            ->unique()
            ->sort()
            ->values();

        // Peta spesifikasi per gadget untuk lookup cepat
        $specMap = [];
        foreach ($gadgets as $g) {
            $specMap[$g->id] = $g->specs->pluck('value', 'key');
        }

        return view('gadgets.compare', compact('gadgets', 'allKeys', 'specMap'));
    }

    public function storeReview(Request $request, string $slug)
    {
        $gadget = Gadget::where('slug', $slug)->firstOrFail();

        $data = $request->validate([
            'name' => ['required', 'string', 'max:100'],
            'email' => ['required', 'email', 'max:150'],
            'rating' => ['required', 'integer', 'min:1', 'max:5'],
            'body' => ['required', 'string', 'min:10', 'max:2000'],
        ]);

        // Tautkan ke user yang ada berdasarkan email, atau user yang sedang login.
        // Jika tidak ada keduanya, jangan buat akun baru secara otomatis.
        $user = User::where('email', $data['email'])->first();
        $payload = [
            'gadget_id' => $gadget->id,
            'rating' => $data['rating'],
            'body' => $data['body'],
            'approved' => false,
        ];

        if ($user) {
            $payload['user_id'] = $user->id;
        } elseif (auth()->check()) {
            $payload['user_id'] = auth()->id();
        } else {
            // Guest review path: simpan nama dan email tamu tanpa membuat akun
            $payload['guest_name'] = $data['name'];
            $payload['guest_email'] = $data['email'];
        }

        Review::create($payload);

        return redirect()->route('gadgets.show', $gadget->slug)
            ->with('status', 'Terima kasih! Ulasan Anda menunggu persetujuan.');
    }

    public function brand(string $slug, Request $request)
    {
        $brand = Brand::where('slug', $slug)->firstOrFail();

        $query = Gadget::query()
            ->with(['brand', 'category', 'images'])
            ->where('brand_id', $brand->id);

        if ($search = $request->string('q')->toString()) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('model', 'like', "%{$search}%");
            });
        }

        $gadgets = $query->paginate(12)->withQueryString();
        $categories = Category::orderBy('name')->get();

        return view('gadgets.brand', compact('brand', 'gadgets', 'categories'));
    }

    public function category(string $slug, Request $request)
    {
        $category = Category::where('slug', $slug)->firstOrFail();

        $query = Gadget::query()
            ->with(['brand', 'category', 'images'])
            ->where('category_id', $category->id);

        if ($search = $request->string('q')->toString()) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('model', 'like', "%{$search}%");
            });
        }

        $gadgets = $query->paginate(12)->withQueryString();
        $brands = Brand::orderBy('name')->get();

        return view('gadgets.category', compact('category', 'gadgets', 'brands'));
    }

    public function brands(Request $request)
    {
        $search = $request->string('q')->toString();
        $query = Brand::query()->withCount('gadgets');
        if ($search) {
            $query->where('name', 'like', "%{$search}%");
        }
        $brands = $query->orderBy('name')->paginate(18)->withQueryString();
        return view('gadgets.brands', compact('brands'));
    }

    public function categories(Request $request)
    {
        $search = $request->string('q')->toString();
        $query = Category::query()->withCount('gadgets');
        if ($search) {
            $query->where('name', 'like', "%{$search}%");
        }
        $categories = $query->orderBy('name')->paginate(18)->withQueryString();
        return view('gadgets.categories', compact('categories'));
    }

    public function adminReviews()
    {
        $reviews = Review::where('approved', false)
            ->with(['gadget', 'user'])
            ->latest()
            ->paginate(20);
        return view('admin.reviews.index', compact('reviews'));
    }

    public function approveReview(int $id)
    {
        $review = Review::findOrFail($id);
        $review->approved = true;
        $review->save();

        // Recalculate gadget rating_avg from approved reviews
        try {
            $gadgetId = $review->gadget_id;
            if ($gadgetId) {
                $avg = Review::where('gadget_id', $gadgetId)
                    ->where('approved', true)
                    ->avg('rating');
                if ($avg !== null) {
                    Gadget::where('id', $gadgetId)->update(['rating_avg' => $avg]);
                }
            }
        } catch (\Throwable $e) {
            // noop: avoid breaking admin flow if recalculation fails
        }
        return back()->with('status', 'Ulasan berhasil di-approve.');
    }
}
