<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\Page;
use App\Http\Controllers\Api\BaseController as BaseController;
use Validator;

class PageController extends BaseController
{
    public $successStatus = 200;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pages = Page::orderBy('id', 'desc')->get();
        foreach($pages as $page){
            $page['description'] = strlen($page->description) > 250 ? substr($page->description,0,40)."..." : $page->description;
        }

        if(empty($pages)){
            return $this->sendError($pages, 'Pages not found');
        }

        return $this->sendResponse($pages, 'Pages retrieved successfully.');
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
            'slug' => 'required',
           ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $page = new Page;
        $page->menu_id = $request->menu_id;
        $page->title = $request->title;
        $page->slug = $request->slug;
        $page->description = $request->description;
        $page->is_active = 1;
        $page->save();

        return $this->sendResponse($page, 'Page created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $page = Page::where('slug', $slug)->first();

        if(empty($page)){
            return $this->sendError($page, 'Page not found');
        }

        $page['description'] = strlen($page->description) > 250 ? substr($page->description,0,160)."..." : $page->description;

        return $this->sendResponse($page, 'Page retrieved successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $page = Page::where('pages.id', $id)->first();

        if (is_null($page)) {
            return $this->sendError('Page not found.');
        }

        return $this->sendResponse($page, 'Page retrieved successfully.');
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
        $page = Page::find($id);
        $page->menu_id = $request->menu_id;
        $page->title = $request->title;
        $page->slug = $request->slug;
        $page->description = $request->description;
        $page->is_active = 1;
        $page->save();
        return $this->sendResponse($page, 'Page updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $page = Page::find($id);
        $page->delete();
        return $this->sendResponse($page, 'Page deleted successfully.');
    }
}
