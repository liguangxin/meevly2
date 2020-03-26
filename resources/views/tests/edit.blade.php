@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Redaguoti testą</h2>

			<div class="mt-4">
				<form action="{{ url('tests/' . $test['id']) }}" method="POST">
					@csrf
					@method('PUT')
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas" value="{{ $test['name'] }}">
					</div>
					<div class="form-group">
						<label for="tests_categories_id">Kategorija</label>
						<select class="form-control" name="tests_categories_id" id="tests_categories_id">
							@if ( ! empty( $categories ) )
								@include('tests-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => '', 'selected' => $test['tests_category_id']))
							@endif
						</select>
					</div>
					<div class="form-group">
						<label for="questions_no">Kiek klausimų rodyti</label>
						<input type="text" class="form-control" id="questions_no" name="questions_no" placeholder="Kiek klausimų rodyti" value="{{ $test['questions_no'] }}">
					</div>
					<button class="btn btn-primary">Redaguoti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
