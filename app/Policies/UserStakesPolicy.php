<?php

namespace App\Policies;

use App\User;

class UserStakesPolicy
{
    public function manageStakes(User $user): bool
    {
        return $user->isAdmin();
    }
}