<?php

namespace App;

use Carbon\Carbon;

use App\Events\UserRecordSaving;

use Illuminate\Database\Eloquent\Model as Eloquent;

use Illuminate\Database\Eloquent\Relations\BelongsTo;

use Collective\Html\Eloquent\FormAccessible;

/**
 * @property int $owner_id
 * @property string $bankroll
 * @property int $games_count
 * @property string $winamax_photo
 * @property string $pt4_photo
 * @property string $stake
 * @property string $cashout
 * @property string $ft_cashout
 * @property string $sf_cashout
 * @property string $af_cashout
 * @property string $action
 * @property bool $is_ft_paid
 * @property bool $is_st_paid
 * 
 * @property \Carbon\Carbon $recorded_at
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 *
 * @property User $owner
 */
class UserRecord extends Eloquent
{
    use FormAccessible;

    public const ACTION_WITHOUT_ANSWER = 'without_answer';
    public const ACTION_SMALL_PROFIT = 'small_profit';
    public const ACTION_CASHOUT = 'cashout';

    /**
     * @var array
     */
    protected $fillable = [
        'bankroll', 'stake', 'recorded_at', 'games_count', 'winamax_photo', 'pt4_photo'
    ];

    /**
     * @var array
     */
    protected $casts = [
        'bankroll' => 'decimal:2',
        'owner_id' => 'integer',
        'games_count' => 'integer',
        'stake' => 'decimal:2',
        'cashout' => 'decimal:2',
        'ft_cashout' => 'decimal:2',
        'sf_cashout' => 'decimal:2',
        'af_cashout' => 'decimal:2',
        'is_ft_paid' => 'bool',
        'is_st_paid' => 'bool',
    ];

    /**
     * @var array
     */
    protected $dates = [
        'recorded_at'
    ];

    /**
     * @var array
     */
    protected $dispatchesEvents = [
        'saving' => UserRecordSaving::class,
    ];

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public static function actions(): array
    {
        return [
            self::ACTION_WITHOUT_ANSWER,
            self::ACTION_SMALL_PROFIT,
            self::ACTION_CASHOUT
        ];
    }

    public function isOwnedBy(User $user): bool
    {
        return $this->owner_id === $user->id;
    }

    public function formRecordedAtAttribute(Carbon $recorded_at): string
    {
        return $recorded_at->format('Y-m-d');
    }
}
