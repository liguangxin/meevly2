<?php

namespace App\Http\Middleware;

use Closure;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Auth\Access\AuthorizationException;

class CheckRole
{
    /**
     * @var Guard
     */
    private $guard;

    public function __construct(Guard $guard)
    {
        $this->guard = $guard;
    }

    public function handle($request, Closure $next, string $role)
    {
        if (!$this->guard->check()) {
            throw new AuthorizationException();
        }

        $user = $this->guard->user();

        if ($user->role === $role) {
            return $next($request);
        }
    }
}
