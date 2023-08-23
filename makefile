include git.mk

include .env

print:
	$(MAKE) env-print
env-print:
	@echo ""
	@echo "-- ENV --"
	@echo "GIT_USER_NAME:      $(GIT_USER_NAME)"
	@echo "GIT_USER_EMAIL:     $(GIT_USER_EMAIL)"
	@echo "GIT_USER_SSH:       $(GIT_USER_SSH)"
	