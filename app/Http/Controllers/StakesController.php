<?php

namespace App\Http\Controllers;

use App\Http\Requests\StakeRequest;

use App\User;
use App\UserStake;

use App\Repositories\UsersRepository;
use App\Repositories\UserStakesRepository;

use Illuminate\Http\Request;

use Illuminate\Http\RedirectResponse;

use Illuminate\Contracts\View\View;

class StakesController extends Controller
{
    /**
     * @var UsersRepository
     */
    private $users;

    /**
     * @var UserStakesRepository
     */
    private $stakes;

    public function __construct(UsersRepository $users, UserStakesRepository $stakes)
    {
        $this->users = $users;
        $this->stakes = $stakes;
    }

    public function index(): View
    {
        $this->authorize('manage-stakes', UserStake::class);

        $entries = $this->stakes->findLatest();

        return view('stakes.index', compact('entries'));
    }

    public function store(StakeRequest $request): RedirectResponse
    {
        $this->authorize('manage-stakes', UserStake::class);

        $userStake = new UserStake($request->validated());
    
        $userStake->saveOrFail();

        $request->session()->flash('alert', ['success' => 'flashes.stake_added']);

        return redirect()->route('stakes.index');
    }

    public function all(): View
    {
        $this->authorize('manage-stakes', UserStake::class);

        $users = $this->users->findAll();

        return view('stakes.all', compact('users'));
    }

    public function user(User $user): View
    {
        $this->authorize('manage-stakes', UserStake::class);

        return view('stakes.user', [
            'user' => $user,
            'entries' => $this->stakes->findByUser($user)
        ]);
    }

    public function delete(UserStake $userStake, Request $request): RedirectResponse
    {
        $this->authorize('manage-stakes', $userStake);

        $userStake->delete();

        $request->session()->flash('alert', ['success' => 'flashes.stake_deleted']);

        return redirect()->route('stakes.user', $userStake->user);
    }
}
