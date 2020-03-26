@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            @can('manage-records', \App\UserRecord::class)
                @isset($user)
                    <h2 class="lead">@lang('records.user_records', ['name' => $user->name])</h2>
                @else
                    <h2 class="lead">@lang('records.latest_records')</h2>
                @endisset
            @else
                <h2 class="lead">@lang('records.my_records')</h2>
            @endcan

            <a class="btn btn-success" href="{{ route('record.create') }}" role="button">@lang('record.create_title')</a>

            @isset($profits)
                <div class="pt-3 pb-3 profits">
                    <p><strong>@lang('record.teacher_profits'):</strong></p>
                    <p>{{ ucfirst(\App\User::FIRST_TEACHER_NAME) }} - @money($profits['all_first_teacher'])</p>
                    <p>{{ ucfirst(\App\User::SECOND_TEACHER_NAME) }} - @money($profits['all_second_teacher'])</p>

                    @can('manage-records', \App\UserRecord::class)
                        @isset($profits['all_third_teacher'])
                            <p>{{ ucfirst(\App\User::THIRD_TEACHER_NAME) }} - @money($profits['all_third_teacher'])</p>
                        @endisset

                        @isset($profits['all_fourth_teacher'])
                            <p>{{ ucfirst(\App\User::FOURTH_TEACHER_NAME) }} - @money($profits['all_fourth_teacher'])</p>
                        @endisset
                    @endcan
                </div>
            @endisset

            @isset($dates)
                {{ Form::select(
                    'filter_by_date',
                    $dates,
                    $date,
                    ['class' => 'filter-by-date', 'data-url' => route('records.filter-by', '!date!')]
                ) }}
            @endisset

            <div class="mt-4">
                @if(count($entries))
                    <div class="table-responsive">
                        <table class="table">
                            @isset($date)
                                <caption>
                                    {{ $date }}
                                </caption>
                            @endisset

                            <thead>
                                <tr>
                                    @can('manage-records', \App\UserRecord::class)
                                        <th scope="col">@lang('user.name')</th>
                                    @endcan

                                    @isset($dates)
                                        <th scope="col">@lang('record.created_at')</th>
                                    @else
                                        <th scope="col">@lang('record.recorded_at')</th>
                                    @endisset

                                    <th scope="col">@lang('user.stake')</th>
                                    <th scope="col">@lang('record.bankroll')</th>
                                    <th scope="col">@lang('record.winamax_photo')</th>
                                    <th scope="col">@lang('record.games_count')</th>
                                    <th scope="col">@lang('record.pt4_photo')</th>
                                    <th scope="col">@lang('record.cashout')</th>
                                    <th scope="col">@lang('record.ft_cashout')</th>
                                    <th scope="col">@lang('record.st_cashout')</th>
                                    @can('manage-records', \App\UserRecord::class)
                                        <th scope="col">@lang('record.tt_cashout')</th>
                                        <th scope="col">@lang('record.fth_cashout')</th>
                                    @endcan
                                    <th scope="col">@lang('record.af_cashout')</th>

                                    @can('manage-records', \App\UserRecord::class)
                                        <th scope="col">@lang('record.payments')</th>
                                    @endcan

                                    <th scope="col">@lang('record.actions')</th>
                                </tr>
                            </thead>

                            <tbody>
                                @foreach ($entries as $entry)
                                    <tr>
                                        @can('manage-records', \App\UserRecord::class)
                                            <td>
                                                <a href="{{ route('records.user', $entry->owner) }}">
                                                    {{ $entry->owner->name }}
                                                </a>
                                            </td>
                                        @endcan

                                        @isset($user)
                                            <td>{{ $entry->recorded_at->format('Y-m-d') }}</td>
                                        @else
                                            <td>{{ $entry->created_at->format('Y-m-d') }}</td>
                                        @endisset

                                        <td>
                                            @money($entry->stake)
                                        </td>

                                        <td>
                                            @money($entry->bankroll)
                                        </td>

                                        <td>
                                            <a href="{{ $entry->winamax_photo }}" target="_blank">
                                                {{ $entry->winamax_photo }}
                                            </a>
                                        </td>

                                        <td>
                                            {{ $entry->games_count }}
                                        </td>

                                        <td>
                                            <a href="{{ $entry->pt4_photo }}" target="_blank">
                                                {{ $entry->pt4_photo }}
                                            </a>
                                        </td>

                                        <td>
                                            @money($entry->cashout)
                                        </td>

                                        <td>
                                            @money($entry->ft_cashout)
                                        </td>

                                        <td>
                                            @money($entry->st_cashout)
                                        </td>
                                        @can('manage-records', \App\UserRecord::class)
                                            <td>
                                                @money($entry->tt_cashout)
                                            </td>

                                            <td>
                                                @money($entry->fth_cashout)
                                            </td>
                                        @endcan

                                        <td>
                                            @money($entry->af_cashout)
                                        </td>

                                        @can('manage-records', \App\UserRecord::class)
                                            <td>
                                                {!! Form::open(['class' => 'inline-form', 'route' => ['record.payment', $entry]]) !!}
                                                    {!! Form::checkbox('is_paid', true, $entry->is_ft_paid, [
                                                        'class' => 'payment-received',
                                                        'data-toggle' => 'tooltip',
                                                        'data-trigger' => 'hover',
                                                        'data-placement' => 'bottom',
                                                        'title' => __('record.ft_tooltip')
                                                    ]) !!}
                                                    {!! Form::hidden('teacher', \App\User::FIRST_TEACHER_NAME) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(['class' => 'inline-form', 'route' => ['record.payment', $entry]]) !!}
                                                    {!! Form::checkbox('is_paid', true, $entry->is_st_paid, [
                                                        'class' => 'payment-received',
                                                        'data-toggle' => 'tooltip',
                                                        'data-trigger' => 'hover',
                                                        'data-placement' => 'bottom',
                                                        'title' => __('record.st_tooltip')
                                                    ]) !!}
                                                    {!! Form::hidden('teacher', \App\User::SECOND_TEACHER_NAME) !!}
                                                {!! Form::close() !!}
                                            </td>
                                        @endcan

                                        <td>
                                            @if($entry->action === \App\UserRecord::ACTION_WITHOUT_ANSWER || Auth::user()->can('manage-records', $entry))
                                                <div class="btn-group" role="group" aria-label="@lang('record.actions')">
                                                    @if($entry->action === \App\UserRecord::ACTION_WITHOUT_ANSWER)
                                                        <a class="btn btn-secondary" href="{{ route('record.options', $entry) }}" role="button">
                                                            @lang('record.select_option')
                                                        </a>
                                                    @endif

                                                    @can('manage-records', $entry)
                                                        <a class="btn btn-primary" href="{{ route('record.edit', $entry) }}" role="button">
                                                            @lang('record.edit_option')
                                                        </a>

                                                        <a class="btn btn-danger" href="#" onclick="document.getElementById('delete-entry-{{ $entry->id }}').submit(); return false;" role="button">
                                                            @lang('record.delete_option')
                                                        </a>

                                                        {!! Form::open(['id' => 'delete-entry-'.$entry->id, 'method' => 'delete', 'route' => ['record.delete', $entry]]) !!}
                                                        {!! Form::close() !!}
                                                    @endcan
                                                </div>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info">
                        @lang('records.no_entries')
                    </div>
                @endisset
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    @can('manage-records', \App\UserRecord::class)
        <script src="{{ resource('js/processPayments.js') }}"></script>

        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    @endcan

    <script src="{{ resource('js/filterRecords.js') }}"></script>
@endsection
