@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Sukurti testo klausimą</h2>

			<div class="mt-4">
				<form action="{{ url('test-questions') }}" method="POST">
					@csrf
					<div class="form-group">
						<label for="title">Pavadinimas</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="Pavadinimas">
					</div>
					<div class="form-group">
						<label for="question">Klausimas</label>
						<textarea class="form-control wysiwyg" id="question" rows="5" name="question"></textarea>
					</div>
					<div class="form-group question-answers">
						<label>Atsakymai</label>
						<div class="input-group mb-3 question-answer first-answer">
							<div class="input-group-prepend">
								<button class="btn btn-outline-success is-correct" type="button">Teisingas</button>
							</div>
							<input type="text" name="answers[]" class="form-control" placeholder="">
							<input type="hidden" name="correct[]" value="">
							<div class="input-group-append">
								<button class="btn btn-danger delete-answer" type="button">Trinti</button>
							</div>
						</div>
					</div>
					<div class="answers-questions mt-3 mb-4">
						<button class="btn btn-outline-secondary add-answer" type="button">Pridėti atsakymą</button>
					</div>
					<input type="hidden" name="test_id" value="{{ $test_id }}">
					<button class="btn btn-primary">Kurti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
