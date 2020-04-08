<?php

namespace App\Providers;

use Anaseqal\NovaSidebarIcons\NovaSidebarIcons;
use App\Nova\Tests;
use App\Nova\TestsCategory;
use App\Nova\Tutorial;
use App\Nova\TutorialCategory;
use App\Nova\User;
use App\Nova\Video;
use App\Nova\VideoCategory;
use App\Policies\PermissionPolicy;
use App\Policies\RolePolicy;
use DigitalCreative\CollapsibleResourceManager\CollapsibleResourceManager;
use DigitalCreative\CollapsibleResourceManager\Resources\TopLevelResource;
use Eminiarts\NovaPermissions\NovaPermissions;
use Illuminate\Support\Facades\Gate;
use Laravel\Nova\Cards\Help;
use Laravel\Nova\Nova;
use Laravel\Nova\NovaApplicationServiceProvider;
use Vyuldashev\NovaPermission\NovaPermissionTool;
use Vyuldashev\NovaPermission\Permission;
use Vyuldashev\NovaPermission\Role;

class NovaServiceProvider extends NovaApplicationServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        parent::boot();
    }

    /**
     * Register the Nova routes.
     *
     * @return void
     */
    protected function routes()
    {
        Nova::routes()
                ->withAuthenticationRoutes()
                ->withPasswordResetRoutes()
                ->register();
    }

    /**
     * Register the Nova gate.
     *
     * This gate determines who can access Nova in non-local environments.
     *
     * @return void
     */
    protected function gate()
    {
        Gate::define('viewNova', function ($user) {
            return true;
            return in_array($user->email, [
                //
            ]);
        });
    }

    /**
     * Get the cards that should be displayed on the default Nova dashboard.
     *
     * @return array
     */
    protected function cards()
    {
        return [
            new Help,
        ];
    }

    /**
     * Get the extra dashboards that should be displayed on the Nova dashboard.
     *
     * @return array
     */
    protected function dashboards()
    {
        return [];
    }

    /**
     * Get the tools that should be listed in the Nova sidebar.
     *
     * @return array
     */
    public function tools()
    {
        return [
            \Vyuldashev\NovaPermission\NovaPermissionTool::make()
                ->permissionPolicy(PermissionPolicy::class)
                ->rolePolicy(RolePolicy::class),

            new CollapsibleResourceManager([
                'disable_default_resource_manager' => true,
                'navigation' => [
                    TopLevelResource::make([
                        'label' => 'Testai',
                        'resources' => [
                            Tests::class,
                            TestsCategory::class,
                        ]
                    ]),
                    TopLevelResource::make([
                        'label' => 'Videteka',
                        'resources' => [
                            Video::class,
                            VideoCategory::class,
                        ]
                    ]),
                    TopLevelResource::make([
                        'label' => 'Tutorialai',
                        'resources' => [
                            Tutorial::class,
                            TutorialCategory::class,
                        ]
                    ]),
                    TopLevelResource::make([
                        'label' => 'Vartotojai',
                        'resources' => [
                            User::class,
                            Permission::class,
                            Role::class,
                        ]
                    ]),
                ],
            ]),
        ];
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
