git-print:
	@echo ""
	@echo "-- GIT --"

git-init:
	# do this after you have locally don a git clone,
	# so it uses your auth stuff.
	git config --local user.name "$(GIT_USER_NAME)"
	git config --local user.email "$(GIT_USER_EMAIL)"

	git config --local core.sshCommand "ssh -i $(GIT_USER_SSH)"
git-pull:
	git pull