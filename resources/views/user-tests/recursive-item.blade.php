@foreach ($category as $id => $attrs)
	<div id="accordion-{{ $id }}" class="mb-3">
		<div class="card">
			<div class="card-header" id="heading-{{ $id }}">
				<h5 class="mb-0">
					<button class="btn btn-link" data-toggle="collapse" data-target="#collapse-{{ $id }}" aria-expanded="{{ $attrs['parent_id'] == 0 ? 'true' : 'false' }}" aria-controls="collapse-{{ $id }}">
					{{ $attrs['name'] }}
					</button>
				</h5>
			</div>

			<div id="collapse-{{ $id }}" class="collapse {{ $attrs['parent_id'] == 0 ? 'show' : '' }}" aria-labelledby="heading-{{ $id }}" data-parent="#accordion-{{ $id }}">
				<div class="card-body">
				@if ( ! empty( $tests[ $id ] ) )
					<div class="tests-container">

						@foreach ( $tests[ $id ] as $test )

							<div>
								<i class="fa fa-graduation-cap"></i>
								<a href="{{ url('start-test/' . $test->id) }}">
									{{ $test->name }}
									<span class="badge badge-success float-right">{{ $test->questions_no }} klausimų (-ai)</span>
								</a>
							</div>

						@endforeach

						@if ( ! empty( $videos[ $id ] ) )
							@foreach ( $videos[ $id ] as $video )
								<div>
									<i class="fa fa-video-camera"></i>
									<a href="{{ url('user-videos/' . $video->id) }}">
										{{ $video->name }}
									</a>
								</div>
							@endforeach
						@endif

					</div>

				@endif

				@if (!empty($categories[$id]))
					@php
					$nextindent = $indent + 20;
					@endphp

					@include('user-tests/recursive-item', array('category' => $categories[$id], 'categories' => $categories, 'tests' => $tests, 'videos' => $videos, 'indent' => $nextindent ))

				@endif
				</div>
			</div>
		</div>
	</div>
@endforeach
