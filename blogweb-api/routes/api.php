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

// Blog //

Route::get('blogs', 'Api\BlogController@index');
Route::get('blog/{id}', 'Api\BlogController@show');
Route::get('featured_blogs', 'Api\BlogController@featured_blogs');
// Route::get('gallery', 'Api\BlogController@gallery');
Route::get('recent_blogs', 'Api\BlogController@recent_blogs');

// Category //

Route::get('categories', 'Api\CategoryController@index');
Route::get('category/{id}', 'Api\CategoryController@show');
Route::post('category', 'Api\CategoryController@store');
Route::put('category/{id}', 'Api\CategoryController@store');
Route::delete('category/{id}', 'Api\CategoryController@destroy');

// About //

Route::get('about', 'Api\AboutController@index');

// Page //

Route::get('page/{slug}', 'Api\PageController@show');

// Contact and Send Email //

Route::post('contact', 'Api\ContactController@contact');

// Login //

Route::post('login', 'Api\AuthController@login');
Route::post('register', 'Api\AuthController@register');

// Admin Section //

Route::group(['middleware' => ['auth:api']], function(){

    // Manage Blog //
    Route::get('adminblogs', 'Api\AdminBlogController@index');
    Route::get('adminblog/{id}', 'Api\AdminBlogController@show');
    Route::get('editblog/{id}', 'Api\AdminBlogController@edit');
    Route::post('createblog', 'Api\AdminBlogController@store');
    Route::post('updateblog/{id}', 'Api\AdminBlogController@update');
    Route::delete('deleteblog/{id}', 'Api\AdminBlogController@destroy');

    // Manage Category //
    Route::get('adminCategories', 'Api\CategoryController@index');
    Route::post('createCategory', 'Api\CategoryController@store');
    Route::get('editCategory/{id}', 'Api\CategoryController@edit');
    Route::post('updateCategory/{id}', 'Api\CategoryController@update');
    Route::delete('deleteCategory/{id}', 'Api\CategoryController@destroy');

    // Manage Page //
    Route::get('pages', 'Api\PageController@index');
    Route::post('createPage', 'Api\PageController@store');
    Route::get('editPage/{id}', 'Api\PageController@edit');
    Route::post('updatePage/{id}', 'Api\PageController@update');
    Route::delete('deletePage/{id}', 'Api\PageController@destroy');

     // Manage Page //
     //Route::get('menus', 'Api\MenuController@index');
    Route::post('createMenu', 'Api\MenuController@store');
    Route::get('editMenu/{id}', 'Api\MenuController@edit');
    Route::post('updateMenu/{id}', 'Api\MenuController@update');
    Route::delete('deleteMenu/{id}', 'Api\MenuController@destroy');

     // Settings //

    // Route::get('/settings', 'Api\SettingController@index');
    // Route::post('/settings', 'Api\SettingController@update');
});


