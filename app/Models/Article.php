<?php

namespace App\Models;

use App\Domains\Auth\Models\User;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Article extends Model
{
    use HasFactory, Sluggable;

    protected $guarded = ['id'];

    public function isPublish()
    {
        return $this->is_published;
    }

    public function scopePublish($query, $published = true)
    {
        return $query->where('is_published', $published);
    }

    public function getPictureAttribute()
    {
        return $this->getPicture();
    }

    public function getPicture()
    {
        return url(str_replace(' ', '%20', $this->image));
    }

    /**
     * Get the user that owns the Article
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
}
