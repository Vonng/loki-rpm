#==============================================================#
# File      :   Makefile
# Ctime     :   2022-03-19
# Mtime     :   2022-03-19
# Desc      :   Makefile shortcuts for loki rpm build
# Path      :   loki/Makefile
# Copyright (C) 2018-2022 Ruohang Feng (rh@vonng.com)
#==============================================================#

LOKI_VERSION=2.4.2
SPEC_REMOTE=/home/vagrant/rpmbuild/SPECS
SRC_REMOTE=/home/vagrant/rpmbuild/SOURCES
RPM_REMOTE=/home/vagrant/rpmbuild/RPMS/x86_64

#--------------------------------------------------------------#
# all
#--------------------------------------------------------------#
all: copy build fetch

#--------------------------------------------------------------#
# download
#--------------------------------------------------------------#
download:
	SOURCES/download.sh -v $(LOKI_VERSION) -t SOURCES

#--------------------------------------------------------------#
# copy
#--------------------------------------------------------------#
copy: copy-pre copy-bin copy-spec copy-conf
cc: copy
c: copy-spec copy-conf

copy-pre:
	ssh meta 'mkdir -p rpmbuild/{SOURCES,SPECS}'
copy-bin:
	scp SOURCES/loki-linux-amd64.zip        meta:${SRC_REMOTE}/
	scp SOURCES/loki-canary-linux-amd64.zip meta:${SRC_REMOTE}/
	scp SOURCES/logcli-linux-amd64.zip      meta:${SRC_REMOTE}/
	scp SOURCES/promtail-linux-amd64.zip    meta:${SRC_REMOTE}/

copy-spec:
	scp SOURCES/loki.spec                   meta:${SPEC_REMOTE}/
	scp SOURCES/promtail.spec               meta:${SPEC_REMOTE}/

copy-conf:
	scp SOURCES/loki.service      			meta:${SRC_REMOTE}/
	scp SOURCES/loki.default      			meta:${SRC_REMOTE}/
	scp SOURCES/loki.yml          			meta:${SRC_REMOTE}/
	scp SOURCES/promtail.service  			meta:${SRC_REMOTE}/
	scp SOURCES/promtail.default  			meta:${SRC_REMOTE}/
	scp SOURCES/promtail.yml      			meta:${SRC_REMOTE}/

#--------------------------------------------------------------#
# build
#--------------------------------------------------------------#
build:
	ssh meta rpmbuild -bb $(SPEC_REMOTE)/promtail.spec
	ssh meta rpmbuild -bb $(SPEC_REMOTE)/loki.spec

fetch:
	scp meta:$(RPM_REMOTE)/loki-$(LOKI_VERSION)-1.el7.x86_64.rpm      RPMS/
	scp meta:$(RPM_REMOTE)/promtail-$(LOKI_VERSION)-1.el7.x86_64.rpm  RPMS/

rebuild: copy-spec copy-conf build


#--------------------------------------------------------------#
# test
#--------------------------------------------------------------#
upload:
	scp RPMS/loki-$(LOKI_VERSION)-1.el7.x86_64.rpm      meta:~/
	scp RPMS/promtail-$(LOKI_VERSION)-1.el7.x86_64.rpm  meta:~/

remove:
	ssh meta 'sudo systemctl stop loki promtail'
	ssh meta 'sudo yum remove -y promtail loki'
	ssh meta 'sudo rm -rf /etc/loki.yml /etc/promtail.yml /var/log/positions.yaml'

install: remove
	ssh meta sudo rpm -ivh ${RPM_REMOTE}/loki-$(LOKI_VERSION)-1.el7.x86_64.rpm
	ssh meta sudo rpm -ivh ${RPM_REMOTE}/promtail-$(LOKI_VERSION)-1.el7.x86_64.rpm

ri: reinstall
reinstall: rebuild install

rl: run-loki
run-loki:
	ssh meta sudo systemctl restart loki
	ssh meta sudo systemctl status loki
	ssh meta sudo journalctl -xe

rp: run-promtail
run-promtail:
	ssh meta sudo systemctl restart promtail
	ssh meta sudo systemctl status promtail
	ssh meta sudo journalctl -xe