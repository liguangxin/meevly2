@if(count($entries))
    <div class="mt-4">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">@lang('stake.created_at')</th>
                    <th scope="col">@lang('user.name')</th>
                    <th scope="col">@lang('stake.sum')</th>
                    <th scope="col">@lang('stake.actions')</th>
                </tr>
            </thead>

            <tbody>
                @foreach ($entries as $entry)
                    <tr>
                        <td>{{ $entry->created_at->format('Y-m-d') }}</td>
                        
                        <td>
                            <a href="{{ route('stakes.user', $entry->user) }}">
                                {{ $entry->user->name }}
                            </a>
                        </td>

                        <td class="{!! $entry->stake < 0 ? 'text-danger' : 'text-success' !!}">
                            {{ $entry->stake }}
                        </td>

                        <td>
                            <a class="btn btn-danger" href="#" onclick="document.getElementById('delete-entry-{{ $entry->id }}').submit(); return false;" role="button">
                                @lang('stake.undo_option')
                            </a>

                            {!! Form::open(['id' => 'delete-entry-'.$entry->id, 'method' => 'delete', 'route' => ['stake.delete', $entry]]) !!}
                            {!! Form::close() !!}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        @if(method_exists($entries, 'links'))
            {{ $entries->links() }}
        @endif
    </div>
@else
    @isset($user)
        <div class="alert alert-info">
            @lang('stakes.no_user_entries', ['name' => $user->name])
        </div>
    @else
        <div class="alert alert-info">
            @lang('stakes.no_entries')
        </div>
    @endisset
@endif
