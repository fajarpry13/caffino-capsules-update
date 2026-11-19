<x-frontend.layout.app title="Tentang Kami - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="blackheader">
        <div class="blackheader__wrap">
            <p class="blackheader__title">Tentang Kami</p>
        </div>
    </div>
    <div class="container_fluid">
        <div class="container_wrap">
            {!! $data['about-us']->value !!}
        </div>
    </div>

    @push('after-scripts')
        <x-frontend.script.nav />
    @endpush
</x-frontend.layout.app>