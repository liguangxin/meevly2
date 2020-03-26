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
				@if ( ! empty( $tutorials[ $id ] ) )
					<div class="tests-container">

						@foreach ( $tutorials[ $id ] as $tutorial )
							<div>
								<i class="fa fa-sticky-note"></i>
								<a href="{{ url('user-tutorials/' . $tutorial->id) }}">
									{{ $tutorial->name }}
								</a>
							</div>
						@endforeach

					</div>

				@endif

				@if (!empty($categories[$id]))
					@php
					$nextindent = $indent + 20;
					@endphp

					@include('user-tutorials/recursive-item', array('category' => $categories[$id], 'categories' => $categories, 'tutorials' => $tutorials, 'indent' => $nextindent ))

				@endif
				</div>
			</div>
		</div>
	</div>
@endforeach
