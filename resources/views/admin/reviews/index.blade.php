<!doctype html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin — Ulasan Pending</title>
    @vite('resources/css/app.css')
 </head>
 <body class="font-sans text-gray-900 dark:text-[#EDEDEC] bg-brandPink-50 dark:bg-[#0B0B09] min-h-screen flex flex-col">
    <x-header />

    <main class="max-w-7xl mx-auto px-6 py-8 flex-1">
        <h1 class="text-2xl font-700 text-brandPink-900 dark:text-[#EDEDEC] mb-4">Ulasan Pending</h1>
        @if (session('status'))
            <div class="p-3 rounded border border-brandPink-200 dark:border-[#3E3E3A] bg-brandPink-100 dark:bg-[#161615] text-brandPink-800 dark:text-[#EDEDEC] mb-4">{{ session('status') }}</div>
        @endif
        <section class="grid gap-4">
            @forelse($reviews as $rev)
                <article class="bg-white dark:bg-[#161615] rounded-xl border border-brandPink-200 dark:border-[#3E3E3A] p-4 hover:shadow-md transition">
                    <div class="flex items-center justify-between">
                        <div>
                            <div class="font-semibold dark:text-[#EDEDEC]">{{ $rev->user?->name ?? $rev->guest_name ?? 'Guest' }} ({{ $rev->user?->email ?? $rev->guest_email ?? 'Guest' }})</div>
    <div class="text-sm text-gray-600 dark:text-[#B4B4B0]">Gadget: <a class="text-brandPink-700 dark:text-[#EDEDEC] hover:text-brandPink-900 dark:hover:text-white" href="{{ route('gadgets.show', $rev->gadget->slug, false) }}">{{ $rev->gadget->name }}</a></div>
                            <div class="text-sm"><span class="text-brandPink-700 dark:text-[#EDEDEC]">Rating:</span> <span class="font-600 dark:text-[#EDEDEC]">{{ $rev->rating }}/5</span></div>
                        </div>
    <form method="post" action="{{ route('admin.reviews.approve', $rev->id, false) }}">
                            @csrf
                            <button class="px-3 py-2 rounded-full bg-brandPink-600 hover:bg-brandPink-700 text-white">Approve</button>
                        </form>
                    </div>
                    <p class="mt-3 text-gray-800 dark:text-[#C7C7C7]">{{ $rev->body }}</p>
                </article>
            @empty
                <p class="text-gray-600 dark:text-[#B4B4B0]">Tidak ada ulasan pending.</p>
            @endforelse
        </section>

        <div class="mt-6 border-t border-brandPink-200 dark:border-[#3E3E3A] pt-4">{{ $reviews->links() }}</div>
    </main>

    <x-footer />
    @vite('resources/js/app.js')
 </body>
 </html>
