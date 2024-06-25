<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;


use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Validation\ValidationException;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/user/profile';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        if ($response = $this->loggedOut($request)) {
            return $response;
        }

        return $request->wantsJson()
            ? new JsonResponse([], 204)
            : redirect('login');
    }
    public function username()
    {
      $value= request()->input('userlogin');
      if(filter_var($value,FILTER_VALIDATE_EMAIL)){
        request()->merge(['email'=>$value]);
        return "email";
      }
      elseif(preg_match("/^[a-z ,.'-]+$/",$value)){
        request()->merge(['name'=>$value]);
        return "name";
      }
      elseif(preg_match("/^01[0125][0-9]{8}$/",$value)){
        request()->merge(['phone'=>$value]);
        return "phone";
      }else{
        request()->merge(['email'=>$value]);
        return "email";
      }
    }

    protected function validateLogin(Request $request)
    {
        $request->validate([
            'userlogin' => 'required|string',
            'password' => 'required|string',
        ],[
            "userlogin.required" =>"the phone / email/ name is required"
        ]);
    }

    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            'userlogin' => [trans('auth.failed')],
        ]);
    }
}
