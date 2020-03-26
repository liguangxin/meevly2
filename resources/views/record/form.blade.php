@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            @isset($userRecord)
                <h2 class="lead">@lang('record.edit_title', ['name' => $userRecord->owner->name])</h2>
            @else
                <h2 class="lead">@lang('record.create_title')</h2>
            @endisset

            <div class="mt-4">
                @isset($userRecord)
                    {!! Form::model($userRecord, ['route' => ['record.update', $userRecord]]) !!}
                @else
                    {!! Form::open(['route' => 'record.store']) !!}
                @endisset
                    @can('manage-records', \App\UserRecord::class)
                        {!! Form::group('user_name', null, ['id' => 'autocomplete', 'label' => 'user.name', 'placeholder' => $userRecord->owner->name ?? '']) !!}
                        {!! Form::hidden('owner_id') !!}

                        {!! Form::group('recorded_at', null, ['type' => 'date', 'pattern' => '\d{4}-\d{2}-\d{2}', 'label' => 'record.recorded_at']) !!}

                        {!! Form::group('stake', null, ['type' => 'number', 'min' => 0, 'max' => 1000000, 'label' => 'record.stake']) !!}
                    @endcan

                    {!! Form::group('bankroll', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 1000000, 'label' => 'record.bankroll']) !!}
                    {!! Form::group('games_count', null, ['type' => 'number', 'min' => 0, 'max' => 4200000000, 'label' => 'record.games_count']) !!}
                    {!! Form::group('winamax_photo', null, ['label' => 'record.winamax_photo']) !!}
                    {!! Form::group('pt4_photo', null, ['label' => 'record.pt4_photo']) !!}

                    {!! Form::button(__(isset($userRecord) ? 'record.edit_button' : 'record.submit_button'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    @can('manage-records', $userRecord ?? \App\UserRecord::class)
        <script>
            var AUTOCOMPLETE_URL = '{{ route('autocomplete.search', '!term!') }}';
        </script>

        <script src="{{ resource('js/autoComplete.js') }}"></script>
    @endcan
@endsection
