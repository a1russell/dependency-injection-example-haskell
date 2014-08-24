.PHONY: build test

build:
	cabal build

test: build
	cabal test

