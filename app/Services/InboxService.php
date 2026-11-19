<?php

namespace App\Services;

use App\Models\Inbox;
use App\Services\BaseService;

class InboxService extends BaseService
{
    /**
     * InboxService constructor.
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

    public function getPaginated()
    {
        return $this->model->latest()->paginate(10);
    }

    public function read(Inbox $inbox)
    {
        $inbox->update(['read' => 1]);

        return $inbox;
    }
}