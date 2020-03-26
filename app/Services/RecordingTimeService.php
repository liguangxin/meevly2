<?php

namespace App\Services;

use Carbon\Carbon;

class RecordingTimeService {
    public static function calculate(): Carbon
    {
        $recorded_at = Carbon::now();

        if ($recorded_at->weekOfYear % 2) {
            $recorded_at->startOfWeek();
            $recorded_at->addWeek();
        } else {
            if (!$recorded_at->isMonday()) {
                $recorded_at->startOfWeek();
                $recorded_at->addWeeks(2);
            }
        }

        return $recorded_at;
    }
}
