@php($name = array_key_dot($name))

@if ($errors->has($name))
  <span class="invalid-feedback">
    <strong>{{ $errors->first($name) }}</strong>
  </span>
@endif
