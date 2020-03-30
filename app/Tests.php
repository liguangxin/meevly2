<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tests extends Model
{
    public function testsCategory()
    {
        return $this->belongsTo(TestsCategory::class, 'tests_categories_id', 'id');
    }
}
