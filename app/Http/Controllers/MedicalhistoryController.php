<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMedicalhistoryRequest;
use App\Http\Requests\UpdateMedicalhistoryRequest;
use App\Models\Medicalhistory;

class MedicalhistoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreMedicalhistoryRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreMedicalhistoryRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Medicalhistory  $medicalhistory
     * @return \Illuminate\Http\Response
     */
    public function show(Medicalhistory $medicalhistory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Medicalhistory  $medicalhistory
     * @return \Illuminate\Http\Response
     */
    public function edit(Medicalhistory $medicalhistory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateMedicalhistoryRequest  $request
     * @param  \App\Models\Medicalhistory  $medicalhistory
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateMedicalhistoryRequest $request, Medicalhistory $medicalhistory)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Medicalhistory  $medicalhistory
     * @return \Illuminate\Http\Response
     */
    public function destroy(Medicalhistory $medicalhistory)
    {
        //
    }
}
