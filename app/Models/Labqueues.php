<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Labqueues extends Model
{
    //after the student id leabves the queue it goes to the doctors room, room is found by doctor id

    use HasFactory;

    protected $fillable = ['student_id', 'lab_assistant_id'];

    //Labqueues has one user
    public function lab_assistant()
    {
        return $this->belongsTo(User::class);
    }

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

}
