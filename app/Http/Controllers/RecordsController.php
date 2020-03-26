<?php

namespace App\Http\Controllers;

use DB;

use App\Http\Requests\RecordRequest;
use App\Http\Requests\RecordActionRequest;
use App\Http\Requests\RecordPaymentRequest;

use App\User;
use App\UserRecord;

use App\Repositories\UsersRepository;
use App\Repositories\UserRecordsRepository;

use Illuminate\Http\Request;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\JsonResponse;

use Illuminate\Contracts\View\View;

class RecordsController extends Controller
{
    /**
     * @var UsersRepository
     */
    private $users;

    /**
     * @var UserRecordsRepository
     */
    private $records;

    public function __construct(UsersRepository $users, UserRecordsRepository $records)
    {
        $this->users = $users;
        $this->records = $records;
    }

    public function index(string $date = null): View
    {
        $this->authorize('manage-records', UserRecord::class);

        $dates = $this->records->findAllRecordedDates();

        $entries = null;

        if ($dates->count()) {
            if (empty($date)) {
                $date = $dates->first();
            }

            $entries = $this->records->findAllByRecordedDate($date);
        }

        $profits = $this->records->calculateAllProfits($entries);

        return view('records.index', compact('dates', 'date', 'entries', 'profits'));
    }

    public function create(): View
    {
        return view('record.form');
    }

    public function store(RecordRequest $request): RedirectResponse
    {
        $record = new UserRecord();
    
        DB::transaction(function () use ($request, $record) {
            $record->fill($request->validated());

            $user = $request->user();

            $owner = $record->owner();
    
            if ($user->can('manage-records', UserRecord::class)) {
                $owner->associate($request->input('owner_id'));

                if ($request->has('recorded_at')) {
                    $record->recorded_at = $request->input('recorded_at');
                }
            } else {
                $owner->associate($user);
            }

            $record->action = UserRecord::ACTION_WITHOUT_ANSWER;

            $record->saveOrFail();
        });

        $request->session()->flash('alert', ['success' => 'flashes.entry_added']);

        if ($record->action === UserRecord::ACTION_WITHOUT_ANSWER) {
            return redirect()->route('record.options', $record);
        } else {
            return redirect()->route('records.user', $record->owner);
        }
    }

    public function options(UserRecord $userRecord): View
    {
        $this->authorize('manage-records', $userRecord);

        abort_unless($userRecord->action === UserRecord::ACTION_WITHOUT_ANSWER, 400);

        return view('record.options', compact('userRecord'));
    }

    public function action(RecordActionRequest $request, UserRecord $userRecord): RedirectResponse
    {
        $this->authorize('manage-records', $userRecord);

        abort_unless($userRecord->action === UserRecord::ACTION_WITHOUT_ANSWER, 400);

        $action = $request->input('action');

        if ($action === UserRecord::ACTION_SMALL_PROFIT) {
            $userRecord->cashout = 0;
            $userRecord->ft_cashout = 0;
            $userRecord->st_cashout = 0;
            $userRecord->tt_cashout = 0;
            $userRecord->fth_cashout = 0;
        }

        $userRecord->action = $action;
        $userRecord->saveOrFail();

        $request->session()->flash('alert', ['success' => 'flashes.action_selected']);

        return redirect()->route('records.user', $userRecord->owner);
    }

    public function edit(UserRecord $userRecord): View
    {
        $this->authorize('manage-records', $userRecord);

        return view('record.form', compact('userRecord'));
    }

    public function update(RecordRequest $request, UserRecord $userRecord): RedirectResponse
    {
        $this->authorize('manage-records', $userRecord);

        $userRecord->action = UserRecord::ACTION_WITHOUT_ANSWER;

        $userRecord->fill($request->validated())->saveOrFail();

        $request->session()->flash('alert', ['success' => 'flashes.entry_updated']);

        if ($userRecord->action === UserRecord::ACTION_WITHOUT_ANSWER) {
            return redirect()->route('record.options', $userRecord);
        } else {
            return redirect()->route('records.user', $userRecord->owner);
        }
    }

    public function payment(RecordPaymentRequest $request, UserRecord $userRecord): JsonResponse
    {
        $this->authorize('manage-records', $userRecord);

        $teacher = $request->input('teacher');
        $is_paid = $request->has('is_paid');

        if ($teacher === User::FIRST_TEACHER_NAME) {
            $userRecord->is_ft_paid = $is_paid;
        } else if ($teacher === USER::SECOND_TEACHER_NAME) {
            $userRecord->is_st_paid = $is_paid;
        }

        $userRecord->saveOrFail();

        return response()->json([
            'success' => true
        ]);
    }

    public function delete(UserRecord $userRecord, Request $request): RedirectResponse
    {
        $this->authorize('manage-records', $userRecord);

        $userRecord->delete();

        $request->session()->flash('alert', ['success' => 'flashes.entry_deleted']);

        return redirect()->route('records.user', $userRecord->owner);
    }

    public function user(User $user, Request $request): View
    {
        $entries = $this->records->findAllByUser($user);

        $profits = null;

        $logged = $request->user();

        if ($logged->can('manage-records', UserRecord::class)) {
            $profits = $this->records->calculateAllProfits($entries, $user);
        } else {
            abort_unless($user->isSameAs($logged), 403);
        }

        return view('records.index', compact('user', 'entries', 'profits'));
    }
}
