<?php

namespace App\Http\Requests;

use App\UserRecord;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Contracts\Auth\Access\Authorizable;

class RecordRequest extends FormRequest
{
    use AuthenticatedRequest;

    public function rules(): array
    {
        $user = $this->user();

        $rules = [
            'bankroll' => 'required|numeric|min:0|max:1000000',
            'games_count' => 'required|integer|min:0|max:4200000000',
            'winamax_photo' => 'required|url',
            'pt4_photo' => 'required|url'
        ];

        if ($user instanceof Authorizable && $user->can('manage-records', UserRecord::class)) {
            $rules = array_merge($rules, [
                'stake' => 'required|numeric|min:0|max:1000000',
                'owner_id' => 'required|integer|exists:users,id',
                'recorded_at' => 'nullable|date_format:Y-m-d'
            ]);
        }

        return $rules;
    }
}
