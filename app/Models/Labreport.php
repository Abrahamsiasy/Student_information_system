<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Labreport extends Model
{
    use HasFactory;

    // assign table and column
    protected $table = 'labreports';
    protected $primaryKey = 'id';
    protected $fillable = ['title', 'description', 'lab_result_id'];

    //Labreport belongs to one user
    public function users()
    {
        return $this->belongsTo(User::class);
    }

    //lab report has one lab results
    public function labResult(){
        return $this->hasOne(LabResult::class);
    }


}
