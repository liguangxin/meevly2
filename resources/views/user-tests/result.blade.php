@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Testas <b>{{ $test->name }}</b></h2>
			<div class="mt-5 text-center">
				<h3>Jūsų rezultatas {{ $percent }}% ({{ $correct }}/{{ $total }})</h3>
				<div class="mt-4">
					<a href="{{ url('user-tests') }}" class="btn btn-outline-primary">Grįžti į visus testus</a>
					<a href="{{ url('test-review/' . $id) }}" class="btn btn-outline-success">Peržiūrėti atsakymus</a>
				</div>
				<div class="mt-4">
					<a href="{{ url('start-test/' . $test->id) }}" class="btn btn-outline-primary">Spręsti iš naujo</a>
				</div>
			</div>

		</div>
	</div>
</div>
@stop
