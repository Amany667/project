<?php

namespace App\Http\Controllers\admins\auth;

use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class AdminRegisterController extends Controller
{
    public function register(){
        return view ('admins.auth.register');
       }


       public function store(request $request){
        $adminkey="admin1";

        if($request->adminkey == $adminkey){
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'adminkey'=>['required','string'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['required', 'string', 'min:8'],
            ]);

            $data=$request->except(["_token","adminkey"]);




           Admin::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'confirm_password' => Hash::make($data['password_confirmation']),
           ]);
          return redirect()->route('admin.dashboard.login');
        }else{
            return redirect()->back()->with('errorresponse',"something went wrong");
        }

       }
}
