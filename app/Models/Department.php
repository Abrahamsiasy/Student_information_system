<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;
    // protected fillable title and description
    protected $fillable = [ 'name', 'description'];

    //departement has many users
    public function users()
    {
        return $this->hasMany(User::class);
    }

    //departemnt has many users 
    //return the sum of two numbers
    
}
