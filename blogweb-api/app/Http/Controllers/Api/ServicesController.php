<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Service;
use App\Model\CoreServices;
use App\Http\Controllers\Api\BaseController;

class ServicesController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $service = Service::first();
        $service['icon'] = url('public/blogs_images/'.$service->thumbnail);
        return $this->sendResponse($service, 'Service retrieved successfully');
    }

    public function coreServices()
    {
        $coreServices = CoreServices::get();
        foreach($coreServices as $coreService){
            $coreService['icon'] = url('public/blogs_images/'.$coreService->icon);
        }
        return $this->sendResponse($coreServices, 'Core Services retrieved successfully');
    }

}
