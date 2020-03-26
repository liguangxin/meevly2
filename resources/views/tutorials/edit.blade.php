@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Redaguoti tutorialą</h2>

			<div class="mt-4">
				<form action="{{ url('tutorials/' . $tutorial['id']) }}" method="POST">
					@csrf
					@method('PUT')
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas" value="{{ $tutorial['name'] }}">
					</div>
					<div class="form-group">
						<label for="tutorials_category_id">Kategorija</label>
						<select class="form-control" name="tutorials_category_id" id="tutorials_category_id">
							@if ( ! empty( $categories ) )
								@include('tutorials-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => '', 'selected' => $tutorial['tutorials_category_id']))
							@endif
						</select>
					</div>
					<div class="form-group">
						<label for="content">Turinys</label>
						<textarea class="form-control wysiwyg" id="content" rows="5" name="content">{{ $tutorial['content'] }}</textarea>
					</div>
					<button class="btn btn-primary">Redaguoti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
