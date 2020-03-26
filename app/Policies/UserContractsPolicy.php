<?php

namespace App\Policies;

use App\User;

class UserContractsPolicy
{
    public function manageContracts(User $user): bool
    {
        return $user->isAdmin();
    }
}
