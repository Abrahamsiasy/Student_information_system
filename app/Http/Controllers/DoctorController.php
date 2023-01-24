<?php

namespace App\Http\Controllers;

use App\Models\Labqueues;
use App\Models\Room;
use App\Models\Queue;
use App\Models\Student;
use App\Models\Labreport;
use App\Models\LabResult;
use App\Models\Medication;
use Illuminate\Http\Request;
use App\Models\Medicalhistory;

class DoctorController extends Controller
{
    //
    public function index()
    {
        //
        return view('doctor.doctor', [
            'students' => Queue::where('status', 0)->paginate(25),
            // 'rooms' => Room::all(),
        ]);
    }

    public function show(
        Student $student,
        Medicalhistory $histories
    ) {
        //
        $histories = Medicalhistory::where('student_id', $student->id)->first();
        //dd($histories);

        $labhistories = LabResult::where('student_id', $student->id)->get();
        //dd($labhistories); // returns empty array
        //dd(count(Medication::where('medicalhistories_id', $histories->id)->get()))



        //change queue status of the student when doctor accepts
        $queueid = Queue::where('student_id', $student->id)->first();
        //dd($queue->id);
        //update queue status
        $queue = Queue::where('id', $queueid->id)->first();
        $queue->doctor_id = auth()->user()->id;
        $queue->status = 1;
        $queue->save();





        //check if the student id existes in medical history table
        if ($histories === null) {
            //ID does not exist it will create a new history table
            $medicalhistories = new Medicalhistory();
            $medicalhistories->student_id = $student->id;
            $medicalhistories->doctor_id  = auth()->user()->id;
            //save the history table
            $medicalhistories->save();

            //$medhistories = Medication::where('medicalhistories_id', $histories->id)->get();

        } else {
            //ID exists
            $medhistories = Medication::where('medicalhistories_id', $histories->id)->get();
            // dd($medhistories);
        }



        //dd($labhistoriess);

        // dd($historiess);
        //dd($medhistories);
        return view('doctor.student_info', [
            'student' => $student,
            'histories' => $histories,
            'labhistories' => $labhistories,
            'medhistories' => $medhistories,
        ]);
    }

    public function storeLabReports(Request $request, Student $student)
    {
        $formField = $request->validate([
            'title' => 'required',
            'description'  => 'required'

        ]);
        $formField['doctor_id '] = auth()->user()->id;
        $formField['student_id '] = $student->id;
        // dd($formField);
        // // or anther method
        $labReport = new Labreport();
        $labReport->title = $request->title;
        $labReport->description = $request->description;
        $labReport->student_id = $student->id;
        $labReport->doctor_id = auth()->user()->id;
        $labReport->save();
        //dd($labReport->id);
        //Labreport::create($formField);

        if ($labReport->id) {
            //create lab que with labreport id
            $labQueue = new Labqueues();
            $labQueue->labreport_id = $labReport->id;
            $labQueue->student_id = $student->id;
            $labQueue->save();

            //redirect to its own page
            return redirect('/doctor/detail/' . $student->id)->with('status', 'Lab sent!');
        }
    }

    public function delete(Student $student)
    {
        //find queue where student_id = $student->id
        $queue = Queue::where('student_id', $student->id)->first();
        //dd($queue);

        $queue->delete();

        return redirect('/doctor')->with('status', 'Queue deleted!');
    }
}
