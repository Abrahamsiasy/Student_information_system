<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\Queue;
use Illuminate\Http\Request;

class DoctorController extends Controller
{
    //
    public function index()
    {
        //
        return view('doctor.doctor', [
            'students' => Queue::paginate(25),
            'rooms' => Room::all(),
        ]);
    }

    public function show()
    {
        //
        return view('doctor.student_info', [
            'students' => Queue::paginate(25),
            'rooms' => Room::all(),
        ]);
    }
}
