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
        Schema::create('labqueues', function (Blueprint $table) {
            $table->id();
            //student queues
            $table->string('student_id');
            $table->foreign('student_id')->references('student_id')->on('students')->onDelete('cascade');

            //doctor queues
            $table->unsignedBigInteger('lab_assistant_id')->nullable();
            $table->foreign('lab_assistant_id')->references('id')->on('users')->onDelete('cascade');
            

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('labqueues');
    }
};
