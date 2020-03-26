<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

use App\User;

use App\UserStake;
use App\UserRecord;

use App\Policies\UserContractsPolicy;

use App\Policies\UserStakesPolicy;
use App\Policies\UserRecordsPolicy;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        User::class => UserContractsPolicy::class,
        UserStake::class => UserStakesPolicy::class,
        UserRecord::class => UserRecordsPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
    }
}