<?php

use Tabuna\Breadcrumbs\Trail;
use App\Domains\Auth\Models\User;
use App\Http\Controllers\Backend\InboxController;
use App\Http\Controllers\Backend\PagesController;
use App\Http\Controllers\Backend\CmsFaqController;
use App\Http\Controllers\Backend\ArticleController;
use App\Http\Controllers\Backend\SettingsController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\BannerHomeController;
use App\Http\Controllers\Backend\Product\BuyNowController;
use App\Http\Controllers\Backend\Product\ProductController;
use App\Http\Controllers\Backend\Product\FaktaNutrisiController;
use App\Http\Controllers\Backend\Auth\User\UserPasswordNewController;

// All route names are prefixed with 'admin.'.
Route::redirect('/', '/admin/dashboard', 301);
Route::get('dashboard', [DashboardController::class, 'index'])
    ->name('dashboard')
    ->breadcrumbs(function (Trail $trail) {
        $trail->push(__('Dashboard'), route('admin.dashboard'));
    });

// Route::view('filemanager', 'backend.file_manager')->name('file_manager');

// All route names are prefixed with 'user.'.
Route::group([
    'prefix' => 'user',
    'as' => 'user.',
], function () {
    Route::group(['prefix' => '{user}'], function () {
        Route::get('password-new/change', [UserPasswordNewController::class, 'edit'])
            ->name('change-password-new')
            ->breadcrumbs(function (Trail $trail, User $user) {
                $trail->parent('admin.dashboard')
                    ->push(__('Change Password'), route('admin.user.change-password-new', $user));
            });

        Route::patch('password-new/change', [UserPasswordNewController::class, 'update'])
            ->name('change-password-new.update');
    });
});

// All route names are prefixed with 'product'.
Route::group([
    'prefix' => 'product'
], function () {

    Route::get('/', [ProductController::class, 'index'])->name('product')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.dashboard')->push(__('Produk'), route('admin.product'));
        });

    Route::get('create', [ProductController::class, 'create'])->name('product.create')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.product')->push(__('Tambah Produk'), route('admin.product.create'));
        });

    Route::get('{product}/edit', [ProductController::class ,'edit'])->name('product.edit')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.product')->push(__('Edit Produk'), route('admin.product'));
        });

    Route::get('{product}/detail', [ProductController::class, 'detail'])->name('product.detail')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.product')->push(__('Tambah Detail'), route('admin.product'));
        });

    Route::get('{product}/detail/create', [ProductController::class, 'createDetail'])->name('product.detail.create')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.product')->push(__('Tambah Detail'), route('admin.product'));
        });

    // Check Slug
    Route::get('checkSlug', [ProductController::class, 'checkSlug'])->name('product.checkSlug');

    // CRUD Product
    Route::post('/', [ProductController::class, 'store'])->name('product.store');
    Route::put('{product}/update', [ProductController::class, 'update'])->name('product.update');
    Route::delete('{product}/destroy', [ProductController::class, 'destroy'])->name('product.destroy');
    Route::get('{product}/publish', [ProductController::class, 'publish'])->name('product.publish');
    Route::get('{product}/unpublish', [ProductController::class, 'unpublish'])->name('product.unpublish');

    // Route CRUD Product/faktanutrisi/..
    Route::group(['prefix' => 'faktanutrisi'],  function () {
        Route::get('{id}/edit', [FaktaNutrisiController::class, 'edit'])->name('product.faktanutrisi.edit');
        Route::post('/', [FaktaNutrisiController::class, 'store'])->name('product.faktanutrisi.create');
        Route::put('{id}/update', [FaktaNutrisiController::class, 'update'])->name('product.faktanutrisi.update');
        Route::delete('{FaktaNutrisi}/destroy', [FaktaNutrisiController::class, 'destroy'])->name('product.faktanutrisi.destroy');
    });

    // Update and Store Product BuyNow(online shop)
    Route::group(['prefix' => 'buynow'], function () {
        Route::post('/', [BuyNowController::class, 'store'])->name('product.buynow.store');
        Route::put('{buynow}/update', [BuyNowController::class, 'update'])->name('product.buynow.update');
    });

    //Sort or Reorder Product
    Route::get('sort', [ProductController::class, 'SortProduct'])->name('product.sort');

});

// All route names are prefixed with 'article'.
Route::group([
    'prefix' => 'article'
], function () {

    Route::get('/', [ArticleController::class, 'index'])->name('article')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.dashboard')->push(__('Artikel'), route('admin.article'));
        });

    Route::get('create', [ArticleController::class, 'create'])->name('article.create')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.article')->push(__('Tambah Artikel'), route('admin.article.create'));
        });

    Route::get('{article}/edit', [ArticleController::class, 'edit'])->name('article.edit')
        ->breadcrumbs(function (Trail $trail, $article) {
            $trail->parent('admin.article')->push(__('Edit'), route('admin.article.edit', $article));
        });

    Route::get('{article?}/show', [ArticleController::class, 'show'])->name('article.show')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.article')->push(__('Show'), route('admin.article.show'));
        });

    // Check Slug
    Route::get('checkSlug', [ArticleController::class, 'checkSlug'])->name('article.checkSlug');

    //Publish and unpublish
    Route::get('{article}/publish', [ArticleController::class, 'publish'])->name('article.publish');
    Route::get('{article}/unpublish', [ArticleController::class, 'unpublish'])->name('article.unpublish');

    //CRUD
    Route::post('store', [ArticleController::class, 'store'])->name('article.store');
    Route::put('{article}/update', [ArticleController::class, 'update'])->name('article.update');
    Route::delete('{article}/destroy', [ArticleController::class, 'destroy'])->name('article.destroy');

});

// All route names are prefixed with 'Inboxs'.
Route::group([
    'prefix' => 'inbox'
], function () {
    Route::get('/', [InboxController::class, 'index'])->name('inbox')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.dashboard')->push(__('Kontak Masuk'), route('admin.inbox'));
        });
    Route::get('{inbox}/detail', [InboxController::class, 'show'])->name('inbox.show')
        ->breadcrumbs(function (Trail $trail, $inbox) {
            $trail->parent('admin.inbox')->push( $inbox->name, route('admin.inbox.show', $inbox));
        });
});

// All route names are prefixed with 'FAQ'.

Route::group([
    'prefix' => 'faq'
], function () {
    Route::get('/', [CmsFaqController::class, 'index'])->name('faq')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.dashboard')->push(__('Tanya Jawab'), route('admin.faq'));
        });
    Route::get('create', [CmsFaqController::class, 'create'])->name('faq.create')
        ->breadcrumbs(function (Trail $trail) {
            $trail->parent('admin.inbox')->push(__('Buat'), route('admin.faq.create'));
        });
    Route::get('{faq}/edit', [CmsFaqController::class, 'edit'])->name('faq.edit')
        ->breadcrumbs(function (Trail $trail, $faq) {
            $trail->parent('admin.inbox')->push(__('Edit'), route('admin.faq.edit', $faq));
        });

    Route::post('store', [CmsFaqController::class, 'store'])->name('faq.store');
    Route::post('{faq}/update', [CmsFaqController::class, 'update'])->name('faq.update');
    Route::delete('{faq}/destroy', [CmsFaqController::class, 'destroy'])->name('faq.destroy');

    //Sort or Reorder FAQ
    Route::get('sort', [CmsFaqController::class, 'SortFaq'])->name('faq.sort');
});

Route::prefix('setting')->group(function () {
    //social media
    Route::get('sosial-media', [SettingsController::class, 'indexSosmed'])->name('setting.sosmed');
    Route::put('{linkSosmed}/sosial-media', [SettingsController::class, 'Update'])->name('setting.sosmed.update');

    //Banner Home page
    Route::get('banner', [BannerHomeController::class, 'index'])->name('setting.banner')
            ->breadcrumbs(function (Trail $trail) {
                $trail->parent('admin.dashboard')->push(__('Banner'), route('admin.setting.banner'));
            });
    Route::get('{banner}/edit', [BannerHomeController::class, 'edit'])->name('setting.banner.edit')
            ->breadcrumbs(function (Trail $trail, $banner) {
                $trail->parent('admin.setting.banner')->push(__('Edit Banner'), route('admin.setting.banner.edit', $banner));
            });
    Route::get('create', [BannerHomeController::class, 'create'])->name('setting.banner.create')
            ->breadcrumbs(function (Trail $trail) {
                $trail->parent('admin.setting.banner')->push(__('Create Banner'), route('admin.setting.banner.create'));
            });
    Route::post('store', [BannerHomeController::class, 'store'])->name('setting.banner.store');
    Route::put('{banner}/update', [BannerHomeController::class, 'update'])->name('setting.banner.update');
    Route::delete('{banner}/destroy', [BannerHomeController::class, 'destroy'])->name('setting.banner.destroy');
    //Publish and unpublish
    Route::get('{banner}/publish', [BannerHomeController::class, 'publish'])->name('setting.banner.publish');
    Route::get('{banner}/unpublish', [BannerHomeController::class, 'unpublish'])->name('setting.banner.unpublish');
});

Route::prefix('pages')->group(function () {
    Route::get('home', [PagesController::class, 'indexHome'])->name('pages.home');
    Route::get('about', [PagesController::class, 'indexAbout'])->name('pages.about');
    Route::get('terms', [PagesController::class, 'indexTerms'])->name('pages.terms');
    Route::get('contact', [PagesController::class, 'indexContact'])->name('pages.contact');
    Route::get('{PageDetail}/edit', [PagesController::class, 'edit'])->name('pages.edit');
    Route::put('{PageDetail}/update', [PagesController::class, 'update'])->name('pages.update');
});
