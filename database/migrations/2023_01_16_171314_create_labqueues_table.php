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
            $table->unsignedBigInteger('labreport_id');
            $table->foreign('labreport_id')->references('id')->on('labreports')->onDelete('cascade');

            //doctor queues
            $table->unsignedBigInteger('lab_assistant_id')->nullable();
            $table->foreign('lab_assistant_id')->references('id')->on('users')->onDelete('cascade');
            $table->boolean('status')->default(0);


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
