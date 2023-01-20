<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Medicalhistory extends Model
{
    use HasFactory;
    protected $table = 'medicalhistories';
    protected $fillable = ['student_id' , 'doctor_id' , 'lab_id', 'medication_id' , 'personal_medical_history_id'];

    //one medical history belongs to one doctor
    public function doctor()
    {
        return $this->belongsTo(User::class);
    }
    //one medcal history belongs to one student

    public function student()
    {
        return $this->belongsTo(Student::class);
    }
    //medical History has many lab reports
    public function labReports()
    {
        return $this->hasMany(LabReport::class);
    }
    
    //medical history has many medications 
    public function medications(){
        return $this->hasMany(Medication::class);
    } 

    //a table with custom conditional question based on the patient which belong to patient medical history
    public function personal_medical_history(){
        return $this->hasMany(Personalmedicalhistory::class);
    } 

    public function women(){
        return $this->hasOne(Women::class);
    } 
    

}
