<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    public function testsCategory()
    {
        return $this->belongsTo(TestsCategory::class, 'tests_categories_id', 'id');
    }

    public function videoCategory()
    {
        return $this->belongsTo(VideoCategory::class, 'videos_categories_id', 'id');
    }
}
