<?php

namespace App\Http\Controllers\API;

use Validator;
use App\Models\User;
use App\Models\Dentist;
use Illuminate\Http\Request;
use App\Models\Rating_doctors;
use App\Models\Radiology;
use App\Models\appoin;
use App\Models\reservation;
use App\Models\Rating_radiology;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class Homecontroller extends Controller
{
    public function showimage(Request  $request){
        $user = $request->user()->profileimage;
        if(!$user){
            $user = $request->user()->personalphoto;
        }

        return response()->json($user,200);
    }

    public function showdoctorwithname(Request  $request){
        $request->validate([
           'name' => ['string', 'max:255'],

        ]);
        $doctor= Dentist::where('firstname',$request->input('name'))->first();

        if(!$doctor){
            $doctor= Dentist::where('email',$request->input('name'))->first();
            if($doctor){
                $doctor= Dentist::where('email',$request->input('name'))->get();
                return response()->json($doctor,200);
              }
              else{
                return response()->json(["message"=>"the search not found"],200);
              }
        }
        if($doctor){
            $doctor= Dentist::where('firstname',$request->input('name'))->get();
            return response()->json($doctor,200);
          }
    }
    public function addrate(Request  $request){
        $request->validate([
            'doctor_rating' => 'required',
            'comment'=>'required',
            'dentist_id'=>'required',

         ]);
        $user = $request->user()->id;
        $star_rated=$request->input('doctor_rating');
        $comment=$request->input('comment');
        $dentist_id=$request->input('dentist_id');
        $existingrate=Rating_doctors::where('user_id',$user)->where('doctor_id',$dentist_id)->first();
        if($existingrate){
            $existingrate->star_rated=$star_rated;
            $existingrate->comment=$comment;
            $existingrate->save();

        }else{
            Rating_doctors::create([
                'user_id'=>$user,
                'doctor_id'=>$dentist_id,
                'star_rated'=>$star_rated,
                'comment'=>$comment,
            ]);
        }
        return response()->json(["message"=>"add rate and comment successuflly "],200);
    }
    public function showdentistrate(Request  $request){
        $user=$request->user()->id;
        if($user){
            $results = Dentist::join('rating_doctors', 'dentists.dentist_id', '=','doctor_id')
            ->select('dentists.personalphoto', 'dentists.firstname', 'dentists.secondname','rating_doctors.comment', DB::raw('AVG(rating_doctors.star_rated) as average_stars'))
            ->groupBy('dentists.dentist_id', 'rating_doctors.comment')
            ->get();
        }else{
            $results = Radiology::join('rating_radiologies', 'radiology center.radio-id', '=','reserv_id')
            ->select('radiology center.personal photo', 'radiology center.name','rating_radiologies.comment', DB::raw('AVG(rating_radiologies.star_rated) as average_stars'))
            ->groupBy('radiology center.radio-id','rating_radiologies.comment')
            ->get();

        }

         return response()->json($results, 200);
    }
    public function bookappointment(Request $request){
        $request->validate([
            'day' => 'required',
            'time'=>'required',
            'email'=>'required',
            'id' =>'required',
            'name_doctor'=>'required',

         ]);
        $user=$request->user()->id;
        $exsist=reservation::where('email patient',$request->user()->email)->first();
        $email   = $request->email;
        $id_den  = $request->id;
        $name   =$request->name_doctor;
        if($exsist){
            $rese=appoin::where('id-reserve',$exsist->id_reserve)->first();
            /*
            $exsist->email_doctor=$email;
            $exsist->den_id=$id_den;
            $exsist->doctor_name=$name;
            $exsist->save();
            */
            reservation::where('id_reserve',$exsist->id_reserve)->update([
                'email_doctor' => $request->email,

                'doctor_name'=>$request->name_doctor,

                'den-id'=>$request->id,
        ]);
        appoin::where('id-reserve',$exsist->id_reserve)->update([
            'day'=>$request->day,

            'time'=>$request->time,


    ]);
/*         $rese->day=$request->day;
            $rese->time=$request->time;
            $rese->save();
            */
            return response()->json(["message"=>"you are update successuflly"], 200);

        }else{
         $reservation = reservation::create([
                'email_doctor' => $request->email,
                'first name'=>$request->user()->firstname ,
                'last name'=>$request->user()->secondname,
                'email patient'=>$request->user()->email,
                'phone patient'=>$request->user()->phone,
                'doctor_name'=>$request->name_doctor,
                'waiting list'=>True,
                'id-patient'=>$request->user()->id,
                'den-id'=>$request->id,
        ]);
        appoin::create([
            'id-reserve'=>$reservation->id,
            'day'=>$request->day,
            'time'=>$request->time,
        ]);

        }
        return response()->json(["message"=>"you are booking successuflly"], 200);
    }
}
