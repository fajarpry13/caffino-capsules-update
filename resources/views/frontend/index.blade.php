<x-frontend.layout.app title="{{ appName() }} - Pasti Rasa Kopinya" navbar="navbar-fix" hamburger="fill-white" logo="fill-white" contact="text-white">
    @section('meta_description', 'Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.')

    <div class="home__header">
        <video autoplay playsinline loop muted class="home__header__banner home__header__banner-desktop">
            <source src="{{ asset('img/banner/HOME BANNER DESKTOP.mp4') }}#t=0.001" type="video/mp4">
            <source src="{{ asset('img/banner/HOME BANNER DESKTOP.ogg') }}#t=0.001" type="video/mp4">
        </video>
        <video autoplay playsinline loop muted class="home__header__banner home__header__banner-mobile">
            <source src="{{ asset('img/banner/HOME-BANNER-MOBILE.mp4') }}#t=0.001" type="video/mp4">
            <source src="{{ asset('img/banner/HOME-BANNER-MOBILE.ogg') }}#t=0.001" type="video/mp4">
        </video>
        <div class="home__container">
            <div class="home__header__scroll-btm">
                <button id="scrollTobtm" class="hero__scroll">
                    <div>
                        <span class="uppercase">Lihat ke Bawah</span>
                    </div>
                    <div class="arrow__btm">
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                </button>
            </div>
        </div>
    </div>
    @if ($banner)
        <div class="overflow-hidden max-h-max">
            <div class="banner-slider flex overflow-hidden">
                @foreach ($banner as $image)
                    <div>
                        <div class="desktop">
                            <a href="{{ $content['banner-link']->value }}" target="_blank">
                                <img class="bg-cover h-full w-full " src="{{ asset($image->source) }}" alt="caffino">
                            </a>
                        </div>
                        <div class="mobile">
                            <a href="{{ $content['banner-link']->value }}" target="_blank">
                                <img class="bg-cover h-full w-full" src="{{ asset($image->source_mobile) }}" alt="caffino">
                            </a>
                        </div>
                    </div>
                @endforeach
            </div>
            <ul class="banner-dots"></ul>
        </div>
    @endif
    <div id="section1" class="home__section1">
        <div class="home__container">
            <div class="home__section1__content">
                <img class="home__section1__content-bean5" src="{{ asset('img/bean/BEAN-5.png') }}" alt="">
                <img class="home__section1__content-latte_cup2" src="{{ asset('img/bean/LATTE-CUP-2.png') }}" alt="">
                <img class="home__section1__content-bean4" src="{{ asset('img/bean/BEAN-4.png') }}" alt="">
                <img class="home__section1__content-bean2" src="{{ asset('img/bean/BEAN-2.png') }}" alt="">
                <img data-aos="zoom-in" data-aos-duration="1500" data-aos-anchor=".banner-slider" data-aos-anchor-placement="center-bottom" class="home__section1__content-darkcappu" src="{{ asset('img/product/CAFFINO-FAMILY-PACK-DARKCAPPU_home.jpg') }}" alt="">
                <img class="home__section1__content-bean1" src="{{ asset('img/bean/BEAN-1.png') }}" alt="">
                <img class="home__section1__content-bean3" src="{{ asset('img/bean/BEAN-3.png') }}" alt="">
            </div>
            <div class="home__section1__content">
                <div class="home__section1__content-copy_home container">
                    <img data-aos="fade-right" data-aos-duration="1500" data-aos-anchor=".banner-slider" data-aos-anchor-placement="center-bottom" src="{{ asset('img/brand/COPY HOME.svg') }}" alt="">
                    <hr data-aos="fade-right" data-aos-duration="1500" data-aos-anchor=".banner-slider" data-aos-anchor-placement="center-bottom" class="line">
                    <div data-aos="zoom-in-up" data-aos-duration="1500" data-aos-anchor=".banner-slider" data-aos-anchor-placement="center-bottom" class="home__section1__content-copy_home-text">
                        <p>Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas. <br> <br> Nikmati Caffino Dark Cappuccino yang pasti rasa kopinya.</p>
                    </div>
                    <div class="home__section1__content-copy_home-button">
                        <a data-aos="fade-right" data-aos-duration="1500" data-aos-anchor=".banner-slider" data-aos-anchor-placement="center-bottom" target="_blank" href="{{ $content['buy-now']->value }}" class="block text-center bg-[#BB9F64] py-4 w-[320px] md:w-[300px] rounded-full uppercase relative">Beli sekarang <i class="fa-solid fa-angle-right text-xl absolute right-10 top-1/2 -translate-y-1/2"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="home__section2">
        <div class="home__container">
            <div class="home__section2__content hidden md:flex">
                <div data-aos="fade-right" data-aos-duration="1000" data-aos-anchor=".banner-slider" data-aos-anchor-placement="bottom-bottom" class="-mt-20 md:mt-0 hidden md:block {{ $products->count() <= 5 ? 'home__section2__content-caffinopack-lg' : 'home__section2__content-caffinopack' }}">
                    {{-- <div class="flex items-end">
                        @foreach ($products as $data) --}}
                        {{-- <img
                            class="image-product-lg"
                            src="{{ asset($data->icon) }}" alt="" style="z-index: {{ '-' . $data->index }}; {{ $data->index > 1 ? 'margin-left: -10px;' : '' }}"> --}}
                            {{-- <img
                                class="{{ strtolower($data->brand) == 'caffino bold' || strtolower($data->brand) == 'caffino barista' ?  'image-product-lg' : 'image-product'}}"
                                src="{{ asset($data->icon) }}" alt="" style="z-index: {{ '-' . $data->index }};">
                        @endforeach
                    </div> --}}
                    <div class="justify-center items-end mx-auto">
                        <div class="product-slider md:flex items-end">
                            @foreach ($products as $data)
                            @php
                                $margin = 4;
                                $margin = $margin;
                            @endphp
                            <div class="wrap_image" style="position: relative; z-index: {{ '-' . $data->index }}; {{ $data->index > 1 ? 'margin-left: -'.$margin.'px;' : '' }}">
                                <img
                                    class="{{ $data->pack_large ?  'image-product-lg' : 'image-product'}} {{ $data->is_bottle ? 'bottle' : '' }}"
                                    src="{{ asset($data->icon) }}" alt="" >
                            </div>
                        @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="home__section2__content md:hidden">
                <div class="-mt-20 md:mt-0 home__section2__content-caffinopack">
                    <div class="justify-center items-end mx-auto">
                        <div id="slider-product" class="product-slider md:flex items-end">
                            @foreach ($products as $data)
                            <div class="wrap_image">
                                <img
                                    class="{{ $data->pack_large ?  'image-product-lg' : 'image-product'}} {{ $data->is_bottle ? 'bottle' : '' }}"
                                    src="{{ asset($data->icon) }}" alt="" >
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="home__section2__content-tagline">
                <img data-aos="flip-right" data-aos-duration="800" data-aos-anchor=".banner-slider" data-aos-anchor-placement="bottom-bottom" class="" src="{{ asset('img/brand/TAGLINE.svg') }}" alt="">
                <p data-aos="fade-up" data-aos-duration="800" data-aos-anchor=".banner-slider" data-aos-anchor-placement="bottom-bottom" class="">Temukan banyak pilihan <br>
                    rasa authentic Caffino di sini.</p>
            </div>
            <div class="home__section2__content mb-4">
                <a data-aos="fade-down" data-aos-duration="900" data-aos-anchor=".banner-slider" data-aos-anchor-placement="bottom-bottom" href="{{ route('frontend.product') }}" class="block text-center bg-[#BB9F64] py-4 w-[320px] md:w-[300px] rounded-full uppercase relative">Cari tahu <i class="fa-solid fa-angle-right text-xl absolute right-10 top-1/2 -translate-y-1/2"></i></a>
            </div>
            <div class="home__section2__content">
                <a href="{{ route('frontend.contact') . '#e-commerce' }}" id="btnBuyNow" data-aos="fade-down" data-aos-duration="900" data-aos-anchor=".banner-slider" data-aos-anchor-placement="bottom-bottom" class="block text-center bg-[#BB9F64] py-4 w-[320px] md:w-[300px] rounded-full uppercase relative">E-COMMERCE <i class="fa-solid fa-angle-right text-xl absolute right-10 top-1/2 -translate-y-1/2"></i></a>
            </div>
        </div>
    </div>
    <hr style="border: 0.2px solid black">

    {{-- <x-frontend.modal-marketplace :link="$content" /> --}}

    @push('before-styles')
        <link rel="prefetch" href="{{ asset('img/banner/HOME BANNER DESKTOP.mp4') }}">
        <link rel="prefetch" href="{{ asset('img/banner/HOME-BANNER-MOBILE.mp4') }}">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" integrity="sha512-17EgCFERpgZKcm0j0fEq1YCJuyAWdz9KUtv1EjVuaOz8pDnh/0nZxmU6BBXwaaxqoi9PQXnRWqlcDB027hgv9A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    @endpush

    @push('after-scripts')
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <x-frontend.script.nav-trans />
        <script>
            $('.hero__scroll').on('click', function(e) {
				$('html, body').animate({
					scrollTop: $(window).height()
				}, 300);
			});

            // $(document).on('turbo:before-cache', function() {
            //     // const sliders = document.querySelectorAll('.slider-product');
            //     const sliders2 = document.querySelectorAll('.banner-slider');

            //     // sliders.forEach(item => {
            //     //     $(item).slick('unslick');
            //     // })
            //     sliders2.forEach(item => {
            //         $(item).slick('unslick');
            //     })
            // });
            var productSlider = null;

            productSlider = $('#slider-product').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                dots: false,
            });
            $(document).ready(function () {

                $('.banner-slider').slick({
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    autoplay: true,
		            infinite: true,
                    adaptiveHeight: true,
                    autoplaySpeed: 1500,
                    dots: true,
                    dotsClass: 'banner-dots',
                })
            })

            $(window).resize(function() {
                clearTimeout(window.resizedFinished);
                window.resizedFinished = setTimeout(function(){
                    console.log('Resized finished.');
                    productSlider.slick('unslick').slick('reinit').slick()
                }, 250);
            });



            // function ScrollToBtm() {
            //     const goToBtm = document.getElementById("section1");
            //     goToBtm.scrollIntoView();
            // }
        </script>
    @endpush
</x-frontend.layout.app>
