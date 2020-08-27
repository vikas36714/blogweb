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
        //return request('password');
        if(Auth::attempt(['username' => request('username'), 'password' => request('password')])){
            $user = Auth::user();
            $success['token'] =  $user->createToken('MyApp')-> accessToken;
            return response()->json(['success' => $success], $this-> successStatus);
        }
        else{
            return response()->json(['error'=>'Unauthorised'], 401);
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
            return $this->sendError('Validation Error.',$validator->errors()->first() ,200);
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
        $success['token'] =  $user->createToken('MyApp')-> accessToken;
        // $success['username'] =  $user->username;
        // return response()->json($success, 'Registration form submitted successfully.');
        return $this->sendResponse($success, 'Registration form submitted successfully.');
    }



}
