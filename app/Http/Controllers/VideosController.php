<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Videos;
use App\VideosCategories;
use App\TestsCategories;

class VideosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sorted    = array();
		$videos = Videos::select('videos.id', 'videos.name', 'videos.content', 'videos_categories.name AS category_name')
			->join('videos_categories', 'videos_categories.id', '=', 'videos.videos_categories_id')
			->get();

        return view('videos.index', array(
            'title'   => 'Video',
            'current' => 'videos',
            'videos'  => $videos,
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
        $categories = VideosCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        $tests_sorted     = array();
        $tests_categories = TestsCategories::all()->toArray();

        foreach ($tests_categories as $test_category) {
            if ( 0 == $test_category['parent_id'] ) {
                $tests_sorted[0][$test_category['id']] = $test_category; 
            } else {
                $tests_sorted[$test_category['parent_id']][$test_category['id']] = $test_category;
            }
        }

        return view('videos.create', array(
            'title'            => 'Sukurti video',
            'current'          => 'videos/create',
            'categories'       => $sorted,
            'tests_categories' => $tests_sorted,
            'selected'         => 0
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
        $tutorial                       = new Videos;
        $tutorial->name                 = $request->input('name');
        $tutorial->videos_categories_id = $request->input('videos_categories_id');
        $tutorial->tests_categories_id  = $request->input('tests_categories_id');
        $tutorial->content              = $request->input('content');
        $tutorial->save();

        return redirect('videos');
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
        $video      = Videos::find($id);
        $categories = VideosCategories::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category; 
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }
        }

        $tests_sorted     = array();
        $tests_categories = TestsCategories::all()->toArray();

        foreach ($tests_categories as $test_category) {
            if ( 0 == $test_category['parent_id'] ) {
                $tests_sorted[0][$test_category['id']] = $test_category; 
            } else {
                $tests_sorted[$test_category['parent_id']][$test_category['id']] = $test_category;
            }
        }

        return view('videos.edit', array(
            'title'            => 'Redaguoti video',
            'current'          => 'videos',
            'video'            => $video,
            'categories'       => $sorted,
            'tests_categories' => $tests_sorted,
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
		$tutorial                       = Videos::find($id);
        $tutorial->name                 = $request->input('name');
        $tutorial->videos_categories_id = $request->input('videos_categories_id');
        $tutorial->tests_categories_id  = $request->input('tests_categories_id');
        $tutorial->content              = $request->input('content');
        $tutorial->save();

        return redirect('videos');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		Videos::find($id)->delete();

		return redirect('videos');
    }
}
