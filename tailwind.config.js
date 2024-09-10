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
        background: '#F6F5EA',
        header_footer: '#CFCAA5',
        btn: '#626C88',
        text: '#5F5434',
        pink: '#F3D3B8',
        blue: '#A5C3CF',
        yellow: '#F4CC70',
        green: '#A99F3C',
        green2: '#C3BC75',
        navy: '#525E83',
        red: '#CF5326',
        my_white: '#FCFAF7'
      },
      fontFamily: {
        zenmaru: ['Zen Maru Gothic', 'serif']
      },
    },
  },
  plugins: [
    require('daisyui')
  ],
};
