<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreLabqueuesRequest;
use App\Http\Requests\UpdateLabqueuesRequest;
use App\Models\Labqueues;

class LabqueuesController extends Controller
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
     * @param  \App\Http\Requests\StoreLabqueuesRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreLabqueuesRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Labqueues  $labqueues
     * @return \Illuminate\Http\Response
     */
    public function show(Labqueues $labqueues)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Labqueues  $labqueues
     * @return \Illuminate\Http\Response
     */
    public function edit(Labqueues $labqueues)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateLabqueuesRequest  $request
     * @param  \App\Models\Labqueues  $labqueues
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateLabqueuesRequest $request, Labqueues $labqueues)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Labqueues  $labqueues
     * @return \Illuminate\Http\Response
     */
    public function destroy(Labqueues $labqueues)
    {
        //
    }
}
