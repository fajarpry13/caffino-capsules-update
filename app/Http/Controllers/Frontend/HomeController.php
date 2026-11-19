<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Page;
use App\Models\Banner;
use App\Services\PageService;
use App\Models\Product\Product;

/**
 * Class HomeController.
 */
class HomeController
{
    /**
     * @var PageService
     */
    protected $pageService;

    /**
     * HomeController constructor.
     *
     * @param  PageService  $pageService
     */
    public function __construct(PageService $pageService)
    {
        $this->pageService = $pageService;
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        $pages = $this->pageService->getPage($code = 'home');
        $content = $this->pageService->getContent();
        $banner = Banner::Publish()->latest()->get();
        $products = Product::select('name', 'image', 'icon', 'brand', 'index', 'pack_large', 'is_bottle')->publish()->orderBy('index', 'ASC')->get();
        return view('frontend.index', ['products' => $products, 'content' => $content, 'banner' => $banner]);
    }
    public function indexUser()
    {
        return view('frontend.index-bk');
    }
}
