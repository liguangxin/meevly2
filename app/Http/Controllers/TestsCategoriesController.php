<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\TestsCategory;

class TestsCategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted     = array();
        $categories = TestsCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tests-categories.index', array(
            'title'      => 'Testų kategorijos',
            'current'    => 'tests-categories',
            'categories' => $sorted,
            'error'      => $request->get('error')
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
        $categories = TestsCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tests-categories.create', array(
            'title'      => 'Sukurti testo kategoriją',
            'current'    => 'tests-categories',
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
        $category            = new TestsCategory;
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('tests-categories');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        $single     = TestsCategory::find($id);
        $categories = TestsCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tests-categories.edit', array(
            'title'      => 'Redaguoti testo kategoriją',
            'current'    => 'tests-categories',
            'single'     => $single,
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
        $category            = TestsCategory::find($id);
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('tests-categories');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $parent = TestsCategory::where('parent_id', $id)->get()->toArray();

        if ( ! empty( $parent ) ) {
            return redirect('tests-categories?error=1');
        } else {
            TestsCategory::find($id)->delete();

            return redirect('tests-categories');
        }
    }
}
