@foreach ($category as $id => $attrs)
	<option value="{{ $id }}" {{ $selected === $id ? "selected" : "" }}>{{ $indent }} {{ $attrs['name'] }}</option>

	@if (!empty($categories[$id]))
		@php
		$nextindent = $indent . '-';
		@endphp

		@include('tutorials-categories/recursive-option', array('category' => $categories[$id], 'categories' => $categories, 'indent' => $nextindent, 'selected' => $selected ))

	@endif
@endforeach
