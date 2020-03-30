<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tutorial extends Model
{
    public function tutorialCategory()
    {
        return $this->belongsTo(TutorialCategory::class, 'tutorials_category_id', 'id');
    }
}
