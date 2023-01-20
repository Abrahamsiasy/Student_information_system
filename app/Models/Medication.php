<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medication extends Model
{
    use HasFactory;

    protected $table = 'medications';
    protected  $fillable = [ 'name', 'description', 'dose', 'medicalhistories_id'];

    //medication belongs to medical history
    public function medical_history(){
        return $this->belongsTo(Medicalhistory::class);
    }
}
