@props([
    'navbar' => '',
    'hamburger' => 'fill-white',
    'logo' => 'fill-mocha',
    'textCont' => '',
    'bg' => ''
    ])

<div id="navigation" x-data="{ open: false }" :class="{'navbar-open': open, '':!open}" class="relative navbar {{ $navbar }}">
    <div class="nav" @click.away="open = false">
      <div id="nav-wrap" class="transition duration-300" :class="{'bg-caffino text-white': open, '{{ $bg }}':!open}">
        <div id="navbar-bg" class="">
          <div class="container">
            <div class="nav__bar">
                <div class="nav__bar__button">
                    <button id="toggle" @click="open = !open" aria-label="Button Toggle">
                      <svg fill="currentColor" viewBox="0 0 20 20" class="w-6 h-6">
                        <path x-show="!open" class="{{ $hamburger }}" fill-rule="evenodd" d="M1,4 H18 V6 H1 V4 M1,9 H18 V11 H1 V7 M3,14 H18 V16 H1 V14" clip-rule="evenodd"></path>
                        <path x-show="open" style="display: none;" fill="white" fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                      </svg>
                    </button>
                </div>
              <a href="{{ route('frontend.home') }}" class="nav__bar__logo" aria-label="logo">
                <template x-if="open">
                  <x-frontend.utils.logo fill="fill-white"/>
                </template>
                <template x-if="!open">
                  <x-frontend.utils.logo fill="{{ $logo }}"/>
                </template>
              </a>
              <a href="{{ route('frontend.contact') }}" :class="{'text-white' : open, '{{ $textCont }}' : !open}" class="nav__bar__contact">Kontak Kami</a>
            </div>
          </div>
        </div>
      </div>
      <nav x-show="open"
          x-transition:enter="transition duration-300"
          x-transition:leave="transition duration-300"
          :class="{'bg-caffino slide-in shadow-md' : open, 'slide-out bg-caffino shadow-md': !open}" class="nav__link absolute top-[94px] w-full" x-cloak >
        <div class="container overflow-auto">
          <ul>
            <li class="nav__link__item">
              <a href="/">BERANDA</a>
            </li>
            <li class="nav__link__item">
              <a href="{{ route('frontend.product') }}">produk</a>
            </li>
            <li class="nav__link__item">
              <a href="{{ route('frontend.capsule') }}">Capsule</a>
            </li>
            <li class="nav__link__item">
              <a href="{{ route('frontend.articles') }}">Artikel</a>
            </li>
            {{-- <li class="nav__link__item">
              <a href="{{ route('frontend.gallery') }}">Gallery</a>
            </li> --}}
          </ul>
          <x-frontend.footer-links hide="md:hidden" />
        </div>
      </nav>
    </div>
</div>