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
.PHONY: clean kodi pandoc3 pdf2djvu janet

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

target/packages/p/pdf2djvu/pdf2djvu-0.9.19-9-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/p/pdf2djvu
> cp -f src/pdf2djvu.yml target/packages/p/pdf2djvu/package.yml
> (cd target/packages/p/pdf2djvu && go-task)

pdf2djvu: target/packages/p/pdf2djvu/pdf2djvu-0.9.19-9-1-x86_64.eopkg ## build pdf2djvu, print path to new eopkg file
> echo "${CURDIR}/target/packages/p/pdf2djvu/pdf2djvu-0.9.19-9-1-x86_64.eopkg"

target/packages/j/janet/janet-1.36.0-3-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/j/janet
> cp -f src/janet.yml target/packages/j/janet/package.yml
> (cd target/packages/j/janet && go-task)

janet: target/packages/j/janet/janet-1.36.0-3-1-x86_64.eopkg ## build janet, print path to new eopkg file
> echo "${CURDIR}/target/packages/j/janet/janet-1.36.0-3-1-x86_64.eopkg"

target/packages/a/antiword/antiword-0.37-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/a/antiword
> cp -f src/antiword.yml target/packages/a/antiword/package.yml
> (cd target/packages/a/antiword && go-task)

antiword: target/packages/a/antiword/antiword-0.37-1-1-x86_64.eopkg ## build antiword, print path to new eopkg file
> echo "${CURDIR}/target/packages/a/antiword/antiword-0.37-1-1-x86_64.eopkg"

clean: ## clean up
> rm -rf target

