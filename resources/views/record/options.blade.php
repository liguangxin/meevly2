@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('record.options_title')</h2>

            <div class="mt-4">
                {!! Form::model($userRecord, ['class' => 'inline-form', 'route' => ['record.action', $userRecord]]) !!}
                    {!! Form::button(__('record.small_profit'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
                    {!! Form::hidden('action', \App\UserRecord::ACTION_SMALL_PROFIT) !!}
                {!! Form::close() !!}

                {!! Form::model($userRecord, ['class' => 'inline-form', 'route' => ['record.action', $userRecord]]) !!}
                    {!! Form::button(__('record.cashout'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
                    {!! Form::hidden('action', \App\UserRecord::ACTION_CASHOUT) !!}
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection
