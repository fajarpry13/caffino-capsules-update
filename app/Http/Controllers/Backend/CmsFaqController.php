<?php

namespace App\Http\Controllers\Backend;

use App\Models\Faq;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CmsFaqController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $faq = Faq::orderBy('index', 'ASC')->get();
        return view('backend.pages.faq.index', ['faq' => $faq]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.pages.faq.create');
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
            'questions' => 'required',
            'answer' => 'required'
        ]);

        faq::create($validate);

        return redirect()->route('admin.faq')->withFlashSuccess(__("The FAQ was successfully created."));
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
    public function edit(Faq $faq)
    {
        return view('backend.pages.faq.edit', ['faq' => $faq]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Faq $faq)
    {
        $validate = $request->validate([
            'questions' => 'required',
            'answer' => 'required'
        ]);

        $faq->update($validate);

        return redirect()->route('admin.faq')->withFlashSuccess(__("The FAQ was successfully update."));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Faq $faq)
    {
        $faq->delete();

        return redirect()->route('admin.faq')->withFlashSuccess(__("The FAQ was successfully Deleted."));
    }

    public function SortFaq(Request $request)
    {
        $faq = Faq::orderBy('index', 'ASC')->get();
        $id = $request->input('id');
        $sorting = $request->input('sorting');
        foreach ($faq as $item) {
            Faq::where('id', '=', $id)->update(array('index' => $sorting));
        }
        // return response()->json(['data' => Product::orderBy('index', 'ASC')->get('index')]);
    }
}
