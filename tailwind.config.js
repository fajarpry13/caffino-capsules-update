// tailwind.config.js
module.exports = {
  content: [
    './storage/framework/views/*.php',
    './resources/**/*.blade.php',
    './resources/**/*.js',
    './resources/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    container: {
      center: true,
      padding: '1rem',
      screens: {
         sm: "540px",
         md: "720px",
         lg: "1120px",
         xl: "1320px"
      }
    },
    extend: {
      fontFamily: {
        roboto: 'Roboto'
      }
    },

    pagination: theme => ({
      link: 'bg-white px-3 py-2 rounded text-gray-400 no-underline text-[18px]',
      linkActive: 'text-black underline',
      linkHover: 'bg-gray-300',
      linkFirst: 'bg-transparent text-black font-bold',
      linkFirstHover: 'bg-gray-300',
      linkLast: 'bg-transparent text-black font-bold',
      linkLastHover: 'bg-gray-300',
      linkDisabled: 'bg-transparent text-gray-400',
      linkDisabledHover: 'bg-transparent'
    })
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('tailwindcss-plugins/pagination'),
  ],
}