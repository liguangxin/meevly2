@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Redaguoti tutorialo kategoriją</h2>

			<div class="mt-4">
				<form action="{{ url('tutorials-categories/' . $single['id']) }}" method="POST">
					@csrf
					@method('PUT')
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" value="{{ $single['name'] }}" placeholder="Pavadinimas">
					</div>
					<div class="form-group">
						<label for="parent_id">Tėvinė kategorija</label>
						<select class="form-control" name="parent_id" id="parent_id">
							<option value="">Pasirinkti</option>
							
							@include('tutorials-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => '', 'selected' => $single['parent_id']))

						</select>
					</div>
					<button class="btn btn-primary">Redaguoti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
