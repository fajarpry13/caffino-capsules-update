<?php

namespace App\Models;

use App\Models\Page;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PageDetail extends Model
{
    use HasFactory;

    protected $table = 'page_detail';
    protected $guarded = ['id'];

    public function pages()
    {
        return $this->belongsTo(Page::class, 'id');
    }
}
