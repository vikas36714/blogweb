<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Model\Menu;
use Validator;

class MenuController extends BaseController
{
    public function index()
    {
        $menus = Menu::all();

        if(empty($menus)){
            return $this->sendError($menus, 'Menus not found');
        }
        return $this->sendResponse($menus, 'Menus retrieved successfully.');
    }

    // Store Data //

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'link' => 'required',
           ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $menu = new Menu;
        $menu->title = $request->title;
        $menu->link = $request->link;
        $menu->save();

        return $this->sendResponse($menu, 'Menu created successfully.');
    }

    public function edit($id)
    {
        $menu = Menu::where('menus.id', $id)->first();

        if (is_null($menu)) {
            return $this->sendError('Menu not found.');
        }

        return $this->sendResponse($menu, 'Menu retrieved successfully.');
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
        $menu = Menu::find($id);
        $menu->title = $request->title;
        $menu->link = $request->link;
        $menu->save();
        return $this->sendResponse($menu, 'Menu updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $menu = Menu::find($id);
        $menu->delete();
        return $this->sendResponse($menu, 'Menu deleted successfully.');
    }

}
