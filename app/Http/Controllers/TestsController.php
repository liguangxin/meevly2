<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Tests;
use App\TestsCategories;
use App\TestQuestions;

class TestsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted = array();
		$tests  = Tests::select('tests.id', 'tests.name', 'tests_categories.name AS category_name')
			->join('tests_categories', 'tests_categories.id', '=', 'tests.tests_categories_id')
            ->get();

        return view('tests.index', array(
            'title'   => 'Testai',
            'current' => 'tests',
            'tests'   => $tests,
            'error'   => $request->get('error')
        ));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
		$sorted     = array();
        $categories = TestsCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tests.create', array(
            'title'      => 'Sukurti testą',
            'current'    => 'tests/create',
            'categories' => $sorted,
            'selected'   => 0
        ));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $test                      = new Tests;
        $test->name                = $request->input('name');
        $test->questions_no        = $request->input('questions_no');
        $test->tests_categories_id = $request->input('tests_categories_id');
        $test->save();

        return redirect('tests');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $test = Tests::find($id);
        $test_questions = TestQuestions::select('test_questions.id', 'test_questions.title')
            ->where('test_id', $id)
            ->get();

        
        return view('tests.show', array(
            'title'     => 'Testo klausimai',
            'current'   => 'tests',
            'test'      => $test,
            'questions' => $test_questions,
        ));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $sorted     = array();
        $test       = Tests::find($id);
        $categories = TestsCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tests.edit', array(
            'title'      => 'Redaguoti testą',
            'current'    => 'tests',
            'test'       => $test,
            'categories' => $sorted,
        ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
		$test                      = Tests::find($id);
        $test->name                = $request->input('name');
        $test->questions_no        = $request->input('questions_no');
        $test->tests_categories_id = $request->input('tests_categories_id');
        $test->save();

        return redirect('tests');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		Tests::find($id)->delete();

		return redirect('tests');
    }
}
