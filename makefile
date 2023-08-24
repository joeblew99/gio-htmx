SC=$(PWD)/_make

include git.mk

include $(SC)/caddy.mk
include $(SC)/gio.mk
include $(SC)/go.mk
include $(SC)/goreman.mk
include $(SC)/minio.mk
include $(SC)/nats.mk
include $(SC)/weaver.mk

# MUST be last
include .env-git
include .env

# all binaries we make go here.
BIN_ROOT=$(PWD)/.bin
export $(PATH):=$(PATH):$(BIN_ROOT)

print:
	$(MAKE) env-print

all: dep-all build-all

### CLEAN

clean-os:
	# delete go stuff on OS that build up.
	$(MAKE) go-clean-os
clean-project:
	# delete any .bin folder
	$(MAKE) go-clean-bin-run

	# delete any .bin folder
	$(MAKE) go-clean-data-run
	
### ENV

env-git-print:
	@echo ""
	@echo "-- ENV GIT --"
	@echo "GIT_USER_NAME:          $(GIT_USER_NAME)"
	@echo "GIT_USER_EMAIL:         $(GIT_USER_EMAIL)"
	@echo "GIT_USER_SSH:           $(GIT_USER_SSH)"
	@echo "GIT_USER_REPO_URL:      $(GIT_USER_REPO_URL)"
	@echo ""

env-print:
	@echo ""
	@echo "-- ENV --"
	@echo "CADDY_SRC_CONFIG_FSPATH:     $(CADDY_SRC_CONFIG_FSPATH)"
	@echo "GOREMAN_SRC_CONFIG_FSPATH:   $(GOREMAN_SRC_CONFIG_FSPATH)"
	@echo "NATS_SRC_CONFIG_FSPATH:      $(NATS_SRC_CONFIG_FSPATH)"
	@echo ""

### DEPS

dep-print:
	$(MAKE) caddy-print
	$(MAKE) gio-print
	$(MAKE) go-print
	$(MAKE) goreman-print
	$(MAKE) minio-print
	$(MAKE) nats-print
	$(MAKE) weaver-print

dep-all:
	$(MAKE) caddy-dep
	$(MAKE) gio-dep
	$(MAKE) goreman-dep
	$(MAKE) minio-dep
	$(MAKE) nats-dep
	$(MAKE) weaver-dep
	
start-goreman:
	# DONT USE. Its leaking processes.
	#$(MAKE) goreman-server-run

start-caddy:
	$(MAKE) caddy-server-run
	# https://browse.localhost/
	# https://bin.localhost/

	# Client is here:
	# https://browse.localhost/cmd/client/.bin/giobuild/web_wasm/gio-htmx.web/

start-nats:
	$(MAKE) nats-server-run
	# Listening for websocket clients on wss://0.0.0.0:443
	# Listening for client connections on 0.0.0.0:4222
	
mod:
	go mod tidy


build-all: build-client-all
CLIENT_SRC_FSAPTH=$(PWD)/cmd/client
CLIENT_SRC_NAME=gio-htmx
build-client:
	$(MAKE) GIO_SRC_NAME=$(CLIENT_SRC_NAME) GIO_SRC_FSPATH=$(CLIENT_SRC_FSAPTH) gio-build
	# hack works for now..
	$(MAKE) go-clean-syso-run
build-client-all:
	$(MAKE) GIO_SRC_NAME=$(CLIENT_SRC_NAME) GIO_SRC_FSPATH=$(CLIENT_SRC_FSAPTH) gio-build-all
	# hack works for now..
	$(MAKE) go-clean-syso-run

SERVER_SRC_FSAPTH=$(PWD)/cmd/server
SERVER_SRC_NAME=gio-htmx-server

build-server:
	$(MAKE) GO_SRC_NAME=$(SERVER_SRC_NAME) GO_SRC_FSPATH=$(SERVER_SRC_FSAPTH) go-build
build-server-all:
	$(MAKE) GO_SRC_NAME=$(SERVER_SRC_NAME) GO_SRC_FSPATH=$(SERVER_SRC_FSAPTH) go-build-all

run:
	open $(CLIENT_SRC_FSAPTH)/.bin/giobuild/darwin_amd64
	