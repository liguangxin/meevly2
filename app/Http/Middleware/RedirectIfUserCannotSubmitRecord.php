<?php

namespace App\Http\Middleware;

use Closure;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;

use Illuminate\Auth\Access\AuthorizationException;

use App\Repositories\UserRecordsRepository;

use App\Services\RecordingTimeService;

use App\User;

class RedirectIfUserCannotSubmitRecord
{
    /**
     * @var Guard
     */
    private $guard;

    /**
     * @var UserRecordsRepository
     */
    private $records;

    public function __construct(Guard $guard, UserRecordsRepository $records)
    {
        $this->guard = $guard;
        $this->records = $records;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (!$this->guard->check()) {
            throw new AuthorizationException();
        }

        $user = $this->guard->user();

        if ($user->role === User::ROLE_ADMIN) {
            return $next($request);
        }

        $current_date = RecordingTimeService::calculate();

        if ($this->records->countByUserAndRecordedAt($user, $current_date)) {
            $next_date = $current_date->copy()->addDay();
            $previous_date = $next_date->copy()->subWeeks(2);

            $request->session()->flash('alert', [
                'warning' => [
                    'message' => 'flashes.cannot_submit',
                    'replace' => ['previous_date' => $previous_date->format('Y-m-d'), 'current_date' => $current_date->format('Y-m-d'), 'next_date' => $next_date->format('Y-m-d')]
                ]
            ]);

            return redirect()->route('records.user', $user);
        }

        return $next($request);
    }
}
