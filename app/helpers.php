<?php

use Illuminate\Support\Arr;

if (!function_exists('resource')) {

    function resource(string $path, string $version = null, bool $secure = null): string
    {
        return sprintf('%s?v=%s', asset($path, $secure), $version ?? config('app.version'));
    }
}

if (!function_exists('array_append')) {

    function array_append(array &$array, string $key, string $value, string $glue = ' '): array
    {
        $existing = Arr::get($array, $key);

        if (is_array($existing)) {
            $value = array_merge($existing, array_wrap($value));
        } else {
            $value = trim($existing . $glue . $value);
        }

        return Arr::set($array, $key, $value);
    }
}

if (!function_exists('array_key_dot')) {

    function array_key_dot(string $key): string
    {
        return trim(str_replace(']', '', str_replace('[', '.', $key)), '.');
    }
}
