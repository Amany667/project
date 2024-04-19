<?php

namespace App\Http\Controllers\admins;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AdminhomeController extends Controller
{
    public function index(){
        return view ('admins.adminprofile');
    }
}
