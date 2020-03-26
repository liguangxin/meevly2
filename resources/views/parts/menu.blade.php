@guest
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">PokerGang</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigationCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navigationCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{{ url('/') }}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ isset($current) && $current == 'login' ? 'font-weight-bold' : '' }}"
                            href="{{ url('login') }}">Sign In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{ !isset($current) ? 'font-weight-bold' : '' }}"
                            href="{{ url('register') }}">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
@else
    <div class="col-lg-4 mb-4 mb-lg-0">
        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
            <p class="dropdown-item">
                @lang('user.games_left', ['games' => Auth::user()->games_left])
            </p>

            @if ( Auth::user()->role === 'admin' )
                <!-- Admin Menu-->
                <h4 class="text-uppercase px-4 mt-3">Testai</h4>
                <a href="{{ url('tests') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tests' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    <!--<i class="fa fa-bar-chart mr-2"></i>-->
                    Visi testai
                </a>
                <a href="{{ url('tests/create') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tests/create' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Naujas testas
                </a>
                <a href="{{ url('results') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tests-results' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Rezultatai
                </a>
                <a href="{{ url('tests-categories') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tests-categories' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Kategorijos
                </a>

                <h4 class="text-uppercase px-4 mt-3">Videoteka</h4>
                <a href="{{ url('videos-categories') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'videos-categories' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Kategorijos
                </a>
                <a href="{{ url('videos') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'videos' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Video įrašai
                </a>
                <a href="{{ url('videos/create') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'videos/create' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Pridėti naują
                </a>

                <h4 class="text-uppercase px-4 mt-3">Tutorialai</h4>
                <a href="{{ url('tutorials-categories') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tutorials-categories' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Kategorijos
                </a>
                <a href="{{ url('tutorials') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tutorials' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Tutorialai
                </a>
                <a href="{{ url('tutorials/create') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tutorials/create' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Pridėti naują
                </a>

                @can('manage-contracts', \App\User::class)
                    <h4 class="text-uppercase px-4 mt-3">@lang('contracts.menu_block')</h4>

                    <a href="{{ route('contracts.index') }}" class="@classNames('dropdown-item nav-link px-4 rounded', Route::currentRouteName() === 'contracts.index' ? 'active bg-primary text-white shadow-sm' : '')">
                        @lang('contracts.index_page')
                    </a>
                @endcan

                @can('manage-stakes', \App\UserStake::class)
                    <h4 class="text-uppercase px-4 mt-3">@lang('stakes.menu_block')</h4>

                    <a href="{{ route('stakes.index') }}" class="@classNames('dropdown-item nav-link px-4 rounded', Route::currentRouteName() === 'stakes.index' ? 'active bg-primary text-white shadow-sm' : '')">
                        @lang('stakes.create_page')
                    </a>
                @endcan
            @else
                <!-- User Menu -->
                <h4 class="text-uppercase px-4 mt-3">Testai</h4>
                <a href="{{ url('user-tests') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'tests' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    <!--<i class="fa fa-bar-chart mr-2"></i>-->
                    Visi testai
                </a>
                <a href="{{ url('results') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'results' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Rezultatai
                </a>
                <h4 class="text-uppercase px-4 mt-3">Videoteka</h4>
                <a href="{{ url('user-videos') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'user-videos' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Vaizdo įrašai
                </a>
                <h4 class="text-uppercase px-4 mt-3">Tutorialai</h4>
                <a href="{{ url('user-tutorials') }}" class="dropdown-item nav-link px-4 rounded {{ isset($current) && $current == 'user-tutorials' ? 'active bg-primary text-white shadow-sm' : '' }}">
                    Tutorialai
                </a>
            
            @endif

            <h4 class="text-uppercase px-4 mt-3">@lang('records.menu_block')</h4>

            @can('manage-records', \App\UserRecord::class)
                <a href="{{ route('records.index') }}" class="@classNames('dropdown-item nav-link px-4 rounded', Route::currentRouteName() === 'records.index' ? 'active bg-primary text-white shadow-sm' : '')">
                    @lang('records.index_page')
                </a>
            @endcan

            <a href="{{ route('records.user', Auth::user()) }}" class="@classNames('dropdown-item nav-link px-4 rounded', Route::currentRouteName() === 'records.user' ? 'active bg-primary text-white shadow-sm' : '')">
                @lang('records.user_page')
            </a>

            <a href="{{ route('record.create') }}" class="@classNames('dropdown-item nav-link px-4 rounded', Route::currentRouteName() === 'record.create' ? 'active bg-primary text-white shadow-sm' : '')">
                @lang('records.create_page')
            </a>

            <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                {{ __('Atsijungti') }}
            </a>

            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
            </form>
        </nav>
        <!-- End -->
    </div>
    
@endguest
