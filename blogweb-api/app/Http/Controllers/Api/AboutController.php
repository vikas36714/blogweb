<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Model\About;
use App\Model\OurTeam;

class AboutController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $abouts = About::first();
        $abouts['image'] = url('public/blogs_images/'.$abouts->image);
        return $this->sendResponse($abouts, 'About Content retrieved successfully');
    }

    public function ourTeam()
    {
        $ourTeams = Ourteam::get();
        foreach($ourTeams as $ourTeam){
            $ourTeam['image'] = url('public/blogs_images/'.$ourTeam->image);
        }
        return $this->sendResponse($ourTeams, 'Our Team retrieved successfully');
    }


}
