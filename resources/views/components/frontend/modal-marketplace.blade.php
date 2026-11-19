@props([
    'link' => null,
])

<div id="modalBuyNow" class="modal-buynow">
    <div id="cardBuyNow" class="modal-buynow__card">
        <button id="btnClose" class="float-right m-4 modal-close"><i class="fa-solid fa-x text-[15px]"></i></button>
        <div class="modal-buynow__card__wrap">
            <div class="modal-buynow__card__header">
                <h1>E-COMMERCE</h1>
                <hr class="border border-solid border-black my-[15px]">
            </div>
            <div class="modal-buynow__card__body">
                <div class="modal-buynow__card__body-wrap">
                    <div class="olshop">
                        <a href="{{ $link['btn-link-tokped']->value }}" target="_blank" class="btn_olshop">
                            <img class="" src="{{ asset('img/icon/tokped.png') }}" alt="">
                        </a>
                    </div>
                    <div class="olshop">
                        <a href="{{ $link['btn-link-shopee']->value }}" target="_blank" class="btn_olshop">
                            <img class="" src="{{ asset('img/icon/shopee.png') }}" alt="">
                        </a>
                    </div>
                    <div class="olshop">
                        <a href="{{ $link['btn-link-blibli']->value }}" target="_blank" class="btn_olshop">
                            <img class="" src="{{ asset('img/icon/blibli.png') }}" alt="">
                        </a>
                    </div>
                    <div class="olshop">
                        <a href="{{ $link['btn-link-bukalapak']->value }}" target="_blank" class="btn_olshop">
                            <img class="" src="{{ asset('img/icon/bukalapak.png') }}" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('after-scripts')
<script>
   $(document).ready(function() {
        $('#btnBuyNow').click(function () {
            $('#modalBuyNow').fadeIn('slow');
        })

        $('#btnClose').click(function() {
            $("#modalBuyNow").fadeOut('slow');
        })

        $('.btn_olshop').click(function() {
            $("#modalBuyNow").fadeOut('slow');
        })

        $(window).click(function (e) {
            let modal = document.querySelector('#modalBuyNow')

            if (e.target == modal) {
                $('#modalBuyNow').hide();
            }
        })
    })
</script>
@endpush