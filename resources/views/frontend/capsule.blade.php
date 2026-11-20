<x-frontend.layout.app 
title=" Caffino Coffee Capsule | Kopi Kapsul Nespresso Compatible - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
<div class="capsule">
    <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="capsule__banner">
            <img src="{{ asset('img/bg-capsule-fix.png') }}" alt="Banner Desktop" class="hidden lg:block">
            <img src="{{ asset('img/capsule/bg-capsule-mob.png') }}" alt="Banner Mobile" class="block lg:hidden">
        </div>
        {{-- Wrapper Desktop --}}
    <div class="capsule__wrapper hidden lg:block">
      <div class="capsule__wrapper__col">
        <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="text-white uppercase leading-[3.5rem] xl:leading-[4.5rem] text-[38px] xl:text-[62px] font-bold">
            caffino <br> coffee <br> capsules
        </div>
        <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"  class="bg-white w-[35%] h-px my-3 shrink-0"></div>
        <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"  class="text-white text-base xl:text-lg font-bold tracking-wide text-justify">
          Experience Café-Quality Coffee At Home With The Caffino Capsule Collection, 
          Celebrating The Remarkable Richness Of Indonesian Coffee Through 
          Distinctive Origin And Signature Blends. 
          Made From 100% Selected Indonesian Coffee Beans
        </div>
      </div>
    </div>
    {{-- Wrapper Mobile --}}
    <div class="capsule__wrapper-mobile">
        <div class="capsule__wrapper-mobile__inner">
            <h1 data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"  class="text-white text-[22px] md:text-[32px] font-bold uppercase">
                caffino coffee capsules
            </h1>
            <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"  class="bg-white w-[15%] h-px my-3 shrink-0"></div>
            <p data-aos="fade-up" data-aos-once="false" data-aos-duration="1000">
                Experience Café-Quality Coffee At Home With The Caffino Capsule Collection, 
                Celebrating The Remarkable Richness Of Indonesian Coffee Through 
                Distinctive Origin And Signature Blends. 
                Made From 100% Selected Indonesian Coffee Beans
            </p>
        </div>
    </div>
@php
$capsulesOrigin = [
    [
        'slug' => 'bali-blend',
        'title' => 'Bali Blend',
        'strength' => '6',
        'image' => asset('img/capsule/bali-blend-c.png'),
        'image_mobile' => asset('img/capsule/bali-blend-cm.png'),
        'description' => 'Experience the allure of the Kintamani highlands of Bali 
        in Indonesia through it’s prized Arabica coffee beans. Masterfully blended 
        with selected Java beans for a more full-bodied taste, our Caffino Bali Blend 
        unveils a tapestry of flavours.',
        'notes' => 'Coffee Cherry, Strawberry Husk, Vanilla, Java Orange, Slight Calendulla Leaf, Spices.',
    ],
     [
        'slug' => 'java-blend',
        'title' => 'Java Blend',
        'strength' => '8',
        'image' => asset('img/capsule/java-blend-c.png'),
        'image_mobile' => asset('img/capsule/java-blend-cm.png'),
        'description' => 'Savour quality coffee from the Indonesian island of Java. We have curated a unique blend of beans from the historic coffee plantations of East Java and beans from Sumatra to create the bold, full taste of our Caffino Java Blend.',
        'notes' => 'Crisp, Full Body, Caramelized Sugar, Vanilla, Hint of Oak Wood.',
    ],
     [
        'slug' => 'sumatra-blend',
        'title' => 'Sumatra Blend',
        'strength' => '6',
        'image' => asset('img/capsule/sumatra-blend-c.png'),
        'image_mobile' => asset('img/capsule/sumatra-blend-cm.png'),
        'description' => 'Explore Mandheling Arabica coffee from the fertile volcanic soil of Sumatra island’s northern mountains in Indonesia. Blended with South Sumatran beans for a bolder taste, our Caffino Sumatra Blend evokes an exquisite coffee sensation.',
        'notes' => 'Cherry, Vanilla, Plum, Mandarin Orange, Coffee Cherry, Spices.',
    ],
    [
         'slug' => 'intense-blend',
        'title' => 'Intense Blend',
        'strength' => '10',
        'image' => asset('img/capsule/intense-blend-c.png'),
        'image_mobile' => asset('img/capsule/intense-blend-cm.png'),
        'description' => 'For seekers of depth and vitality in every cup, Caffino Intense Blend delivers a bold flavour experience. Medium-roasted Indonesian high quality beans reveal a lingering, full-bodied finish. Rich, aromatic and uncompromising for moments when you need your coffee to rise to the occasion.',
        'notes' => 'Dark Chocolate, Caramel, Earthy,
Nutty, Plum, Tea.',
    ],
    [
        'slug' => 'all-day-blend',
        'title' => 'All-Day Blend',
        'strength' => '7',
        'image' => asset('img/capsule/all-day-blend-c.png'),
        'image_mobile' => asset('img/capsule/all-day-blend-cm.png'),
        'description' => 'Meet your perfect companion from dawn to dusk. Our Caffino All-Day Blend features a refined combination of medium-roasted Indonesian high quality beans for a rich, rounded taste. Balanced and versatile, it’s crafted to keep you refreshed and ready for whatever the day brings.',
        'notes' => 'Spices, Berry, Chocolate, Nutty, Earthy, Vanilla, Citrus.',
    ],
    [
        'slug' => 'breakfast-blend',
        'title' => 'Breakfast Blend',
        'strength' => '8',
        'image' => asset('img/capsule/breakfast-blend-c.png'),
        'image_mobile' => asset('img/capsule/breakfast-blend-cm.png'),
        'description' => 'Awaken your senses with our Caffino Breakfast Blend – a vibrant harmony of medium-roasted Indonesian high quality beans crafted to kickstart your day. This blend offers a smooth yet lively character, balancing gentle brightness with a satisfying body for a perfectly uplifting morning brew.',
        'notes' => 'Spices, Chocolate, Caramel, Earthy, Nutty, Herbs.',
    ],
];
// $capsulesOcca = [
//     [
//          'slug' => 'intense-blend',
//         'title' => 'Intense Blend',
//         'strength' => '10',
//         'image' => asset('img/capsule/intens-blend-desk.png'),
//         'description' => 'For seekers of depth and vitality in every cup, Caffino Intense Blend delivers a bold flavour experience. Medium-roasted Indonesian high quality beans reveal a lingering, full-bodied finish. Rich, aromatic and uncompromising for moments when you need your coffee to rise to the occasion.',
//         'notes' => 'Dark Chocolate, Caramel, Earthy,
// Nutty, Plum, Tea.',
//     ],
//     [
//         'slug' => 'all-day-blend',
//         'title' => 'All-Day Blend',
//         'strength' => '7',
//         'image' => asset('img/capsule/all-day-blend-desk.png'),
//         'description' => 'Meet your perfect companion from dawn to dusk. Our Caffino All-Day Blend features a refined combination of medium-roasted Indonesian high quality beans for a rich, rounded taste. Balanced and versatile, it’s crafted to keep you refreshed and ready for whatever the day brings.',
//         'notes' => 'Spices, Berry, Chocolate, Nutty, Earthy, Vanilla, Citrus.',
//     ],
//     [
//         'slug' => 'breakfast-blend',
//         'title' => 'Breakfast Blend',
//         'strength' => '8',
//         'image' => asset('img/capsule/breakfastblend-desk.png'),
//         'description' => 'Awaken your senses with our Caffino Breakfast Blend – a vibrant harmony of medium-roasted Indonesian high quality beans crafted to kickstart your day. This blend offers a smooth yet lively character, balancing gentle brightness with a satisfying body for a perfectly uplifting morning brew.',
//         'notes' => 'Spices, Chocolate, Caramel, Earthy, Nutty, Herbs.',
//     ],
// ]
@endphp
<section class="capsule__section" >
    <img  src="{{ asset('img/capsule/section-capsule-no-bg.png') }}" class="absolute inset-0 w-full h-full object-cover object-top bg-top -z-10" alt="">
    
    {{-- <span class="absolute left-1/2 top-[8.1vw] -translate-x-1/2 -translate-y-full
    uppercase text-white whitespace-nowrap text-4xl font-bold mb-12">
        Capsule Collection
         <p class="absolute top-full left-1/2 -translate-x-1/2 mt-[0.5vw]
              normal-case text-center whitespace-nowrap
              text-2xl text-white font-semibold">
       Caffino Origin Series
    </p>
    </span> --}}
@foreach ($capsulesOrigin as $capsule)

    @if ($loop->index === 0)
    <div class="hidden md:grid grid-cols-[minmax(0,1fr)_auto_minmax(0,1fr)] items-center gap-6 xl:gap-10 relative text-center mx-auto container pt-[8.1vw] pb-[5.2vw]">
    <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="grid place-content-center">
        <img src="{{ asset('img/capsule/icon/line-left.png') }}" alt="" class="w-full h-auto">
    </div>

    <div>
        <h1 data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"
            class="text-white text-[32px] xl:text-[48px] font-bold uppercase whitespace-nowrap">Capsule Collection</h1>
        <p  data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"
            class="mt-[0.5vw] text-[24px] xl:text-[36px] whitespace-nowrap text-white font-semibold">
            Caffino Origin Series
        </p>
    </div>

    <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="grid place-content-center">
        <img src="{{ asset('img/capsule/icon/line-right.png') }}" alt="" class="w-full h-auto">
    </div>
</div>
    <div class="md:hidden flex flex-col relative justify-start items-start mx-auto container">
            <h1 data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"
                class="text-white text-[22px] font-bold uppercase">Capsule Collection</h1>
         <p     data-aos="fade-up" data-aos-once="false" data-aos-duration="1000"
                class="mt-[0.5vw] text-[16px] text-center whitespace-nowrap text-2xl text-white font-semibold">
                Caffino Origin Series
            </p>

    </div>
    @endif

@if ($loop->index === 3)
<div class="capsule__section__occasion">
          <p data-aos="fade-up" data-aos-once="false" data-aos-duration="1000">
              Caffino Occasion Series
          </p>
      </div>
@endif

   <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="capsule__collection">
    <div class="capsule__card">
        <div class="capsule__card__media">
                {{-- Mobile --}}
        <img
                src="{{ $capsule['image_mobile'] }}"
                 alt="{{ $capsule['title'] }}"
                class="block md:hidden"
        >

                {{-- Desktop --}}
        <img
                src="{{ $capsule['image'] }}"
                alt="{{ $capsule['title'] }}"
                class="hidden md:block"
        >
        </div>

        <div class="capsule__collection__text">
            <div class="capsule__collection__strong">
                <img src="{{ asset('img/capsule/icon/coffee-symbol.png') }}" alt="">
                <h1 class="text-[21px] md:text-[28px] xl:text-[36px] text-[#41290E] font-bold">{{ $capsule['title'] }}</h1>
            </div>
        
            <div class="capsule__intensity">
                <div class="capsule__intensity__wrap">
                    <p class="capsule__intensity__label capsule__text__intensity">Intensity</p>
                    <div class="capsule__intensity__list">
                        @for ($i = 1; $i <= 10; $i++)
                            <p class="capsule__intensity__item capsule__text__intensity {{ (int) $capsule['strength'] === $i ? 'active' : '' }}">
                                {{ $i }}
                            </p>
                        @endfor
                    </div>
                </div>
                <div class="col-span-2 p-4 border-t border-[#41290E] capsule__text__intensity">
                    <p class="text-justify">
                        <span class="font-bold">Notes:</span>
                        <span class="font-bold">{{ $capsule['notes'] }}</span>
                    </p>
                </div>
            </div>

            <div class="w-12 md:w-32 h-[3px] md:h-1 -mt-2 -mb-4 md:-mt-2 md:-mb-2 bg-gradient-to-r from-[#41290E] to-[#D9D9D9]"></div>
            <p class="">{{ $capsule['description'] }}</p>

            {{-- <button type="button" x-data x-on:click="$dispatch('open-modal', 'capsule-modal')"
                    class="capsule__collection__btn">
                Beli Sekarang
            </button> --}}
        </div>
    </div>
</div>

    
        
            @endforeach
          
             {{-- @foreach ($capsulesOcca as $capsule)
    <div class="capsule__collection">
        <img src="{{ $capsule['image'] }}" alt="{{ $capsule['title'] }}">
        <div class="capsule__collection__grid">
            <div></div>
    
                <div class="capsule__collection__text">
                    <h1 class="text-4xl text-[#41290E] font-bold">{{ $capsule['title'] }}</h1>
                    <div class="capsule__collection__strong">
                        <img src="{{ asset('img/capsule/icon/coffee-symbol.png') }}" alt="">
                        <span>{{ $capsule['strength'] }}</span>
                    </div>
                    <p class="text-xl text-[#41290E] font-medium">
                        {{$capsule['description']}}
                    </p>
                    <div class="w-32 h-1 -my-2 bg-gradient-to-r from-[#41290E] to-[#D9D9D9]"></div>
                   <p class="text-xl text-[#41290E]">
                        <span class="font-bold">Notes:</span> 
                        <span class="font-normal">{{ $capsule['notes'] }}</span>
                    </p>
                <button type="button" x-data x-on:click="$dispatch('open-modal', 'capsule-modal')"
            class="capsule__collection__btn">
        Beli Sekarang
    </button>
                </div>
        </div>
    </div>

    
        
         
            @endforeach --}}
            
            <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="capsule__easy">
                <img class="w-full h-auto object-cover hidden md:block" src="{{ asset('img/capsule/section-footer-crop.png') }}" alt="Banner Footer Desktop">
                <img class="w-full h-auto object-cover md:hidden block" src="{{ asset('img/capsule/section-footer-mob.png') }}" alt="Banner Footer Mobile">
                <div class="capsule__easy__wrap">
                    <div class="capsule__collection__text__footer">
                    <h1 class="pl-0 md:pl-6 xl:pl-0 text-[21px] xl:text-[42px] text-[#41290E] font-bold">EASY PREPARATION</h1>
                <ol class="pl-6">
                    <li>
                           Use a Nespresso® Compatible machine.
                    </li>
                    <li>
                            Turn on the machine and wait until it is <br class="hidden 2xl:block"> ready to brew.
                    </li>
                    <li>
                          Insert the Caffino Capsule into the <br class="hidden 2xl:block"> machine.   
                    </li>
                    <li>
                           Press the brew button.
                    </li>
                     <li>
                          Enjoy your Caffino coffee.
                    </li>
                </ol>

                <a href="https://drive.google.com/file/d/1bLUu9vKzC9S57xuZOPGyhcJ0P67nIc0q/view?pli=1" target="_blank" rel="noopener noreferrer" class="capsule__collection__btn__footer font-medium md:font-bold">
                    SEE HOW IT WORKS
                    <i class="fa-solid fa-angle-right"></i>
                </a>
                </div>
                    {{--Dont Touch This Div  --}}
            <div></div>
    
        </div>

            </div>

            <div data-aos="fade-up" data-aos-once="false" data-aos-duration="1000" class="capsule__buy">
                <div class="capsule__buy__wrap">
                    <img src="{{ asset('img/capsule/allcapsule.png') }}" alt="" class="md:block hidden">
                    <img src="{{ asset('img/capsule/allcapsule-mobile.png') }}" alt="" class="block md:hidden">
                    <button type="button" x-data x-on:click="$dispatch('open-modal', 'capsule-modal')"
                    class="capsule__buy__btn">
                Click Here To Buy
            </button>
                </div>
            </div>
        </section>
        <x-popup name="capsule-modal">
       <div class="bg-white p-6 rounded-lg relative z-50">
         <button x-on:click="$dispatch('close-modal', 'capsule-modal')"
     class="flex justify-start items-start mb-3 -ml-1.5 text-black hover:text-gray-700 focus:outline-none">
         <svg class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
         </svg>
     </button>
     <div class=" md:w-fit md:mx-auto mb-4">
<h2 class="text-xl font-bold text-left">E-COMMERCE</h2>
<div class="h-0.5 bg-black mt-1"></div>
</div>
     <div class="grid grid-cols-2 items-center justify-center pb-4">
             <a href="https://www.tokopedia.com/savoriaofficial/etalase/caffino-capsule" target="_blank" rel="noopener noreferrer"
class="flex items-center justify-center p-3 h-20 transition hover:scale-105">
<img src="{{ asset('img/capsule/icon/tokped-caffino.png') }}" alt="Caffino di Tokopedia">
</a>

<a href="https://id.shp.ee/LNfdWbHm" target="_blank" rel="noopener noreferrer"
class="flex items-center justify-center p-3 h-20 transition hover:scale-105">
<img src="{{ asset('img/capsule/icon/shopee-caffino.png') }}" alt="Caffino di Shopee">
</a>

<a href="https://www.blibli.com/brand/savoria-flagship-store?excludeProductList=false&promoTab=false&bc=Caffino%20Capsule%20" target="_blank" rel="noopener noreferrer"
class="flex items-center justify-center p-3 h-20 transition hover:scale-105">
<img src="{{ asset('img/capsule/icon/blibli-caffino.png') }}" alt="Caffino di Blibli">
</a>

<a href="https://vt.tiktok.com/ZS9f3EPf49A77-rpUt1/" target="_blank" rel="noopener noreferrer"
class="flex items-center justify-center p-3 h-20 transition hover:scale-105">
<img src="{{ asset('img/capsule/icon/tiktok-caffino.png') }}" alt="Caffino di TikTok Shop">
</a>
         </div>  
   </div>
     </x-popup>
</div>


    @push('after-scripts')
        <x-frontend.script.nav />
    @endpush
</x-frontend.layout.app>