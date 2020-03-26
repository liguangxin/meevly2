@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Sukurti testo kategoriją</h2>

			<div class="mt-4">
				<form action="{{ url('tests-categories') }}" method="POST">
					@csrf
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas">
					</div>
					<div class="form-group">
						<label for="parent_id">Tėvinė kategorija</label>
						<select class="form-control" name="parent_id" id="parent_id">
							<option value="">Pasirinkti</option>
							@if ( ! empty( $categories ) )
								@include('tests-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => ''))
							@endif
						</select>
					</div>
					<button class="btn btn-primary">Kurti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
