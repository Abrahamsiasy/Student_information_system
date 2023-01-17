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
        Schema::create('lab_results', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('description')->nullable();
            $table->string('comment');

            //lab report foregin id
            $table->unsignedBigInteger('lab_report_id');
            $table->foreign('lab_report_id')->references('id')->on('lab_results')->onDelete('cascade'); 


            //create user_id foreign key
            $table->unsignedBigInteger('lab_assistant_id');
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
        Schema::dropIfExists('lab_results');
    }
};
