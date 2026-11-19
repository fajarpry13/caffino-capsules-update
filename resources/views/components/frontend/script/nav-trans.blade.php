<script>
    window.onscroll = function() {
        const nav = document.querySelector('#nav-wrap');
        const navFix = document.querySelector('#navbar-bg');
        const fixNav = nav.offsetTop;

        if(window.pageYOffset > fixNav) {
            nav.classList.add('bg-caffino', 'slide-in', 'shadow');
            navFix.classList.add('bg-caffino');
        } else {
            // if have class navbar-open dont remove bg-caffino
            const navOpen = document.querySelector('.navbar-open');
            if(!navOpen) {
                nav.classList.remove('bg-caffino', 'slide-in', 'shadow');
                navFix.classList.remove('bg-caffino');
            }
        }
    }
</script>