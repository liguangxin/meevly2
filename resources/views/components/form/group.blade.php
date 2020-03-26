@php($hasError = $errors->has(array_key_dot($name)))
@php($classes = 'form-control' . ($hasError ? ' is-invalid' : ''))
@php($type = Arr::pull($attributes, 'type', 'text'))
@php($label = Arr::pull($attributes, 'label'))

<div
  class="@classNames('form-group', ['has-invalid' => $hasError])"
>
  <div class="form-input">
    @if($label)
      {!! Form::label($name, __($label) . ':') !!}
    @endif

    @if($type === 'text')
      {!! Form::text($name, null, array_append($attributes, 'class', $classes)) !!}
    @elseif($type === 'number')
      {!! Form::number($name, null, array_append($attributes, 'class', $classes)) !!}
    @elseif($type === 'date')
      {!! Form::date($name, null, array_append($attributes, 'class', $classes)) !!}
    @endif
  </div>

  {!! Form::error($name) !!}
</div>
