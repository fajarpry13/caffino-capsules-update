<?php

use Tabuna\Breadcrumbs\Trail;
use App\Http\Controllers\Frontend\FaqController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\Frontend\AboutController;
use App\Http\Controllers\Frontend\TermsController;
use App\Http\Controllers\Frontend\ArticleController;
use App\Http\Controllers\Frontend\ContactController;
use App\Http\Controllers\Frontend\ProductController;

/*
 * Frontend Controllers
 * All route names are prefixed with 'frontend.'.
 */
Route::get('/usr', [HomeController::class, 'indexUser'])
    ->name('index')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Home'), route('frontend.index'));
    });

// Route::get('terms', [TermsController::class, 'index'])
//     ->name('pages.terms')
//     ->breadcrumbs(function (Trail $trail) {
//         $trail->parent('frontend.index')
//             ->push(__('Terms & Conditions'), route('frontend.pages.terms'));
//     });

Route::get('/', [HomeController::class, 'index'])
    ->name('home');

Route::get('product/{slug?}', [ProductController::class, 'index'])
    ->name('product');

Route::group(['prefix' => 'article'], function () {
    Route::get('/', [ArticleController::class, 'index'])->name('articles');
    Route::get('{slug}', [ArticleController::class, 'show'])->name('article');
});

Route::get('about', [AboutController::class, 'index'])->name('about');
Route::get('terms', [TermsController::class, 'index'])->name('terms');
Route::get('frequently-asked-questions', [FaqController::class, 'index'])->name('faq');

Route::get('gallery', function () {
    return view('frontend.gallery');
})->name('gallery');

Route::group(['prefix' => 'contact'], function () {
    Route::get('/', [ContactController::class, 'index'])->name('contact');
    Route::post('send', [ContactController::class, 'sendContactUs'])->name('sendContact');
});

Route::get('capsule', function () {
    return view('frontend.capsule');
})->name('capsule');
