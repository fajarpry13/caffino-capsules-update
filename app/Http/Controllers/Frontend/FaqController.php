<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Faq;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FaqController extends Controller
{
    public function index()
    {
        $faq = Faq::orderBy('index', 'ASC')->get();
        return view('frontend.faq', ['faq' => $faq]);
    }
}
