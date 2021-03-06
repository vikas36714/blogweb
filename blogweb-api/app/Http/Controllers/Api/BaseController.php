<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    /* Success response method. */

    public function sendResponse($result, $message)
    {
        $response = [
            'success' => true,
            'data' => $result,
            'message' => $message
        ];

         return response()->json($response, 200);

    }

    // Error  response method. //

    public function sendError($error, $errorMessages = [], $code='')
    {
        $response = [
            'success' => false,
            'message' => $errorMessages
        ];

        if(!empty($errorMessages)){
            $response['data'] = $error;
        }

        return response()->json($response, $code);
    }
}
