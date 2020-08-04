<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    protected $fillable = [
        'title',
        'user_id',
        'category_id',
        'description',
        'image',
        'is_featured',
        'is_active',
    ];
}
