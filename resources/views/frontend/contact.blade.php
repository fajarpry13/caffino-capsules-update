{{-- @dd($data) --}}
<x-frontend.layout.app title="Kontak Kami - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="contact__banner">
        <div class="wrap-asset">
            <div class="latte-cup">
                <img class="" src="{{ asset('img/bean/LATTE-CUP-2.png') }}" alt="">
            </div>
            <div class="bean">
                <img class="" src="{{ asset('img/bean/BEAN-5.png') }}" alt="" style="transform: matrix(0.92, 0.39, 0.39, -0.92, 0, 0);">
            </div>
        </div>
        <div class="section__contact">
            <div class="section__contact__wrap">
                <div class="contact_us">
                    Kontak Kami
                </div>
                <div class="line">
                    <div class="rhombus"></div>
                </div>
                <div class="company">
                    Perusahaan
                </div>
                <div class="rhombus">
                </div>
                <div class="company-name">
                    {{ $data['company']->value }}
                </div>
                <div class="addrs-1">
                    <div class="font-bold">
                        Kudus Factory
                    </div>
                    <div>
                        {!! nl2br($data['addrs-kudus']->value) !!}
                    </div>
                </div>
                <div class="addrs-2">
                    <div class="font-bold">
                        Mojokerto Factory
                    </div>
                    <div>
                        {!! nl2br($data['addrs-mojokerto']->value) !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="e-commerce" class="home__section2">
        <div class="home__container">
            <div class="home__section2__content">
                <div data-aos="fade-right" data-aos-duration="1000" class="{{ $products->count() <= 5 ? 'home__section2__content-caffinopack-lg' : 'home__section2__content-caffinopack' }} sm-hidden">
                    <div class="flex items-end">
                        @foreach ($products as $product)
                                <img
                                    class="{{ strtolower($product->brand) == 'caffino bold' || strtolower($product->brand) == 'caffino barista' ?  'image-product-lg' : 'image-product'}}"
                                    src="{{ asset($product->icon) }}" alt="" style="z-index: {{ '-' . $product->index }};">
                        @endforeach
                    </div>
                </div>
                <div class="flex justify-center -mt-20 md:-mt-24">
                    <img class="w-[200px] md:w-[300px]" src="{{ asset('img/bean/BEAN-6.png') }}" alt="">
                </div>
            </div>
            <div class="-mt-10">
                <div class="text-center font-bold text-[50px] text-[#BB9F64]">
                    E-commerce
                </div>
                <!-- commerce -->
                <div class="flex flex-wrap justify-center gap-10 mt-20"> <!-- section -->
                    <div class="w-[20rem]"> <!-- wrap Blibli -->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/blibli.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-blibli-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #1e93d1">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="w-[20rem]"> <!-- wrap Tokped-->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/tokped.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-tokped-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #5BB547">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="w-[20rem]"> <!-- wrap Shopee-->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/shopee.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-shopee-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #EA4E1F">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="w-[20rem]" style="display: none"> <!-- wrap BukalapakL hide Julian 06-11-2024 -->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/bukalapak.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-bukalapak-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #E31E52">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="w-[20rem]"> <!-- wrap TIKTOK: julian 06-11-2024 -->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/logo-tiktok-shop.jpg') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="https://vt.tiktok.com/ZSjrEGfRd/?page=Mall" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #011112">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    {{-- <div class="w-[20rem]"> <!-- wrap Lazada-->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/lazada.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-lazada-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #000053">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="w-[20rem]"> <!-- wrap JD.ID-->
                        <div class="relative"> <!-- body -->
                            <div class="py-4 bg-white shadow-2xl rounded-3xl">
                                <img class="mx-auto" src="{{ asset('img/icon/jd-id.png') }}" alt="">
                            </div>
                            <div class="flex justify-center mt-[30px]">
                                <a href="{{ 'https://' . $data['link-jdid-caffino']->value }}" target="_blank" class="px-8 py-2 text-2xl text-white hover:text-gray-300 font-bold rounded-full shadow-2xl"
                                    style="background-color: #ED1D1D">
                                    @lang('CLICK HERE')
                                </a>
                            </div>
                        </div>
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
    <hr style="border: 0.2px solid black">

    @push('before-styles')
        <link rel="prefetch" href="{{ asset('img/bean/LATTE-CUP-2.png') }}">
        <link rel="prefetch" href="{{ asset('img/bean/BEAN-5.png') }}">
        <link rel="prefetch" href="{{ asset('img/banner/maps-contact.jpg') }}">
        
        <style>
            @media screen and (max-width: 640px) {
                .sm-hidden {
                    display: none;
                }
            }
        </style>
    @endpush

    @push('after-scripts')
        <x-frontend.script.nav />
    @endpush
</x-frontend.layout.app>
