<x-frontend.layout.app title="Gallery - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">

    <div id="preload-gallery" class="grid grid-cols-6 grid-rows-2 gap-2 p-5">
        <div class="is-preloader row-span-2 col-span-2 h-[350px]"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader col-span-1"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader row-span-2 col-span-2"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader row-span-2 col-span-2 h-[350px]"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader h-[175px]"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
        <div class="is-preloader"></div>
    </div>

    {{-- <div id="curator-feed-default-feed-layout" style="padding: 0;">
        <a href="https://curator.io" target="_blank" class="crt-logo crt-tag">
        </a>
    </div> --}}
    

    @push('after-styles')
        <style>
            #load {
                height: 100vh;
                text-align: center;
            }
            #load p {
                margin: auto auto;
            }
        </style>
    @endpush

    @push('after-scripts')
        <x-frontend.script.nav />

        <script type="text/javascript">

            /* curator-feed-default-feed-layout */
        
            // (function(){
        
            // var i,e,d=document,s="script";i=d.createElement("script");i.async=1;i.charset="UTF-8";
        
            // i.src="https://cdn.curator.io/published/0c53ce83-f750-45ba-af3f-7e91f3a81e90.js";
        
            // e=d.getElementsByTagName(s)[0];e.parentNode.insertBefore(i, e);
        
            // })();

            $(window).on('load', function(){ 
                setTimeout(function(){
                    $('#preload-gallery').hide();
                }, 2000);
            });
        </script>
    @endpush
</x-frontend.layout.app>