<?php

namespace App\Providers;

use App\Models\Page;
use App\Models\Inbox;
use App\Models\LinkSosmed;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use App\Domains\Announcement\Services\AnnouncementService;

/**
 * Class ComposerServiceProvider.
 */
class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Register bindings in the container.
     *
     * @param  AnnouncementService  $announcementService
     */
    public function boot(AnnouncementService $announcementService)
    {
        View::composer('*', function ($view) {
            $view->with('logged_in_user', auth()->user());
        });

        View::composer(['frontend.index', 'frontend.layouts.app'], function ($view) use ($announcementService) {
            $view->with('announcements', $announcementService->getForFrontend());
        });

        //link sosial media
        View::composer(['components.frontend.footer-links'], function ($view) {
            $sosmed = LinkSosmed::first();
            $view->with(['link' => $sosmed]);
        });

        View::composer(['backend.layouts.app'], function ($view) use ($announcementService) {
            $view->with('announcements', $announcementService->getForBackend());
        });

        View::composer(['backend.includes.sidebar'], function ($view) {
            $view->with(['new_inbox' => Inbox::where('read', false)->count()]);
        });
    }
}
