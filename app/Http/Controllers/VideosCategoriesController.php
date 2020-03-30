<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\VideoCategory;

class VideosCategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted     = array();
        $categories = VideoCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('videos-categories.index', array(
            'title'      => 'Video kategorijos',
            'current'    => 'videos-categories',
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
        $categories = VideoCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('videos-categories.create', array(
            'title'      => 'Sukurti video kategoriją',
            'current'    => 'videos-categories',
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
        $category            = new VideoCategory;
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('videos-categories');
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
        $single     = VideoCategory::find($id);
        $categories = VideoCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        return view('videos-categories.edit', array(
            'title'      => 'Redaguoti tutorialo kategoriją',
            'current'    => 'videos-categories',
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
        $category            = VideoCategory::find($id);
        $category->name      = $request->input('name');
        $category->parent_id = $request->input('parent_id');
        $category->save();

        return redirect('videos-categories');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $parent = VideoCategory::where('parent_id', $id)->get()->toArray();

        if ( ! empty( $parent ) ) {
            return redirect('videos-categories?error=1');
        } else {
            VideoCategory::find($id)->delete();

            return redirect('videos-categories');
        }
    }
}
