<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('labqueues', function (Blueprint $table) {
            //
            $table->dropForeign(['student_id']);
            $table->unsignedBigInteger('labreport_id');
            $table->foreign('labreport_id')->references('id')->on('labreports')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('labqueues', function (Blueprint $table) {
            //
            $table->dropForeign('labreport_id');
        });
    }
};
