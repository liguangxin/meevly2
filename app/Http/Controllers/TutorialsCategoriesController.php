<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\TutorialCategory;

class TutorialsCategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted     = array();
        $categories = TutorialCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tutorials-categories.index', array(
            'title'      => 'Tutorialų kategorijos',
            'current'    => 'tutorials-categories',
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
        $categories = TutorialCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tutorials-categories.create', array(
            'title'      => 'Sukurti tutorialo kategoriją',
            'current'    => 'tutorials-categories',
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
        $category            = new TutorialCategory;
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('tutorials-categories');
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
        $single     = TutorialCategory::find($id);
        $categories = TutorialCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tutorials-categories.edit', array(
            'title'      => 'Redaguoti tutorialo kategoriją',
            'current'    => 'tutorials-categories',
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
        $category            = TutorialCategory::find($id);
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('tutorials-categories');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $parent = TutorialCategory::where('parent_id', $id)->get()->toArray();

        if ( ! empty( $parent ) ) {
            return redirect('tutorials-categories?error=1');
        } else {
            TutorialCategory::find($id)->delete();

            return redirect('tutorials-categories');
        }
    }
}
