<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicalhistory extends Model
{
    use HasFactory;
    protected $table = 'medicalhistories';
    protected $fillable = ['student_id' , 'doctor_id' , 'lab_id', 'medication_id' , 'personal_medical_history_id'];

    //one medical history belongs to one user
    public function users()
    {
        return $this->belongsTo(User::class);
    }
    //one medcal history belongs to one student

    public function students()
    {
        return $this->belongsTo(Student::class);
    }

    //medical story has multiple lab reports

    //medical history has many medications 
    public function medication(){
        return $this->hasMany(Medication::class);
    } 

    public function personal_medical_history(){
        return $this->hasMany(Personalmedicalhistory::class);
    } 

    public function women(){
        return $this->hasOne(Women::class);
    } 
    

}
