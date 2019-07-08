module.exports = ({ file, options, env }) => ({
  parser: file.extname === '.sss' ? 'sugarss' : false,
  plugins: {
    'autoprefixer': {
      browsers: ['last 3 versions']
    },
    'cssnano': env === 'production' ? true : false,
    'stylelint': env === 'development' ? true : false
  }
})
