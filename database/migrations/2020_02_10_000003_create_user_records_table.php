<?php

use App\UserRecord;

use Illuminate\Database\Migrations\Migration;

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;

class CreateUserRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_records', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('owner_id');
            $table->decimal('bankroll', 15, 2);
            $table->unsignedInteger('games_count');
            $table->string('winamax_photo');
            $table->string('pt4_photo');
            $table->decimal('stake', 15, 2)->default(0);
            $table->decimal('cashout', 15, 2)->default(0);
            $table->decimal('ft_cashout', 15, 2)->default(0);
            $table->decimal('st_cashout', 15, 2)->default(0);
            $table->decimal('af_cashout', 15, 2)->default(0);
            $table->string('action', 20)->default(UserRecord::ACTION_WITHOUT_ANSWER);
            $table->date('recorded_at')->index();
            $table->boolean('is_ft_paid')->default(false);
            $table->boolean('is_st_paid')->default(false);
            $table->timestamps();

            $table->foreign('owner_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_records');
    }
}
