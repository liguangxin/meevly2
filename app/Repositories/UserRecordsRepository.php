<?php

namespace App\Repositories;

use Carbon\Carbon;

use App\User;
use App\UserRecord;

use Illuminate\Database\Eloquent\Builder as Query;

use Illuminate\Support\Collection;

class UserRecordsRepository extends EloquentRepository
{
    public function findAllRecordedDates(): Collection {
        return $this->query()
            ->latest('recorded_at')
            ->groupBy('recorded_at')
            ->pluck('recorded_at', 'recorded_at')
            ->transform(function ($entry) {
                return $entry->format('Y-m-d');
            });
    }

    public function findAllByRecordedDate($recorded_at): Collection
    {
        if (!($recorded_at instanceof Carbon)) {
            $recorded_at = Carbon::createFromFormat('Y-m-d', $recorded_at);
        }

        return $this->query()
            ->whereDate('recorded_at', $recorded_at)
            ->latest('recorded_at')
            ->get();
    }

    public function findAllByUser(User $user = null): Collection
    {
        return $this->query()
            ->where('owner_id', $user->id)
            ->latest('recorded_at')
            ->get();
    }

    public function countByUserAndRecordedAt(User $user, Carbon $recorded_at): int
    {
        return $this->query()
            ->where('owner_id', $user->id)
            ->where('recorded_at', $recorded_at)
            ->count();
    }

    public function calculateAllProfits(Collection $entries, User $user = null): array
    {
        $profits = [];

        $profits['all_first_teacher'] = $entries->sum('ft_cashout');
        $profits['all_second_teacher'] = $entries->sum('st_cashout');
        $profits['all_third_teacher'] = $entries->sum('tt_cashout');
        $profits['all_fourth_teacher'] = $entries->sum('fth_cashout');

        return $profits;
    }

    protected function query(): Query
    {
        return UserRecord::query();
    }
}
