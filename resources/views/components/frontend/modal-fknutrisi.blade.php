@props([
    'data' => null,
])

<div id="myModal" class="modal">
    <div class="modal__card">
        <button id="modalClose" class="modal-close"><i class="fa-solid fa-x"></i></button>
        <div class="modal__card__warp">
            <div class="modal__card__header">
                <h1>FAKTA NUTRISI</h1>
                <hr class="garis">
            </div>
            <div class="modal__card__body">
                <div class="modal__card__body-grid__fknutrisi">
                    @foreach ($data as $data) 
                    <div class="modal__card__body-items">
                        <p>{{ $data->name }}</p>
                        <p>{{ $data->value }}</p>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
 
@push('after-scripts')    
    <script>
        let modal = document.querySelector("#myModal");

        let btn = document.querySelector("#myBtn");

        let close = document.querySelector("#modalClose");

        btn.onclick = function() {
            modal.style.display = "block";
            modal.classList.add('slide-in');
            modal.classList.remove('slide-out');
        }
        
        close.onclick = function() {
            modal.classList.add('slide-out');
            modal.classList.remove('slide-in');
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
@endpush