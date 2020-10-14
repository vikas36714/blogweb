<?php

use Illuminate\Http\Request;
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Authorization, Content-Type");
header("Access-Control-Allow-Methods: DELETE");

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::get('menus', 'Api\MenuController@index');

//------------------------------ Blog Section ----------------------------------//
Route::get('blogs', 'Api\BlogController@index');
Route::get('blog/{id}', 'Api\BlogController@show');
Route::get('featured_blogs', 'Api\BlogController@featured_blogs');
// Route::get('gallery', 'Api\BlogController@gallery');
Route::get('recent_blogs', 'Api\BlogController@recent_blogs');
Route::get('getCategories', 'Api\BlogController@getCategories');

//------------------------------ About  Section ----------------------------------//
Route::get('about', 'Api\AboutController@index');
Route::get('ourTeam', 'Api\AboutController@ourTeam');

//------------------------------ Services Section ----------------------------------//
Route::get('services', 'Api\ServicesController@index');
Route::get('coreServices', 'Api\ServicesController@coreServices');

//------------------------------ Page Section ----------------------------------//
Route::get('page/{slug}', 'Api\PageController@show');

//------------------------------ Contact Section ----------------------------------//
Route::post('contact', 'Api\ContactController@contact');

//------------------------------ Login Section ----------------------------------//
Route::post('login', 'Api\AuthController@login');
Route::post('register', 'Api\AuthController@register');

//------------------------------ Admin Section ----------------------------------//
Route::group(['middleware' => ['auth:api']], function(){

    // Manage Blog //
    Route::get('adminblogs', 'Api\Admin\AdminBlogController@index');
    Route::get('adminblog/{id}', 'Api\Admin\AdminBlogController@show');
    Route::get('editblog/{id}', 'Api\Admin\AdminBlogController@edit');
    Route::post('createblog', 'Api\Admin\AdminBlogController@store');
    Route::post('updateblog/{id}', 'Api\Admin\AdminBlogController@update');
    Route::delete('deleteblog/{id}', 'Api\Admin\AdminBlogController@destroy');

    // Manage Category //
    Route::get('adminCategories', 'Api\Admin\CategoryController@index');
    Route::post('createCategory', 'Api\Admin\CategoryController@store');
    Route::get('getCategory/{id}', 'Api\Admin\CategoryController@show');
    Route::post('updateCategory/{id}', 'Api\Admin\CategoryController@update');
    Route::delete('deleteCategory/{id}', 'Api\Admin\CategoryController@destroy');

    // Manage About Page //
    Route::get('editAbout', 'Api\Admin\AboutController@index');
    Route::post('updateAbout', 'Api\Admin\AboutController@update');

    // Manage User //
    Route::get('users', 'Api\Admin\UserController@index');
    Route::get('currentUser', 'Api\Admin\UserController@currentUser');
    Route::get('editUser/{id}', 'Api\Admin\UserController@edit');
    Route::post('updateUser/{id}', 'Api\Admin\UserController@update');
    Route::delete('deleteUser/{id}', 'Api\Admin\UserController@destroy');

    // Manage Page //
    Route::get('pages', 'Api\Admin\PageController@index');
    Route::post('createPage', 'Api\Admin\PageController@store');
    Route::get('editPage/{id}', 'Api\Admin\PageController@edit');
    Route::post('updatePage/{id}', 'Api\Admin\PageController@update');
    Route::delete('deletePage/{id}', 'Api\Admin\PageController@destroy');

     // Manage Page //
     //Route::get('menus', 'Api\Admin\MenuController@index');
    Route::post('createMenu', 'Api\Admin\MenuController@store');
    Route::get('editMenu/{id}', 'Api\Admin\MenuController@edit');
    Route::post('updateMenu/{id}', 'Api\Admin\MenuController@update');
    Route::delete('deleteMenu/{id}', 'Api\Admin\MenuController@destroy');

     // Settings //

    // Route::get('/settings', 'Api\Admin\SettingController@index');
    // Route::post('/settings', 'Api\Admin\SettingController@update');
});
