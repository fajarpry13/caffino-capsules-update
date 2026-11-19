<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Product_bk;
use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Http\Controllers\Controller;
use App\Models\Product\FaktaNutrisi;

class ProductController extends Controller
{

    public $all;

    public function __construct() 
    {
        $this->all = Product::with(['faktaNutrisi', 'buyNow'])->publish()->orderBy('index', 'ASC')->get();
    }

    public function index($slug = null)
    {
        // dd($this->all);
        $products = $this->all;
        $current = null;

        foreach($products as $product) {
            if(empty($slug)) {
                return redirect(route('frontend.product', ['slug' => $product->slug]));
            } else if($product->slug == $slug) {
                $current = $product;
                break;
            }
        }

        return view('frontend.product', compact('products', 'current'));
    }
}
