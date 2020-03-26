<?php

namespace App\Policies;

use App\User;
use App\UserRecord;

class UserRecordsPolicy
{
    public function manageRecords(User $user, UserRecord $record = null): bool
    {
        return $user->isAdmin() || (isset($record) && $record->isOwnedBy($user));
    }
}
