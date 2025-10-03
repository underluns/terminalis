.PHONY: shell_install
shell_install:
	asdf plugin add shfmt && asdf install shfmt
	asdf plugin add shellcheck && asdf install shellcheck

.PHONY: shell_format
shell_format:
	shfmt --version && shfmt --list --write .

.PHONY: shell_lint
shell_lint:
	shfmt --version && shfmt --diff .
	shellcheck --version && shellcheck $(shell find . -type f -name '*.sh')
