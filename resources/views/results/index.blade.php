@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Rezultatai</h2>
			<div class="mt-4">
				@foreach ($results as $id => $attrs)

					<div class="card">
						<div class="card-header" id="heading-{{ $id }}">
							<h5 class="mb-0">
								{{ $attrs['name'] }}
							</h5>
						</div>

						<div class="card-body">
							@if ( ! empty( $attrs['attempts'] ) )
								<div class="results-container">

									@foreach ( $attrs['attempts'] as $attempt )

										<div>
											<a href="{{ url('test-review/' . $attempt) }}">
												Bandymas #{{ $loop->iteration }}
											</a>
										</div>

									@endforeach

								</div>

							@endif
						</div>
					</div>

				@endforeach
			</div>
		</div>
	</div>
</div>
@stop
