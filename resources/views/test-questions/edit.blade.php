@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<div class="mb-3">
				<a href="{{ url('tests/' . $single->test_id) }}">Atgal</a>
			</div>
			<h2 class="lead">Redaguoti testo klausimą</h2>

			<div class="mt-4">
				<form action="{{ url('test-questions/' . $single->id) }}" method="POST">
					@csrf
					@method('PUT')
					<div class="form-group">
						<label for="title">Pavadinimas</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="Pavadinimas" value="{{ $single->title }}">
					</div>
					<div class="form-group">
						<label for="question">Klausimas</label>
						<textarea class="form-control wysiwyg" id="question" rows="5" name="question">{{ $single->question }}</textarea>
					</div>
					<div class="form-group question-answers">
						<label>Atsakymai</label>
						@foreach ($answers as $answer)
							<div class="input-group mb-3 question-answer @if ($loop->first) first-answer @endif">
								<div class="input-group-prepend">
									<button class="btn @if ($answer->is_correct) btn-success @else btn-outline-success @endif is-correct" type="button">Teisingas</button>
								</div>
								<input type="text" name="answers[]" class="form-control" value="{{ $answer->answer }}">
								<input type="hidden" name="correct[]" value="{{ $answer->is_correct }}">
								<input type="hidden" name="answer_id[]" value="{{ $answer->id }}">
								<div class="input-group-append">
									<button class="btn btn-danger delete-answer" type="button">Trinti</button>
								</div>
							</div>
						@endforeach
					</div>
					<div class="answers-questions mt-3 mb-4">
						<button class="btn btn-outline-secondary add-answer" type="button">Pridėti atsakymą</button>
					</div>
					<button class="btn btn-primary">Redaguoti</button>
				</form>
			</div>
		</div>
	</div>
</div>
@stop
