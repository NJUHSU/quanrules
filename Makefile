FILES = .
COMMIT_MSG = Auto commit by Makefile
BRANCH = main

.PHONY: push
push:
	git add $(FILES)
	git commit -m "$(COMMIT_MSG)"
	git push origin $(BRANCH)

