<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Room extends Model
{
    use HasFactory;

    public function clinic(){
        return $this->belongsTo(Clinic::class);
    }

    //user belongs to rooms
    public function user() {
        return $this->belongsTo(User::class);
    }

    //user belongs to rooms
    public function students() {
        return $this->hasMany(Student::class);
    }
}
