<x-frontend.layout.app title="Tanya Jawab - {{ appName() }}" bg="bg-caffino" hamburger="fill-white" logo="fill-white" textCont="text-white">
    <div class="blackheader">
        <div class="blackheader__wrap">
            <p class="blackheader__title">Tanya Jawab</p>
        </div>
    </div>
    <div class="container_fluid">
        <div class="container_wrap">
            @foreach ($faq as $data)
            <button class="accordion">
                <div class="font-bold text-lg my-5 mr-2">
                    {{ $data->questions }}
                </div>
            </button>

            <div class="panel">
                <div class="mb-5">
                    {!! $data->answer !!}
                </div>
            </div>
            @endforeach
            <hr class="border-black">
        </div>
    </div>

@push('after-styles')
    <style>
        .accordion {
            position: relative;
            color: #444;
            cursor: pointer;
            width: 100%;
            text-align: left;
            outline: none;
            transition: 0.4s;
        }

        .accordion::before {
            display:block;
            width: 100%;
            height:1px;
            margin:auto;   
            margin-bottom: 0px;
            margin-top: 0px;
            background:#000;
            content:"";
            font-size:0;
            left:0;
            right:0;
            bottom:0;
        }

        .accordion:after {
            content: '\25B8';
            color: #000;
            font-weight: bold;
            float: right;
            margin-left: 5px;
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
        }

        .active:after {
            content: "\25BE";
        }

        .panel {
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }
    </style>

@endpush

@push('after-scripts')
    <x-frontend.script.nav />
    <script>
        let acc = document.getElementsByClassName("accordion");
        let i;

        for (i = 0; i < acc.length; i++) {

            acc[i].addEventListener("click", function() {

                this.classList.toggle("active");
                var panel = this.nextElementSibling;

                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                } 

            });

        }
    </script>
@endpush
</x-frontend.layout.app>


