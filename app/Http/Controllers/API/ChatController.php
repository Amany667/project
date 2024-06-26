<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Chat;
use App\Models\Dentist;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ChatController extends Controller
{
    public function create_user(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'max:255'],
          ]);

          if ($validator->fails()) {
              return $this->sendError('Validation Error.', $validator->errors());
          }
        $user = $request->user();
        $otherperson=Dentist::where('email', '=', $request->email)->first();
        if($otherperson == null){
            return response()->json(['message' =>"the email not found"],200);
        }
        $conversation = Chat::conversations()->between($user, $otherperson);
        if(!isset($conversation)){
            $conversation = Chat::makeDirect()->createConversation([$user, $otherperson]);
        }
        return response()->json($conversation,200);

    }
    public function create_doctor(Request $request){
        $validator = Validator::make($request->all(), [
          'email' => ['required', 'string', 'email', 'max:255'],
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $user = $request->user();
        $otherperson=User::where('email', '=', $request->email)->first();
        if( $otherperson == null){
            return response()->json(['message' =>"the email not found"],200);
        }
        $conversation = Chat::conversations()->between($user, $otherperson);
        if(!isset($conversation)){
            $conversation = Chat::makeDirect()->createConversation([$user, $otherperson]);
        }
       // return($conversation);
        return response()->json($conversation,200);

    }

    public function index(Request $request){
        return $conversations = Chat::conversations()->setParticipant($request->user())->isDirect()->get();

    }

    public function sendmessage(Request $request,$id){
        $conversation = Chat::conversations()->getById($id);


        if (!$conversation) {
            throw new NotFoundHttpException("Conversation not created.");
        }
        $message = Chat::message($request->message)
            ->from($request->user())
            ->to($conversation)
            ->send();

            return response()->json(['message' => $message],200);


    }
    public function getmessage(Request $request,$id){

        $conversation = Chat::conversations()->getById($id);

        if (!$conversation) {
            throw new NotFoundHttpException("Conversation not found.");
        }

        $messages = Chat::conversation($conversation)->setParticipant($request->user())->getMessages();

        return response()->json(['messages' => $messages],200);


    }
    public function sendError($error, $errorMessages = [], $code = 200)
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
}

/*

// app/Http/Controllers/ChatController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Musonza\Chat\Facades\ChatFacade as Chat;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ChatController extends Controller
{
    public function sendMessage(Request $request, $recipientId)
    {
        $conversation = Chat::createConversation([$request->user()->id, $recipientId]);


        if (!$conversation) {
            throw new NotFoundHttpException("Conversation not created.");
        }

        $message = Chat::message($request->input('message'))
            ->from($request->user())
            ->to($conversation)
            ->send();

        return response()->json(['message' => $message]);
    }


}
*/



