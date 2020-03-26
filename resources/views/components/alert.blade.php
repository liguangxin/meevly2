@php($closeable = !empty($closeable))
<div class="@classNames('alert alert-' . $type, ['alert-dismissible' => $closeable])" role="alert">
  {!! $slot !!}
  @if($closeable)
    <button type="button" class="close" data-dismiss="alert" aria-label="@lang('buttons.close')">
      <span aria-hidden="true">&times;</span>
    </button>
  @endif
</div>
