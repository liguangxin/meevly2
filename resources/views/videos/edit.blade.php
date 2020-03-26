@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Redaguoti video</h2>

			<div class="mt-4">
				<form action="{{ url('videos/' . $video['id']) }}" method="POST">
					@csrf
					@method('PUT')
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas" value="{{ $video['name'] }}">
					</div>
					<div class="form-group">
						<label for="videos_categories_id">Kategorija</label>
						<select class="form-control" name="videos_categories_id" id="videos_categories_id">
							@if ( ! empty( $categories ) )
								@include('videos-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => '', 'selected' => $video['videos_categories_id']))
							@endif
						</select>
					</div>
					<div class="form-group">
						<label for="tests_categories_id">Testo kategorija</label>
						<select class="form-control" name="tests_categories_id" id="tests_categories_id">
							@if ( ! empty( $tests_categories ) )
								@include('tutorials-categories/recursive-option', array('category' => $tests_categories[0], 'categories' => $tests_categories, 'indent' => '', 'selected' => $video['tests_categories_id']))
							@endif
						</select>
					</div>
					<div class="form-group">
						<label for="content">Turinys</label>
						<textarea class="form-control wysiwyg" id="content" rows="5" name="content">{{ $video['content'] }}</textarea>
					</div>
					<button class="btn btn-primary">Redaguoti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
