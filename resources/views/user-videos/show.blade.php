@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Vaizdo įrašas <b>{{ $video->name }}</b></h2>
			<div class="mt-5 text-center">
				<div class="mt-5">
					{!! $video->content !!}
				</div>
			</div>
		</div>
	</div>
</div>
@stop
