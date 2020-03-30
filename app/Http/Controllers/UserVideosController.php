<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use App\Video;
use App\VideoCategory;

class UserVideosController extends Controller
{
    public function index() {
        $categories = VideoCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }

            $videos[$category['id']] = Video::where('videos_categories_id', $category['id'])->get();
        }

        return view('user-videos.index', array(
            'title'      => 'Vaizdo įrašai',
            'current'    => 'user-videos',
            'categories' => $sorted,
            'videos'     => $videos,
        ));
    }

    public function show($id) {
        $video = Video::where('id', $id)->first();

        return view('user-videos.show', array(
            'title'      => 'Vaizdo įrašas',
            'current'    => 'user-videos',
            'video'      => $video,
        ));
    }
}
