<?php

namespace App\Widgets;

use Arrilot\Widgets\AbstractWidget;

class LabQueuewidgit extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        //

        return view('widgets.lab_queuewidgit', [
            'config' => $this->config,
        ]);
    }
}
