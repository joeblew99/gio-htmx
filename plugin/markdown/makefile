# https://github.com/aymanbagabas/go-udiff

SC=$(PWD)/../../_make
include $(SC)/caddy.mk
include $(SC)/gio.mk
include $(SC)/go.mk

BIN=$(PWD)/.bin
export PATH:=$(PATH):$(BIN)
BIN_PUS_NAME=pushup
BIN_PUS=$(BIN)/$(BIN_PUS_NAME)

SRC=$(PWD)/go-udiff

print:

bin-init:
	mkdir -p $(BIN)

GO_SRC_NAME=markdown
GO_SRC_FSPATH=$(PWD)

GIO_SRC_NAME=markdown
GIO_SRC_FSPATH=$(PWD)

mod-up:
	$(MAKE) go-mod-upgrade
build:
	$(MAKE) go-build
	$(MAKE) gio-build
build-all:
	$(MAKE) go-build-all
	$(MAKE) gio-build-all
run:
	# works :)
	$(MAKE) go-run

publish:
	# We dont have a plugin registry etc yet, so for now just put in the top level .bin
	


