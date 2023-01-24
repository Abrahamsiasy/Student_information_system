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
use App\Models\Personalmedicalhistory;

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
    //get doctor id from loged in user(AUTH) the creat a lab report 
    //with that doctor id for lab que and create lab que to be edited 
    //with lab assistant id then redirect back to doc page with list of student 
    //to be accepted
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
    //storeMedRecord
    public function storeMedRecord(Request $request, Student $student)
    {
        $formField = $request->validate([
            'name' => 'required',
            'dose'  => 'required',
            'description' => 'required'

        ]);
        $histories = Medicalhistory::where('student_id', $student->id)->first();
        // $formField['doctor_id '] = auth()->user()->id;
        // $formField['student_id '] = $student->id;
        // $formField['medicalhistories_id '] = $histories->id;
        // dd($formField);
        $medicalrecord = new Medication();
        
        $medicalrecord->name = $formField['name'];
        $medicalrecord->dose = $formField['dose'];
        $medicalrecord->description = $formField['description'];
        $medicalrecord->medicalhistories_id = $histories->id;
        $medicalrecord->save();
        //dd($medicalrecord->id);
        // // or anther method


        //redirect to its own page
        return redirect('/doctor/detail/' . $student->id)->with('status', 'Medcin added!');
    }



    //storeMedRecord
    public function storePersonalRecord(Request $request, Student $student)
    {
        //dd("sfsdfs");
        $formField = $request->validate([
            'disease_or_conditions' => 'required',
            'current' => 'required',
            'comments' => 'required'

        ]);
        $histories = Medicalhistory::where('student_id', $student->id)->first();
        // $formField['doctor_id '] = auth()->user()->id;
        // $formField['student_id '] = $student->id;
        // $formField['medicalhistories_id '] = $histories->id;
        // dd($formField);
        $personalmedicalrecord = new Personalmedicalhistory();
        
        $personalmedicalrecord->disease_or_conditions = $formField['disease_or_conditions'];
        $personalmedicalrecord->current = $formField['current'];
        $personalmedicalrecord->comments = $formField['comments'];
        $personalmedicalrecord->medicalhistories_id = $histories->id;
        $personalmedicalrecord->save();
        dd($personalmedicalrecord);
        // // or anther method


        //redirect to its own page
        return redirect('/doctor/detail/' . $student->id)->with('status', 'Medcin added!');
    }

    //delete que where student id is given
    public function delete(Student $student)
    {
        //find queue where student_id = $student->id
        $queue = Queue::where('student_id', $student->id)->first();
        //dd($queue);

        $queue->delete();

        return redirect('/doctor')->with('status', 'Queue deleted!');
    }
}
