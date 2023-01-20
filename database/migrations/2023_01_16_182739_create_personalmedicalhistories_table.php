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
        Schema::create('personalmedicalhistories', function (Blueprint $table) {
            //a table with custom conditional question based on the patient which belong to patient medical history
            $table->id();
            $table->string('disease_or_conditions');
            $table->boolean('current');
            $table->string('comments');

            //personal medical history belongs to medical histories
            $table->unsignedBigInteger('medicalhistories_id')->nullable();
            $table->foreign('medicalhistories_id')->references('id')->on('medicalhistories')->onDelete('cascade');

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
        Schema::dropIfExists('personalmedicalhistories');
    }
};
