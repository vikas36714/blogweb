<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Category;
use Validator;
use Auth;
use App\Http\Controllers\Api\BaseController as BaseController;

class CategoryController extends BaseController
{
    //public $successStatus = 200;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::orderBy('id', 'desc')->get();
        return $this->sendResponse($categories, 'Categories retrieved successfully');

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
            'category_name' => 'required',
            //'image'  => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
           ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $category = new Category;
        $category->category_name = $request->category_name;
        $category->save();

        return $this->sendResponse($category, 'Category created successfully.');
    }

    public function edit($id)
    {
        $category = Category::where('categories.id', $id)->first();

        if (is_null($category)) {
            return $this->sendError('Category not found.');
        }

        return $this->sendResponse($category, 'Category retrieved successfully.');
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
        $category = Category::find($id);
        $category->category_name = $request->category_name;
        $category->save();
        return $this->sendResponse($category, 'Category updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        $category->delete();
        return $this->sendResponse($category, 'Category deleted successfully.');
    }
}
