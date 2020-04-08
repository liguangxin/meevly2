<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any posts.
     *
     * @param User $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        return $user->hasRole(['Admin']);
    }

    /**
     * Determine if the given post can be updated by the user.
     *
     * @param User $user
     * @return bool
     */
    public function view(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can create employees.
     *
     * @param User $user
     * @return mixed
     */
    public function create(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can update the employee.
     *
     * @param User $user
     * @return mixed
     */
    public function update(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can delete the employee.
     *
     * @param User $user
     * @return mixed
     */
    public function delete(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can restore the employee.
     *
     * @param User $user
     * @return mixed
     */
    public function restore(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can permanently delete the employee.
     *
     * @param User $user
     * @return mixed
     */
    public function forceDelete(User $user)
    {
        return true;
    }
}
