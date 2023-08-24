

# Cockroach db
#

# help
# https://www.cockroachlabs.com/docs/stable/install-cockroachdb-mac.html
# cloud https://cockroachlabs.cloud/clusters


# TODO ideas:
# https://github.com/gedw99/xnats/blob/main/db-cockroach/pgrok/fly.mk
# flyex: https://github.com/sosedoff/pgweb/blob/master/fly.toml
# https://github.com/charsleysa/cockroachdb/tree/feat-secure-cluster


## OS

COCKROACH_GO_PATH?= $(shell go env GOPATH)
COCKROACH_GO_BIN_NAME=go
COCKROACH_GO_OS=$(shell $(COCKROACH_GO_BIN_NAME) env GOOS)
COCKROACH_GO_ARCH=$(shell $(COCKROACH_GO_BIN_NAME) env GOARCH)



# SRC

COCKROACH_BINROOT_FSPATH=$(PWD)/.bin
COCKROACH_SRC_BIN_BACKGROUND=false
COCKROACH_SRC_DATA_FSPATH=$(PWD)/.data/cockroach
COCKROACH_SRC_LISTEN_ADDRESS=localhost:26257
COCKROACH_SRC_HTTP_ADDRESS=localhost:8080

COCKROACH_SRC_JOIN_ADDRESS=localhost:26257,localhost:26258,localhost:26259

## DEP

# all binary names
COCKROACH_RELEASE_BIN_NAME_WINDOWS_AMD64=cockroach.exe
COCKROACH_RELEASE_BIN_NAME_DARWIN_AMD64=cockroach
COCKROACH_RELEASE_BIN_NAME_LINUX_AMD64=cockroach

COCKROACH_CLI_RELEASE_BIN_NAME_WINDOWS_AMD64=cockroach-sql.exe
COCKROACH_CLI_RELEASE_BIN_NAME_DARWIN_AMD64=cockroach-sql
COCKROACH_CLI_RELEASE_BIN_NAME_LINUX_AMD64=cockroach-sql

# final binary name
COCKROACH_BIN_NAME=??
COCKROACH_SQL_BIN_NAME=??

ifeq ($(COCKROACH_GO_OS),windows)
	COCKROACH_BIN_NAME=$(COCKROACH_RELEASE_BIN_NAME_WINDOWS_AMD64)
	COCKROACH_SQL_BIN_NAME=$(COCKROACH_CLI_RELEASE_BIN_NAME_WINDOWS_AMD64)
endif

ifeq ($(COCKROACH_GO_OS),darwin)
	COCKROACH_BIN_NAME=$(COCKROACH_RELEASE_BIN_NAME_DARWIN_AMD64)
	COCKROACH_SQL_BIN_NAME=$(COCKROACH_CLI_RELEASE_BIN_NAME_DARWIN_AMD64)
endif

ifeq ($(COCKROACH_GO_OS),linux)
	COCKROACH_BIN_NAME=$(COCKROACH_RELEASE_BIN_NAME_LINUX_AMD64)
	COCKROACH_SQL_BIN_NAME=$(COCKROACH_CLI_RELEASE_BIN_NAME_LINUX_AMD64)
endif 

COCKROACH_BIN_VERSION=v23.1.1
COCKROACH_BINROOT_FSPATH=$(PWD)/.bin



COCKROACH_BIN_WHICH=$(shell which $(COCKROACH_BIN_NAME))
COCKROACH_BIN_WHICH_VERSION=$(shell $(COCKROACH_BIN_NAME) --version)

# releases
# https://www.cockroachlabs.com/docs/releases/index.html?filters=mac

# Constant download URL Prefix
COCKROACH_GET_URL_PREFIX=https://binaries.cockroachdb.com/cockroach
COCKROACH_GET_SQL_URL_PREFIX=https://binaries.cockroachdb.com/cockroach-sql

# Computed paths to binaries Folder on disk
COCKROACH_FSPATH_WINDOWS=$(COCKROACH_BINROOT_FSPATH)/windows_$(COCKROACH_GO_ARCH)
COCKROACH_FSPATH_DARWIN=$(COCKROACH_BINROOT_FSPATH)/darwin_$(COCKROACH_GO_ARCH)
COCKROACH_FSPATH_LINUX=$(COCKROACH_BINROOT_FSPATH)/linux_$(COCKROACH_GO_ARCH)


### WINDOWS

# https://www.cockroachlabs.com/docs/releases/index.html?filters=windows

# AMD64
# https://binaries.cockroachdb.com/cockroach-v23.1.2.windows-6.2-amd64.zip
# https://binaries.cockroachdb.com/cockroach-sql-v23.1.2.windows-6.2-amd64.zip

# Computed paths of SERVER URL 
COCKROACH_URL_SERVER_WINDOWS_AMD64=$(COCKROACH_GET_URL_PREFIX)-$(COCKROACH_BIN_VERSION).windows-6.2-amd64.zip
COCKROACH_URL_SQL_WINDOWS_AMD64=$(COCKROACH_GET_SQL_URL_PREFIX)-$(COCKROACH_BIN_VERSION).windows-6.2-amd64.zip

# Computed paths to binaries
COCKROACH_BIN_SERVER_WINDOWS_AMD64=$(COCKROACH_FSPATH_WINDOWS)/cockroach-$(COCKROACH_BIN_VERSION).windows-6.2-amd64/cockroach.exe
COCKROACH_BIN_SQL_WINDOWS_AMD64=$(COCKROACH_FSPATH_WINDOWS)/cockroach-sql-$(COCKROACH_BIN_VERSION).windows-6.2-amd64/cockroach-sql.exe


### MAC

# https://www.cockroachlabs.com/docs/releases/index.html?filters=mac

# AMD64
# https://binaries.cockroachdb.com/cockroach-v23.1.1.darwin-10.9-amd64.tgz
# https://binaries.cockroachdb.com/cockroach-sql-v23.1.1.darwin-10.9-amd64.tgz

# ARM64
# https://binaries.cockroachdb.com/cockroach-v23.1.1.darwin-11.0-arm64.tgz
# https://binaries.cockroachdb.com/cockroach-sql-v23.1.1.darwin-11.0-arm64.tgz

# Computed paths of SERVER URL 
COCKROACH_URL_SERVER_DARWIN_AMD64=$(COCKROACH_GET_URL_PREFIX)-$(COCKROACH_BIN_VERSION).darwin-10.9-amd64.tgz
COCKROACH_URL_SQL_DARWIN_AMD64=$(COCKROACH_GET_SQL_URL_PREFIX)-$(COCKROACH_BIN_VERSION).darwin-10.9-amd64.tgz

# Computed paths to binaries
COCKROACH_BIN_SERVER_DARWIN_AMD64=$(COCKROACH_FSPATH_DARWIN)/cockroach-$(COCKROACH_BIN_VERSION).darwin-10.9-amd64/cockroach
COCKROACH_BIN_SHARED_DARWIN_AMD64=$(COCKROACH_FSPATH_DARWIN)/cockroach-$(COCKROACH_BIN_VERSION).darwin-10.9-amd64/lib
COCKROACH_BIN_SQL_DARWIN_AMD64=$(COCKROACH_FSPATH_DARWIN)/cockroach-sql-$(COCKROACH_BIN_VERSION).darwin-10.9-amd64/cockroach-sql


### LINUX

# https://www.cockroachlabs.com/docs/releases/index.html?filters=linux

# AMD64
# https://binaries.cockroachdb.com/cockroach-v23.1.2.linux-amd64.tgz
# https://binaries.cockroachdb.com/cockroach-sql-v23.1.2.linux-amd64.tgz

# ARM64
# https://binaries.cockroachdb.com/cockroach-v23.1.2.linux-arm64.tgz
# https://binaries.cockroachdb.com/cockroach-sql-v23.1.2.linux-arm64.tgz


# Computed paths of SERVER URL 
COCKROACH_URL_SERVER_LINUX_AMD64=$(COCKROACH_GET_URL_PREFIX)-$(COCKROACH_BIN_VERSION).linux-amd64.tgz
COCKROACH_URL_SQL_LINUX_AMD64=$(COCKROACH_GET_SQL_URL_PREFIX)-$(COCKROACH_BIN_VERSION).linux-amd64.tgz

# Computed paths to binaries
COCKROACH_BIN_SERVER_LINUX_AMD64=$(COCKROACH_FSPATH_LINUX)/cockroach-$(COCKROACH_BIN_VERSION).linux-amd64/cockroach
COCKROACH_BIN_SQL_LINUX_AMD64=$(COCKROACH_FSPATH_LINUX)/cockroach-sql-$(COCKROACH_BIN_VERSION).linux-amd64/cockroach-sql





## cockroach print, outputs all variables needed to run cockroach
cockroach-print:
	@echo ""
	@echo "--- DB-COCKROACH ---"
	@echo ""

	$(MAKE) cockroach-print-os

	$(MAKE) cockroach-print-src

cockroach-print-os:
	@echo ""
	@echo "--- OS ---"
	@echo "COCKROACH_GO_BIN_NAME:              $(COCKROACH_GO_BIN_NAME)"
	@echo "COCKROACH_GO_OS:                    $(COCKROACH_GO_OS)"
	@echo "COCKROACH_GO_ARCH:                  $(COCKROACH_GO_ARCH)"
	@echo ""

cockroach-print-src:
	@echo ""
	@echo "-src "
	@echo "COCKROACH_BINROOT_FSPATH:           $(COCKROACH_BINROOT_FSPATH)"
	@echo "COCKROACH_SRC_BIN_BACKGROUND:       $(COCKROACH_SRC_BIN_BACKGROUND)"
	
	@echo "COCKROACH_SRC_DATA_FSPATH:          $(COCKROACH_SRC_DATA_FSPATH)"

	@echo "COCKROACH_SRC_LISTEN_ADDRESS:       $(COCKROACH_SRC_LISTEN_ADDRESS)"
	@echo "COCKROACH_SRC_HTTP_ADDRESS:         $(COCKROACH_SRC_HTTP_ADDRESS)"

	@echo "COCKROACH_SRC_JOIN_ADDRESS:         $(COCKROACH_SRC_JOIN_ADDRESS)"
	@echo ""


cockroach-print-dep:
	@echo ""
	@echo "-- DEP --"
	@echo "COCKROACH_BIN_NAME:                 $(COCKROACH_BIN_NAME)"
	@echo "COCKROACH_BIN_VERSION:              $(COCKROACH_BIN_VERSION)"
	@echo "COCKROACH_BIN_WHICH:                $(COCKROACH_BIN_WHICH)"
	@echo "COCKROACH_BIN_WHICH_VERSION:        $(COCKROACH_BIN_WHICH_VERSION)"

	@echo "COCKROACH_BINROOT_FSPATH:           $(COCKROACH_BINROOT_FSPATH)"
	@echo "COCKROACH_BIN_EXPORT:               $(COCKROACH_BIN_EXPORT)"
	@echo ""
cockroach-print-dep-sources:
	@echo ""
	@echo "-- dep spurces:"
	@echo "COCKROACH_GET_URL_PREFIX:           $(COCKROACH_GET_URL_PREFIX)"
	@echo "COCKROACH_GET_SQL_URL_PREFIX:       $(COCKROACH_GET_SQL_URL_PREFIX)"

	@echo ""
	@echo "-- Computed variables:"
	@echo "- FSPATH of binaries"
	@echo "COCKROACH_FSPATH_WINDOWS:           $(COCKROACH_FSPATH_WINDOWS)"
	@echo "COCKROACH_FSPATH_DARWIN:            $(COCKROACH_FSPATH_DARWIN)"
	@echo "COCKROACH_FSPATH_LINUX:             $(COCKROACH_FSPATH_LINUX)"
	@echo ""
	@echo "- URL of binaries"
	@echo "-- windows"
	@echo "COCKROACH_URL_SERVER_WINDOWS_AMD64: $(COCKROACH_URL_SERVER_WINDOWS_AMD64)"
	@echo "COCKROACH_URL_SQL_WINDOWS_AMD64:    $(COCKROACH_URL_SQL_WINDOWS_AMD64)"
	@echo "-- darwin"
	@echo "COCKROACH_URL_SERVER_DARWIN_AMD64:  $(COCKROACH_URL_SERVER_DARWIN_AMD64)"
	@echo "COCKROACH_URL_SQL_DARWIN_AMD64:     $(COCKROACH_URL_SQL_DARWIN_AMD64)"
	@echo "-- linux"
	@echo "COCKROACH_URL_SERVER_LINUX_AMD64:   $(COCKROACH_URL_SERVER_LINUX_AMD64)"
	@echo "COCKROACH_URL_SQL_LINUX_AMD64:      $(COCKROACH_URL_SQL_LINUX_AMD64)"
	@echo ""
	@echo "- Path to binaries"
	@echo "-- windows"
	@echo "COCKROACH_BIN_SERVER_WINDOWS_AMD64: $(COCKROACH_BIN_SERVER_WINDOWS_AMD64)"
	@echo "COCKROACH_BIN_SQL_WINDOWS_AMD64:    $(COCKROACH_BIN_SQL_WINDOWS_AMD64)"
	@echo "-- darwin"
	@echo "COCKROACH_BIN_SERVER_DARWIN_AMD64:  $(COCKROACH_BIN_SERVER_DARWIN_AMD64)"
	@echo "COCKROACH_BIN_SHARED_DARWIN_AMD64:  $(COCKROACH_BIN_SHARED_DARWIN_AMD64)"
	@echo "COCKROACH_BIN_SQL_DARWIN_AMD64:     $(COCKROACH_BIN_SQL_DARWIN_AMD64)"
	@echo "-- linux"
	@echo "COCKROACH_BIN_SERVER_LINUX_AMD64:   $(COCKROACH_BIN_SERVER_LINUX_AMD64)"
	@echo "COCKROACH_BIN_SQL_LINUX_AMD64:      $(COCKROACH_BIN_SQL_LINUX_AMD64)"
	@echo ""



cockroach-templates-dep:
	# none. its just needs args

cockroach-dep-pre:
	go install github.com/hashicorp/go-getter/cmd/go-getter@latest

cockroach-dep: cockroach-dep-pre
ifeq ($(COCKROACH_GO_OS),windows)
	$(MAKE) cockroach-dep-windows
endif

ifeq ($(COCKROACH_GO_OS),darwin)
	$(MAKE) cockroach-dep-darwin
endif

ifeq ($(COCKROACH_GO_OS),linux)
	cockroach-dep-linux
endif 

## install all OS versions
cockroach-dep-all: cockroach-dep-pre cockroach-dep-windows cockroach-dep-darwin cockroach-dep-linux

## install windows
cockroach-dep-windows:
	# assumes amd64 for now
	go-getter $(COCKROACH_URL_SERVER_WINDOWS_AMD64) $(COCKROACH_FSPATH_WINDOWS)
	go-getter $(COCKROACH_URL_SQL_WINDOWS_AMD64) $(COCKROACH_FSPATH_WINDOWS)

# install mac
cockroach-dep-darwin:
	# assumes amd64 for now
	go-getter $(COCKROACH_URL_SERVER_DARWIN_AMD64) $(COCKROACH_FSPATH_DARWIN)
	go-getter $(COCKROACH_URL_SQL_DARWIN_AMD64) $(COCKROACH_FSPATH_DARWIN)

# install linux
cockroach-dep-linux:
	# assumes amd64 for now
	go-getter $(COCKROACH_URL_SERVER_LINUX_AMD64) $(COCKROACH_FSPATH_LINUX)
	go-getter $(COCKROACH_URL_SQL_LINUX_AMD64) $(COCKROACH_FSPATH_LINUX)

cockroach-dep-del:
	rm -rf $(COCKROACH_FSPATH_FSPATH)



## runs for any OS
cockroach-server-run:
	# https://www.cockroachlabs.com/docs/v23.1/start-a-local-cluster#step-1-start-the-cluster

	# 
	# cockroach start --insecure --store=node1 --listen-addr=localhost:26257 --http-addr=localhost:8080 --join=localhost:26257,localhost:26258,localhost:26259 --background
	# 
	$(COCKROACH_BIN_NAME) start --accept-sql-without-tls --insecure --store=$(COCKROACH_SRC_DATA_FSPATH) --listen-addr=$(COCKROACH_SRC_LISTEN_ADDRESS) --http-addr=$(COCKROACH_SRC_HTTP_ADDRESS) --join=$(COCKROACH_SRC_JOIN_ADDRESS) --background=$(COCKROACH_SRC_BIN_BACKGROUND)

# Print the version
cockroach-version:
	$(COCKROACH_BIN_NAME) version

## inits the server. MUST be done for a cluster.
cockroach-run-init:
	$(COCKROACH_BIN_NAME) init --insecure --host=$(COCKROACH_SRC_LISTEN_ADDRESS)

## connect to db via sql cli
cockroach-run-cli:
	$(COCKROACH_BIN_NAME) sql --insecure --host=$(COCKROACH_SRC_LISTEN_ADDRESS)

## opens web gui.
cockroach-run-gui:
	open http://$(COCKROACH_SRC_HTTP_ADDRESS)






