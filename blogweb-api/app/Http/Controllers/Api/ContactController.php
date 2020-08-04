<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Contact;
use Mail;

class ContactController extends Controller
{
    public $successStatus = 200;

    public function contact(Request $request)
    {
        //Contact::create($request->all());
        $contactData = new Contact;
        $contactData->name = $request->name;
        $contactData->email = $request->email;
        $contactData->subject = $request->subject;
        $contactData->message = $request->message;
        $contactData->save();
        $this->sendemail($contactData);
        return response()->json(['message' => 'Great success! New Contact created','success' => $contactData->id], $this-> successStatus);
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
         //$mail_message->attach('C:\xampp\htdocs\Angular-Projects\blog-website\api\public\img1.jpg');
         //$mail_message->attach('C:\laravel-master\laravel\public\uploads\test.txt');
         $mail_message->from('vikas36714@gmail.com','Vikas gupta');
      });
      echo "Email Sent with attachment. Check your inbox.";
    }

}
