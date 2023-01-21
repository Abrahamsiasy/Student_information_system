<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\Labqueues;
use Illuminate\Http\Request;

class LabAssistantController extends Controller
{
    //
    public function index()
    {
        //
        return view('lab.lab', [
            'students' => Labqueues::paginate(25),
            'rooms' => Room::all(),
        ]);
    }
}
