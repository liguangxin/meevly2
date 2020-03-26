@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Testas <b>{{ $test->name }}</b></h2>
			<div class="mt-5 text-center">
				<h3>{{ $question->title }}</h3>
				<div class="question">
					{!! $question->question !!}
				</div>
				<div class="mt-4 text-left">
					@foreach ( $answers as $answer )

						<a href="{{ url('test-answer/' . $id . '/' . $user_answer->id . '/'. $answer->id) }}" class="d-block mt-2 text-left btn {{ $answer->id == $user_answer->question_answer_id ? 'btn-success' : 'btn-outline-success' }}">{{ $answer->answer }}</a>

					@endforeach
				</div>
				@if ( $user_test->is_completed == '0' )
					<div class="mt-5">
						@foreach ( $pages as $page )

							<a href="{{ url('test-in-progress/' . $id . '/' . $page->id) }}" class="btn {{ !empty($page->question_answer_id || $page->id == $user_answer->id) ? 'btn-primary' : 'btn-outline-primary' }} {{ $page->id == $user_answer->id ? 'active' : '' }}">
								{{ $loop->iteration }}
							</a>

						@endforeach
					</div>
					<div class="mt-2">
						<a href="{{ url('test-confirm/' . $id) }}" class="btn btn-outline-primary">Baigti testą</a>
					</div>
				@else
					<div class="mt-5">
						@foreach ( $pages as $page )

							<a href="{{ url('test-in-progress/' . $id . '/' . $page->id) }}" class="btn {{ !empty($page->is_correct) ? 'btn-success' : 'btn-danger' }}">
								{{ $loop->iteration }}
							</a>

						@endforeach
					</div>
				@endif
			</div>

		</div>
	</div>
</div>
@stop
