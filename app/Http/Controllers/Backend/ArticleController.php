<?php

namespace App\Http\Controllers\Backend;

use App\Models\Article;
use Illuminate\Http\Request;
use App\Exceptions\GeneralException;
use App\Http\Controllers\Controller;
use Cviebrock\EloquentSluggable\Services\SlugService;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $articles = Article::with('user')->latest()->get();
        // $articles = Article::publish()->with('user')->latest()->get();

        return view('backend.pages.article.index', ['articles' => $articles]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.pages.article.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validate = $request->validate([
            'title' => 'required',
            'slug' => 'required|unique:articles',
            'content' => 'required',
            'image' => ''
        ]);

        $validate['user_id'] = auth()->user()->id;
        
        if ($request->has('is_published')) {
            $validate['is_published'] = true;
            $validate['published_at'] = now();
        }else {
            $validate['is_published'] = false;
            $validate['published_at'] = NULL;
        }

        Article::create($validate);

        return redirect()->route('admin.article')->withFlashSuccess(__("The Article was successfully created."));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article)
    {
        return view('backend.pages.article.show', ['data' => $article]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Article $article)
    {
        return view('backend.pages.article.edit', ['data' => $article]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Article $article)
    {
        $validate = $request->validate([
            'title' => 'required',
            'slug' => "required|unique:articles,slug,$article->id",
            'content' => 'required',
            'image' => ''
        ]);
        
        if ($request->has('is_published')) {
            $validate['is_published'] = true;
            $validate['published_at'] = now();
        }else {
            $validate['is_published'] = false;
            $validate['published_at'] = NULL;
        }

        $article->update($validate);

        return redirect()->route('admin.article')->withFlashSuccess(__("The Article was successfully Update."));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article)
    {
        $article->delete();

        return redirect()->route('admin.article')->withFlashSuccess(__("The Article was successfuly Deleted."));
    }

    public function publish(Article $article)
    {
        if ($article->is_published) {
            throw new GeneralException('This Article Already Published');
        }

        $article->is_published = true;
        $article->published_at = now();
        $article->save();

        return redirect()->route('admin.article')->withflashSuccess('This Article was succesfuly Published');
    }

    public function unpublish(Article $article)
    {
        if (!$article->is_published) {
            throw new GeneralException('This Article Already Unpublish');
        }

        $article->is_published = false;
        $article->published_at = NULL;
        $article->save();

        return redirect()->route('admin.article')->withflashSuccess('This Article was succesfuly Unpublished');
    }

    public function checkSlug(Request $request)
    {
        if ($request->title) {
            $slug = SlugService::createSlug(Article::class, 'slug', $request->title);
            return response()->json(['slug' => $slug]);
        }
    }
}
