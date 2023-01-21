<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QueueController;
use App\Http\Controllers\DoctorController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StudentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

//student list routes
Route::controller(StudentController::class)->group(
    function () {
        Route::get('student', 'index');
    }
);
//queue index routes
Route::controller(QueueController::class)->group(
    function () {
        Route::get('queue', 'index');
    }
);
//doctor index route
Route::controller(DoctorController::class)->group(
    function () {
        Route::get('doctor', 'index');
        //post lab report
        Route::post('doctor/detail/{student}', 'storeLabReports');
        //Route::get('doctor/detail', 'show');
        Route::get('doctor/detail/{student}', 'show');
    },

);

require __DIR__ . '/auth.php';
