<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Personalmedicalhistory extends Model
{
    use HasFactory;

    // create fillable values 
    //stores personal past desis condition and their status
    
        // define the table name    and columns
        protected $fillable = [
            'disease_or_conditions',
            'current',
            'comments',
        ];

        //medication belongs to medical history
    public function medical_history(){
        return $this->belongsTo(Medicalhistory::class);
    }
}
