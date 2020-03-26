@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Tutorialai</h2>
			<div class="mt-4">
				@if ( ! empty( $categories[0] ) )
					@include('user-tutorials/recursive-item', array('category' => $categories[0], 'categories' => $categories, 'tutorials' => $tutorials, 'indent' => 20))
				@endif
			</div>
		</div>
	</div>
</div>
@stop
