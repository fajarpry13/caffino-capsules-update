<?php

namespace App\Services;

use App\Models\Inbox;
use App\Services\BaseService;

class ContactService extends BaseService
{
    /**
     * ContactService constructor.
     *
     * @param  Inbox  $inbox
     */
    public function __construct(Inbox $inbox)
    {
        $this->model = $inbox;
    }

    public function store(array $data)
    {
        $this->model->create($data);
    }
}