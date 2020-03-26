<?php
 
namespace App\Http\Controllers;

use App\Repositories\UsersRepository;

use Illuminate\Http\JsonResponse;

class AutoCompleteController extends Controller
{
    /**
     * @var UsersRepository
     */
    private $users;

    public function __construct(UsersRepository $users)
    {
        $this->users = $users;
    }

    public function search(string $term): JsonResponse
    {
        return response()->json($this->users->searchByTerm($term));
    }
}
