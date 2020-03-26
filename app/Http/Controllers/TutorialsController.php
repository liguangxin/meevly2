<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Tutorials;
use App\TutorialsCategories;

class TutorialsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted    = array();
		$tutorials = Tutorials::select('tutorials.id', 'tutorials.name', 'tutorials.content', 'tutorials_categories.name AS category_name')
			->join('tutorials_categories', 'tutorials_categories.id', '=', 'tutorials.tutorials_category_id')
			->get();

        return view('tutorials.index', array(
            'title'     => 'Tutorialai',
            'current'   => 'tutorials',
            'tutorials' => $tutorials,
            'error'     => $request->get('error')
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
        $categories = TutorialsCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tutorials.create', array(
            'title'      => 'Sukurti tutorialą',
            'current'    => 'tutorials/create',
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
        $tutorial                        = new Tutorials;
        $tutorial->name                  = $request->input('name');
        $tutorial->tutorials_category_id = $request->input('tutorials_category_id');
        $tutorial->content               = $request->input('content');
        $tutorial->save();

        return redirect('tutorials');
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
        $tutorial   = Tutorials::find($id);
        $categories = TutorialsCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('tutorials.edit', array(
            'title'      => 'Redaguoti tutorialą',
            'current'    => 'tutorials',
            'tutorial'   => $tutorial,
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
		$tutorial                        = Tutorials::find($id);
        $tutorial->name                  = $request->input('name');
        $tutorial->tutorials_category_id = $request->input('tutorials_category_id');
        $tutorial->content               = $request->input('content');
        $tutorial->save();

        return redirect('tutorials');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		Tutorials::find($id)->delete();

		return redirect('tutorials');
    }
}
