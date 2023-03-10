<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Labreport extends Model
{
    //this is written by the doctor for the lab to get lab result
    use HasFactory;

    // assign table and column
    protected $table = 'labreports';
    protected $primaryKey = 'id';
    protected $fillable = ['title', 'description', 'doctor_id', 'student_id'];

    //Labreport belongs to one user
    public function users()
    {
        return $this->belongsTo(User::class);
    }

    //lab report has one lab results
    public function labResult(){
        return $this->hasOne(LabResult::class);
    }

    //lab report has belongs to patient history
    public function medicalHistories()
    {
        return $this->belongsTo(Medicalhistory::class);
    }


}
