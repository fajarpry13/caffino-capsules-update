<script>
    window.onscroll = function() {
        const nav = document.querySelector('#navigation');
        const fixNav = nav.offsetTop = 90;

        if(window.pageYOffset > fixNav) {
            nav.classList.add('navbar-fix', 'slide-in');
        } else {
            nav.classList.remove('navbar-fix', 'slide-in');
        }
    }
</script>