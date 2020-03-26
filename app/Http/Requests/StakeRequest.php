<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StakeRequest extends FormRequest
{
    use AuthenticatedRequest;

    public function rules(): array
    {
        return [
            'user_id' => 'required|integer|exists:users,id',
            'stake' => 'required|integer|min:-1000000|max:1000000'
        ];
    }
}