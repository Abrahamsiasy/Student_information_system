<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;
    // protected $primaryKey = 'student_id';

    //one student has one medical history
    public function medicalhistories()
    {
        return $this->hasMany(Medicalhistory::class);
    }

    //Student belongs to campas
    public function campas(){
        return $this->belongsTo(Campas::class);
    }

    public function scopeFilter($query, array $filters) {
        if ($filters['camp'] ?? false ) {
            $query->where('campas_id', 'like', '%' . request('camp') . '%');
        }

    }







}
