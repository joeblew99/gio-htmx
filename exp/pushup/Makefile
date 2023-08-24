# https://github.com/adhocteam/pushup

SC=$(PWD)/../../_make
include $(SC)/caddy.mk
include $(SC)/gio.mk
include $(SC)/go.mk

BIN=$(PWD)/.bin
export PATH:=$(PATH):$(BIN)
BIN_PUS_NAME=pushup
BIN_PUS=$(BIN)/$(BIN_PUS_NAME)

SRC=$(PWD)/pushup

print:

bin-init:
	mkdir -p $(BIN)
dep-git:
	git clone git@github.com:adhocteam/pushup.git -b main
dep-git-del:
	rm -rf $(SRC)

# SERVER

GO_SRC_NAME=pushup
GO_SRC_FSPATH=$(SRC)

build: bin-init
	$(MAKE) go-build
	# TODO: in _make/go.mk, add a "go-build-post" target that does this in OS agnostic way.
	# go-build then checks for GO_SRC_POST_FSPATH, and copies the right binary to GO_SRC_POST_FSPATH.
	cp $(SRC)/.bin/gobuild/darwin_amd64/$(GO_SRC_NAME) $(BIN_PUS)
build-all:
	# FAILS for windows build ?
	$(MAKE) go-build-all


## EXAMPLE


TEST_FSPATH=$(PWD)/ex
TEST_NAME=test
TEST=$(TEST_FSPATH)/$(TEST_NAME)
TEST_CMD=cd $(TEST) && $(BIN_PUS_NAME)

run-new:
	mkdir -p $(TEST_FSPATH)
	cd $(TEST_FSPATH) && $(BIN_PUS_NAME) new $(TEST_NAME)

run-run:
	$(TEST_CMD) run
	# http://0.0.0.0:8080/
	# http://0.0.0.0:8080/debug/pprof/
	# http://0.0.0.0:8080/debug/pprof/cmdline
	# http://0.0.0.0:8080/debug/pprof/profile
	# http://0.0.0.0:8080/debug/pprof/symbol
	# http://0.0.0.0:8080/debug/pprof/trace
run-dev:
	$(TEST_CMD) run -dev
run-build:
	$(TEST_CMD) build
run-routes:
	$(TEST_CMD) routes

