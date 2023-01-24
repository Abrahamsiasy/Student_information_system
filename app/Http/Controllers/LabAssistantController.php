<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\Student;
use App\Models\Labqueues;
use App\Models\Queue;
use App\Models\Labreport;
use App\Models\LabResult;
use Illuminate\Http\Request;

class LabAssistantController extends Controller
{
    //
    public function index()
    {
        //
        return view('lab.lab', [
            'labqueues' => Labqueues::where('status', 0)->paginate(25),
            // 'rooms' => Room::all(),
        ]);
    }



    public function show(
        Student $student,
    ) {
        //change queue status of the student when doctor accepts
        $queueid = Labqueues::where('student_id', $student->id)->first();
        //dd($queueid);
        //update queue status
        $labqueue = Labqueues::where('id', $queueid->id)->first();
        $labqueue->lab_assistant_id = auth()->user()->id;
        $labqueue->status = 1;
        $labqueue->save();
        //dd($labqueue->status);


        //get the lab report based on lab queue id
        $labreport = Labreport::where('id', $labqueue->labreport_id)->first();
        //dd($labreport);

        return view('lab.result', [
            'student' => $student,
            'labreport' =>$labreport
        ]);
    }



    public function storeLabResultss(Request $request, Student $student)
    {
        //dd($student->id);
        $formField = $request->validate([
            'title' => 'required',
            'description'  => 'required',
            'comment'  => 'required'

        ]);
        // $formField['lab_assistant_id '] = auth()->user()->id;
        // $formField['student_id '] = $student->id;
        // dd($formField);
        // // or anther method

        $queueid = Labqueues::where('student_id', $student->id)->first();
        $labqueue = Labqueues::where('id', $queueid->id)->first();
        //dd($labqueue->labreport_id);



        $result = new LabResult();
        $result->title = $request->title;
        $result->description = $request->description;
        $result->comment = $request->comment;
        $result->student_id = $student->id;
        $result->lab_report_id = $labqueue->labreport_id;

        $result->lab_assistant_id = auth()->user()->id;
        $result->save();

        //get the labque id and delte * from lab queue so it disapears from the labque list
        $labque = Labqueues::find($labqueue);
        $labque->each->delete();
        //after the labque is delted the it needs to create main que back to the doctor get doector id from lab report and put it back

        //Labreport::create($formField);


        //after deleting lab que send the student straigh to the doctor by adding it to que with status one
        //redirect to view lab

        //slect from queue where student_id = $student->id
        //$queue = Queue::where('student_id', $student->id)->first(); //cant be used since queue is deleted
        $labReport = Labreport::where('student_id', $student->id)->first();
        $queue = new Queue();
            $queue->student_id = $student->id;
            $queue->doctor_id = $labReport->doctor_id;
            $queue->status = 1;
            $queue->save();
        return redirect('/lab')->with('status', 'Lab Result submited to the doctor');

    }
}
