<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campas extends Model
{
    use HasFactory;
    protected $table = 'campas';

    protected $fillable = ['name' , 'campas_name' , 'campas_id'];

    // campas has many clinics 
    public function clinics()
    {
        return $this->hasOne(Clinic::class);
    }

    public function students(){
        return $this->hasMany(Student::class);
    }

    // campas has many users
    // public function users()
    // {
    //     return $this->hasMany(User::class);
    // }
}
