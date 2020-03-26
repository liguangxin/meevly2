<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use App\UserTests;

class ResultsController extends Controller
{
    public function index()
    {
        $userID = Auth::user()->id;
        $results = DB::table('user_tests')->select('user_tests.id', 'tests.id AS test_id', 'tests.name')
            ->join('tests', 'tests.id', '=', 'user_tests.test_id')
            ->where('user_tests.user_id', $userID)
            ->get();

        $resultsArr = array();

        if (!empty($results)) {
            foreach ($results as $result) {
                $resultsArr[$result->test_id]['name'] = $result->name;
                $resultsArr[$result->test_id]['attempts'][] = $result->id;
            }
        }

        return view('results.index', array(
            'title'      => 'Rezultatai',
            'current'    => 'results',
            'results'    => $resultsArr,
        ));
    }

   
}
