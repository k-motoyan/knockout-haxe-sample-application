setup:
	haxelib install knockout.hx
	haxelib install jQueryExtern
	npm install
	node_modules/.bin/bower install
	rm -f bin/css/*.css
	rm -f bin/js/*.js
	rm -f bin/views/*.html
	rm -f bin/index.html
	cp bower_components/bootstrap/dist/css/bootstrap.min.css bin/css/bootstrap.css
	cp bower_components/jquery/dist/jquery.min.js bin/js/jquery.js
	cp bower_components/knockoutjs/dist/knockout.js bin/js/knockout.js

server:
	nekotools server -h localhost -d bin

clean:
	rm -f bin/css/*.css
	rm -f bin/js/*.js
	rm -f bin/views/*.html
	rm -f bin/index.html
	rm -rf bower_components
	rm -rf node_modules

.PHONY: setup server clean
