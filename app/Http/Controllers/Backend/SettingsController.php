<?php

namespace App\Http\Controllers\Backend;

use App\Models\Page;
use App\Models\LinkSosmed;
use App\Models\PageDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SettingsController extends Controller
{
    public function indexSosmed()
    {
        $sosmed = LinkSosmed::first();
        return view('backend.settings.sosmed', ['link' => $sosmed]);
    }

    public function Update(Request $request, LinkSosmed $linkSosmed)
    {
        $validate = $request->validate([
            'link_instagram' => 'required',
            'link_tiktok' => 'required',
            'link_facebook' => 'required',
            'link_youtube' => 'required',
            'link_twitter' => 'required',
        ]);

        $linkSosmed->update($validate);

        return redirect()->route('admin.setting.sosmed')->withSuccess(__("The Link Social Media was successfully Update."));
    }
}
