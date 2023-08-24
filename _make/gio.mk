# GIO
# https://github.com/gioui

# https://github.com/gioui/gio-cmd

### OS

GIO_GO_OS=$(shell $(GIO_GO_BIN_NAME) env GOOS)
GIO_GO_ARCH=$(shell $(GIO_GO_BIN_NAME) env GOARCH)
GIO_GO_TOOLDIR=$(shell $(GIO_GO_BIN_NAME) env GOTOOLDIR)
GIO_GO_PATH=$(shell $(GIO_GO_BIN_NAME) env GOPATH)


### BINS

GIO_GO_BIN_NAME=$(GIO_SRC_GO_BIN_NAME)
GIO_GO_BIN_WHICH=$(shell which $(GIO_GO_BIN_NAME))
GIO_GO_BIN_WHICH_VERSION=$(shell $(GIO_GO_BIN_NAME) version)
GIO_GO_BIN_WHICH_GO_VERSION=$(shell $(GIO_GO_BIN_NAME) version $(GIO_GO_BIN_WHICH))

GIO_BIN=gogio
GIO_BIN_VERSION=latest
GIO_BIN_WHICH=$(shell which $(GIO_BIN))
GIO_BIN_WHICH_GO_VERSION=$(shell $(GIO_GO_BIN_NAME) version $(GIO_BIN_WHICH))

GIO_GARBLE_BIN_NAME=garble
GIO_GARBLE_BIN_VERSION=latest
GIO_GARBLE_BIN_WHICH=$(shell which $(GIO_GARBLE_BIN_NAME))
GIO_GARBLE_BIN_WHICH_VERSION=$(shell $(GIO_GARBLE_BIN_NAME) version)
GIO_GARBLE_BIN_WHICH_GO_VERSION=$(shell $(GIO_GO_BIN_NAME) version $(GIO_GARBLE_BIN_WHICH))

# https://github.com/a8m/tree
GIO_TREE_BIN_NAME=tree
GIO_TREE_BIN_VERSION=latest
GIO_TREE_BIN_WHICH=$(shell which $(GIO_TREE_BIN_NAME))
GIO_TREE_BIN_WHICH_VERSION=$(shell $(GIO_TREE_BIN_NAME) version)
GIO_TREE_BIN_WHICH_GO_VERSION=$(shell $(GIO_GO_BIN_NAME) version $(GIO_TREE_BIN_WHICH))


### VARIABLES

# where to put the standard templates. Might want them elsewhere.
GIO_SRC_TEMPLATES_FSPATH=

## OVERRIDE variables
# where to look for gio golang soure code to build from.
GIO_SRC_FSPATH=$(PWD)
GIO_SRC_NAME=ex
GIO_SRC_GO_BIN_NAME=go
# or GIO_SRC_GO_BIN_NAME=gotip

### VARIABLES

# COMPUTED variables

GIO_SRC=$(GIO_SRC_FSPATH)/$(GIO_SRC_NAME)

# build paths
GIO_BUILD_FSPATH=$(GIO_SRC_FSPATH)/.bin/giobuild
GIO_BUILD_RELEASE_FSPATH=$(GIO_SRC_FSPATH)/.bin/giobuild-release

# templates
_GIO_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_GIO_TEMPLATES_SOURCE=$(_GIO_SELF_DIR)templates/gio
_GIO_TEMPLATES_TARGET=$(PWD)/.templates/gio


## path to builds for easy running.
GIO_RUN_FSPATH=?

ifeq ($(GO_OS),windows)
	GIO_RUN_FSPATH=$(GIO_BUILD_WINDOWS_AMD64_PACK)
endif

ifeq ($(GO_OS),darwin)
	GIO_RUN_FSPATH=$(GIO_BUILD_DARWIN_AMD64_PACK)
endif

ifeq ($(GO_OS),linux)
	GIO_RUN_FSPATH=$(GIO_BUILD_LINUX_AMD64_PACK)
endif 

GIO_RUN_RELEASE_FSPATH=?


ifeq ($(GO_OS),windows)
	GIO_RUN_RELEASE_FSPATH=$(GIO_BUILD_WINDOWS_RELEASE_AMD64_PACK)
endif

ifeq ($(GO_OS),darwin)
	GIO_RUN_RELEASE_FSPATH=$(GIO_BUILD_DARWIN_RELEASE_AMD64_PACK)
endif

ifeq ($(GO_OS),linux)
	GIO_RUN_RELEASE_FSPATH=$(GIO_BUILD_LINUX_RELEASE_AMD64_PACK)
endif 


## Prints the variables used.
gio-print:
	@echo ""
	@echo --- OS ---
	@echo "GIO_GO_OS:                            $(GIO_GO_OS)"
	@echo "GIO_GO_ARCH:                          $(GIO_GO_ARCH)"
	@echo "GIO_GO_TOOLDIR:                       $(GIO_GO_TOOLDIR)"
	@echo "GIO_GO_PATH:                          $(GIO_GO_PATH)"

	@echo ""
	@echo "--- BINS ---"
	@echo "GIO_GO_BIN_NAME:                      $(GIO_GO_BIN_NAME)"
	@echo "GIO_GO_BIN_WHICH                      $(GIO_GO_BIN_WHICH)"
	@echo "GIO_GO_BIN_WHICH_VERSION:             $(GIO_GO_BIN_WHICH_VERSION)"
	@echo "GIO_GO_BIN_WHICH_GO_VERSION:          $(GIO_GO_BIN_WHICH_GO_VERSION)"
	
	@echo ""
	@echo "GIO_BIN:                              $(GIO_BIN)"
	@echo "GIO_BIN_WHICH:                        $(GIO_BIN_WHICH)"
	@echo "GIO_BIN_WHICH_GO_VERSION:             $(GIO_BIN_WHICH_GO_VERSION)"
	
	@echo ""
	@echo "GIO_GARBLE_BIN_NAME:                  $(GIO_GARBLE_BIN_NAME)"
	@echo "GIO_GARBLE_BIN_VERSION                $(GIO_GARBLE_BIN_VERSION)"
	@echo "GIO_GARBLE_BIN_WHICH                  $(GIO_GARBLE_BIN_WHICH)"
	@echo "GIO_GARBLE_BIN_WHICH_VERSION          $(GIO_GARBLE_BIN_WHICH_VERSION)"
	@echo "GIO_GARBLE_BIN_WHICH_GO_VERSION       $(GIO_GARBLE_BIN_WHICH_GO_VERSION)"

	@echo ""
	@echo "GIO_TREE_BIN_NAME:                    $(GIO_TREE_BIN_NAME)"
	@echo "GIO_TREE_BIN_VERSION                  $(GIO_TREE_BIN_VERSION)"
	@echo "GIO_TREE_BIN_WHICH                    $(GIO_TREE_BIN_WHICH)"
	@echo "GIO_TREE_BIN_WHICH_VERSION            $(GIO_TREE_BIN_WHICH_VERSION)"
	@echo "GIO_TREE_BIN_WHICH_GO_VERSION         $(GIO_TREE_BIN_WHICH_GO_VERSION)"
	

	@echo ""
	@echo --- VARIABLES ---
	@echo ""
	@echo "- Override variables"
	@echo "GIO_SRC_FSPATH:                       $(GIO_SRC_FSPATH)"
	@echo "GIO_SRC_NAME:                         $(GIO_SRC_NAME)"
	@echo "GIO_SRC_GO_BIN_NAME:                  $(GIO_SRC_GO_BIN_NAME)"
	
	@echo ""
	@echo "Computed variables"
	
	@echo ""
	@echo "- build paths"
	@echo "GIO_BUILD_FSPATH:                    $(GIO_BUILD_FSPATH)"
	@echo "GIO_BUILD_RELEASE_FSPATH:            $(GIO_BUILD_RELEASE_FSPATH)"

	@echo ""
	@echo "- run paths"
	@echo "GIO_RUN_FSPATH:                     $(GIO_RUN_FSPATH)"
	@echo "GIO_RUN_RELEASE_FSPATH:             $(GIO_RUN_RELEASE_FSPATH)"

	@echo ""

gio-print-build:
	
	@echo ""
	@echo "-- ALL BUILD variables:"
	@echo ""

	$(MAKE) gio-web-print

	$(MAKE) gio-desk-windows-print

	$(MAKE) gio-desk-darwin-print

	$(MAKE) gio-ios-print

	$(MAKE) gio-android-print



## Installs all tools
gio-dep:
	@echo ""
	@echo "-- Installing gogio tool into go bin --"
	$(GIO_GO_BIN_NAME) install gioui.org/cmd/gogio@$(GIO_BIN_VERSION)
	@echo installed gogio [ $(GIO_BIN_VERSION) ] at : $(GIO_BIN_WHICH)

	@echo
	@echo "-- Installing garble"
	$(GIO_GO_BIN_NAME) install mvdan.cc/garble@$(GIO_GARBLE_BIN_VERSION)
	@echo "garble installed at : $(GIO_GARBLE_BIN_WHICH)"

	@echo
	@echo "-- Installing tree"
	$(GIO_GO_BIN_NAME) install github.com/a8m/tree/cmd/tree@$(GIO_TREE_BIN_VERSION)
	@echo "tree installed at : $(GIO_TREE_BIN_WHICH)"

gio-dep-git:
	# my fork 
	rm -rf gio-cmd
	git clone git@github.com:gedw99/gio-cmd.git -b main
	cd gio-cmd && git remote add upstream git@github.com:gioui/gio-cmd.git 
	cd gio-cmd/gogio && $(GIO_GO_BIN_NAME) build -o $(GIO_GO_BIN_FSPATH)/gogio .

	@echo installed gogio [ $(GIO_BIN_VERSION) ] at : $(GIO_BIN_WHICH)

gio-dep-git-sync:
	# for getting back upstream ...
	cd gio-cmd && git remote -v
	cd gio-cmd && git git remote add upstream git@github.com:gioui/gio-cmd.git 
	cd gio-cmd && git fetch upstream
	cd gio-cmd && git reset --hard upstream/main
	cd gio-cmd && git push origin main --force



## prints the templates 
gio-templates-print:
	@echo ""
	@echo "- templates:"
	@echo "_GIO_SELF_DIR:                      $(_GIO_SELF_DIR)"
	@echo "_GIO_TEMPLATES_SOURCE:              $(_GIO_TEMPLATES_SOURCE)"
	@echo "_GIO_TEMPLATES_TARGET:              $(_GIO_TEMPLATES_TARGET)"

## installs the standard templates
gio-templates-dep:
	@echo ""
	@echo "-- Installing GIO templates into your project --"
	mkdir -p $(_GIO_TEMPLATES_TARGET)
	cp -r $(_GIO_TEMPLATES_SOURCE) $(_GIO_TEMPLATES_TARGET)
	@echo installed gio templates  at : $(_GIO_TEMPLATES_TARGET)

gio-build-all:
	# Always do Web so we know its never broken. Its pretty fast
	$(MAKE) gio-web-build
	# These  builders fail 
	#$(MAKE) gio-wasmtiny-build
	#$(MAKE) gio-wasm-build


	$(MAKE) gio-desk-windows-build

	$(MAKE) gio-desk-darwin-build

	$(MAKE) gio-desk-linux-build

## Builds the code for Web and Desktop as a convenience
gio-build:
	# only build for OS i am on.

ifeq ($(GIO_GO_OS),windows)
	$(MAKE) gio-desk-windows-build
endif

ifeq ($(GIO_GO_OS),darwin)
	$(MAKE) gio-desk-darwin-build
endif

ifeq ($(GIO_GO_OS),linux)
	$(MAKE) gio-desk-linux-build
endif 

gio-run:

ifeq ($(GIO_GO_OS),windows)
	$(MAKE) gio-desk-windows-run
endif

ifeq ($(GIO_GO_OS),darwin)
	$(MAKE) gio-desk-darwin-run
endif

ifeq ($(GIO_GO_OS),linux)
	$(MAKE) gio-desk-linux-run
endif 
	
gio-runpack:

ifeq ($(GIO_GO_OS),windows)
	$(MAKE) gio-desk-windows-runpack
endif

ifeq ($(GIO_GO_OS),darwin)
	$(MAKE) gio-desk-darwin-runpack
endif

ifeq ($(GIO_GO_OS),linux)
	$(MAKE) gio-desk-linux-runpack
endif 

gio-web-run:
	# yes i know its a leaking abstraction.
	
	# work out a way to know the URL path, so we can open a browser to it.
	# assume on https://localhost
	# open $(GIO_BUILD_WEB_PATH)
	caddy run

# Deletes the gio build foolder
gio-build-delete:
	rm -rf $(GIO_BUILD_FSPATH)
gio-build-release-delete:
	rm -rf $(GIO_BUILD_RELEASE_FSPATH)


### WEB

GIO_BUILD_WEB_PATH=$(GIO_BUILD_FSPATH)/web_wasm/$(GIO_SRC_NAME).web
GIO_BUILD_TINYWASM_PATH=$(GIO_BUILD_FSPATH)/web_tinywasm/$(GIO_SRC_NAME).web
GIO_BUILD_WASM_PATH=$(GIO_BUILD_FSPATH)/web_wasm/$(GIO_SRC_NAME).web

gio-web-print:
	@echo "GIO_BUILD_WEB_PATH:                 $(GIO_BUILD_WEB_PATH)"
	@echo "GIO_BUILD_TINYWASM_PATH:            $(GIO_BUILD_TINYWASM_PATH)"
	@echo "GIO_BUILD_WASM_PATH:                $(GIO_BUILD_WASM_PATH)"
	
gio-web-build:
	@echo ""
	@echo "$(GIO_SRC_NAME): js wasm ( using gio cmd )"

	@echo ""
	@echo ""
	@echo ""
	@echo "web - js"
	@echo ""

	cd $(GIO_SRC_FSPATH) && $(GIO_GO_BIN_NAME) generate -v ./...
	
	## TODO <title>foobar</title> is not changed in index.html despite setting the -appid
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target js -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_WEB_PATH) .
	
gio-wasmtiny-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "$(GIO_SRC_NAME): wasip1 wasm ( using tinygo )"
	cd $(GIO_SRC_FSPATH) && $(GIO_GO_BIN_NAME) generate -v ./...
	# also try "-scheduler=none" as it removed goroutine and speeds up build.
	cd $(GIO_SRC_FSPATH) && tinygo build -o $(GIO_BUILD_TINYWASM_PATH) -target wasm .


gio-wasm-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "$(GIO_SRC_NAME): wasip1 wasm  ( using gotip )"

	@echo ""
	@echo "web - wasip1"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_GO_BIN_NAME) generate -v ./...
	
	cd $(GIO_SRC_FSPATH) && GOOS=wasip1 GOARCH=wasm $(GIO_GO_BIN_NAME) build -tags $(GIO_SRC_TAG) -o $(GIO_BUILD_WASM_PATH) .

	# tinygo not needed now
	#cd $(GIO_SRC_FSPATH) && tinygo build -o $(GIO_BUILD_TINYWASM_PATH) -target wasm .

### DESK

### DESK - MACOS

# debug

GIO_BUILD_DARWIN_PACK=$(GIO_BUILD_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_BIN=$(GIO_BUILD_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app//Contents/MacOS/$(GIO_SRC_NAME)

GIO_BUILD_DARWIN_AMD64_PACK=$(GIO_BUILD_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_ARM64_PACK=$(GIO_BUILD_FSPATH)/darwin_arm64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_AMD64_BIN=$(GIO_BUILD_DARWIN_AMD64_PACK)/Contents/MacOS/$(GIO_SRC_NAME)
GIO_BUILD_DARWIN_ARM64_BIN=$(GIO_BUILD_DARWIN_ARM64_PACK)/Contents/MacOS/$(GIO_SRC_NAME)

# release

GIO_BUILD_DARWIN_RELEASE_PACK=$(GIO_BUILD_RELEASE_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_RELEASE_BIN=$(GIO_BUILD_RELEASE_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app//Contents/MacOS/$(GIO_SRC_NAME)

GIO_BUILD_DARWIN_RELEASE_AMD64_PACK=$(GIO_BUILD_RELEASE_FSPATH)/darwin_amd64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_RELEASE_ARM64_PACK=$(GIO_BUILD_RELEASE_FSPATH)/darwin_arm64/$(GIO_SRC_NAME).app
GIO_BUILD_DARWIN_RELEASE_AMD64_BIN=$(GIO_BUILD_DARWIN_RELEASE_AMD64_PACK)/Contents/MacOS/$(GIO_SRC_NAME)
GIO_BUILD_DARWIN_RELEASE_ARM64_BIN=$(GIO_BUILD_DARWIN_RELEASE_ARM64_PACK)/Contents/MacOS/$(GIO_SRC_NAME)


gio-desk-darwin-print:
	@echo ""
	@echo "- gio-desk-darwin-print:"
	@echo "GIO_BUILD_DARWIN_AMD64_PACK:        $(GIO_BUILD_DARWIN_AMD64_PACK)"
	@echo "GIO_BUILD_DARWIN_ARM64_PACK:        $(GIO_BUILD_DARWIN_ARM64_PACK)"
	@echo "GIO_BUILD_DARWIN_AMD64_BIN:         $(GIO_BUILD_DARWIN_AMD64_BIN)"
	@echo "GIO_BUILD_DARWIN_ARM64_BIN:         $(GIO_BUILD_DARWIN_ARM64_BIN)"
	@echo ""
	@echo "-run:"
	@echo "GIO_BUILD_DARWIN_PACK:              $(GIO_BUILD_DARWIN_PACK)"
	@echo "GIO_BUILD_DARWIN_BIN:               $(GIO_BUILD_DARWIN_BIN)"

	# release
	
	@echo ""
	@echo "- gio-desk-darwin-release-print:"
	@echo "GIO_BUILD_DARWIN_RELEASE_AMD64_PACK:        $(GIO_BUILD_DARWIN_RELEASE_AMD64_PACK)"
	@echo "GIO_BUILD_DARWIN_RELEASE_ARM64_PACK:        $(GIO_BUILD_DARWIN_RELEASE_ARM64_PACK)"
	@echo "GIO_BUILD_DARWIN_RELEASE_AMD64_BIN:         $(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)"
	@echo "GIO_BUILD_DARWIN_RELEASE_ARM64_BIN:         $(GIO_BUILD_DARWIN_RELEASE_ARM64_BIN)"
	@echo ""
	@echo "- run:"
	@echo "GIO_BUILD_DARWIN_RELEASE_PACK:              $(GIO_BUILD_DARWIN_RELEASE_PACK)"
	@echo "GIO_BUILD_DARWIN_RELEASE_BIN:               $(GIO_BUILD_DARWIN_RELEASE_BIN)"

gio-desk-darwin-build: 

	@echo ""
	@echo ""
	@echo ""
	@echo "-- gio-desk-darwin-build --"
	@echo ""
	@echo "GIO_BUILD_DARWIN_AMD64_PACK:       $(GIO_BUILD_DARWIN_AMD64_PACK)"
	@echo "GIO_BUILD_DARWIN_BIN:              $(GIO_BUILD_DARWIN_AMD64_PACK)"
	@echo ""

	# this packages it automatically as a .app
	cd $(GIO_SRC_FSPATH) && $(GIO_GO_BIN_NAME) generate -v ./...
	# the new way.
	# appid does change the plist Bundle identifier, and binary name inside the packaging.
	@echo ""
	@echo "darwin - packed"
	@echo ""

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target macos -arch amd64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_DARWIN_AMD64_PACK) .
	
	@echo ""
	@echo "-- arm64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target macos -arch arm64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_DARWIN_ARM64_PACK) .

	# also need without packing
	@echo ""
	@echo "darwin - binary"
	@echo ""

	@echo ""
	@echo "-- amd64"
	@echo ""
	cp $(GIO_BUILD_DARWIN_AMD64_BIN) $(GIO_BUILD_FSPATH)/darwin_amd64/$(GIO_SRC_NAME)

	@echo ""
	@echo "-- arm64"
	@echo ""
	cp $(GIO_BUILD_DARWIN_ARM64_BIN) $(GIO_BUILD_FSPATH)/darwin_arm64/$(GIO_SRC_NAME)


gio-desk-darwin-run:
	open $(GIO_BUILD_DARWIN_BIN)
gio-desk-darwin-runpack:
	open $(GIO_BUILD_DARWIN_PACK)

# release

gio-desk-darwin-release-build:
	
	@echo ""
	@echo ""
	@echo ""
	@echo "darwin - binary release"
	@echo ""

	#cd $(GIO_SRC_FSPATH) && $(GIO_GO_BIN_NAME) generate -v ./...

	# CURRENTLY garble messes it up.
	
	# first build binary inside the pack scaffold.
	#  -debugdir=out
	mkdir -p $(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)_out
	cd $(GIO_SRC_FSPATH) && GOOS=darwin GOARCH=amd64 $(GIO_GARBLE_BIN_NAME) -debugdir=$(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)_out -tiny build .
	
	# need to copy go.mod etc in.
	cp $(GIO_SRC_FSPATH)/go.mod $(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)_out/$(GIO_SRC_NAME)
	cp $(GIO_SRC_FSPATH)/go.sum $(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)_out/$(GIO_SRC_NAME)

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_BUILD_DARWIN_RELEASE_AMD64_BIN)_out/$(GIO_SRC_NAME) && $(GIO_BIN) -target macos -arch amd64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_DARWIN_RELEASE_AMD64_PACK) .
	
	@echo ""
	@echo "-- amd64: NOP"
	@echo ""
	#cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target macos -arch arm64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_DARWIN_RELEASE_ARM64_PACK) .
gio-desk-darwin-release-run:
	open $(GIO_BUILD_DARWIN_RELEASE_BIN)

gio-desk-darwin-sign-notorise:
	# still to do...
gio-desk-darwin-sign:
	# https://github.com/gioui/gio-cmd/blob/main/gogio/darwinosbuild.go
	# this inserts the signing into the built .app.
	codesign -s - $(GIO_BUILD_DARWIN_AMD64_PACK)
	codesign -s - $(GIO_BUILD_DARWIN_ARM64_PACK)
gio-desk-darwin-sign-check:
	# https://osxdaily.com/2016/03/14/verify-code-sign-apps-darwin-os-x/
	# Look at Authority values !!
	codesign -dv --verbose=4 $(GIO_BUILD_DARWIN_AMD64_PACK)
	codesign -dv --verbose=4 $(GIO_BUILD_DARWIN_ARM64_PACK)
	@echo ""
	@echo "terminal app, just to compare for now..."
	codesign -dv --verbose=4 /System/Applications/Utilities/Terminal.app
	

### DESK - WINDOWS

GIO_BUILD_WINDOWS_AMD64_PATH=$(GIO_BUILD_FSPATH)/windows_amd64/$(GIO_SRC_NAME).exe
GIO_BUILD_WINDOWS_ARM64_PATH=$(GIO_BUILD_FSPATH)/windows_arm64/$(GIO_SRC_NAME).exe
GIO_BUILD_WINDOWS_PATH=$(GIO_BUILD_FSPATH)/windows_amd64/$(GIO_SRC_NAME).exe

GIO_BUILD_WINDOWS_RELEASE_AMD64_PATH=$(GIO_BUILD_RELEASE_FSPATH)/windows_amd64/$(GIO_SRC_NAME).exe
GIO_BUILD_WINDOWS_RELEASE_ARM64_PATH=$(GIO_BUILD_RELEASE_FSPATH)/windows_arm64/$(GIO_SRC_NAME).exe
GIO_BUILD_WINDOWS_RELEASE_PATH=$(GIO_BUILD_RELEASE_FSPATH)/windows_amd64/$(GIO_SRC_NAME).exe

# NOT finished
gio-desk-windows-print:
	@echo ""
	@echo "- gio-desk-windows-print:"
	@echo "GIO_BUILD_WINDOWS_AMD64_PATH:             $(GIO_BUILD_WINDOWS_AMD64_PATH)"
	@echo "GIO_BUILD_WINDOWS_ARM64_PATH:             $(GIO_BUILD_WINDOWS_ARM64_PATH)"
	@echo "GIO_BUILD_WINDOWS_PATH:                   $(GIO_BUILD_WINDOWS_PATH)"
	@echo ""
	@echo "- gio-desk-windows-release-print:"
	@echo "GIO_BUILD_WINDOWS_RELEASE_AMD64_PATH:     $(GIO_BUILD_WINDOWS_RELEASE_AMD64_PATH)"
	@echo "GIO_BUILD_WINDOWS_RELEASE_ARM64_PATH:     $(GIO_BUILD_WINDOWS_RELEASE_ARM64_PATH)"
	@echo "GIO_BUILD_WINDOWS_RELEASE_PATH:           $(GIO_BUILD_WINDOWS_RELEASE_PATH)"

	
gio-desk-windows-pack-init:
	# TODO: 
gio-desk-windows-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "windows - binary"
	@echo ""
	# this does not packaging. Its just .exe for now.

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target windows -arch amd64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_WINDOWS_AMD64_PATH) .
	
	@echo ""
	@echo "-- arm64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target windows -arch arm64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_WINDOWS_ARM64_PATH) .

gio-desk-windows-release-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "windows - binary release"
	@echo ""
	# this does not packaging. Its just .exe for now.

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target windows -arch amd64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_WINDOWS_RELEASE_AMD64_PATH) .
	
	@echo ""
	@echo "-- arm64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target windows -arch arm64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_WINDOWS_RELEASE_ARM64_PATH) .

gio-desk-windows-run:
	open $(GIO_BUILD_WINDOWS_PATH)
gio-desk-windows-release-run:
	open $(GIO_BUILD_WINDOWS_RELEASE_PATH)


### DESK - LINUX

GIO_BUILD_LINUX_AMD64_PATH=$(GIO_BUILD_FSPATH)/linux_amd64/$(GIO_SRC_NAME)
GIO_BUILD_LINUX_ARM64_PATH=$(GIO_BUILD_FSPATH)/linux_arm64/$(GIO_SRC_NAME)
GIO_BUILD_LINUX_PATH=$(GIO_BUILD_FSPATH)/linux_amd64/$(GIO_SRC_NAME)

GIO_BUILD_LINUX_RELEASE_AMD64_PATH=$(GIO_BUILD_RELEASE_FSPATH)/linux_amd64/$(GIO_SRC_NAME)
GIO_BUILD_LINUX_RELEASE_ARM64_PATH=$(GIO_BUILD_RELEASE_FSPATH)/linux_arm64/$(GIO_SRC_NAME)
GIO_BUILD_LINUX_RELEASE_PATH=$(GIO_BUILD_RELEASE_FSPATH)/linux_amd64/$(GIO_SRC_NAME)

# NOT finished
gio-desk-linux-print:
	@echo ""
	@echo "- gio-desk-linux-print:"
	@echo "GIO_BUILD_LINUX_AMD64_PATH:             $(GIO_BUILD_LINUX_AMD64_PATH)"
	@echo "GIO_BUILD_LINUX_ARM64_PATH:             $(GIO_BUILD_LINUX_ARM64_PATH)"
	@echo "GIO_BUILD_LINUX_PATH:                   $(GIO_BUILD_LINUX_PATH)"
	@echo ""
	@echo "- gio-desk-linux-release-print:"
	@echo "GIO_BUILD_LINUX_RELEASE_AMD64_PATH:     $(GIO_BUILD_LINUX_RELEASE_AMD64_PATH)"
	@echo "GIO_BUILD_LINUX_RELEASE_ARM64_PATH:     $(GIO_BUILD_LINUX_RELEASE_ARM64_PATH)"
	@echo "GIO_BUILD_LINUX_RELEASE_PATH:           $(GIO_BUILD_LINUX_RELEASE_PATH)"

	
gio-desk-linux-pack-init:
	# TODO: create scaffold maually and go build and insert bin into scaffold for now.
gio-desk-linux-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "Linux - binary"
	@echo ""

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && GOOS=linux GOARCH=amd64 && $(GIO_GO_BIN_NAME) build -o $(GIO_BUILD_LINUX_AMD64_PATH) .
	
	@echo ""
	@echo "-- arm64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && GOOS=linux GOARCH=arm64 && $(GIO_GO_BIN_NAME) build -o $(GIO_BUILD_LINUX_ARM64_PATH) .

	# gogio seems to not support linux desktop builds..
	#cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target linux -arch amd64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_LINUX_AMD64_PATH) .
	#cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -target linux -arch arm64 -appid $(GIO_SRC_NAME) -icon appicon.png -o $(GIO_BUILD_LINUX_ARM64_PATH) .
gio-desk-linux-release-build:
	@echo ""
	@echo ""
	@echo ""
	@echo "Linux - binary release"
	@echo ""

	@echo ""
	@echo "-- amd64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && GOOS=linux GOARCH=amd64 && $(GIO_GO_BIN_NAME) build -o $(GIO_BUILD_LINUX_RELEASE_AMD64_PATH) .
	@echo ""
	@echo "-- arm64"
	@echo ""
	cd $(GIO_SRC_FSPATH) && GOOS=linux GOARCH=arm64 && $(GIO_GO_BIN_NAME) build -o $(GIO_BUILD_LINUX_RELEASE_ARM64_PATH) .
gio-desk-linux-run:
	open $(GIO_BUILD_LINUX_PATH)
gio-desk-linux-release-run:
	open $(GIO_BUILD_LINUX_RELEASE_PATH)






### IOS

GIO_BUILD_IOS_PATH=$(GIO_BUILD_FSPATH)/ios/$(GIO_SRC_NAME).ipa
GIO_BUILD_IOS_SIM_PATH=$(GIO_BUILD_FSPATH)/ios-sim/$(GIO_SRC_NAME).app

gio-ios-print:
	@echo "GIO_BUILD_IOS_PATH:                 $(GIO_BUILD_IOS_PATH)"
	@echo "GIO_BUILD_IOS_SIM_PATH:             $(GIO_BUILD_IOS_SIM_PATH)"

	# TOOO: make this an ENV variable like "GIO_IOS_DEVICE_ID", that is checked for existing and then used. 
	@echo IOS_DEVICE: $(shell idevice_id -l)
gio-ios-build:
	# -work IF you want to see the xcode generated.

	# make build dir
	mkdir -p $(GIO_BUILD_FSPATH)/ios
	
	# FAILS: nope - needs a provioning profile.
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -work -appid gedw99.$(GIO_SRC_NAME) -buildmode exe -o $(GIO_BUILD_IOS_PATH) -target ios .
gio-ios-install:
	# see: https://www.systutorials.com/docs/lin/man/1-ideviceinstaller/
	# idevice_id -l
	cd $(GIO_SRC_FSPATH) && ideviceinstaller -i $(GIO_BUILD_IOS_PATH) --udid bdf90dc799709a013a25d0fc2df80e441df026f3

gio-ios-sim-build:
	#exe and archive
	# -work IF you want to see the xcode generated.

	# make build dir
	mkdir -p $(GIO_BUILD_FSPATH)/ios-sim/

	cd $(GIO_SRC) && $(GIO_BIN) -work -appid ??.$(GIO_SRC_NAME) -buildmode exe -o $(GIO_BUILD_IOS_SIM_PATH) -target ios .
gio-ios-sim-install:

	xcrun simctl install booted $(GIO_BUILD_IOS_SIM_PATH)


### ANDROID



GIO_BUILD_ANDROID_PATH=$(GIO_BUILD_FSPATH)/android/$(GIO_SRC_NAME).apk

gio-android-print:
	@echo "GIO_BUILD_ANDROID_PATH:             $(GIO_BUILD_ANDROID_PATH)"

gio-android-build:
	# todo: adjust buil path to be in .bin ....
	mkdir -p $(GIO_BUILD_FSPATH)/android/
	cd $(GIO_SRC_FSPATH) && $(GIO_BIN) -o $(GIO_BUILD_ANDROID_PATH) -target android .
gio-android-device-start:
	# Blocks in Terminal.
	# start emulator ( .zshrc )
	emulator @testdevice 
gio-android-install:
	# copy apk across to emulator
	cd $(GIO_SRC_FSPATH) && adb install $(GIO_BUILD_ANDROID_PATH)
gio-android-install-del:
	adb uninstall org.gioui.component