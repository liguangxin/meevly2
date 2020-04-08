<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
//    public const ROLE_USER = 'user';
//    public const ROLE_ADMIN = 'admin';
//
//    public const FIRST_TEACHER_NAME = 'marcius';
//    public const SECOND_TEACHER_NAME = 'algirdas';
//    public const THIRD_TEACHER_NAME = 'tomas';
//    public const FOURTH_TEACHER_NAME = 'ssuba';

    use Notifiable;
    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
//    protected $fillable = [
//        'name', 'email', 'password', 'max_games_count', 'profit_share',
//        'ft_profit_share', 'st_profit_share', 'tt_profit_share', 'fth_profit_share', 'affiliate_share', 'transfer_fee'
//    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
//    protected $hidden = [
//        'password', 'remember_token', 'type', 'max_games_count', 'profit_share',
//        'ft_profit_share', 'st_profit_share', 'tt_profit_share', 'fth_profit_share', 'affiliate_share', 'transfer_fee'
//    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
//    protected $casts = [
//        'email_verified_at' => 'datetime',
//    ];

//    public function isAdmin(): bool
//    {
//        return $this->role === self::ROLE_ADMIN;
//    }
//
//    public function stakes(): HasMany
//    {
//        return $this->hasMany(UserStake::class);
//    }
//
//    public function records(): HasMany
//    {
//        return $this->hasMany(UserRecord::class, 'owner_id');
//    }
//
//    protected function getStakeAttribute(): int
//    {
//        return $this->stakes()->sum('stake');
//    }
//
//    protected function getGamesLeftAttribute(): int
//    {
//        $games_left = $this->max_games_count - $this->records()->sum('games_count');
//
//        if ($games_left < 0) {
//            $games_left = 0;
//        }
//
//        return $games_left;
//    }
//
//    public static function teachers(): array
//    {
//        return [
//            self::FIRST_TEACHER_NAME,
//            self::SECOND_TEACHER_NAME
//        ];
//    }
//
//    public function isSameAs(User $user): bool
//    {
//        return $this->id === $user->id;
//    }
}
