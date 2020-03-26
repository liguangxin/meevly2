<?php

use Illuminate\Database\Migrations\Migration;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class UserShares extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->unsignedInteger('profit_share')->default(50)->after('email');
            $table->unsignedInteger('ft_profit_share')->default(36)->after('profit_share');
            $table->unsignedInteger('st_profit_share')->default(64)->after('ft_profit_share');
            $table->unsignedInteger('tt_profit_share')->default(18)->after('st_profit_share');
            $table->unsignedInteger('fth_profit_share')->default(12)->after('tt_profit_share');
            $table->unsignedInteger('affiliate_share')->default(0)->after('fth_profit_share');
            $table->decimal('transfer_fee', 15, 2)->default(0.01)->after('affiliate_share');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('profit_share');
            $table->dropColumn('ft_profit_share');
            $table->dropColumn('st_profit_share');
            $table->dropColumn('tt_profit_share');
            $table->dropColumn('fth_profit_share');
            $table->dropColumn('affiliate_share');
            $table->dropColumn('transfer_fee');
        });
    }
}
