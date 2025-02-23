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
.PHONY: clean kodi pandoc3 pdf2djvu janet antiword zotero ditaa firestarter gmaptool tmx2lua hunspell-uk luajit ziglang languagetool gnuplot visidata sdcv ttyplot bandwhich bb gpxsee fio tailscale iosevka metabase mu kitty tiled libresprite gbstudio apktool uber-apk-signer wrk

target/Taskfile.yml:
> git clone --depth=1 https://github.com/getsolus/packages.git target

target/packages/k/kodi/kodi-21.2-105-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/k/kodi
> cp -f src/kodi.yml target/packages/k/kodi/package.yml
> (cd target/packages/k/kodi && go-task)

kodi: target/packages/k/kodi/kodi-21.2-105-1-x86_64.eopkg ## build kodi, print path to new eopkg file
> echo "${CURDIR}/target/packages/k/kodi/kodi-21.2-105-1-x86_64.eopkg"

target/packages/p/pandoc3/pandoc3-3.6.2-6-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/p/pandoc3
> cp -f src/pandoc3.yml target/packages/p/pandoc3/package.yml
> (cd target/packages/p/pandoc3 && go-task)

pandoc3: target/packages/p/pandoc3/pandoc3-3.6.2-6-1-x86_64.eopkg ## build pandoc3, print path to new eopkg file
> echo "${CURDIR}/target/packages/p/pandoc3/pandoc3-3.6.2-6-1-x86_64.eopkg"

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

target/packages/z/zotero/zotero-7.0.9-22-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/z/zotero
> cp -f src/zotero.yml target/packages/z/zotero/package.yml
> (cd target/packages/z/zotero && go-task)

zotero: target/packages/z/zotero/zotero-7.0.9-22-1-x86_64.eopkg ## build zotero, print path to new eopkg file
> echo "${CURDIR}/target/packages/z/zotero/zotero-7.0.9-22-1-x86_64.eopkg"

target/packages/d/ditaa/ditaa-0.11.0-4-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/d/ditaa
> cp -f src/ditaa.yml target/packages/d/ditaa/package.yml
> (cd target/packages/d/ditaa && go-task)

ditaa: target/packages/d/ditaa/ditaa-0.11.0-4-1-x86_64.eopkg ## package ditaa, print path to new eopkg file
> echo "${CURDIR}/target/packages/d/ditaa/ditaa-0.11.0-4-1-x86_64.eopkg"

target/packages/f/firestarter/firestarter-2.0-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/f/firestarter
> cp -f src/firestarter.yml target/packages/f/firestarter/package.yml
> (cd target/packages/f/firestarter && go-task)

firestarter: target/packages/f/firestarter/firestarter-2.0-1-1-x86_64.eopkg ## build firestarter, print path to new eopkg file
> echo "${CURDIR}/target/packages/f/firestarter/firestarter-2.0-1-1-x86_64.eopkg"

target/packages/g/gmaptool/gmaptool-0.9.73-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/g/gmaptool
> cp -f src/gmaptool.yml target/packages/g/gmaptool/package.yml
> (cd target/packages/g/gmaptool && go-task)

gmaptool: target/packages/g/gmaptool/gmaptool-0.9.73-1-1-x86_64.eopkg ## package gmt, print path to new eopkg file
> echo "${CURDIR}/target/packages/g/gmaptool/gmaptool-0.9.73-1-1-x86_64.eopkg"

target/packages/t/tmx2lua/tmx2lua-1.0.0-2-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/t/tmx2lua
> cp -f src/tmx2lua.yml target/packages/t/tmx2lua/package.yml
> (cd target/packages/t/tmx2lua && go-task)

tmx2lua: target/packages/t/tmx2lua/tmx2lua-1.0.0-2-1-x86_64.eopkg ## package tmx2lua, print path to new eopkg file
> echo "${CURDIR}/target/packages/t/tmx2lua/tmx2lua-1.0.0-2-1-x86_64.eopkg"

target/packages/h/hunspell-uk/hunspell-uk-6.5.3-11-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/h/hunspell-uk
> cp -f src/hunspell-uk.yml target/packages/h/hunspell-uk/package.yml
> (cd target/packages/h/hunspell-uk && go-task)

hunspell-uk: target/packages/h/hunspell-uk/hunspell-uk-6.5.3-11-1-x86_64.eopkg ## package hunspell-uk, print path to new eopkg file
> echo "${CURDIR}/target/packages/h/hunspell-uk/hunspell-uk-6.5.3-11-1-x86_64.eopkg"

target/packages/l/luajit/luajit-2.1.1727619075-13-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/l/luajit
> cp -f src/luajit.yml target/packages/l/luajit/package.yml
> (cd target/packages/l/luajit && go-task)

luajit: target/packages/l/luajit/luajit-2.1.1727619075-13-1-x86_64.eopkg ## build juajit, print path to new eopkg file
> echo "${CURDIR}/target/packages/l/luajit/luajit-2.1.1727619075-13-1-x86_64.eopkg"

target/packages/z/ziglang/ziglang-0.13.0-11-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/z/ziglang
> cp -f src/ziglang.yml target/packages/z/ziglang/package.yml
> (cd target/packages/z/ziglang && go-task)

ziglang: target/packages/z/ziglang/ziglang-0.13.0-11-1-x86_64.eopkg ## package zig, print path to new eopkg file
> echo "${CURDIR}/target/packages/z/ziglang/ziglang-0.13.0-11-1-x86_64.eopkg"

target/packages/l/languagetool/languagetool-6.5-10-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/l/languagetool
> cp -f src/languagetool.yml target/packages/l/languagetool/package.yml
> (cd target/packages/l/languagetool && go-task)

languagetool: target/packages/l/languagetool/languagetool-6.5-10-1-x86_64.eopkg ## package langtool, print path to new eopkg file
> echo "${CURDIR}/target/packages/l/languagetool/languagetool-6.5-10-1-x86_64.eopkg"

target/packages/g/gnuplot/gnuplot-6.0.1-25-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/g/gnuplot
> cp -f src/gnuplot.yml target/packages/g/gnuplot/package.yml
> (cd target/packages/g/gnuplot && go-task)

gnuplot: target/packages/g/gnuplot/gnuplot-6.0.1-25-1-x86_64.eopkg ## build gnuplot, print path to new eopkg file
> echo "${CURDIR}/target/packages/g/gnuplot/gnuplot-6.0.1-25-1-x86_64.eopkg"

target/packages/v/visidata/visidata-3.1.1-13-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/v/visidata
> cp -f src/visidata.yml target/packages/v/visidata/package.yml
> (cd target/packages/v/visidata && go-task)

visidata: target/packages/v/visidata/visidata-3.1.1-13-1-x86_64.eopkg ## build vd, print path to new eopkg file
> echo "${CURDIR}/target/packages/v/visidata/visidata-3.1.1-13-1-x86_64.eopkg"

target/packages/s/sdcv/sdcv-0.5.5-8-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/s/sdcv
> cp -f src/sdcv.yml target/packages/s/sdcv/package.yml
> (cd target/packages/s/sdcv && go-task)

sdcv: target/packages/s/sdcv/sdcv-0.5.5-8-1-x86_64.eopkg ## build sdcv, print path to new eopkg file
> echo "${CURDIR}/target/packages/s/sdcv/sdcv-0.5.5-8-1-x86_64.eopkg"

target/packages/t/ttyplot/ttyplot-1.7.0-4-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/t/ttyplot
> cp -f src/ttyplot.yml target/packages/t/ttyplot/package.yml
> (cd target/packages/t/ttyplot && go-task)

ttyplot: target/packages/t/ttyplot/ttyplot-1.7.0-4-1-x86_64.eopkg ## build ttyplot, print path to new eopkg file
> echo "${CURDIR}/target/packages/t/ttyplot/ttyplot-1.7.0-4-1-x86_64.eopkg"

target/packages/b/bandwhich/bandwhich-0.23.1-7-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/b/bandwhich
> cp -f src/bandwhich.yml target/packages/b/bandwhich/package.yml
> (cd target/packages/b/bandwhich && go-task)

bandwhich: target/packages/b/bandwhich/bandwhich-0.23.1-7-1-x86_64.eopkg ## build bandwhich, print path to new eopkg file
> echo "${CURDIR}/target/packages/b/bandwhich/bandwhich-0.23.1-7-1-x86_64.eopkg"

target/packages/b/bb/bb-1.12.196-4-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/b/bb
> cp -f src/bb.yml target/packages/b/bb/package.yml
> (cd target/packages/b/bb && go-task)

bb: target/packages/b/bb/bb-1.12.196-4-1-x86_64.eopkg ## build bb, print path to new eopkg file
> echo "${CURDIR}/target/packages/b/bb/bb-1.12.196-4-1-x86_64.eopkg"

target/packages/g/gpxsee/gpxsee-13.26-46-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/g/gpxsee
> cp -f src/gpxsee.yml target/packages/g/gpxsee/package.yml
> (cd target/packages/g/gpxsee && go-task)

gpxsee: target/packages/g/gpxsee/gpxsee-13.26-46-1-x86_64.eopkg ## build gpxsee, print path to new eopkg file
> echo "${CURDIR}/target/packages/g/gpxsee/gpxsee-13.26-46-1-x86_64.eopkg"

target/packages/f/fio/fio-3.38-19-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/f/fio
> cp -f src/fio.yml target/packages/f/fio/package.yml
> (cd target/packages/f/fio && go-task)

fio: target/packages/f/fio/fio-3.38-19-1-x86_64.eopkg ## build fio, print path to new eopkg file
> echo "${CURDIR}/target/packages/f/fio/fio-3.38-19-1-x86_64.eopkg"

target/packages/t/tailscale/tailscale-1.76.0-27-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/t/tailscale
> cp -f src/tailscale.yml target/packages/t/tailscale/package.yml
> (cd target/packages/t/tailscale && go-task)

tailscale: target/packages/t/tailscale/tailscale-1.76.0-27-1-x86_64.eopkg ## build tailscale, print path to new eopkg file
> echo "${CURDIR}/target/packages/t/tailscale/tailscale-1.76.0-27-1-x86_64.eopkg"

target/packages/f/font-iosevka-ttf/font-iosevka-ttf-31.9.1-77-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/f/font-iosevka-ttf
> cp -f src/iosevka.yml target/packages/f/font-iosevka-ttf/package.yml
> (cd target/packages/f/font-iosevka-ttf && go-task)

iosevka: target/packages/f/font-iosevka-ttf/font-iosevka-ttf-31.9.1-77-1-x86_64.eopkg ## package iosevka, print path to new eopkg file
> echo "${CURDIR}/target/packages/f/font-iosevka-ttf/font-iosevka-ttf-31.9.1-77-1-x86_64.eopkg"

target/packages/m/metabase/metabase-0.51.1-2-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/m/metabase
> cp -f src/metabase.yml target/packages/m/metabase/package.yml
> (cd target/packages/m/metabase && go-task)

metabase: target/packages/m/metabase/metabase-0.51.1-2-1-x86_64.eopkg ## package metabase, print path to new eopkg file
> echo "${CURDIR}/target/packages/m/metabase/metabase-0.51.1-2-1-x86_64.eopkg"

target/packages/m/mu/mu-1.12.8-29-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/m/mu
> cp -f src/mu.yml target/packages/m/mu/package.yml
> (cd target/packages/m/mu && go-task)

mu: target/packages/m/mu/mu-1.12.8-29-1-x86_64.eopkg ## build mu and mu4e, print path to new eopkg file
> echo "${CURDIR}/target/packages/m/mu/mu-1.12.8-29-1-x86_64.eopkg"

target/packages/k/kitty/kitty-0.37.0-75-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/k/kitty
> cp -f src/kitty.yml target/packages/k/kitty/package.yml
> (cd target/packages/k/kitty && go-task)

kitty: target/packages/k/kitty/kitty-0.37.0-75-1-x86_64.eopkg ## build kitty, print path to new eopkg file
> echo "${CURDIR}/target/packages/k/kitty/kitty-0.37.0-75-1-x86_64.eopkg"

target/packages/t/tiled/tiled-1.11.0-22-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/t/tiled
> cp -f src/tiled.yml target/packages/t/tiled/package.yml
> (cd target/packages/t/tiled && go-task)

tiled: target/packages/t/tiled/tiled-1.11.0-22-1-x86_64.eopkg ## build tiled, print path to new eopkg file
> echo "${CURDIR}/target/packages/t/tiled/tiled-1.11.0-22-1-x86_64.eopkg"

target/packages/l/libresprite/libresprite-1.1-3-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/l/libresprite
> cp -f src/libresprite.yml target/packages/l/libresprite/package.yml
> (cd target/packages/l/libresprite && go-task)

libresprite: target/packages/l/libresprite/libresprite-1.1-3-1-x86_64.eopkg ## build libresprite, print path to new eopkg file
> echo "${CURDIR}/target/packages/l/libresprite/libresprite-1.1-3-1-x86_64.eopkg"

target/packages/g/gbstudio/gbstudio-4.1.3-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/g/gbstudio
> cp -f src/gbstudio.yml target/packages/g/gbstudio/package.yml
> (cd target/packages/g/gbstudio && go-task)

gbstudio: target/packages/g/gbstudio/gbstudio-4.1.3-1-1-x86_64.eopkg ## package deb to eopkg, print path to new eopkg file
> echo "${CURDIR}/target/packages/g/gbstudio/gbstudio-4.1.3-1-1-x86_64.eopkg"

target/packages/a/apktool/apktool-2.10.0-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/a/apktool
> cp -f src/apktool.yml target/packages/a/apktool/package.yml
> (cd target/packages/a/apktool && go-task)

apktool: target/packages/a/apktool/apktool-2.10.0-1-1-x86_64.eopkg ## package apktool, print path to new eopkg file
> echo "${CURDIR}/target/packages/a/apktool/apktool-2.10.0-1-1-x86_64.eopkg"

target/packages/u/uber-apk-signer/uber-apk-signer-1.3.0-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/u/uber-apk-signer
> cp -f src/uber-apk-signer.yml target/packages/u/uber-apk-signer/package.yml
> (cd target/packages/u/uber-apk-signer && go-task)

uber-apk-signer: target/packages/u/uber-apk-signer/uber-apk-signer-1.3.0-1-1-x86_64.eopkg ## package uber-apk-signer, print path to new eopkg file
> echo "${CURDIR}/target/packages/u/uber-apk-signer/uber-apk-signer-1.3.0-1-1-x86_64.eopkg"

target/packages/w/wrk/wrk-4.2.0-1-1-x86_64.eopkg: target/Taskfile.yml
> mkdir -p target/packages/w/wrk
> cp -f src/wrk.yml target/packages/w/wrk/package.yml
> (cd target/packages/w/wrk && go-task)

wrk: target/packages/w/wrk/wrk-4.2.0-1-1-x86_64.eopkg ## build wrk, print path to new eopkg file
> echo "${CURDIR}/target/packages/w/wrk/wrk-4.2.0-1-1-x86_64.eopkg"

clean: ## clean up
> rm -rf target

