<?php

namespace App\Repositories;

use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder as Query;

abstract class EloquentRepository
{
    abstract protected function query(): Query;

    public function findAll(int $limit = 15): LengthAwarePaginator
    {
        return $this->query()
            ->latest()
            ->paginate($limit);
    }
}
