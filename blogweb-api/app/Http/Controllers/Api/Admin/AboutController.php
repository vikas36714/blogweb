<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\About;
use Image;
use Auth;
use App\Http\Controllers\Api\BaseController as BaseController;

class AboutController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user()->role == 'admin'){
            $abouts = About::first();
            $abouts['image'] = url('public/blogs_images/'.$abouts->image);
            return $this->sendResponse($abouts, 'About Content retrieved successfully');
        }
    }

    public function update(Request $request)
    {
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('blogs_images');
            $img = Image::make($image->getRealPath());
            $img->resize(1360, 901)->save($destinationPath.'/'.$image_name);
        }

        $about = About::find($request->id);

        if($request->hasFile('image') == null){
        }else{
            $about->image = $image_name;
        }
        if(Auth::user()->role == 'admin'){
            $about->heading = $request->heading;
            $about->title = $request->title;
            $about->title = $request->title;
            $about->description = $request->description;
            $about->save();
            return $this->sendResponse($about, 'About Data updated successfully.');
        }
    }

}
