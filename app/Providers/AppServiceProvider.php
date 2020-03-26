<?php

namespace App\Providers;

use NumberFormatter;

use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->singleton('NumberFormatter', function () {
            return new NumberFormatter(config('money.locale'), NumberFormatter::CURRENCY);
        });

        Blade::directive('money', function ($expression) {
            return "<?php echo app('NumberFormatter')->formatCurrency($expression, config('money.currency')); ?>";
        });
    }
}
