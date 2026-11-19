@props([
        'navbar' => 'navbar' ,
        'hamburger' => '',
        'logo' => 'fill-white',
        'textCont' => 'text-white',
        'bg' => '',
        'title' => ''
        ])

<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="scroll-smooth">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" sizes="192x192" href="{{ asset('img/brand/favicon.ico') }}">
        <link rel="prefetch" href="{{ asset('img/brand/favicon.ico') }}">
        <title>{{ $title }}</title>
        <meta name="description" content="@yield('meta_description', 'Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.')">
        @yield('meta')

        @stack('before-styles')
        <link rel="prefetch" href="{{ mix('css/dev.css') }}">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link rel="dns-prefetch" href="//fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
        <link href="{{ mix('css/dev.css') }}" rel="stylesheet">
        @stack('after-styles')
        <script src="{{ mix('js/frontend.js') }}"></script>
        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-ZF822MDD8D"></script>
        <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'G-ZF822MDD8D');
        </script>
        <script src="{{ asset('aos/aos.css') }}"></script>
    </head>
    <body>

        {{-- navigation bar --}}
        <x-frontend.layout.navbar navbar="{{ $navbar }}" bg="{{ $bg }}" hamburger="{{ $hamburger }}" logo="{{ $logo }}" textCont="{{ $textCont }}"/>

        <main id="app" class="relative">
            {{ $slot }}
        </main>

        {{-- footer --}}
        <x-frontend.layout.footer />

        @include('sweetalert::alert')
        @stack('before-scripts')
        <script src="{{ mix('js/manifest.js') }}"></script>
        <script src="{{ mix('js/vendor.js') }}"></script>
        @stack('after-scripts')
        <script src="{{ asset('aos/aos.js') }}"></script>
        <script>
            AOS.init({
                once: false,
                mirror: true,
            });
        </script>
    </body>
</html>
