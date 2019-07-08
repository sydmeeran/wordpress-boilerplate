var gulp = require('gulp'),
gulpLoadPlugins = require('gulp-load-plugins'),
plugins = gulpLoadPlugins(),
path = require('path');

gulp.task('svgstore', function(done){
  gulp.src('static/icons/*.svg')
  .pipe(plugins.svgmin( function(file) {
    plugins: [{
      cleanupIDs: {
        prefix: path.basename(file.relative, path.extname(file.relative)) + '-',
        minify: true
      }
    }]
  }))
  .pipe(plugins.svgstore())
  .pipe(gulp.dest('static'))
  done();
});

gulp.task('default',
  gulp.series('svgstore',
  function(done) {
    done();
  })
);

gulp.task('build',
  gulp.series('svgstore',
  function(done) {
    done();
  })
);
