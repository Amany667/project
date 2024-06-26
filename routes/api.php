<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\ChatController;
use App\Http\Controllers\API\Homecontroller;
use App\Http\Controllers\API\RegisterController;
use App\Http\Controllers\API\dentistregistercontroller;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::controller(RegisterController::class)->group(function()
{
    Route::post('register', 'register');
    Route::post('login', 'login');

    Route::post('users', 'login')->name('index');

});
*/
Route::middleware('guest')->prefix('auth')->controller(RegisterController::class)->group(function()
{
    Route::post('register', 'register');
    Route::post('login', 'login');
    Route::post('forget','forget');
    Route::post('reset','reset');
});
/*** -----------Users ---------------------
Route::middleware('auth:sanctum')->group(function() {
    Route::get('/users',[RegisterController::class,'index'])->name('index');
});
*/
Route::middleware('auth:sanctum')->controller(RegisterController::class)->group(function() {
    Route::get('/users','index')->name('index');
    Route::post('logout', 'logout');
    Route::post('/users/updade_profile','updade_profile');
    Route::post('/users/updade_password','updade_password');
    Route::post('/users/getprofile','profile');

    Route::delete('/users/delete','delete');
});
/**dentist */
Route::middleware('guest')->prefix('auth')->controller(dentistregistercontroller::class)->group(function()
{
    Route::post('dentistregister', 'register');
    Route::post('dentistlogin', 'login');
    Route::post('dentistforget','forget');
    Route::post('dentistreset','reset');

});

Route::middleware('auth:sanctum')->group(function() {
    Route::get('/dentists',[dentistregistercontroller::class,'index'])->name('index');
});

Route::middleware('auth:sanctum')->controller(dentistregistercontroller::class)->group(function() {
    Route::get('/dentists','index')->name('index');
    Route::post('dentistlogout', 'logout');
    Route::post('/dentists/getprofile','profile');
    Route::post('/dentists/update_profile','updade_profile');
    Route::delete('/dentists/delete_account','delete_account');
    Route::post('/dentists/updade_password','updade_password');


});
Route::middleware('auth:sanctum')->controller(ChatController::class)->group(function() {
   Route::post('/chatuser','create_user');
   Route::post('/chatdoctor','create_doctor');
   Route::get('/chat','index');
   Route::post('/chat/{id}/send','sendmessage');
   Route::get('/chat/{id}/message','getmessage');


});
Route::middleware('auth:sanctum')->controller(Homecontroller::class)->group(function() {
    Route::get('/showimage','showimage');
    Route::get('/search doctor','showdoctorwithname');
    Route::get('/showdoctorrate','showdentistrate');
    Route::post('/add/ratedoctor','addrate');
    Route::post('/add/reserv','bookappointment');

 });
