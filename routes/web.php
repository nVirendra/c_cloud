<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CandidateController;

//student masrks entry form
Route::get('/',[CandidateController::class,'index']);

//marks details server side 
Route::get('/server-side',[CandidateController::class,'serversideIndex']);
Route::get('/serverList',[CandidateController::class,'ServersideList']);

//check unique roll no
Route::post('/check-roll-number',[CandidateController::class,'isRolNoAvailable']);

//get all inout field for marks of subject
Route::post('/getsubjecs',[CandidateController::class,'getSubjects']);

//save marks details
Route::post('/save-marks',[CandidateController::class,'saveMarks']);

//view of total score
Route::get('/getstudents',[CandidateController::class,'totoalScore']);