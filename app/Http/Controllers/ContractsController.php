<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserContractRequest;

use App\User;

use App\Repositories\UsersRepository;
use App\Repositories\UserRecordsRepository;

use Illuminate\Http\RedirectResponse;

use Illuminate\Contracts\View\View;

class ContractsController extends Controller
{
    /**
     * @var UsersRepository
     */
    private $users;

    public function __construct(UsersRepository $users)
    {
        $this->users = $users;
    }

    public function index(): View
    {
        $this->authorize('manage-contracts', User::class);

        return view('contracts.index', [
            'users' => $this->users->findAll()
        ]);
    }

    public function edit(User $user): View
    {
        $this->authorize('manage-contracts', $user);

        return view('user.contract', [
            'user' => $user
        ]);
    }

    public function update(UserContractRequest $request, User $user): RedirectResponse
    {
        $this->authorize('manage-contracts', $user);

        $user->fill($request->validated())->saveOrFail();

        $request->session()->flash('alert', ['success' => 'flashes.contract_updated']);

        return redirect()->route('contracts.index');
    }
}
