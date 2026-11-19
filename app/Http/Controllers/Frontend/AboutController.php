<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Page;
use Illuminate\Http\Request;
use App\Services\PageService;
use App\Http\Controllers\Controller;

class AboutController extends Controller
{

    /**
     * @var PageService
     */
    protected $pageService;

    /**
     * AboutController constructor.
     *
     * @param  PageService  $pageService
     */
    public function __construct(PageService $pageService)
    {
        $this->pageService = $pageService;
    }

    public function index()
    {
        $pages = $this->pageService->getPage($code = 'about');
        $content =  $this->pageService->getContent();
        return view('frontend.about', ['data' => $content]);
    }
}
