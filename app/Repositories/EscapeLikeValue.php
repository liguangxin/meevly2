<?php

namespace App\Repositories;

trait EscapeLikeValue
{
    private function getEscapedValue(string $value): string
    {
        return str_replace(['\\', '%', '_'], ['\\\\', '\\%', '\\_'], $value);
    }
}