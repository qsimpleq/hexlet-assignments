setup:
	bin/setup
	yarn install
	yarn build
	yarn build:css
	bin/rails db:fixtures:load

start:
	bin/dev

console:
	bin/rails console

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

.PHONY: test
