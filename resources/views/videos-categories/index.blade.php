@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	@php
	if ( ! empty( $error ) ) {
		@endphp
		<div class="alert alert-danger" role="alert">
			Trinti negalima, nes yra priskirtų dukterinių kategorijų.
		</div>
		@php
	}
	@endphp
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Video kategorijos</h2>
			<a class="btn btn-success" href="{{ url('videos-categories/create') }}" role="button">Sukurti naują</a>
			<div class="mt-4">
				<ul class="list-group">
					@if ( ! empty( $categories[0] ) )
						@include('videos-categories/recursive-item', array('category' => $categories[0], 'categories' => $categories, 'indent' => 20))
					@endif
				</ul>
			</div>
		</div>
	</div>
</div>
@stop
