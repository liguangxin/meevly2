@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Sukurti tutorialą</h2>

			<div class="mt-4">
				<form action="{{ url('tutorials') }}" method="POST">
					@csrf
					<div class="form-group">
						<label for="name">Pavadinimas</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Pavadinimas">
					</div>
					<div class="form-group">
						<label for="tutorials_category_id">Kategorija</label>
						<select class="form-control" name="tutorials_category_id" id="tutorials_category_id">
							@if ( ! empty( $categories ) )
								@include('tutorials-categories/recursive-option', array('category' => $categories[0], 'categories' => $categories, 'indent' => ''))
							@endif
						</select>
					</div>
					<div class="form-group">
						<label for="content">Turinys</label>
						<textarea class="form-control wysiwyg" id="content" rows="5" name="content"></textarea>
					</div>
					<button class="btn btn-primary">Kurti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
