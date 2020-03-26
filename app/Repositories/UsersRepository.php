<?php

namespace App\Repositories;

use App\User;

use Illuminate\Database\Eloquent\Builder as Query;

use Illuminate\Support\Collection;

class UsersRepository extends EloquentRepository
{
    use EscapeLikeValue;

    public function searchByTerm(string $term, int $limit = 15): Collection
    {
        $value = $this->getEscapedValue($term);

        return $this->query()
            ->where('name', 'like', "%$value%")
            ->limit($limit)
            ->get();
    }

    public function findById(string $id): Collection
    {
        return $this->query()
            ->where('id', $id)
            ->first();
    }

    protected function query(): Query
    {
        return User::query();
    }
}
