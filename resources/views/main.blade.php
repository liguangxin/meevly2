@extends('parts.base')

@section('content')
<div class="col-lg-8 mb-5">
<!-- Demo Content-->
	<div class="p-5 bg-white shadow-sm rounded h-100">
		<div>
			<h2 class="lead">Pagrindinis</h2>
			<p>Sveiki prisijungę, {{ Auth::user()->name }}</p>
		</div>
	</div>
</div>
@stop
