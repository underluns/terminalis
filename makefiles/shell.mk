.PHONY: shell_install
shell_install:
	asdf plugin add shellcheck && asdf install shellcheck

.PHONY: shell_lint
shell_lint:
	shellcheck --version && shellcheck $(shell find . -name '*.sh')
