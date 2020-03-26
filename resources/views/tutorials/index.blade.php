@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Tutorialai</h2>
			<a class="btn btn-success" href="{{ url('tutorials/create') }}" role="button">Sukurti naują</a>
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
					@if ( ! empty( $tutorials ) )
						@foreach ($tutorials as $tutorial)
							<tr>
								<th scope="row">{{ $tutorial->id }}</th>
								<td>{{ $tutorial->name }}</td>
								<td>{{ $tutorial->category_name }}</td>
								<td>
									<a href="{{ url('tutorials/' . $tutorial->id .'/edit') }}" class="btn">Redaguoti</a>
									<form action="{{ url('tutorials/' . $tutorial->id) }}" method="POST" class="mb-0 d-inline-block">
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
