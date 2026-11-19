<x-frontend.layout.app title="Arikel - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="articles">
        @if ($articles->isNotEmpty())
            <div class="articles-container">
                <div class="articles__header">
                    <h1 class="">ARTIKEL</h1>
                    <hr class="">
                </div>
                <div class="articles__body-flex" >
                    @foreach ($articles as $data)
                    <div class="articles__body__content">
                        <a href="{{ route('frontend.article', $data->slug) }}">
                            <div class="image-wrap is-preloader">
                                @if ($data->image)
                                    <div class="img-article" style="background-image: url({{ $data->getPictureAttribute() }});"></div>
                                @else
                                    <div class="img-article" style="background-image: url({{ asset('img/caffino-article.jpg') }})"></div>
                                @endif
                            </div>
                            <div class="my-[15px] text-coffe">
                                <a href="#">
                                    {{ Carbon\Carbon::parse($data->published_at)->format('F d, Y') }}
                                </a>
                            </div>
                            <div>
                                <a href="{{ route('frontend.article', $data->slug) }}" class="text-[24px] leading-[31.2px] hover:underline">{{ Str::limit($data->title, 42) }}</a>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>

                <div class="articles__pagination">
                    {{ $articles->links('components.frontend.pagination') }}
                </div>

                <div class="articles__pagination-mobile">
                    {{ $articles->links('components.frontend.mobile-pagination') }}
                </div>

            </div>
            {{-- end article-container --}}
        @else
            <div class="articles-container">
                <div class="articles__header">
                    <h1 class="">ARTIKEL</h1>
                    <hr class="">
                </div>
                <div class="text-4xl font-bold text-center my-[450px]">
                    Artikel Tidak Ditemukan
                </div>
            </div>
            {{-- end article-container --}}
        @endif
    </div>
    {{-- end articles --}}

    @push('after-scripts')
        <x-frontend.script.nav />
    @endpush
</x-frontend.layout.app>