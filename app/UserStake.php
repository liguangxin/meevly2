<?php

namespace App;

use Illuminate\Database\Eloquent\Model as Eloquent;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property int $user_id
 * @property int $stake
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 *
 * @property User $user
 */
class UserStake extends Eloquent
{
    /**
     * @var array
     */
    protected $fillable = [
        'user_id', 'stake'
    ];

    /**
     * @var array
     */
    protected $casts = [
        'stake' => 'integer'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}