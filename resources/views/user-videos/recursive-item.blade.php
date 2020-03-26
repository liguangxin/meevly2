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
				@if ( ! empty( $videos[ $id ] ) )
					<div class="tests-container">

						@foreach ( $videos[ $id ] as $video )
							<div>
								<i class="fa fa-video-camera"></i>
								<a href="{{ url('user-videos/' . $video->id) }}">
									{{ $video->name }}
								</a>
							</div>
						@endforeach

					</div>

				@endif

				@if (!empty($categories[$id]))
					@php
					$nextindent = $indent + 20;
					@endphp

					@include('user-videos/recursive-item', array('category' => $categories[$id], 'categories' => $categories, 'videos' => $videos, 'indent' => $nextindent ))

				@endif
				</div>
			</div>
		</div>
	</div>
@endforeach
