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
        'green-100': '#e6f4e6',
        'green-700': '#3b5a3b',
        'green-50': '#f2f9f2',
      },
    },
  },
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: [
      "bumblebee"
    ],
  },
}
