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
dep-git:
	git clone git@github.com:aymanbagabas/go-udiff.git -b master
dep-git-del:
	rm -rf $(SRC)

### EXAMPLE 

GO_SRC_NAME=ex
GO_SRC_FSPATH=$(PWD)/ex

ex-mod-up:
	$(MAKE) go-mod-upgrade
ex-build:
	$(MAKE) go-build
ex-build-all:
	$(MAKE) go-build-all
ex-run:
	# works :)
	$(MAKE) go-run


