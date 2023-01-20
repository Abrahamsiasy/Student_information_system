<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    // user belongs to campas 
    public function clinic()
    {
        return $this->belongsTo(Clinic::class);
    }

    // user has many students
    public function students()
    {
        return $this->hasMany(Student::class);
    }

    //lab reports belongs to a user
    public function labReport(){
        return $this->hasMany(Labreport::class);
    }

    //user belong to room
    public function room()
    {
        return $this->hasOne(Room::class);
    }
    //user belongs to one department
    public function department()
    {
        return $this->belongsTo(Department::class);
    }
    //user belongs to one campus

    //student has many MedicalHistory
    //COULD BE DELETED ???
    // one medical history could belong to a doctor a lab asssistant or more 
    // public function medicalHistories()
    // {
    //     return $this->hasMany(Medicalhistory::class);
    // }

    
    

}
