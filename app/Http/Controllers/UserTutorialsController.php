<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use App\Tutorial;
use App\TutorialCategory;

class UserTutorialsController extends Controller
{
    public function index() {
        $categories = TutorialCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }

            $tutorials[$category['id']] = Tutorial::where('tutorials_category_id', $category['id'])->get();
        }

        return view('user-tutorials.index', array(
            'title'      => 'Tutorialai',
            'current'    => 'user-tutorials',
            'categories' => $sorted,
            'tutorials'  => $tutorials,
        ));
    }

    public function show($id) {
        $tutorial = Tutorial::where('id', $id)->first();

        return view('user-tutorials.show', array(
            'title'      => 'Tutorialai',
            'current'    => 'user-tutorials',
            'tutorial'   => $tutorial,
        ));
    }
}
