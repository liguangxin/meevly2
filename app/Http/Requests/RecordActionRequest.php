<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

use Illuminate\Validation\Rule;

use App\UserRecord;

class RecordActionRequest extends FormRequest
{
    use AuthenticatedRequest;

    public function rules(): array
    {
        return [
            'action' => ['required', Rule::in(UserRecord::actions())]
        ];
    }
}