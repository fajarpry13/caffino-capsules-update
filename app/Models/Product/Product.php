<?php

namespace App\Models\Product;

use App\Models\Product\BuyNow;
use App\Models\Product\FaktaNutrisi;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory, Sluggable;

    protected $guarded = [];

    public function isPublish()
    {
        return $this->published;
    }

    function isPackLarge ()
    {
        return $this->pack_large;
    }

    function isBottle ()
    {
        return $this->is_bottle;
    }

    public function scopePublish($query, $published = true)
    {
        return $query->where('published', $published);
    }

    public function scopePackLarge($query, $status = true)
    {
        return $query->where('pack_large', $status);
    }

    public function scopeIsBottle($query, $status = true)
    {
        return $query->where('is_bottle', $status);
    }

    public function buyNow()
    {
        return $this->hasOne(BuyNow::class);
    }

    public function faktaNutrisi()
    {
        return $this->hasMany(FaktaNutrisi::class);
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }
}
