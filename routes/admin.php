<?php


use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admins\AdminhomeController;
use App\Http\Controllers\admins\auth\AdminLoginController;
use App\Http\Controllers\admins\auth\AdminRegisterController;


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
Route::get('/admin/dashboard/home',[AdminhomeController::class,'index'])->name('admin.dashboard.home');
Route::get('/admin/dashboard/login',[AdminLoginController::class,'login'])->name('admin.dashboard.login');
Route::post('/admin/dashboard/login',[AdminLoginController::class,'check'])->name('admin.dashboard.check');
Route::get('/admin/dashboard/register',[AdminRegisterController::class,'register'])->name('admin.dashboard.register');
Route::post('/admin/dashboard/register',[AdminRegisterController::class,'store'])->name('admin.dashboard.store');
Route::post('/admin/dashboard/logout',[AdminLoginController::class,'logout'])->name('admin.dashboard.logout');



