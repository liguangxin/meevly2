<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Validation\Rule;

use App\User;

class RecordPaymentRequest extends FormRequest
{
    use AuthenticatedRequest;

    public function rules(): array
    {
        return [
            'teacher' => ['required', Rule::in(User::teachers())],
            'is_paid' => 'sometimes|boolean'
        ];
    }
}
