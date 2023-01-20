<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Queue extends Model
{
    use HasFactory;

    //deleted fillable student_id and room_id
    //select room title based on room user columun which is a doctor

    // from rooms_id we get room number and room user which is the doctor that acceptes the student
    protected $fillable = [ 'student_id', 'user_id'];


    //queue has one student and one room
    //que has one student and one room
    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function room()
    {
        return $this->belongsTo(Room::class);
    }






}
