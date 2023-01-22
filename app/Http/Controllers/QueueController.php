<?php

namespace App\Http\Controllers;

use App\Models\Queue;
use App\Http\Requests\StoreQueueRequest;
use App\Http\Requests\UpdateQueueRequest;
use App\Models\Room;

class QueueController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return list of students accepted by the doctor
        //$waitingQueue = Queue::where('status', 1)->paginate(25);
        //dd($waitingQueue->count());
        // foreach ($waitingQueue as $key => $value) {
        //     # code...
        //     echo($value). "<hr>";
        // }
        //$queue = Queue::where('status', 0)->paginate(25);


        return view('queue.queue', [
            'queues' => Queue::where('status', 0)->paginate(25),
            'queuesdoc' => Queue::where('status', 1)->paginate(25),
        ]);
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
     * @param  \App\Http\Requests\StoreQueueRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreQueueRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Queue  $queue
     * @return \Illuminate\Http\Response
     */
    public function show(Queue $queue)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Queue  $queue
     * @return \Illuminate\Http\Response
     */
    public function edit(Queue $queue)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateQueueRequest  $request
     * @param  \App\Models\Queue  $queue
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateQueueRequest $request, Queue $queue)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Queue  $queue
     * @return \Illuminate\Http\Response
     */
    public function destroy(Queue $queue)
    {
        //
    }
}
