<?php

namespace App\Repositories;

use App\User;
use App\UserStake;

use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder as Query;

use Illuminate\Support\Collection;

class UserStakesRepository extends EloquentRepository
{
    public function findByUser(User $user, int $limit = 15): LengthAwarePaginator
    {
        return $this->query()
            ->where('user_id', $user->id)
            ->latest()
            ->paginate($limit);
    }

    public function findLatest(int $limit = 15): Collection
    {
        return $this->query()
            ->latest()
            ->limit($limit)
            ->get();
    }

    protected function query(): Query
    {
        return UserStake::query();
    }
}
