<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Auth;
use App\Tests;
use App\Video;
use App\TestsCategory;
use App\TestQuestions;
use App\UserTests;
use App\UserTestsAnswers;
use App\QuestionAnswers;

class UserTestsController extends Controller
{
    public function index() {
        $categories = TestsCategory::all()->toArray();

        foreach ($categories as $category) {
            if ( 0 == $category['parent_id'] ) {
                $sorted[0][$category['id']] = $category;
            } else {
                $sorted[$category['parent_id']][$category['id']] = $category;
            }

            $tests[$category['id']] = Tests::where('tests_categories_id', $category['id'])->get();
            $videos[$category['id']] = Video::where('tests_categories_id', $category['id'])->get();
        }

        return view('user-tests.index', array(
            'title'      => 'Visi testai',
            'current'    => 'tests',
            'categories' => $sorted,
            'tests'      => $tests,
            'videos'     => $videos,
        ));
    }

    public function startTest($id) {
        $userID = Auth::user()->id;

        // check if user hasn't already started the test.
        $userTest = UserTests::where('user_id', $userID)->where('test_id', $id)->where('is_completed', 0)->first();

        if ( empty( $userTest->id ) ) {
            // get test data.
            $test = Tests::find($id);

            // set that the user is solving this test.
            $userTest = new UserTests;
            $userTest->user_id = $userID;
            $userTest->test_id = $id;
            $userTest->save();

            // pick up random questions and write into the database.
            $questions = TestQuestions::where('test_id', $test->id)->inRandomOrder()->limit($test->questions_no)->get();

            if ( ! empty( $questions ) ) {
                foreach ( $questions as $question ) {
                    $answer = new UserTestsAnswers;
                    $answer->user_test_id = $userTest->id;
                    $answer->test_question_id = $question->id;
                    $answer->save();
                }
            }
        }

        $firstQuestion = UserTestsAnswers::where('user_test_id', $userTest->id)->first();

        return redirect('test-in-progress/' . $userTest->id . '/' . $firstQuestion->id);
    }

    public function testInProgress($id, $userAnswerID) {
        $userAnswer = UserTestsAnswers::find($userAnswerID);

        $test = DB::table('user_tests')->select('tests.name', 'tests.questions_no')
            ->join('tests', 'tests.id', '=', 'user_tests.test_id')
            ->where('user_tests.id', $id)
            ->first();

        $userTest = UserTests::find($id);
        $question = TestQuestions::find($userAnswer->test_question_id);
        $answers = QuestionAnswers::where('test_question_id', $question->id)->get();

        $allUserAnswers = DB::table('user_tests_answers')->select(
                'user_tests_answers.id',
                'user_tests_answers.question_answer_id',
                'question_answers.is_correct'
            )
            ->leftJoin('question_answers', 'user_tests_answers.question_answer_id', '=', 'question_answers.id')
            ->where('user_test_id', $id)->get();

        return view('user-tests.show', array(
            'test'           => $test,
            'question'       => $question,
            'answers'        => $answers,
            'pages'          => $allUserAnswers,
            'user_answer'    => $userAnswer,
            'id'             => $id,
            'user_test'      => $userTest,
        ));
    }

    public function testAnswer($id, $userAnswerID, $answerID) {
        $userAnswer = UserTestsAnswers::find($userAnswerID);
        $userAnswer->question_answer_id = $answerID;
        $userAnswer->save();

        $nextQuestion = UserTestsAnswers::where('user_test_id', $id)->where('id', '>', $userAnswer->id)->first();

        if ( empty( $nextQuestion ) ) {
            return redirect('test-confirm/' . $id);
        } else {
            return redirect('test-in-progress/' . $id . '/' . $nextQuestion->id);
        }
    }

    public function testConfirm($id) {
        $test = DB::table('user_tests')->select('tests.id', 'tests.name', 'tests.questions_no')
            ->join('tests', 'tests.id', '=', 'user_tests.test_id')
            ->where('user_tests.id', $id)
            ->first();

        return view('user-tests.confirm', array(
            'id'   => $id,
            'test' => $test
        ));
    }

    public function testFinish($id) {
        $test = DB::table('user_tests')->select('tests.id', 'tests.name', 'tests.questions_no')
            ->join('tests', 'tests.id', '=', 'user_tests.test_id')
            ->where('user_tests.id', $id)
            ->first();

        // complete user test.
        $userTest = UserTests::find($id);
        $userTest->is_completed = 1;
        $userTest->save();

        // show results.
        $result = DB::table('user_tests_answers')->select(
            DB::raw('COUNT(user_tests_answers.id) AS total'),
            DB::raw('SUM(CASE WHEN question_answers.is_correct = 1 THEN 1 ELSE 0 END) AS correct')
            )
            ->leftJoin('question_answers', 'question_answers.id', '=', 'user_tests_answers.question_answer_id')
            ->where('user_tests_answers.user_test_id', $id)
            ->first();

        $percent = $result->correct / $result->total * 100;

        return view('user-tests.result', array(
            'id'      => $id,
            'test'    => $test,
            'correct' => $result->correct,
            'total'   => $result->total,
            'percent' => $percent
        ));
    }

    public function testReview($id) {
        $firstQuestion = UserTestsAnswers::where('user_test_id', $id)->first();

        return redirect('test-in-progress/' . $id . '/' . $firstQuestion->id);
    }
}
