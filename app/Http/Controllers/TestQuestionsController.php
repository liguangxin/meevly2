<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\TestQuestions;
use App\QuestionAnswers;

class TestQuestionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        return view('test-questions.create', array(
            'title'      => 'Sukurti testo klausimą',
            'current'    => 'tests',
            'test_id'    => $request->get('test_id')
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
		$answers = $request->get('answers');
		$correct = $request->get('correct');

        $question           = new TestQuestions;
        $question->test_id  = $request->input('test_id');
        $question->title    = $request->input('title');
		$question->question = $request->input('question');
		$question->save();

		$question_id = $question->id;

		if ( ! empty( $answers ) ) {
			foreach ( $answers as $key => $value ) {
				$answer = new QuestionAnswers;
				$answer->test_question_id = $question_id;
				$answer->is_correct       = $correct[$key];
				$answer->answer           = $value;
				$answer->save();
			}
		}
		
		return redirect('tests/' . $request->input('test_id'));
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
        $sorted  = array();
        $single  = TestQuestions::find($id);
		$answers = QuestionAnswers::where('test_question_id', $id)
			->get();

        return view('test-questions.edit', array(
            'title'   => 'Redaguoti testo klausimą',
            'current' => 'tests',
            'single'  => $single,
            'answers' => $answers,
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
		$answers = $request->get('answers');
		$ids     = $request->get('answer_id');
		$correct = $request->get('correct');

        $question           = TestQuestions::find($id);
        $question->title    = $request->input('title');
		$question->question = $request->input('question');
		$question->save();
		$question_id = $question->id;

		QuestionAnswers::whereNotIn('id', array_filter($ids))
			->where('test_question_id', $id)
			->delete();

		if ( ! empty( $answers ) ) {
			foreach ( $answers as $key => $value ) {
				if ( ! empty( $ids[$key] ) ) {
					$answer = QuestionAnswers::where('id', $ids[$key])->first();
				} else {
					$answer = new QuestionAnswers;

					$answer->test_question_id = $id;
				}

				$answer->is_correct = $correct[$key];
				$answer->answer     = $value;
				$answer->save();
			}
		}
		
		return redirect('tests/' . $question->test_id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $parent = TestQuestions::where('parent_id', $id)->get()->toArray();

        if ( ! empty( $parent ) ) {
            return redirect('tutorials-categories?error=1');
        } else {
            TestQuestions::find($id)->delete();

            return redirect('tutorials-categories');
        }
    }
}
