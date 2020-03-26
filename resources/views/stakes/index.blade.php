@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('stake.add_title')</h2>
            <a class="btn btn-success" href="{{ route('stakes.all_users') }}" role="button">@lang('stakes.all_users')</a>

            <div class="mt-4">
                {!! Form::open(['route' => 'stake.store']) !!}
                    {!! Form::group('user_name', null, ['id' => 'autocomplete', 'label' => 'user.name']) !!}
                    {!! Form::group('stake', null, ['type' => 'number', 'min' => -1000000, 'max' => 1000000, 'label' => 'stake.sum']) !!}

                    {!! Form::hidden('user_id') !!}
                    {!! Form::button(__('stake.submit'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
                {!! Form::close() !!}
            </div>
        </div>

        <div class="px-5 pb-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('stakes.latest_entries')</h2>

            @include('stakes.rows')
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        var AUTOCOMPLETE_URL = '{{ route('autocomplete.search', '!term!') }}';
    </script>

    <script src="{{ resource('js/autoComplete.js') }}"></script>
@endsection
