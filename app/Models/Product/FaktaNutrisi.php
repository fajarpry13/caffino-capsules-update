<?php

namespace App\Models\Product;

use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FaktaNutrisi extends Model
{
    use HasFactory;

    protected $table = 'product_fakta_nutrisi';

    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
