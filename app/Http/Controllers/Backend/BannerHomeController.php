<?php

namespace App\Http\Controllers\Backend;

use App\Models\Banner;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BannerHomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Banner::latest()->get();
        return view('backend.settings.banner.index', ['banners' => $banners]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.settings.banner.create');
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
            'source' => 'required',
            'source_mobile' => 'required'
        ]);

        if ($request->has('published')) {
            $validate['is_published'] = true;
        } else {
            $validate['is_published'] = false;
        }

        $validate['key'] = 'banner-home';

        Banner::create($validate);

        return redirect()->route('admin.setting.banner')->withFlashSuccess(__("The Banner was successfully created."));
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
    public function edit(Banner $banner)
    {
        return view('backend.settings.banner.edit', ['banner' => $banner]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Banner $banner)
    {
        $validate = $request->validate([
            'source' => 'required',
            'source_mobile' => 'required'
        ]);

        if ($request->has('published')) {
            $validate['is_published'] = true;
        } else {
            $validate['is_published'] = false;
        }

        $banner->update($validate);

        return redirect()->route('admin.setting.banner', $banner)->withFlashSuccess(__("The Banner was successfully update."));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Banner $banner)
    {
        $banner->delete();

        return redirect()->route('admin.setting.banner')->withFlashSuccess(__("The Banner was successfuly Deleted."));
    }

    public function publish(Banner $banner)
    {
        if ($banner->is_published) {
            throw new GeneralException('This banner Already Published');
        }

        $banner->is_published = true;
        $banner->save();

        return redirect()->route('admin.setting.banner')->withflashSuccess('This banner was succesfuly Published');
    }

    public function unpublish(banner $banner)
    {
        if (!$banner->is_published) {
            throw new GeneralException('This banner Already Unpublish');
        }

        $banner->is_published = false;
        $banner->save();

        return redirect()->route('admin.setting.banner')->withflashSuccess('This banner was succesfuly Unpublished');
    }
}
