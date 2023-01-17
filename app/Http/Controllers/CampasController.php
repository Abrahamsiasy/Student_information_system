<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCampasRequest;
use App\Http\Requests\UpdateCampasRequest;
use App\Models\Campas;

class CampasController extends Controller
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
     * @param  \App\Http\Requests\StoreCampasRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCampasRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Campas  $campas
     * @return \Illuminate\Http\Response
     */
    public function show(Campas $campas)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Campas  $campas
     * @return \Illuminate\Http\Response
     */
    public function edit(Campas $campas)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCampasRequest  $request
     * @param  \App\Models\Campas  $campas
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCampasRequest $request, Campas $campas)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Campas  $campas
     * @return \Illuminate\Http\Response
     */
    public function destroy(Campas $campas)
    {
        //
    }
}
