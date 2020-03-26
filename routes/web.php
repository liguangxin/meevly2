<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', function () {
    if (Auth::guest()) {
        return view('index', array('title' => 'Home'));
    }
    else {
        return view('main', array('title' => 'Home'));
    }
});

Route::group(array('middleware' => array('auth')), function() {
    // fix home route.
    Route::get('home', function() {
        return redirect('/');
    });

    // user videos.
    Route::get('user-videos', 'UserVideosController@index');
    Route::get('user-videos/{id}', 'UserVideosController@show');

    // user tutorials.
    Route::get('user-tutorials', 'UserTutorialsController@index');
    Route::get('user-tutorials/{id}', 'UserTutorialsController@show');

    // user tests.
    Route::get('user-tests', 'UserTestsController@index');
    Route::get('start-test/{id}', 'UserTestsController@startTest');
    Route::get('test-in-progress/{id}/{user_tests_answers_id}', 'UserTestsController@testInProgress');
    Route::get('test-answer/{id}/{user_tests_answers_id}/{answer_id}', 'UserTestsController@testAnswer');
    Route::get('test-confirm/{id}', 'UserTestsController@testConfirm');
    Route::get('test-finish/{users_tests_id}', 'UserTestsController@testFinish');
    Route::get('test-review/{users_tests_id}', 'UserTestsController@testReview');

    // results.
    Route::get('results', 'ResultsController@index');

    Route::group(['middleware' => 'role:admin'], function () {
        // videos.
        Route::resource('videos', 'VideosController');
        Route::resource('videos-categories', 'VideosCategoriesController');

        // tutorials.
        Route::resource('tutorials', 'TutorialsController');
        Route::resource('tutorials-categories', 'TutorialsCategoriesController');

        // tests.
        Route::resource('tests', 'TestsController');
        Route::resource('tests-categories', 'TestsCategoriesController');
        Route::resource('test-questions', 'TestQuestionsController');

        Route::group(['prefix' => 'contract'], function () {
            Route::get('/{user}/edit', 'ContractsController@edit')->name('contract.edit');
            Route::post('/{user}/update', 'ContractsController@update')->name('contract.update');
        });

        Route::group(['prefix' => 'stakes'], function () {
            Route::get('/', 'StakesController@index')->name('stakes.index');
            Route::get('/all', 'StakesController@all')->name('stakes.all_users');
            Route::get('/user/{user}', 'StakesController@user')->name('stakes.user');
        });

        Route::group(['prefix' => 'records'], function () {
            Route::get('/', 'RecordsController@index')->name('records.index');
            Route::get('/filter-by/{date}', 'RecordsController@index')->name('records.filter-by');
        });

        Route::group(['prefix' => 'record'], function () {
            Route::post('/{userRecord}/payment', 'RecordsController@payment')->name('record.payment');
        });

        Route::get('/contracts', 'ContractsController@index')->name('contracts.index');

        Route::group(['prefix' => 'stake'], function () {
            Route::post('/store', 'StakesController@store')->name('stake.store');
            Route::delete('/{userStake}/delete', 'StakesController@delete')->name('stake.delete');
        });

        Route::get('/autocomplete/search/{term}', 'AutoCompleteController@search')
            ->where('term', '[A-Za-z0-9\-_]{3,}')
            ->name('autocomplete.search');
    });

    Route::group(['prefix' => 'record'], function () {
        Route::group(['middleware' => 'record.check.time'], function () {
            Route::get('/create', 'RecordsController@create')->name('record.create');
            Route::post('/create', 'RecordsController@store')->name('record.store');
        });

        Route::get('/{userRecord}/action', 'RecordsController@options')->name('record.options');
        Route::post('/{userRecord}/action', 'RecordsController@action')->name('record.action');
        Route::get('/{userRecord}/edit', 'RecordsController@edit')->name('record.edit');
        Route::post('/{userRecord}/update', 'RecordsController@update')->name('record.update');
        Route::delete('/{userRecord}/delete', 'RecordsController@delete')->name('record.delete');
    });

    Route::get('/records/user/{user}', 'RecordsController@user')->name('records.user');
});
