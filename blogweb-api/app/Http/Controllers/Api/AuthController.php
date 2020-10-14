<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\User;
use Validator;
use App\Http\Controllers\Api\BaseController as BaseController;

class AuthController extends BaseController
{
    public $successStatus = 200;
    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */

    public function login()
    {
        $loginData = [
            'email'=> request('email'),
            'password' => request('password'),
        ];

        $validator = Validator::make($loginData, [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.',$validator->errors()->first() ,422);
        }else{
            if(Auth::attempt(['email' => request('email'), 'password' => request('password'), 'is_active' => 1 ])){
                // The user is active, not suspended, and exists.
                $user = Auth::user();
                $success['currentUser'] = $user->first_name.' '.$user->last_name;
                $success['authToken'] =  $user->createToken('MyApp')-> accessToken;
                return $this->sendResponse($success, 'Logged In.');
            }
            else{
                return $this->sendError('Login Failed','Invalid email or Password',401);
            }
        }
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required',
            'lastName' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'confirmPassword' => 'required|same:password',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.',$validator->errors()->first() ,422);
        }

        unset($request->signup);
        $user = new User;
        $user->first_name = $request->firstName;
        $user->last_name = $request->lastName;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->role = 'user';
        $user->is_active = 1;

        $user->save();
        $success['authToken'] =  $user->createToken('MyApp')-> accessToken;
        // $success['username'] =  $user->username;
        return $this->sendResponse($success, 'Registration form submitted successfully.');
    }

}
