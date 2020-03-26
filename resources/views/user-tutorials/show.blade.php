@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Tutorialas <b>{{ $tutorial->name }}</b></h2>
			<div class="mt-5 text-center">
				<div class="mt-5">
					{!! $tutorial->content !!}
				</div>
			</div>
		</div>
	</div>
</div>
@stop
