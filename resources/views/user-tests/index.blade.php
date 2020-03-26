@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Testai</h2>
			<div class="mt-4">
				@if ( ! empty( $categories[0] ) )
					@include('user-tests/recursive-item', array('category' => $categories[0], 'categories' => $categories, 'tests' => $tests, 'videos' => $videos, 'indent' => 20))
				@endif
			</div>
		</div>
	</div>
</div>
@stop
