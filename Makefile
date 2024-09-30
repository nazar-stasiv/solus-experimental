SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
$(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

help: ## Display this help section
> @awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-38s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg
.PHONY: install clean once

target/Taskfile.yml: ## set up local packaging environment
> mkdir -p target
> git clone --depth=1 https://github.com/getsolus/packages.git target

target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg: target/Taskfile.yml ## build eopkg
> mkdir -p target/packages/k/kodi
> cp kodi.yml target/packages/k/kodi/package.yml
> (cd target/packages/k/kodi && go-task)

install: target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg ## install eopkg, requires sudo
> sudo eopkg install -y target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg

clean: ## clean up
> rm -rf target

once: ## init chroot, requires sudo
> sudo eopkg install -y go-task ypkg git solbuild-config-unstable solbuild make
> sudo solbuild init -p unstable-x86_64
> sudo solbuild update -p unstable-x86_64
