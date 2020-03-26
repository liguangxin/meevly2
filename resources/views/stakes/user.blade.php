@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('stakes.user_history', ['name' => $user->name])</h2>

            @include('stakes.rows')
        </div>
    </div>
@endsection