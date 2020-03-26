@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Testai</h2>
			<a class="btn btn-success" href="{{ url('tests/create') }}" role="button">Sukurti naują</a>
			<div class="mt-4">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Pavadinimas</th>
						<th scope="col">Kategorija</th>
						<th scope="col">Veiksmai</th>
					</tr>
				</thead>
				<tbody>
					@if ( ! empty( $tests ) )
						@foreach ($tests as $test)
							<tr>
								<th scope="row">{{ $test->id }}</th>
								<td>
									<a href="{{ url('tests/' . $test->id ) }}">{{ $test->name }}</a>
								</td>
								<td>{{ $test->category_name }}</td>
								<td>
									<a href="{{ url('tests/' . $test->id .'/edit') }}" class="btn">Redaguoti</a>
									<form action="{{ url('tests/' . $test->id) }}" method="POST" class="mb-0 d-inline-block">
										{{ method_field('DELETE') }}
										{{ csrf_field() }}
										<button class="btn" aria-hidden="true">
											Trinti
										</button>
									</form>
								</td>
							</tr>
						@endforeach
					@endif
				</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
@stop
