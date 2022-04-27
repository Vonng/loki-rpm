#==============================================================#
# File      :   Makefile
# Ctime     :   2022-03-19
# Mtime     :   2022-04-28
# Desc      :   Makefile shortcuts for loki rpm build
# Path      :   Makefile
# Copyright (C) 2018-2022 Ruohang Feng (rh@vonng.com)
#==============================================================#

VERSION=2.5.0

all: download unzip build
build: rpm deb

download:
	bin/download.sh -v $(VERSION) -t bin

unzip:
	cd bin && unzip -o logcli-linux-amd64.zip
	cd bin && unzip -o loki-canary-linux-amd64.zip
	cd bin && unzip -o loki-linux-amd64.zip
	cd bin && unzip -o promtail-linux-amd64.zip

rpm:
	nfpm package --config loki.yaml     --packager rpm
	nfpm package --config promtail.yaml --packager rpm
	mkdir -p dist/v$(VERSION)
	mv -f *.rpm dist/v$(VERSION)/

deb:
	nfpm package --config loki.yaml     --packager deb
	nfpm package --config promtail.yaml --packager deb
	mkdir -p dist/v$(VERSION)
	mv -f *.deb dist/v$(VERSION)/

.PHONY: all build download unzip rpm deb