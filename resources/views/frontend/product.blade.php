<x-frontend.layout.app title="Product - {{ ucwords(strtolower($current['name'])) }}" navbar="navbar-fix" hamburger="fill-white" logo="fill-white" textCont="text-white">
    @if ($products->isNotEmpty())
        <div class="product" >
            <div class="product__thumb">
                <div data-aos="fade-up" data-aos-duration="800" class="product__thumb-item">
                    <img src="{{ asset($current['image']) }}" alt="">
                </div>
                <div class="tab">
                    <div class="tab__wrap relative">
                        @foreach ($products as $data)
                            <div class="tab__links">
                                @if ($data->pack_large)
                                    <a class="{{ $data->slug == $current->slug ? 'tab__links-active' : 'tab__links-deactive' }} {{ $data->is_bottle ? 'bottle' : '' }}" href="/product/{{ $data->slug }}">
                                        <img class="" src="{{ asset($data->icon) }}" alt="{{ $data->name }}">
                                    </a>
                                @else
                                    <a class="{{ $data->slug == $current->slug ? 'tab__links-active' : 'tab__links-deactive-sm' }} {{ $data->is_bottle ? 'bottle' : '' }}" href="/product/{{ $data->slug }}">
                                        <img class="" src="{{ asset($data->icon) }}" alt="{{ $data->name }}">
                                    </a>
                                @endif
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="product__detail" style="background-color: {{ $current['bg_color'] }}">
                <div class="product__detail-wrap">
                    <div>
                        <div data-aos="fade-right" data-aos-duration="1000" class="text-title">
                            <h1 class="uppercase"><span class="font-extrabold">{{ $current['brand'] }}</span> <br>
                                {{ $current['name'] }}
                            </h1>
                        </div>
                        <div data-aos="fade-right" data-aos-duration="1200" class="text-p">
                            {!! nl2br($current->description) !!}
                        </div>
                        @if ($current->renteng_reguler !== null || $current->pouch_reguler !== null)
                        <div class="info_kemasan">
                            <h3 data-aos="fade-right" data-aos-duration="1300">INFO KEMASAN:</h3>
                            <div class="info_kemasan-grid">
                                <div data-aos="fade-right" data-aos-duration="1400">
                                    <h4 class="font-medium">RENTENG REGULER:</h4>
                                    {!! nl2br($current->renteng_reguler) !!}
                                </div>
                                <div data-aos="fade-right" data-aos-duration="1500">
                                    <h4 class="font-medium">POUCH REGULER:</h4>
                                    {!! nl2br($current->pouch_reguler) !!}
                                </div>
                            </div>
                        </div>
                        @endif
                        <div class="product__detail-links">
                            <div data-aos="fade-right" data-aos-anchor-placement="bottom-bottom" data-aos-duration="1700">
                                <button id="myBtn" class="underline">FAKTA NUTRISI <i class="fa-solid fa-angle-right ml-4"></i></button>
                            </div>
                            <div class="mt-[17px]" data-aos-anchor-placement="bottom-bottom" data-aos="fade-right" data-aos-duration="1700">
                                <button id="btnBuyNow" class="underline">BELI SEKARANG <i class="fa-solid fa-angle-right ml-[11px]"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @if ($current->faktaNutrisi)
            <x-frontend.modal-fknutrisi :data="$current->faktaNutrisi" />
        @endif

        @if ($current->buyNow)
            <x-frontend.modal-buynow :data="$current->buyNow" />
        @endif
    @else
        <div class="h-[900px] bg-yellow-600 relative">
            <div class="text-white text-4xl font-bold text-center absolute top-[50%] -translate-y-[50%] left-0 right-0">
                Product Not Found
            </div>
        </div>
    @endif

    @push('before-styles')
        @foreach ($products as $image)
            <link rel="prefetch" href="{{ asset($image->imgae) }}">
            <link rel="prefetch" href="{{ asset($image->icon) }}">
        @endforeach
    @endpush

    @push('after-scripts')
        <x-frontend.script.nav-trans />
    @endpush

</x-frontend.layout.app>

