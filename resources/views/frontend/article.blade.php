<x-frontend.layout.app title="Artikel - {{ $article->title }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="article">
        <div class="article__banner">
            @if ($article->image)
            <img class="" src="{{ url($article->image) }}" alt="">
            @else
            <img class="" src="{{ asset('img/caffino-article.jpg') }}" alt="">
            @endif
        </div>
        <div class="article__content"><!-- article__content -->
            <div class="article__content_wrap"><!-- article__content wrap -->
                <div class="article__content__header"><!-- content__head -->
                    <div class="btn-back">
                        <a href="{{ route('frontend.articles') }}" class=""><i class="fa-solid fa-angle-left mr-2"></i>KEMBALI KE ARTIKEL</a>
                    </div>
                    <div class="article__content__header-title">
                        <p class="">{!! $article->title !!}</p>
                    </div>
                    <div class="article__content__header-line">
                        <hr class="">
                    </div>
                </div><!-- content__head -->
                <div class="article__content__body"><!-- content__body -->
                    <div class="article__content__body-text">
                        <p class="">
                            {!! nl2br($article->content) !!}
                        </p>
                    </div>

                    <div class="mt-[51px] md:mt-[82px]"><!-- content__shared -->
                        <div class="text-[14px] text-[#512f2e]">BAGIKAN</div>
                        <div class="mt-[21px]">
                            <!-- ShareThis BEGIN --><div class="sharethis-inline-share-buttons"></div><!-- ShareThis END -->
                        </div>
                        {{-- <div class="flex gap-2 mt-[21px]">
                            <div>
                                <a href="">
                                    <img src="{{ asset('img/icon/fb.svg') }}" alt="">
                                </a>
                            </div>
                            <div>
                                <a href="">
                                    <img src="{{ asset('img/icon/tw.svg') }}" alt="">
                                </a>
                            </div>
                            <div>
                                <a href="">
                                    <img src="{{ asset('img/icon/email.svg') }}" alt="">
                                </a>
                            </div>
                            <div>
                                <a href="">
                                    <img src="{{ asset('img/icon/link.svg') }}" alt="">
                                </a>
                            </div>
                        </div> --}}
                    </div>
                </div><!-- content__body -->
            </div><!-- article__content wrap -->
        </div><!-- article__content -->

        <div class="article__other"><!-- article__other -->
            <div class="article__other__wrap"><!-- wrap -->
                <div class="header"> <!-- header -->
                    <div class="header-title">ARTIKEL LAINNYA</div>
                    <div class="header-border ">
                        <hr>
                    </div>
                </div>
                <div class="body"> <!-- body -->
                    @foreach ($otherArticles as $data)
                    <div class="body-wrap"> <!-- body-wrap -->
                        <a href="{{ route('frontend.article', $data->slug) }}">
                            <div class="img-article">
                                @if ($data->image)
                                    <div style="background-image: url({{ $data->getPictureAttribute() }});"></div>
                                @else
                                    <div style="background-image: url({{ asset('img/caffino-article.jpg') }})"></div>
                                @endif
                            </div>
                            <div class="date-article"><!-- date-article -->
                                <span>
                                    {{ Carbon\Carbon::parse($data->published_at)->format('F d, Y') }}
                                </span>
                            </div>
                            <div class="title-article"> <!-- title-article -->
                                <a href="{{ route('frontend.article', $data->slug) }}">{{ Str::limit($data->title, 42) }}</a>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    @push('after-scripts')
        <x-frontend.script.nav />
        <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=62fb380a11408d0019b6da2c&product=inline-share-buttons' async='async'></script>
    @endpush
</x-frontend.layout.app>