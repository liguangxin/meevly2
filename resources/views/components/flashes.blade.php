@if(session()->has('alert'))
    @foreach(session()->get('alert') as $type => $data)
        @component('components.alert', ['type' => $type, 'closeable' => true])
            @if(is_array($data))
                {!! __($data['message'], $data['replace']) !!}
            @else
                {!! __($data) !!}
            @endif
        @endcomponent
    @endforeach
@endif
