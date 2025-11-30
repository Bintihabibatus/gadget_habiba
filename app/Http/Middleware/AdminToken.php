<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AdminToken
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next): Response
    {
        $token = env('ADMIN_TOKEN');

        // If no token configured, deny access in production; allow in local for dev convenience
        if (!$token) {
            if (app()->environment('local')) {
                return $next($request);
            }
            abort(403, 'Admin access not configured');
        }

        $provided = $request->header('X-Admin-Token') ?: $request->query('admin_token');
        if (!hash_equals($token, (string) $provided)) {
            abort(403, 'Forbidden');
        }

        return $next($request);
    }
}

