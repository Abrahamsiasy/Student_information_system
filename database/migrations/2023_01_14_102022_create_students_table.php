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
        Schema::create('students', function (Blueprint $table) {
            $table->string('student_id')->unique();
            $table->string('first_name');
            $table->string('middle_name');
            $table->string('last_name');
            $table->string('sex');
            $table->date('dob');
            $table->date('join_year');
            $table->string('phone_number')->unique();
            $table->string('email')->unique();
            //Should reference photo(file) table
            $table->string('profile');
            // $table->foreign('profile')->constrained()->cascadeOnUpdate()->onDelete("RESTRICT")->references('id')->on('photos');
            $table->integer('taken_semester');
            $table->integer('passed_semester');
            $table->boolean('status');
            $table->string('program');
            //add campas foreign key
            $table->string('campas_id');
            $table->foreign('campas_id')->references('student_id')->on('student')->onDelete('cascade');   
            $table->timestamps();
            
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
        Schema::dropIfExists('students');
    }
};
