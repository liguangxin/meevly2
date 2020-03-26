@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Testas <b>{{ $test->name }}</b></h2>
			<div class="mt-5 text-center">
				<h3>Ar tikrai norite baigti testą?</h3>
				<div class="mt-4">
					<a href="{{ url('start-test/' . $test->id) }}" class="btn btn-outline-primary">Atgal</a>
					<a href="{{ url('test-finish/' . $id) }}" class="btn btn-outline-success">Baigti testą</a>
				</div>
			</div>

		</div>
	</div>
</div>
@stop
