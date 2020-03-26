@extends('parts.base')

@section('content')
    <div class="col-lg-8 mb-5">
        <div class="p-5 bg-white shadow-sm rounded h-100">
            <h2 class="lead">@lang('contracts.index_page')</h2>

            @if(count($users))
                <div class="mt-4">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">@lang('user.name')</th>
                                <th scope="col">@lang('stake.sum')</th>
                                <th scope="col">@lang('contract.actions')</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach ($users as $user)
                                <tr>
                                    <td>
                                        <a href="{{ route('stakes.user', $user) }}">
                                            {{ $user->name }}
                                        </a>
                                    </td>

                                    <td>
                                        {{ $user->stake }}
                                    </td>

                                    <td>
                                        <a class="btn btn-primary" href="{{ route('contract.edit', $user) }}" role="button">
                                            @lang('contract.change_button')
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    {{ $users->links() }}
                </div>
            @else
                <div class="alert alert-info">
                    @lang('users.no_users')
                </div>
            @endif
        </div>
    </div>
@endsection
