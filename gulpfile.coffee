gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
jst = require 'gulp-template-compile'
concat = require 'gulp-concat'
rename = require 'gulp-rename'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
minifycss = require 'gulp-minify-css'
server = require 'gulp-webserver'
del = require 'del'
sequence = require 'run-sequence'
tar = require 'gulp-tar'
gzip = require 'gulp-gzip'
karma = require('karma').server

config =
  name: 'skeleton'
  version: '0.3.1'

gulp.task 'clean', (cb) ->
  del ['dist'], cb

gulp.task 'lib', ->
  gulp.src('lib/**')
    .pipe(gulp.dest('dist/assets/lib'))

gulp.task 'scripts', ->
  gulp.src(['src/main/app/coffee/services.coffee','src/main/app/coffee/controllers.coffee','src/main/app/coffee/application.coffee'])
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
    .pipe(sourcemaps.init())
    .pipe(coffee({ bare: true }).on('error', gutil.log))
    .pipe(concat('app.js'))
    .pipe(rename({ suffix: '-' }))
    .pipe(rename({ suffix: config.version }))
    .pipe(gulp.dest('dist/assets/app/js'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(uglify())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('dist/assets/app/js'))

gulp.task 'templates', ->
  gulp.src('src/main/app/partials/**/*.html')
     .pipe(gulp.dest('dist/assets/app/partials'))

gulp.task 'html', ->
  gulp.src(['src/main/app/*.html', '!src/main/app/styleguide.html'])
    .pipe(gulp.dest('dist'))

gulp.task 'stylehtml', ->
  gulp.src('src/main/app/styleguide.html')
    .pipe(gulp.dest('dist'))

gulp.task 'css', ->
  gulp.src('src/main/app/css/**/*.css')
    .pipe(rename({ suffix: '-' }))
    .pipe(rename({ suffix: config.version }))
    .pipe(gulp.dest('dist/assets/app/css'))
    .pipe(rename({ suffix: '.min' }))
    .pipe(minifycss())
    .pipe(gulp.dest('dist/assets/app/css'))

gulp.task 'images', ->
  gulp.src('src/main/app/img/**/*')
    .pipe(gulp.dest('dist/assets/app/img'))

gulp.task 'data', ->
  gulp.src('src/main/app/data/**/*')
    .pipe(gulp.dest('dist/assets/app/data'))

gulp.task 'tar', ->
  gulp.src('dist/**')
    .pipe(tar("#{config.name}.tar"))
    .pipe(gzip())
    .pipe(gulp.dest('dist'))

gulp.task 'unittest', ->
  karma.start
    configFile: __dirname + '/karma.conf.coffee'
    singleRun: true

gulp.task 'default', ['clean'], ->
  gulp.start 'lib', 'templates', 'scripts', 'html', 'css', 'images', 'data'

gulp.task 'dist', ['clean'], ->
  sequence ['lib', 'templates', 'scripts', 'html', 'css', 'images', 'data'], 'tar'

gulp.task 'run', ['lib', 'templates', 'scripts', 'html', 'stylehtml', 'css', 'images', 'data'], ->
  gulp.watch 'src/main/app/partials/**/*.html', ['templates']
  gulp.watch 'src/main/app/coffee/**/*.coffee', ['scripts']
  gulp.watch 'src/main/app/*.html', ['html']
  gulp.watch 'src/main/app/styleguide.html', ['stylehtml']
  gulp.watch 'src/main/app/css/**/*.css', ['css']
  gulp.watch 'src/main/app/img/**/*', ['images']
  gulp.watch 'src/main/app/data/**/*', ['data']
  gulp.watch 'lib/**', ['lib']

  gulp.src('dist')
    .pipe(server(
      port: 9000
      livereload: true
    ))

gulp.task 'test', ['clean'], ->
  sequence ['lib', 'templates', 'scripts', 'html', 'css', 'images', 'data'], 'unittest'
