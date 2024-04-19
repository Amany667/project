<?php

namespace App\Http\Controllers\API;

use Validator;
use Carbon\Carbon;
use App\Models\Dentist;
use App\Models\Appointment;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Mail\Message;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use App\Models\Dentistpasswordreset;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rules\Password;

class dentistregistercontroller extends Controller
{
    public function index()
    {
        $users = Dentist::all();
        return $this->sendResponse($users, 'Displaying all users data');
    }

    public function register(Request $request)
    {


        /*
        $validator = Validator::make($request->all(), [

            'firstname'  => ['required', 'string', 'max:255'],
            'secondname' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:dentists'],
            'phonenumber'=>['required','regex:/^01[0125][0-9]{8}$/','unique:dentists'],
            'password' => 'required',
            'confirmpassword' => 'required|same:password',
            'covernate' => ['required', 'string', 'max:255'],
            'region' => ['required', 'string', 'max:255'],
            'youraddress'=> ['required', 'string', 'max:255'],
           // 'personalphoto'=> ['required', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],
           // 'syndicatedphoto'=> ['required', 'mimes:jpeg,png,jpg,gif,svg', 'max:2048'],


          //  'day'=>['required', 'string','max:255'],
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        */

        $rules = [
            'starthour' => ['required', 'date_format:H:i'],
            'endhour' => 'date_format:H:i|after:starthour',
            'day' => 'required|in:Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday',

        ];
       $Appointments = json_decode($request->input("Appointments"),true);
        foreach ( $Appointments as $day => $time){
           $time['day'] = $day;
            $validator = Validator::make($time, $rules);
            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 400);
            }
        }













        /*
        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = Dentist::create($input);



          //  $request = json_decode($request->getContent());
            $image = $request->personalphoto;  // your base64 encoded
            $image = Str::replace('data:image/png;base64,', '', $image);
            $image = Str::replace(' ', '+', $image);
            $personimage = Str::random(10).'.'.'png';
            \File::put(base_path(). '\public\storage\\' . $personimage, base64_decode($image,true));
*/


        $personimage=Str::random(32).".".$request->personalphoto->getClientOriginalExtension();
      $synticaed=Str::random(32).".".$request->syndicatedphoto->getClientOriginalExtension();

        $user= Dentist::create([
            'firstname'  => $request->firstname,
            'secondname' => $request->secondname,
            'email' => $request->email,
            'phonenumber'=>$request->phonenumber,
            'password' => bcrypt($request['password']),
            'confirmpassword' => $request->confirmpassword,
            'covernate' => $request->covernate,
            'region' =>$request->region,
            'youraddress'=> $request->youraddress,
            'personalphoto'=>$personimage ,
            'syndicatedphoto'=> $personimage,


        ]);
        $Appointments = json_decode($request->input("Appointments"),true);
        foreach($Appointments as $day=>$time)
        {
            Appointment::create([
                'id-den'=> $user->dentist_id,
                'day'=> $day,
                'starhour'=>$time["starthour"],
                'endhour'=> $time["endhour"],
            ]);


        }
        /*
       Appointment::create([
        'id-den'=> $user->dentist_id ,
          'day'=> $request->day,
         'starhour'=>$request->starhour,
          'endhour'=> $request->endhour,

       ]);
       */





        Storage::disk('public')->put($personimage,file_get_contents($request->personalphoto));
        Storage::disk('public')->put($synticaed,file_get_contents($request->syndicatedphoto));

        $success['token'] =  $user->createToken('MyApp')->plainTextToken;
        $success['name'] =  $user->firstname ;

        return $this->sendResponse($success, 'User register successfully.');
    }

    public function login(Request $request)
    {
        if(Auth('dentist')->attempt(['email' => $request->email, 'password' => $request->password]))
        {
            $user = Auth('dentist')->user();
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



    public function forget(Request  $request){

        $request->validate([

            'email' => ['required',  'email'],

        ]);



        $users = Dentist::where('email',$request->input('email'))->first();
        if(!$users || !$users->email){

            return response([
                'message'=>'no record found',
                'status'=>'failed'
            ],404);

        }
        $resetpasswordtoken=str_pad(random_int(1,9999),4,'0',STR_PAD_LEFT);

        if(!$userpassrest = Dentistpasswordreset::where('email',$users->email)->first()){
            Dentistpasswordreset::create([
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

    public function reset(Request $request){
        $attribute=$request->validate( [    'email' => ['required',  'email'],
        'token'=>['required' ],
             'password'=>['required','min:8','confirmed' ],
            ]);
        $user=Dentist::where('email',$attribute['email'])->first();
        if(!$user){

            return response([
                'message'=>'no record found',
                'status'=>'incorrect email address provied'
            ],404);


        }
        $resetrequest = Dentistpasswordreset::where('email',$user->email)->first();
        if(!$resetrequest || $resetrequest->token != $request->token){

            return response([
                'message'=>'an error occurd.please try again',
                'status'=>'token mismatched'
            ],400);


        }
        $user->fill([
            'password'=>Hash::make($attribute['password']),
            'confirmpassword'=>$attribute['password'],
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
