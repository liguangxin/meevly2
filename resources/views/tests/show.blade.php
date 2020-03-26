@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead mb-4">Testo <i>{{ $test->name }}</i> klausimai</h2>
			<a class="btn btn-success" href="{{ url('test-questions/create') }}?test_id={{ $test->id }}" role="button">Sukurti naują</a>
			<div class="mt-4">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Pavadinimas</th>
						<th scope="col">Veiksmai</th>
					</tr>
				</thead>
				<tbody>
					@if ( ! empty( $questions ) )
						@foreach ($questions as $question)
							<tr>
								<th scope="row">{{ $question->id }}</th>
								<td>{{ $question->title }}</td>
								<td>
									<a href="{{ url('test-questions/' . $question->id .'/edit') }}" class="btn">Redaguoti</a>
									<form action="{{ url('test-questions/' . $question->id) }}" method="POST" class="mb-0 d-inline-block">
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
