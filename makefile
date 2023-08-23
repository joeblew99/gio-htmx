include git.mk

include caddy.mk
# include goreman.mk
include nats.mk

# MUST be last
include .env

# all binaries we make go here.
BIN_ROOT=$(PWD)/.bin
export $(PATH):=$(PATH):$(BIN_ROOT)

print:
	$(MAKE) env-print
	
env-print:
	@echo ""
	@echo "-- ENV --"
	@echo "GIT_USER_NAME:          $(GIT_USER_NAME)"
	@echo "GIT_USER_EMAIL:         $(GIT_USER_EMAIL)"
	@echo "GIT_USER_SSH:           $(GIT_USER_SSH)"
	@echo "GIT_USER_REPO_URL:      $(GIT_USER_REPO_URL)"

	
dep-tools:
	$(MAKE) caddy-dep
	$(MAKE) nats-dep

	
start-caddy:
	$(MAKE) caddy-server-run
	# https://browse.localhost/
	# https://bin.localhost/
start-nats:
	$(MAKE) nats-server-run
	# Listening for websocket clients on wss://0.0.0.0:443
	# Listening for client connections on 0.0.0.0:4222
	
	
build:
	mkdir -p $(BIN_ROOT)

	# build ...
build-del:
	rm -rf $(BIN_ROOT)
	