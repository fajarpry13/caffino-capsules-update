<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Page;
use App\Models\Inbox;
use Illuminate\Http\Request;
use App\Services\PageService;
use App\Services\InboxService;
use App\Models\Product\Product;
use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\Contact\StoreContactRequest;

class ContactController extends Controller
{
    /**
     * @var InboxService
     */
    protected $inboxService, $pageService;

    /**
     * ContactController constructor.
     *
     * @param  InboxService  $inboxService
     */
    public function __construct(InboxService  $inboxService, PageService $pageService)
    {
        $this->inboxService = $inboxService;
        $this->pageService = $pageService;
    }

    public function index()
    {
        $page = $this->pageService->getPage($code = 'contact');
        $content = $this->pageService->getContent();
        $products = Product::select('name', 'image', 'icon', 'brand', 'index')->publish()->orderBy('index', 'ASC')->get();
        return view('frontend.contact', ['data' => $content, 'products' => $products]);
    }

    // public function sendContactUs(StoreContactRequest $request)
    // {
    //     $this->inboxService->store($request->validated());

    //     return redirect()->back()->withSuccess(__("Terima Kasih, $request->name. Kami akan membalas lewat email yang diberikan sesegera mungkin."));
    // }
}
