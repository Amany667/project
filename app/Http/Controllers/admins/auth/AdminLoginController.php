<?php

namespace App\Http\Controllers\admins\auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AdminLoginController extends Controller
{
   public function login(){
    return view ('admins.auth.login');
   }


   public function check(request $request){
    $request->validate([
        'email' => ['required', 'string'],
        'password'=>['required', 'string'],
    ]);
    if(Auth::guard('admin')->attempt(['email'=>$request->email,'password'=>$request->password])){
        return redirect()->route('admin.dashboard.home');

    }else{
        return redirect()->back()->withinput(['email'=>$request->email])->with('errorresponse','thes credentials do not match');
    }



   }
   public function logout(){
    Auth::guard('admin')->logout();
    return redirect()->route('user.profile');
   }


}
