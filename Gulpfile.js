var gulp = require('gulp'),
    jade = require('gulp-jade'),
    stylus = require('gulp-stylus'),
    shell = require('gulp-shell'),
    concat = require('gulp-concat'),
    uglifyjs = require('gulp-uglify'),
    uglifycss = require('gulp-uglifycss'),
    watch = require('gulp-watch'),
    path = require('path');

var app_path  = path.resolve('./src/ks'),
    bin_path = path.resolve('./bin');

gulp.task('jade', function() {
    gulp
        .src(path.join(app_path, 'templates/*.jade'))
        .pipe(jade({ pretty: true }))
        .pipe(gulp.dest( path.join(bin_path, 'views') ));
    gulp
        .src(path.join(bin_path, 'index.jade'))
        .pipe(jade({ pretty: true }))
        .pipe(gulp.dest(bin_path));
});

gulp.task('stylus', function() {
    gulp
        .src(path.join(app_path, 'styles/*.styl'))
        .pipe(stylus())
        .pipe(gulp.dest( path.join(bin_path, 'css') ));
});

gulp.task('haxe', shell.task([
    'haxe compile.hxml'
]));

gulp.task('css-compress', function() {
    var compressed_css = path.join(bin_path, 'css/app.css');
    gulp
        .src([
            path.join(bin_path, 'css/*.css'),
            '!' + compressed_css
        ])
        .pipe(concat(compressed_css))
        .pipe(uglifycss())
        .pipe(gulp.dest(compressed_css));
});

gulp.task('default', ['jade', 'stylus', 'css-compress', 'haxe']);

gulp.task('watch', function() {
    gulp.watch(path.join(app_path, '**/*.hx'), ['haxe']);
    gulp.watch(path.join(app_path, 'styles/*.styl'), ['stylus', 'css-compress']);
    gulp.watch(path.join(app_path, 'templates/*.jade'), ['jade', 'haxe']);
    gulp.watch(path.join(bin_path, 'index.jade'), ['jade']);
});
