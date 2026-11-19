<?php

namespace App\Models\Product;

use App\Models\Product\Product;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BuyNow extends Model
{
    use HasFactory;
    
    protected $table = 'product_buy_now';

    protected $guarded = [];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
