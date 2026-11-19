<?php

namespace App\Http\Controllers\Backend;

use App\Models\Page;
use App\Models\PageDetail;
use Illuminate\Http\Request;
use App\Services\PageService;
use App\Http\Controllers\Controller;

class PagesController extends Controller
{
    /**
     * @var PageService
     */
    protected $pageService;

    /**
     * PagesController constructor.
     *
     * @param  PageService  $pageService
     */
    public function __construct(PageService $pageService)
    {
        $this->pageService = $pageService;
    }

    Public function indexHome()
    {
        $pages = $this->pageService->getPage("home");
        $content = $this->pageService->getContent();
        return view('backend.pages.page.index', ['pages' => $pages, 'datas' => $content]);
    }

    public function indexAbout()
    {
        $pages = $this->pageService->getPage("about");
        $content = $this->pageService->getContent();
        return view('backend.pages.page.index', ['pages' => $pages, 'datas' => $content]);
    }

    public function indexContact()
    {
        $pages = $this->pageService->getPage("contact");
        $content = $this->pageService->getContent();
        return view('backend.pages.page.index', ['pages' => $pages, 'datas' => $content]);
    }

    public function indexTerms()
    {
        $pages = $this->pageService->getPage("terms");
        $content = $this->pageService->getContent();
        return view('backend.pages.page.index', ['pages' => $pages, 'datas' => $content]);
    }

    public function edit(PageDetail $PageDetail)
    {
        return view('backend.pages.page.edit', ['data' => $PageDetail]);
    }

    public function update(Request $request, PageDetail $PageDetail)
    {
        $validate = $request->validate([
            'value' => 'required'
        ]);

        $PageDetail->update($validate);

        $page = Page::where('id', $PageDetail->page_id)->first();

        return redirect()->route("admin.pages.$page->code")->withFlashSuccess(__('Successfully update.'));
    }
}
