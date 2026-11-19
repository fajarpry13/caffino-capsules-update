<?php

namespace App\Models;

use App\Models\PageDetail;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Page extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function pageDetail()
    {
        return $this->hasMany(PageDetail::class, 'page_id');
    }
}
