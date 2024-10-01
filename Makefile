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

.DEFAULT_GOAL := help
.PHONY: clean kodi pandoc3

target/Taskfile.yml:
> git clone --depth=1 https://github.com/getsolus/packages.git target

target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/k/kodi
> cp -f src/kodi.yml target/packages/k/kodi/package.yml
> (cd target/packages/k/kodi && go-task)

kodi: target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg ## build kodi, print path to new eopkg file
> echo "${CURDIR}/target/packages/k/kodi/kodi-21.1-104-1-x86_64.eopkg"

target/packages/p/pandoc3/pandoc3-3.4-2-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/p/pandoc3
> cp -f src/pandoc3.yml target/packages/p/pandoc3/package.yml
> (cd target/packages/p/pandoc3 && go-task)

pandoc3: target/packages/p/pandoc3/pandoc3-3.4-2-1-x86_64.eopkg ## build pandoc3, print path to new eopkg file
> echo "${CURDIR}/target/packages/p/pandoc3/pandoc3-3.4-2-1-x86_64.eopkg"

clean: ## clean up
> rm -rf target

