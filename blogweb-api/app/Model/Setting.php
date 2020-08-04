<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Config;

class Setting extends Model
{
    // Table Name //
     protected $table = 'settings';

     // Fileds Name //
     protected $fillable = ['key', 'value'];

     public static function get($key)
     {
         $setting = new self();
         $entry = $setting->where('key', $key)->first();
         if(!$entry) {
             return;
         }
         return $entry->value;
     }

     public static function set($key, $value = null)
     {
         $setting = new self();
         $entry = $setting->where('key', $key)->firtOrFail();
         $entry->value = $value;
         $entry->saveOrFail();
         Config::set('key', $value);
         if(Config::get($key) == $value) {
             return true;
         }
         return false;
     }
}
