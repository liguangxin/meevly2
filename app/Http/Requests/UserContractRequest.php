<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserContractRequest extends FormRequest
{
    use AuthenticatedRequest;

    public function rules(): array
    {
        return [
            'profit_share' => 'required|integer|min:0|max:100',
            'ft_profit_share' => 'required|numeric|min:0|max:100',
            'st_profit_share' => 'required|numeric|min:0|max:100',
            'tt_profit_share' => 'required|numeric|min:0|max:100',
            'fth_profit_share' => 'required|numeric|min:0|max:100',
            'affiliate_share' => 'required|numeric|min:0|max:100',
            'transfer_fee' => 'required|numeric|min:0.0001|max:100',
        ];
    }
}
