<?php

namespace App\Http\Controllers\Backend\Product;

use Illuminate\Http\Request;
use App\Models\Product\Product;
use App\Exceptions\GeneralException;
use App\Http\Controllers\Controller;
use App\Models\Product\FaktaNutrisi;
use Illuminate\Support\Facades\File;
use Cviebrock\EloquentSluggable\Services\SlugService;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::orderBy('index', 'ASC')->get();
        return view('backend.pages.product.index', ['products' => $products]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.pages.product.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = $request->validate([
            'brand' => 'required',
            'name' => 'required',
            'slug' => 'required|unique:products',
            'description' => 'required',
            'renteng_reguler' => '',
            'pouch_reguler' => '',
            'image' => 'required',
            'icon' => 'required',
            'bg_color' => 'required'
        ]);

        if ($request->has('published')) {
            $validate['published'] = true;
        } else {
            $validate['published'] = false;
        }

        if ($request->has('pack_large')) {
            $validate['pack_large'] = true;
        } else {
            $validate['pack_large'] = false;
        }

        if ($request->has('is_bottle')) {
            $validate['is_bottle'] = true;
        } else {
            $validate['is_bottle'] = false;
        }

        $name = ucwords($request->name);

        $validate['name'] = $name;

        $product = Product::create($validate);

        return redirect()->route('admin.product.detail.create', $product)->withFlashSuccess(__("The Product $name was successfully created."));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function detail(Product $product)
    {
        $FaktaNutrisi = FaktaNutrisi::where('product_id', $product->id)->get();
        return view('backend.pages.product.detail', ['product' => $product, 'FaktaNutrisi' => $FaktaNutrisi]);
    }

    public function createDetail(Product $product)
    {
        $FaktaNutrisi = FaktaNutrisi::where('product_id', $product->id)->get();
        return view('backend.pages.product.detail', ['product' => $product, 'FaktaNutrisi' => $FaktaNutrisi]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $FaktaNutrisi = FaktaNutrisi::where('product_id', $product->id)->get();
        return view('backend.pages.product.edit', ['product' => $product, 'FaktaNutrisi' => $FaktaNutrisi]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $validate = $request->validate([
            'brand' => 'required',
            'name' => 'required',
            'slug' => "required|unique:products,slug,$product->id",
            'description' => 'required',
            'renteng_reguler' => '',
            'pouch_reguler' => '',
            'image' => 'required',
            'icon' => 'required',
            'bg_color' => 'required'
        ]);

        if ($request->has('published')) {
            $validate['published'] = true;
        } else {
            $validate['published'] = false;
        }

        if ($request->has('pack_large')) {
            $validate['pack_large'] = true;
        } else {
            $validate['pack_large'] = false;
        }

        if ($request->has('is_bottle')) {
            $validate['is_bottle'] = true;
        } else {
            $validate['is_bottle'] = false;
        }

        $name = ucwords($request->name);

        $product->update($validate);

        return redirect()->route('admin.product')->withSuccess(__("The Product $name was successfully Update."));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return redirect()->route('admin.product')->withFlashSuccess(__('The Product was successfully Deleted.'));
    }

    public function publish(Product $product)
    {
        if ($product->published){
            throw new GeneralException('This Product Already Published');
        }

        $product->published = true;
        $product->save();

        return redirect()->route('admin.product')->withflashSuccess('This Product was succesfuly Published');
    }

    public function unpublish(Product $product)
    {
        if (!$product->published) {
            throw new GeneralException('This Product Already Unpublished');
        }

        $product->published = false;
        $product->save();

        return redirect()->route('admin.product')->withflashSuccess('This Product was succesfuly Unpublished');
    }

    public function checkSlug(Request $request)
    {
        $slug = SlugService::createSlug(Product::class, 'slug', $request->name);
        // $publicFolder = public_path();
        // $path = $publicFolder . '/source/product/' . $slug;
        // if (!File::exists($path)) {
        //     File::makeDirectory($path, $mode = 0755, true, true);
        // }

        return response()->json(['slug' => $slug]);
    }

    public function SortProduct(Request $request)
    {
        $product = Product::orderBy('index', 'ASC')->get();
        $id = $request->input('id');
        $sorting = $request->input('sorting');
        foreach ($product as $item) {
            Product::where('id', '=', $id)->update(array('index' => $sorting));
        }
    }
}
