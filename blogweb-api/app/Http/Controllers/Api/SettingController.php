<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Contracts\Cache\Factory;
use App\Http\Controllers\Api\BaseController as BaseController;
use File;
use Auth;
use App\Model\Setting;

class SettingController extends BaseController
{

    public function index()
    {
        $settings = Setting::get();

        return $this->sendResponse($settings, 'settings retrieved successfully.');

    }

    /**
     * Updates the settings.
     *
     * @param int                                 $id
     * @param \Illuminate\Contracts\Cache\Factory $cache
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Requset $request)
    {
        if ($request->has('site_logo') && ($request->file('site_logo'))) {

            if (config('settings.site_logo') != null) {
                delete(config('settings.site_logo'));
            }

            $logo = $request->file('site_logo');

            $logo_name = time() . '.' . $logo->getClientOriginalExtension();

            $destinationPath = public_path('site_logo');

            $img = Image::make($image->getRealPath());

            $img->resize(50, 50)->save($destinationPath.'/'.$image_name);

            Setting::set('site_logo', $img);

        } elseif ($request->has('site_favicon') && ($request->file('site_favicon'))) {

            if (config('settings.site_favicon') != null) {
                delete(config('settings.site_favicon'));
            }

            $site_favicon = $request->file('site_favicon');

            $favicon_name = time() . '.' . $site_favicon->getClientOriginalExtension();

            $destinationPath = public_path('site_favicon');

            $img = Image::make($image->getRealPath());

            $img->resize(50, 50)->save($destinationPath.'/'.$image_name);

            Setting::set('site_favicon', $favicon);

        } else {

            $keys = $request->except('_token');

            foreach ($keys as $key => $value)
            {
                Setting::set($key, $value);
            }
        }
        return $this->sendResponse('true','Setting updated successfully.');
    }
}
