<div class="c-sidebar c-sidebar-dark c-sidebar-fixed c-sidebar-lg-show" id="sidebar">
    <div class="c-sidebar-brand">
        <div class="c-sidebar-brand-full" alt="CoreUI Logo">
            <img src="{{ asset('img/brand/LOGO.svg') }}" alt="" width="118" height="46">
        </div>
        <div class="c-sidebar-brand-minimized" width="46" height="46" alt="CoreUI Logo">
            <img src="{{ asset('img/brand/favicon.ico') }}" alt="">
        </div>
    </div><!--c-sidebar-brand-->

    <ul class="c-sidebar-nav">
        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.dashboard')"
                :active="activeClass(Route::is('admin.dashboard'), 'c-active')"
                icon="c-sidebar-nav-icon cil-speedometer"
                :text="__('Dashboard')" />
        </li>

        <li class="c-sidebar-nav-title">CMS</li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.product')"
                :active="activeClass(Route::is('admin.product.*'), 'c-active')"
                icon="c-sidebar-nav-icon cil-list"
                :text="__('Produk')" />
        </li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.article')"
                :active="activeClass(Route::is('admin.article.*'), 'c-active')"
                icon="c-sidebar-nav-icon fa-solid fa-newspaper"
                :text="__('Artikel')" />
        </li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.faq')"
                :active="activeClass(Route::is('admin.faq.*'), 'c-active')"
                icon="c-sidebar-nav-icon cil-chat-bubble"
                :text="__('Tanya Jawab')" />
        </li>

        {{-- <li class="c-sidebar-nav-title">Inbox</li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.inbox')"
                :active="activeClass(Route::is('admin.inbox.*'), 'c-active')"
                icon="c-sidebar-nav-icon cil-envelope-letter"
            >
                Kontak Masuk
                @if ($new_inbox > 0)
                    <span class="badge badge-danger">{{ $new_inbox }}</span>
                @endif
            </x-utils.link>
        </li> --}}

        <li class="c-sidebar-nav-title">@lang('Pengaturan')</li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.setting.banner')"
                :active="activeClass(Route::is('admin.setting.banner.*'), 'c-active')"
                icon="c-sidebar-nav-icon fa-solid fa-image"
            >
                Banner Home Page
                {{-- @if ($new_inbox > 0)
                    <span class="badge badge-danger">{{ $new_inbox }}</span>
                @endif --}}
            </x-utils.link>
        </li>

        <li class="c-sidebar-nav-dropdown {{ activeClass(Route::is('admin.pages.*') || Route::is('admin.auth.role.*'), 'c-open c-show') }}">
            <x-utils.link
                href="#"
                icon="c-sidebar-nav-icon fa-solid fa-file"
                class="c-sidebar-nav-dropdown-toggle"
                :text="__('Halaman')" />

            <ul class="c-sidebar-nav-dropdown-items">
                <li class="c-sidebar-nav-item">
                    <x-utils.link
                        :href="route('admin.pages.home')"
                        class="c-sidebar-nav-link"
                        :text="__('Beranda')"
                        :active="activeClass(Route::is('admin.pages.home'), 'c-active')" />
                </li>

                <li class="c-sidebar-nav-item">
                    <x-utils.link
                        :href="route('admin.pages.about')"
                        class="c-sidebar-nav-link"
                        :text="__('Tentang Kami')"
                        :active="activeClass(Route::is('admin.pages.about'), 'c-active')" />
                </li>

                <li class="c-sidebar-nav-item">
                    <x-utils.link
                        :href="route('admin.pages.terms')"
                        class="c-sidebar-nav-link"
                        :text="__('Syarat & Ketentuan')"
                        :active="activeClass(Route::is('admin.pages.terms'), 'c-active')" />
                </li>

                <li class="c-sidebar-nav-item">
                    <x-utils.link
                        :href="route('admin.pages.contact')"
                        class="c-sidebar-nav-link"
                        :text="__('Kontak Kami')"
                        :active="activeClass(Route::is('admin.pages.contact'), 'c-active')" />
                </li>
            </ul>
        </li>

        <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.setting.sosmed')"
                :active="activeClass(Route::is('admin.setting.sosmed.*'), 'c-active')"
                icon="c-sidebar-nav-icon fa-solid fa-share-nodes"
                :text="__('Sosial Media')" />
        </li>

        <li class="c-sidebar-nav-title">@lang('System')</li>

        {{-- <li class="c-sidebar-nav-item">
            <x-utils.link
                class="c-sidebar-nav-link"
                :href="route('admin.file_manager')"
                :active="activeClass(Route::is('admin.file_manager'), 'c-active')"
                icon="c-sidebar-nav-icon cil-storage"
                :text="__('File Manager')" />
        </li> --}}

        @if (
            $logged_in_user->hasAllAccess() ||
            (
                $logged_in_user->can('admin.access.user.list') ||
                $logged_in_user->can('admin.access.user.deactivate') ||
                $logged_in_user->can('admin.access.user.reactivate') ||
                $logged_in_user->can('admin.access.user.clear-session') ||
                $logged_in_user->can('admin.access.user.impersonate') ||
                $logged_in_user->can('admin.access.user.change-password')
            )
        )
            <li class="c-sidebar-nav-dropdown {{ activeClass(Route::is('admin.auth.user.*') || Route::is('admin.auth.role.*'), 'c-open c-show') }}">
                <x-utils.link
                    href="#"
                    icon="c-sidebar-nav-icon cil-user"
                    class="c-sidebar-nav-dropdown-toggle"
                    :text="__('Access')" />

                <ul class="c-sidebar-nav-dropdown-items">
                    @if (
                        $logged_in_user->hasAllAccess() ||
                        (
                            $logged_in_user->can('admin.access.user.list') ||
                            $logged_in_user->can('admin.access.user.deactivate') ||
                            $logged_in_user->can('admin.access.user.reactivate') ||
                            $logged_in_user->can('admin.access.user.clear-session') ||
                            $logged_in_user->can('admin.access.user.impersonate') ||
                            $logged_in_user->can('admin.access.user.change-password')
                        )
                    )
                        <li class="c-sidebar-nav-item">
                            <x-utils.link
                                :href="route('admin.auth.user.index')"
                                class="c-sidebar-nav-link"
                                :text="__('User Management')"
                                :active="activeClass(Route::is('admin.auth.user.*'), 'c-active')" />
                        </li>
                    @endif

                    @if ($logged_in_user->hasAllAccess())
                        <li class="c-sidebar-nav-item">
                            <x-utils.link
                                :href="route('admin.auth.role.index')"
                                class="c-sidebar-nav-link"
                                :text="__('Role Management')"
                                :active="activeClass(Route::is('admin.auth.role.*'), 'c-active')" />
                        </li>
                    @endif
                </ul>
            </li>
        @endif

        {{-- @if ($logged_in_user->hasAllAccess())
            <li class="c-sidebar-nav-dropdown">
                <x-utils.link
                    href="#"
                    icon="c-sidebar-nav-icon cil-list"
                    class="c-sidebar-nav-dropdown-toggle"
                    :text="__('Logs')" />

                <ul class="c-sidebar-nav-dropdown-items">
                    <li class="c-sidebar-nav-item">
                        <x-utils.link
                            :href="route('log-viewer::dashboard')"
                            class="c-sidebar-nav-link"
                            :text="__('Dashboard')" />
                    </li>
                    <li class="c-sidebar-nav-item">
                        <x-utils.link
                            :href="route('log-viewer::logs.list')"
                            class="c-sidebar-nav-link"
                            :text="__('Logs')" />
                    </li>
                </ul>
            </li>
        @endif --}}
    </ul>

    <button class="c-sidebar-minimizer c-class-toggler" type="button" data-target="_parent" data-class="c-sidebar-minimized"></button>
</div><!--sidebar-->
