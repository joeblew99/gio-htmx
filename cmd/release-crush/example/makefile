SC=$(PWD)/../../../_make
include $(SC)/caddy.mk
include $(SC)/gio.mk
include $(SC)/go.mk

### EXAMPLE 

GO_SRC_NAME=example
GO_SRC_FSPATH=$(PWD)

all: build-all

mod-up:
	$(MAKE) go-mod-upgrade
build:
	$(MAKE) go-build
build-all:
	$(MAKE) go-build-all
run:
	# works :)
	$(MAKE) go-run

