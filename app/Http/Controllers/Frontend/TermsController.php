<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Page;
use App\Services\PageService;

/**
 * Class TermsController.
 */
class TermsController
{
    /**
     * @var PageService
     */
    protected $pageService;

    /**
     * TermsController constructor.
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
        $pages = $this->pageService->getPage($code = 'terms');
        $content = $this->pageService->getContent();
        return view('frontend.terms', ['data' => $content]);
    }
}
