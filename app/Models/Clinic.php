<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clinic extends Model
{
    use HasFactory;
    protected $table = 'clinics';

    protected $fillable = ['clinic_name' , 'campas_id'];

    // clinic belongs to campas
    public function campas()
    {
        return $this->belongsTo('App\Models\Campas');
    }

    // clinic has many users
    public function users()
    {
        return $this->hasMany('App\Models\User');
    }

    public function room(){
        return $this->hasMany(Room::class);
    }
}
