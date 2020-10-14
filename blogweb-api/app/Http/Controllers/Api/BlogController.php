<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Blog;
use App\Model\Gallery;
use App\Model\Category;
use App\Http\Controllers\Api\BaseController as BaseController;

class BlogController extends BaseController
{
    public $successStatus = 200;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs = Blog::where('blogs.is_active', 1)
        ->join('users as user', 'blogs.user_id', '=', 'user.id')
        ->leftJoin('categories as category', 'blogs.category_id', '=', 'category.id')
        ->select('blogs.*','category.category_name','user.first_name','user.last_name')
        ->get();
        foreach($blogs as $blog){
            $blog['image'] = url('public/blogs_images/'.$blog->image);
        }
        return $this->sendResponse($blogs, 'Blogs retrieved successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $blog = Blog::where('blogs.is_active', 1)
                    ->where('blogs.id', $id)
                    ->join('users as user', 'blogs.user_id', '=', 'user.id')
                    ->leftJoin('categories as category', 'blogs.category_id', '=', 'category.id')
                    ->select('blogs.*','category.category_name','user.first_name','user.last_name')
                    ->first();
        $blog['image'] = url('public/blogs_images/'.$blog->image);

        return $this->sendResponse($blog, 'Blog retrieved successfully');
    }



    public function featured_blogs()
    {
        $featured_blogs = Blog::where('blogs.is_active', 1)
            ->where('blogs.is_featured', 1)
            ->join('users as user', 'blogs.user_id', '=', 'user.id')
            ->leftJoin('categories as category', 'blogs.category_id', '=', 'category.id')
            ->select('blogs.*','category.category_name','user.first_name','user.last_name')
            ->get();
        foreach($featured_blogs as $featured_blog){
            $featured_blog['description'] = substr($featured_blog['description'],0,200);
            $featured_blog['image'] = url('public/blogs_images/'.$featured_blog->image);
        }
        return $this->sendResponse($featured_blogs, 'Featured blog retrieved successfully');
    }

    public function recent_blogs()
    {
        $recentposts = Blog::where('blogs.is_active', 1)
                    ->orderBy('blogs.created_at', 'desc')
                    ->take(3)
                    ->join('users as user', 'blogs.user_id', '=', 'user.id')
                    ->leftJoin('categories as category', 'blogs.category_id', '=', 'category.id')
                    ->select('blogs.*','category.category_name','user.first_name','user.last_name')
                    ->get();
        foreach($recentposts as $recentpost){
            $recentpost['title'] = substr($recentpost['title'],0,15);
            $recentpost['description'] = substr($recentpost['description'],0,30);
            if($recentpost->image){
                $recentpost['image'] = url('public/blogs_images/'.$recentpost->image);
            }else{
                $recentpost['image'] = url('public/blogs_images/no-image.png');
            }

        }
        return $this->sendResponse($recentposts, 'Recent blog retrieved successfully');
    }

    public function getCategories()
    {
        $categories = Category::where('is_active', 1)->orderBy('id', 'desc')->get();
        return $this->sendResponse($categories, 'Categories retrieved successfully');
    }

    // public function gallery()
    // {
    //     $gallery_images = Gallery::where('blogs.is_featured', 1)->orderBy('created_at', 'desc')
    //                 ->join('users as user', 'galleries.user_id', '=', 'user.id')
    //                 ->leftJoin('blogs as blog', 'galleries.blog_id', '=', 'blog.id')
    //                 ->select('galleries.*','user.first_name','user.last_name')->get();
    //     foreach($gallery_images as $gallery_image){
    //         $gallery_image['image'] = url('public/blogs_images/'.$gallery_image->image);

    //     }
    //     return response()->json($gallery_images, $this-> successStatus);
    // }

}
