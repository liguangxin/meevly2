@extends('parts.base')

@section('content')
<div class="jumbotron text-center">
    <div class="container">
        <h1 class="display-4">PokerGang</h1>
        <p class="lead">Poker made easier than ever.</p>
        <hr class="my-4">
        <p>Just take our simply 2-minute registration form and start your journey to easier poker management!</p>
        <p class="lead">
            <a class="btn btn-success btn-lg" href="{{ url('register') }}" role="button">Sign Up</a>
            <a class="btn btn-danger btn-lg" href="{{ url('login') }}" role="button">Sign In</a>
        </p>
    </div>
</div>
@stop
