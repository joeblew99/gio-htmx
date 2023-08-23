# goreman
# https://github.com/mattn/goreman


### ENV 
# where to look for Procfile to use at runtime 
GOREMAN_SRC_FSPATH=$(PWD)

GOREMAN_SRC_CONFIG_NAME=procfile
GOREMAN_SRC_CONFIG_FSPATH=$(PWD)/.templates/goreman/_default
GOREMAN_SRC_CONFIG=$(GOREMAN_SRC_CONFIG_FSPATH)/$(GOREMAN_SRC_CONFIG_NAME)



### DEP

GOREMAN_BIN_NAME=goreman
# https://github.com/mattn/goreman/releases/tag/v0.3.15
GOREMAN_BIN_VERSION=v0.3.15
GOREMAN_BIN_WHICH=$(shell which $(GOREMAN_BIN_NAME))
GOREMAN_BIN_WHICH_VERSION=$(shell $(GOREMAN_BIN_NAME) version)



### TEMPLATES

GOREMAN_SRC_TEMPLATES_FSPATH=$(PWD)/.templates/goreman
# PERFECT :) https://www.systutorials.com/how-to-get-a-makefiles-directory-for-including-other-makefiles/
_GOREMAN_SELF_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
_GOREMAN_TEMPLATES_SOURCE=$(_GOREMAN_SELF_DIR)/templates/goreman
_GOREMAN_TEMPLATES_TARGET=$(GOREMAN_SRC_TEMPLATES_FSPATH)



## goreman print, outputs all variables needed to run goreman
goreman-print:
	@echo ""
	@echo "--- GOREMAN ---"
	@echo ""

	$(MAKE) goreman-print-src

goreman-print-src:
	@echo ""
	@echo "-- src"
	@echo "GOREMAN_SRC_FSPATH:            $(GOREMAN_SRC_FSPATH)"
	@echo ""
	@echo "GOREMAN_SRC_CONFIG_NAME:       $(GOREMAN_SRC_CONFIG_NAME)"
	@echo "GOREMAN_SRC_CONFIG_FSPATH:     $(GOREMAN_SRC_CONFIG_FSPATH)"
	@echo "GOREMAN_SRC_CONFIG:            $(GOREMAN_SRC_CONFIG)"
	@echo ""

goreman-print-dep:
	@echo ""
	@echo "-- dep"
	@echo "GOREMAN_BIN_NAME:              $(GOREMAN_BIN_NAME)"
	@echo "GOREMAN_BIN_VERSION:           $(GOREMAN_BIN_VERSION)"
	@echo "GOREMAN_BIN_WHICH:             $(GOREMAN_BIN_WHICH)"
	@echo "GOREMAN_BIN_WHICH_VERSION:     $(GOREMAN_BIN_WHICH_VERSION)"
	

## installs goreman
goreman-dep:
	@echo ""
	@echo "installing goreman tool..."
	go install -ldflags="-s -w -X main.revision=$(GOREMAN_BIN_VERSION)" github.com/mattn/goreman@$(GOREMAN_BIN_VERSION)
	@echo "installed $(GOREMAN_BIN_VERSION)"
	@echo ""

goreman-templates-print:
	@echo ""
	@echo "-- templates"
	@echo ""
	@echo "_GOREMAN_SELF_DIR:             $(_GOREMAN_SELF_DIR)"
	@echo "_GOREMAN_TEMPLATES_SOURCE:     $(_GOREMAN_TEMPLATES_SOURCE)"
	@echo "_GOREMAN_TEMPLATES_TARGET:     $(_GOREMAN_TEMPLATES_TARGET)"
	@echo ""

## installs the goreman templates into your project
goreman-templates-dep:
	@echo ""
	@echo "installing goreman templates to your project...."
	mkdir -p $(_GOREMAN_TEMPLATES_TARGET)
	cp -r $(_GOREMAN_TEMPLATES_SOURCE)/* $(_GOREMAN_TEMPLATES_TARGET)/
	@echo "installed goreman templates  at : $(_GOREMAN_TEMPLATES_TARGET)"



## goreman run runs goreman using your Procfile
goreman-server-run:
	# starts a RPC Server
	$(GOREMAN_BIN_NAME) -f $(GOREMAN_SRC_CONFIG) start
	# http://0.0.0.0:8555

	# from port 5000 onwards it will run each proces like caddy, nats, your bins

## Show entries in Procfile
goreman-check:
	$(GOREMAN_BIN_NAME) run check
goreman-list:
	$(GOREMAN_BIN_NAME) run list
goreman-status:
	$(GOREMAN_BIN_NAME) run status

