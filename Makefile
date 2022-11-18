.PHONY: help

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	check \
	dist/main.js

check:
	npx --no -- tsc

dist/main.js: | src/main.tsx dist
	npx --no -- esbuild --bundle $(word 1,$|) --outfile=$@

dist:
	mkdir $@

clean:
	rm -rf dist
