<?php

namespace App\Http\Controllers\Backend\Product;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Product\FaktaNutrisi;

class FaktaNutrisiController extends Controller
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
            'name' => 'required',
            'value' => 'required'
        ]);
        FaktaNutrisi::create($validate);

        return redirect()->back()->withFlashSuccess(__('The Fakta Nutrisi was successfully create.'));
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
        $data = FaktaNutrisi::where('id', $id)->get();
        return response()->json($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // dd($request);
        $validate = $request->validate([
            'name' => 'required',
            'value' => 'required'
        ]);

        FaktaNutrisi::where('id', $id)->update($validate);

        // return  redirect()->route('admin.product.detail', $request->product_id)->withFlashSuccess(__('The Fakta Nutrisi was successfully Update.'));
        return  redirect()->back()->withFlashSuccess(__('The Fakta Nutrisi was successfully Update.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(FaktaNutrisi $FaktaNutrisi)
    {
        $FaktaNutrisi->delete();

        // return  redirect()->route('admin.product.detail', $FaktaNutrisi->product_id)->withFlashSuccess(__('The Fakta Nutrisi was successfully Delete.'));        
        return  redirect()->back()->withFlashSuccess(__('The Fakta Nutrisi was successfully Delete.'));        
    }
}
