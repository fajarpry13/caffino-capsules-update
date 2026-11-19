<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banner extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function isPublish()
    {
        return $this->is_published;
    }

    public function scopePublish($query, $published = true)
    {
        return $query->where('is_published', $published);
    }
}
