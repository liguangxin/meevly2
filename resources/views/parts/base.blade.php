<html>
    <head>
        @include('parts.header', array('title' => $title ?? ''))
    </head>
    <body>
        @guest

        @else
        <div class="container-fluid px-md-5 mt-3" style="max-width: 1520px;">
            @include('components.flashes')

            <div class="rounded">
                <div class="row">
        @endguest

        @include('parts.menu')

        @yield('content')
        
        @guest

        @else
                </div>
            </div>
        </div>
        @endguest

        @include('parts.footer')
    </body>
</html>
