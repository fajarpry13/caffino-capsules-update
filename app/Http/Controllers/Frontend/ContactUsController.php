<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Inbox;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ContactUsController extends Controller
{
    public function index()
    {
        return view('frontend.contact');
    }

    public function sendContactUs(Request $request)
    {
        $validate = $request->validate([
            'name' => 'required|max:120',
            'email' => 'required|email:rfc,dns',
            'phone' => 'required|min:11|numeric',
            'subject' => 'required|max:150',
            'message' => 'required'
        ]);

        Inbox::create($validate);

        return redirect()->back()->withSuccess(__("Terima Kasih, $request->name"));;
    }
} 
