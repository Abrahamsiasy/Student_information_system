<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabResult extends Model
{
    //lab result for the lab report and will be sent back to the doctor based on
    //lab_report_id which will be beloging to the doctor it self
    use HasFactory;
    //create fillabe values for title description and comment
    protected $fillable = ['title', 'description', 'comment', 'lab_report_id', 'student_id'];

    //lab result has lab reports
    public function labreports()
    {
        return $this->belongsTo(Labreport::class);
    }
}
