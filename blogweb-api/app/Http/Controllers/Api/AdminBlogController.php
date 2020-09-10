<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Blog;
use Image;
use Auth;
use App\User;
use File;
use App\Http\Controllers\Api\BaseController as BaseController;
use Validator;

class AdminBlogController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::where('blogs.user_id', Auth::user()->id)
        ->select('blogs.*','user.first_name','user.last_name')
        ->join('users as user', 'blogs.user_id', '=', 'user.id')
        ->orderBy('blogs.id', 'desc')
        ->get();
        foreach($blogs as $blog){
            if($blog->image){
                $image = $blog->image;
            }else{
                $image = 'no-image.jpg';
            };
            $blog['image'] = url('public/blogs_images/'.$image);
        }

        return $this->sendResponse($blogs, 'Blogs retrieved successfully.');

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            //'image'  => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'description' => 'required'
           ]);

        //    if($validator->fails()){
        //     return $this->sendError('Validation Error.', $validator->errors());
        // }
        if ($validator->fails()) {
            return $this->sendError('Validation Error.',$validator->errors()->first() ,422);
        }

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('blogs_images');
            $img = Image::make($image->getRealPath());
            $img->resize(1010, 675)->save($destinationPath.'/'.$image_name);
           // $image->move($destinationPath, $image_name);
        }

        $blog = new Blog;
        $blog->title = $request->title;
        $blog->category_id = $request->category_id;
        $blog->image = isset($image_name) ? $image_name : '';
        $blog->description = $request->description;
        $blog->user_id = Auth::user()->id;
        $blog->is_featured = $request->is_featured;
        $blog->is_active = $request->is_active;
        $blog->save();

        return $this->sendResponse($blog, 'Blog created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $blog = Blog::where('blogs.id', $id)
                ->select('blogs.*', 'users.first_name','users.last_name')
                ->join('users', 'users.id', '=', 'blogs.id')->first();
        $blog['image'] = url('public/blogs_images/'.$blog->image);

        if (is_null($blog)) {
            return $this->sendError('Blog not found.');
        }


        return $this->sendResponse($blog, 'Blog retrieved successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $blog = Blog::where('blogs.id', $id)->first();
        $blog['image'] = url('public/blogs_images/'.$blog->image);

        if (is_null($blog)) {
            return $this->sendError('Blog not found.');
        }

        return $this->sendResponse($blog, 'Blog retrieved successfully.');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // $this->validate($request, [
        //     'image'  => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048'
        //    ]);

        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'description' => 'required'
        ]);


        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }


        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $image_name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('blogs_images');
            $img = Image::make($image->getRealPath());
            $img->resize(1010, 675)->save($destinationPath.'/'.$image_name);

            //$image->move($destinationPath, $image_name);

        }

            $blog = Blog::find($id);
            $blog->title = $request->title;
            if($request->hasFile('image') == null){
            }else{
                $blog->image = $image_name;
            }

            $blog->description = $request->description;
            $blog->user_id = Auth::user()->id;
            $blog->category_id = $request->category_id;
            $blog->is_featured = $request->is_featured;
            $blog->is_active = $request->is_active;
            $blog->save();
            return $this->sendResponse($blog, 'Blog updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = Blog::find($id);
        $file= $blog->image;
        $filename = public_path().'public/blogs_images/'.$file;
        File::delete($filename);
        $blog->delete();
        return $this->sendResponse($blog, 'Blog deleted successfully.');
    }
}
