<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Contact;
use Mail;
use Validator;
use App\Http\Controllers\Api\BaseController as BaseController;

class ContactController extends BaseController
{
    public $successStatus = 200;

    public function contact(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email'
        ]);
        
        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors(), 422);
        }
        //Contact::create($request->all());
        $contactData = new Contact;
        $contactData->name = $request->name;
        $contactData->email = $request->email;
        $contactData->subject = $request->subject;
        $contactData->message = $request->message;
        $contactData->save();
        $this->sendemail($contactData);;
        return $this->sendResponse($contactData->name,'Email Sent with attachment. Check your inbox.');
    }

    public function sendemail($contactData)
    {
        $data = array(
                    'name'=> $contactData['name'],
                    'email'=> $contactData['email'],
                    'subject'=> $contactData['subject'],
                    'messages'=> $contactData['message']
                );
      Mail::send('mail', $data, function($mail_message) {
         $mail_message->to('vikas36714@gmail.com', 'Tutorials')
                    ->subject('Contact Form');
         $mail_message->from('vikas36714@gmail.com','Vikas gupta');
      });
    }

}
