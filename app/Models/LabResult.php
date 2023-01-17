<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabResult extends Model
{
    use HasFactory;
    //create fillabe values for title description and comment
    protected $fillable = ['title', 'description', 'comment', ];

    //lab result has lab reports
    public function labreports()
    {
        return $this->belongsTo(Labreport::class);
    }
}
