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
        Schema::create('medicalhistories', function (Blueprint $table) {
            $table->id();
            //foreign key
            //create a realtion with campas table
            //create a relation with studnet table which a studnet would have many records
            $table->string('student_id');
            $table->foreign('student_id')->references('student_id')->on('students')->onDelete('cascade');
            //create a relation with user table which a user would have many records
            $table->unsignedBigInteger('doctor_id')->nullable();
            $table->foreign('doctor_id')->references('id')->on('users')->onDelete('cascade');
            //create a relation with lab reports to the lab assistant through users method and the report it self
            $table->unsignedBigInteger('lab_id')->nullable();
            $table->foreign('lab_id')->references('id')->on('labreports')->onDelete('cascade');
            
            //personal medical history
            // $table->unsignedBigInteger('personal_medical_history_id');
            // $table->foreign('personal_medical_history_id')->references('id')->on('personalmedicalhistories')->onDelete('cascade');
            //personal medical history
            $table->unsignedBigInteger('womens_id')->nullable();
            $table->foreign('womens_id')->references('id')->on('womens')->onDelete('cascade');


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
        Schema::dropIfExists('medicalhistories');
    }
};
