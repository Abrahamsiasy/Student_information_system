<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Women extends Model
{
    use HasFactory;

    public function medical_history(){
        return $this->belongsTo(Medicalhistory::class);
    }
}
