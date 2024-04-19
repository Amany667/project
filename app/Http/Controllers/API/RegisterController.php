<?php

namespace App\Http\Controllers\API;





use Validator;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;

use App\Models\Passwordresets;

use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use App\Http\Requests\ResetPasswordRequest;
use App\Http\Requests\ForgetPasswordRequest;
use Illuminate\Support\Facades\Mail;
use Illuminate\Mail\Message;





class RegisterController extends Controller
{
    public function index()
    {
        $users = User::all();
        return $this->sendResponse($users, 'Displaying all users data');
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstname'  => ['required', 'string', 'max:255'],
            'secondname' => ['required', 'string', 'max:255'],
            'phone'=>['required','regex:/^01[0125][0-9]{8}$/', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'Governate' => ['required', 'string', 'max:255'],
            'region' => ['required', 'string', 'max:255'],
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')->plainTextToken;
        $success['name'] =  $user->name;
        return $this->sendResponse($success, 'User register successfully.');
    }
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password]))
        {
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')->plainTextToken;
            $success['name'] =  $user->firstname;
            return $this->sendResponse($success, 'User login successfully.');
        } else {
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        }
    }
    public function logout()
    {

         auth()->user()->tokens()->delete();
            return response([
                'message'=>'logout sucess',
                'status'=>'sucess'
            ],200);

    }


    public function sendResponse($result, $message)
    {
    	$response = [

            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];
        return response()->json($response, 200);
    }
    public function sendError($error, $errorMessages = [], $code = 404)
    {
    	$response = [

            'success' => false,
            'message' => $error,
        ];
        if (!empty($errorMessages)) {
            $response['data'] = $errorMessages;
        }
        return response()->json($response, $code);
    }


    public function forget(ForgetPasswordRequest $request){

        $request->validate([

            'email' => ['required',  'email'],

        ]);



        $users = User::where('email',$request->input('email'))->first();
        if(!$users || !$users->email){

            return response([
                'message'=>'no record found',
                'status'=>'failed'
            ],404);

        }
        $resetpasswordtoken=str_pad(random_int(1,9999),4,'0',STR_PAD_LEFT);

        if(!$userpassrest = Passwordresets::where('email',$users->email)->first()){
            Passwordresets::create([
                'email'=>$request->email,
                'token' => $resetpasswordtoken,
                'created-at'=>Carbon::now()
            ]);

        }else{
            $userpassrest->update([
                'email'=>$users->email,
                'token' => $resetpasswordtoken,
            ]);
        }

       dump('http://127.0.0.1:8000/api/auth/forget',$resetpasswordtoken);

     /*  $email=$request->input('email');
       Mail::send('forgetpassword', ['token'=>$resetpasswordtoken], function ($message) use($email) {
           $message->subject('reset uour password');
           $message->to( $email);

       });
       */


        return new JsonResponse(['message'=>" a code has been sent to your email address"]);

    }

    public function reset(ResetPasswordRequest $request){
        $attribute=$request->validated();
        $user=User::where('email',$attribute['email'])->first();
        if(!$user){

            return response([
                'message'=>'no record found',
                'status'=>'incorrect email address provied'
            ],404);


        }
        $resetrequest = Passwordresets::where('email',$user->email)->first();
        if(!$resetrequest || $resetrequest->token != $request->token){

            return response([
                'message'=>'an error occurd.please try again',
                'status'=>'token mismatched'
            ],400);


        }
        $user->fill([
            'password'=>Hash::make($attribute['password']),
            'confirm_password'=>$attribute['password'],
        ]);
        $user->save();
        $user->tokens()->delete();
       $resetrequest->delete();



        $token = $user->createToken('authToken')->plainTextToken;




        return response([
            'message'=>'password reset success',
            'status'=>'password reset request'
        ],201);

    }

}
