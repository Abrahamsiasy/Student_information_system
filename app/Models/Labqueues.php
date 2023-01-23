<?php

namespace App\Models;

use App\Models\Labreport;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Labqueues extends Model
{
    //after the student id leabves the queue it goes to the doctors room, room is found by doctor id

    use HasFactory;

    protected $fillable = ['student_id', 'lab_assistant_id'];

    //Labqueues has one user
    public function labAssistant()
    {
        return $this->belongsTo(User::class);
    }

    public function labreport()
    {
        return $this->belongsTo(Labreport::class);
    }

}
