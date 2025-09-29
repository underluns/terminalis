include makefiles/shell.mk

.DEFAULT_GOAL := all
.ONESHELL:
.SILENT:
.POSIX:

.PHONY: all
all: install check

.PHONY: install
install: shell_install

.PHONY: check
check: lint

.PHONY: lint
lint: shell_lint

.PHONY: format
format: shell_format
