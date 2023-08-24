# https://github.com/aquaproj


# example project that shwos how to use it.
# https://github.com/suzuki-shunsuke/pinact

# his command runer
# https://github.com/suzuki-shunsuke/cmdx



### ENV

# config and bin, that is created when you do "aqua init"
# https://aquaproj.github.io/docs/tutorial#install-aqua
# AQUA_ENV_ROOT_FSPATH is actually: $(HOME)/.local/share/aquaproj-aqua
AQUA_ENV_ROOT_FSPATH=$(shell $(AQUA_BIN_NAME) root-dir)
AQUA_ENV_ROOT_BIN_FSPATH=$(AQUA_ENV_ROOT_FSPATH)/bin
AQUA_ENV_ROOT_BIN=$(AQUA_ENV_ROOT_BIN_FSPATH)/aqua
#export PATH:=$(PATH):$(AQUA_ENV_ROOT_BIN_FSPATH)
export PATH:=$(PATH):$($(AQUA_BIN_NAME) root-dir)/bin

# easy way to search for packages..
AQUA_ENV_REG_WEB_URL=https://aqua-picker.deno.dev

# https://aquaproj.github.io/docs/reference/lazy-install
# we want this..
export AQUA_DISABLE_LAZY_INSTALL=true

# https://aquaproj.github.io/docs/reference/config/progress-bar
export AQUA_PROGRESS_BAR=true

# https://aquaproj.github.io/docs/reference/config/log-color
# AQUA_LOG_COLOR=always|auto|never
export AQUA_LOG_COLOR=always

# https://aquaproj.github.io/docs/reference/execve-2
# Windows make shell scripts and batch scripts, instead of usng the proxy. Need to test this.
export AQUA_X_SYS_EXEC=false



### SRC

# template
AQUA_SRC_FSPATH=$(PWD)??
AQUA_SRC_REGISTRY_NAME=standard
AQUA_SRC_PACKAGE_NAME=jonaslu/ain??
AQUA_SRC_PACKAGE_VERSION=?
AQUA_SRC_BIN_NAME=gh?
AQUA_SRC_EXEC_NAME="gh" version

AQUA_SRC_WHICH_VER=2.12.0??
AQUA_SRC_WHICH=$(AQUA_SRC_PACKAGE_NAME)/$(AQUA_SRC_WHICH_VER)



### DEP

# https://github.com/aquaproj/aqua
# https://github.com/aquaproj/aqua/releases/tag/v2.11.0-4
AQUA_BIN_NAME=aqua
AQUA_BIN_VERSION=v2.11.0-4
AQUA_BIN_WHICH=$(shell which $(AQUA_BIN_NAME))
AQUA_BIN_WHICH_VERSION=$(shell $(AQUA_BIN_NAME) --version)

# https://github.com/aquaproj/aqua-proxy
# https://github.com/aquaproj/aqua-proxy/releases/tag/v1.2.2
AQUA_PROXY_BIN_NAME=aqua-proxy
AQUA_PROXY_BIN_VERSION=v1.2.2
AQUA_PROXY_BIN_WHICH=$(shell which $(AQUA_PROXY_BIN_NAME))
AQUA_PROXY_BIN_WHICH_VERSION=$(shell $(AQUA_PROXY_BIN_NAME) version)

# https://github.com/aquaproj/registry-tool
# https://github.com/aquaproj/registry-tool/releases/tag/v0.1.10
AQUA_REGISTRY_BIN_NAME=aqua-registry
AQUA_REGISTRY_BIN_VERSION=v0.1.10
AQUA_REGISTRY_BIN_WHICH=$(shell which $(AQUA_REGISTRY_BIN_NAME))
AQUA_REGISTRY_BIN_WHICH_VERSION=$(shell $(AQUA_REGISTRY_BIN_NAME) --version)


# the github registry where descriptions of package exists.
# https://github.com/aquaproj/aqua-registry

# same as above, but as a template
# https://github.com/aquaproj/template-private-aqua-registry

aqua-print: 
	@echo ""
	@echo "-- AQUA --"
	@echo ""

	$(MAKE) aqua-print-env
	$(MAKE) aqua-print-src
	$(MAKE) aqua-print-dep

aqua-print-env:
	@echo ""
	@echo "-- ENV --"
	@echo ""
	@echo "AQUA_ENV_ROOT_FSPATH:               $(AQUA_ENV_ROOT_FSPATH)"
	@echo "AQUA_ENV_ROOT_BIN_FSPATH:           $(AQUA_ENV_ROOT_BIN_FSPATH)"
	@echo "AQUA_ENV_ROOT_BIN:                  $(AQUA_ENV_ROOT_BIN)"
	@echo "AQUA_ENV_REG_WEB_URL:               $(AQUA_ENV_REG_WEB_URL)"
	@echo ""

aqua-print-src:
	@echo ""
	@echo "-- SRC --"
	@echo ""
	@echo "AQUA_SRC_FSPATH:                    $(AQUA_SRC_FSPATH)"
	@echo "AQUA_SRC_REGISTRY_NAME:             $(AQUA_SRC_REGISTRY_NAME)"
	@echo "AQUA_SRC_PACKAGE_NAME:              $(AQUA_SRC_PACKAGE_NAME)"
	@echo "AQUA_SRC_PACKAGE_VERSION:           $(AQUA_SRC_PACKAGE_VERSION)"
	# run...
	@echo "AQUA_SRC_BIN_NAME:                  $(AQUA_SRC_BIN_NAME)"
	@echo "AQUA_SRC_EXEC_NAME:                 $(AQUA_SRC_EXEC_NAME)"
	# calculated ..
	@echo "AQUA_SRC_WHICH_VER:                 $(AQUA_SRC_WHICH_VER)"
	@echo "AQUA_SRC_WHICH:                     $(AQUA_SRC_WHICH)"
	@echo ""

aqua-print-dep:
	@echo ""
	@echo "-- DEP --"
	@echo ""
	@echo "AQUA_BIN_NAME:                      $(AQUA_BIN_NAME)"
	@echo "AQUA_BIN_VERSION:                   $(AQUA_BIN_VERSION)"
	@echo "AQUA_BIN_WHICH:                     $(AQUA_BIN_WHICH)"
	@echo "AQUA_BIN_WHICH_VERSION:             $(AQUA_BIN_WHICH_VERSION)"
	@echo ""

	@echo ""
	@echo "AQUA_PROXY_BIN_NAME:                $(AQUA_PROXY_BIN_NAME)"
	@echo "AQUA_PROXY_BIN_VERSION:             $(AQUA_PROXY_BIN_VERSION)"
	@echo "AQUA_PROXY_BIN_WHICH:               $(AQUA_PROXY_BIN_WHICH)"
	@echo ""

	@echo ""
	@echo "AQUA_REGISTRY_BIN_NAME:             $(AQUA_REGISTRY_BIN_NAME)"
	@echo "AQUA_REGISTRY_BIN_VERSION:          $(AQUA_REGISTRY_BIN_VERSION)"
	@echo "AQUA_REGISTRY_BIN_WHICH:            $(AQUA_REGISTRY_BIN_WHICH)"
	@echo "AQUA_REGISTRY_BIN_WHICH_VERSION:    $(AQUA_REGISTRY_BIN_WHICH_VERSION)"
	@echo ""

## Install aqua
aqua-dep:
	# this can all be done with go-getter later. go-getter is base.
	# tree is also a dep.

	@echo ""
	@echo "installing aqua tool"
	go install -ldflags="-X main.version=$(AQUA_BIN_VERSION)" github.com/aquaproj/aqua/v2/cmd/aqua@$(AQUA_BIN_VERSION)
	@echo ""

	@echo ""
	@echo "installing aqua proxy tool"
	go install -ldflags="-X main.version=$(AQUA_PROXY_BIN_VERSION)" github.com/aquaproj/aqua-proxy/cmd/aqua-proxy@$(AQUA_PROXY_BIN_VERSION)
	@echo ""

	@echo ""
	@echo "installing aqua registry tool"
	go install -ldflags="-X main.version=$(AQUA_REGISTRY_BIN_VERSION)" github.com/aquaproj/registry-tool/cmd/aqua-registry@$(AQUA_REGISTRY_BIN_VERSION)
	@echo ""

## Uninstall aqua itself
aqua-dep-del:
	rm -f $(AQUA_BIN_WHICH)
	rm -f $(AQUA_PROXY_BIN_WHICH)
	rm -f $(AQUA_REGISTRY_BIN_WHICH)

	# delete root also ?
	#$(MAKE) aqua-root-del



## Help
aqua-help:
	$(AQUA_BIN_NAME) -h




# https://aquaproj.github.io/docs/tutorial/global-config
# Prints global config
aqua-root:
	ls $(AQUA_ENV_ROOT_FSPATH)
# Deletes global config
aqua-root-del:
	rm -rf $(AQUA_ENV_ROOT_FSPATH)
# Opens the global config
aqua-root-code:
	code $(AQUA_ENV_ROOT_FSPATH)
# Tree lists the global config
aqua-root-tree:
	# installed by go.mk ( https://github.com/a8m/tree ) 
	tree $(AQUA_ENV_ROOT_FSPATH)
## Deletes all packages in the root store.
aqua-root-packages-del:
	# https://aquaproj.github.io/docs/guides/uninstall-packages
	rm -rf $(AQUA_ENV_ROOT_FSPATH)/pkgs


## Upgrades aqua. This creates the global config and global aqua bin.
aqua-upgrade:
	# first thng to do after an aqua-dep
	# MUST call the AQUA_BIN_NAME, as AQUA_ENV_ROOT_BIN does not exist yet
	$(AQUA_BIN_NAME) update-aqua

	#$(AQUA_ENV_ROOT_BIN) update-aqua


## Prints info about globla confgo and local pwd config ( aqua.yaml )
aqua-info:
	$(AQUA_ENV_ROOT_BIN) info


## Creates the local manifest ( aqua.yaml ) at PWD
aqua-init:
	$(AQUA_BIN_NAME) init




aqua-test:
	# no idea...
	$(AQUA_BIN_NAME) i --test



## Install package according to the SRC 
aqua-package-install:
	#aqua generate -h
	#$(AQUA_BIN_NAME) generate -h

	# You can pass packages with positional arguments.
	# aqua g [<registry name>,<package name>[@<version>] ...]
	# aqua g standard,cli/cli standard,junegunn/fzf standard,suzuki-shunsuke/tfcmt@v3.0.0

	# -i, so we also insert into the config.
	$(AQUA_BIN_NAME) generate -detail -i $(AQUA_SRC_REGISTRY_NAME),$(AQUA_SRC_PACKAGE_NAME)
	# yaml: - name: cli/cli@v2.0.0

# Install package according to SRC with AQUA_SRC_PACKAGE_VERSION
aqua-package-install-version:
	$(AQUA_BIN_NAME) generate -detail -i $(AQUA_SRC_REGISTRY_NAME),$(AQUA_SRC_PACKAGE_NAME)@$(AQUA_SRC_PACKAGE_VERSION)

# Install package according to the configuration files.
aqua-package-install-all:
	aqua generate -h


## Returns the absolute file path of the given command
aqua-package-which:
	$(AQUA_BIN_NAME) which $(AQUA_SRC_BIN_NAME)

## Executes a binary installed by aqua.
aqua-package-exec:
	$(AQUA_BIN_NAME) -c aqua.yaml exec -- $(AQUA_SRC_EXEC_NAME)



## List packages in Registries ( local )
aqua-list:
	#$(AQUA_BIN_NAME) ??
## List packages in Registries ( remote )
aqua-list-remote:
	$(AQUA_BIN_NAME) list



## Generate a registry's package configuration
aqua-reg-gen:
	# this dumps to a file.
	# aqua gr --out-testdata testdata.yaml --deep suzuki-shunsuke/tfcmt

	# with a version
	# aqua gr cli/cli@v2.0.0

	# we default to -deep, so you see all versions

	#$(AQUA_BIN_NAME) generate-registry -h
	$(AQUA_BIN_NAME) generate-registry -deep $(AQUA_SRC_PACKAGE_NAME)

aqua-reg-install:
	# not needed because "dep" insalled it.
 	# https://aquaproj.github.io/docs/develop-registry/create-private-registry/
	# https://aquaproj.github.io/docs/products/aqua-registry/contributing/
	# install globally

	$(AQUA_BIN_NAME) install -l

	$(AQUA_BIN_NAME) generate -i aquaproj/registry-tool@latest
	# yaml: - name: aquaproj/registry-tool@latest

aqua-reg-update:
	$(AQUA_BIN_NAME) generate-registry

AQUA_REG_ADD_NAME="ffmpeg" 
## Executes a binary installed by aqua- EX make AQUA_REG_ADD_NAME="ffmpeg" aqua-reg-add
aqua-reg-add:
	# https://aquaproj.github.io/docs/products/aqua-registry/contributing/#how-to-add-packages

	@echo "AQUA_REG_ADD_NAME:      $(AQUA_REG_ADD_NAME)"

	aqua-registry scaffold [--deep] $(AQUA_REG_ADD_NAME)

AQUA_REG_PUSH_NAME="ffmpeg" 
## Push a package as a PR to the Registry. EX make AQUA_REG_PUSH_NAME="ffmpeg" aqua-reg-push
aqua-reg-push:
	aqua-registry create-pr-new-pkg $(AQUA_REG_PUSH_NAME)