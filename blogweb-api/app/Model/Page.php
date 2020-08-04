<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    protected $fillable = [
        'menu_id',
        'title',
        'slug',
        'description',
        'is_active',
    ];
}
