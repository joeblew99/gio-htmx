git-print:
	@echo ""
	@echo "-- GIT --"

git-init:
	# do this after you have locally don a git clone,
	# so it uses your auth stuff.

	# dont forget to add your key in your terminal...
	# ssh-add ~/.ssh/joeblew99_github.com

	git config --local user.name "$(GIT_USER_NAME)"
	git config --local user.email "$(GIT_USER_EMAIL)"

	git config --local core.sshCommand "ssh -i $(GIT_USER_SSH)"
git-upstream-set:
	git remote add upstream https://github.com/joeblew99/gio-htmx.git
git-remote:
	git remote -v
GIT_COMMIT="chore"
git-commit:
	git add --all
	git commit -am "$(GIT_COMMIT)"
git-pull:
	git pull upstream main
git-push:
	git push
	open $(GIT_USER_REPO_URL)