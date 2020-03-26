@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('contract.change_title', ['name' => $user->name])</h2>

            <div class="mt-4">
                {!! Form::model($user, ['route' => ['contract.update', $user]]) !!}
                    {!! Form::group('profit_share', null, ['type' => 'number', 'label' => 'user.profit_share']) !!}
                    {!! Form::group('ft_profit_share', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 100, 'label' => 'user.ft_profit_share']) !!}
                    {!! Form::group('st_profit_share', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 100, 'label' => 'user.st_profit_share']) !!}
                    {!! Form::group('tt_profit_share', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 100, 'label' => 'user.tt_profit_share']) !!}
                    {!! Form::group('fth_profit_share', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 100, 'label' => 'user.fth_profit_share']) !!}
                    {!! Form::group('affiliate_share', null, ['type' => 'number', 'min' => 0, 'step' => 0.01, 'max' => 100, 'label' => 'user.affiliate_share']) !!}
                    {!! Form::group('transfer_fee', null, ['type' => 'number', 'min' => 0.0001, 'step' => 0.0001, 'label' => 'user.transfer_fee']) !!}

                    {!! Form::button(__('contract.update_button'), ['type' => 'submit', 'class' => 'btn btn-primary']) !!}
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection
