<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ImageProxyController extends Controller
{
    public function show(Request $request)
    {
        $url = $request->query('url');
        if (!$url) {
            abort(400, 'Missing url parameter');
        }

        $parts = parse_url($url);
        if (!$parts || !in_array($parts['scheme'] ?? '', ['http', 'https'], true)) {
            abort(400, 'Invalid url');
        }

        $host = $parts['host'] ?? '';
        // Limit hosts to avoid SSRF. Extend as needed.
        $allowedHosts = [
            'images.unsplash.com',
            'plus.unsplash.com',
        ];
        if (!in_array($host, $allowedHosts, true)) {
            abort(403, 'Host not allowed');
        }

        $hash = sha1($url);
        $dir = 'image_proxy';
        $disk = Storage::disk('public');
        if (!$disk->exists($dir)) {
            $disk->makeDirectory($dir);
        }

        // Try cached file
        foreach (['jpg', 'jpeg', 'png', 'webp', 'gif'] as $ext) {
            $cached = "$dir/$hash.$ext";
            if ($disk->exists($cached)) {
                return response()->file($disk->path($cached));
            }
        }

        try {
            $client = new \GuzzleHttp\Client([
                'timeout' => 6,
                'http_errors' => true,
            ]);
            $resp = $client->get($url, [
                'headers' => [
                    'Accept' => 'image/*',
                    'User-Agent' => 'HabibaGadgetImageProxy/1.0',
                ],
            ]);

            $contentType = $resp->getHeaderLine('Content-Type') ?: '';
            // Validasi hanya tipe gambar
            if (!str_starts_with(strtolower($contentType), 'image/')) {
                throw new \RuntimeException('Unsupported content type');
            }

            // Batas ukuran konten 5MB
            $maxBytes = 5 * 1024 * 1024;
            $declaredLen = (int) $resp->getHeaderLine('Content-Length');
            if ($declaredLen && $declaredLen > $maxBytes) {
                throw new \RuntimeException('Image too large');
            }

            $stream = $resp->getBody();
            $data = $stream->getContents();
            if (strlen($data) > $maxBytes) {
                throw new \RuntimeException('Image too large');
            }

            $ext = 'jpg';
            $ct = strtolower($contentType);
            if (str_contains($ct, 'png')) $ext = 'png';
            elseif (str_contains($ct, 'webp')) $ext = 'webp';
            elseif (str_contains($ct, 'gif')) $ext = 'gif';
            elseif (str_contains($ct, 'jpeg') || str_contains($ct, 'jpg')) $ext = 'jpg';

            $path = "$dir/$hash.$ext";
            $disk->put($path, $data);

            return response($data, 200)->header('Content-Type', $contentType ?: 'image/jpeg');
        } catch (\Throwable $e) {
            // Fallback to local placeholder
            $fallbackPath = public_path('images/fallback.svg');
            return response()->file($fallbackPath);
        }
    }
}
