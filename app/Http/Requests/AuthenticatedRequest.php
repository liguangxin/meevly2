<?php

namespace App\Http\Requests;

trait AuthenticatedRequest
{
    public function authorize(): bool
    {
        return $this->user() !== null;
    }
}
