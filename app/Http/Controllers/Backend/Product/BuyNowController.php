<?php

namespace App\Http\Controllers\Backend\Product;

use Illuminate\Http\Request;
use App\Models\Product\BuyNow;
use App\Http\Controllers\Controller;

class BuyNowController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'product_id' => 'required',
            'link_tokped' => 'required',
            'link_shopee' => 'required',
            'link_blibli' => 'required',
            'link_bukalapak' => 'required',
        ]);

        BuyNow::create($validate);

        return redirect()->back()->withFlashSuccess(__('The Link E-Commerce was successfully create.'));
        // return redirect()->route('admin.product.edit', $request->product_id)->withFlashSuccess(__('The Link E-Commerce was successfully create.'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BuyNow $buynow)
    {
        $validate = $request->validate([
            'link_tokped' => 'required',
            'link_shopee' => 'required',
            'link_blibli' => 'required',
            'link_bukalapak' => 'required',
        ]);

        $buynow->update($validate);

        return redirect()->back()->withFlashSuccess(__('The Link E-Commerce was successfully update.'));
        // return redirect()->route('admin.product.edit', $buynow->product_id)->withFlashSuccess(__('The Link Olshop was successfully update.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
