<div class="footer">
    <div class="footer__wrap">
        <div class="footer__logo">
            <a href="{{ route('frontend.home') }}" aria-label="Logo">
                <x-frontend.utils.logo fill="fill-white" tinggi="63.5px" lebar="148.62px" />
            </a>
        </div>
        <div class="footer__copyr">
            <p>Copyrights &copy; {{ date("Y") }} 
            <br>Member of Savoria Group, All Rights Reserved</p>
        </div>
        <div class="">
            <x-frontend.footer-links />
        </div>
    </div>
</div>