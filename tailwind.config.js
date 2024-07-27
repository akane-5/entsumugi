module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'green-100': '#c1d8ac',
        'green-700': '#769164',
        'green-50': '#93ca76',
        background: '#FCFAF7',
        button: '#BCA446',
        buttonAlt: '#CFCAA5',
        text: '#5F5434',
        waterblue: '#BED2D5',
        navy: '#525E83',
        red: '#CF5326',
        pink: '#F9DED1',
        yellow: '#DEB143'
      },
      fontFamily: {
        shippori: ['Shippori Mincho B1', 'serif;'],
        noto: ['Noto Serif JP', 'serif'],
        zenmaru: ['Zen Maru Gothic', 'serif'],
        Karakaze: ['Karakaze', 'sans-serif'],
        katsuo: ['katsuo', 'sans-serif']
      },
    },
  },
  plugins: [
    require('daisyui')
  ],
};
