<?php

namespace App\Services;

use App\Models\Page;
use App\Services\BaseService;

class PageService extends BaseService
{
    public $code;
    /**
     * PageService constructor.
     *
     * @param  Page  $page
     */
    public function __construct(Page $page)
    {
        $this->model = $page;
    }

    public function getPage($code)
    {
        $this->code = $code;
        return $this->where('code', $code)->with('pageDetail')->first();  
    }

    public function getContent()
    {
        $code = $this->code;
        return $this->getPage($code)->pageDetail->keyBy('code');
    }

    public function getPageDetail()
    {
        $code = $this->code;
        return $this->getPage($code)->pageDetail;
    }

}