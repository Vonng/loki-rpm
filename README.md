# Loki RPM Builder

Build `loki` & `promtail` rpm based on official zip archive.

Latest Version [2.5.0](https://github.com/Vonng/loki-rpm/releases/tag/v2.5.0) [Official](https://github.com/grafana/loki/releases/tag/v2.5.0)


### Download

```bash
make download
```

Will download loki archive from Official Release: [2.5.0](https://github.com/grafana/loki/releases/tag/v2.5.0) 

```bash
SOURCES/loki-canary-linux-amd64.zip
SOURCES/loki-linux-amd64.zip
SOURCES/logcli-linux-amd64.zip
SOURCES/promtail-linux-amd64.zip
```

### Build RPM 

```bash
make all
```

Will use [pigsty](https://github.com/Vonng/pigsty) meta node as build environment and generate following rpms:

* [loki-2.5.0.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/loki-2.5.0.x86_64.rpm)
* [loki_2.5.0_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/loki_2.5.0_amd64.deb)
* [promtail-2.5.0.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/promtail-2.5.0.x86_64.rpm)
* [promtail_2.5.0_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/promtail_2.5.0_amd64.deb)


MD5 (loki-2.5.0.x86_64.rpm) = 93f82f5f1af334048513645e6dc25a42
MD5 (loki_2.5.0_amd64.deb) = 05b171f53bd86827e2fcaa6bd22ee5e5
MD5 (promtail-2.5.0.x86_64.rpm) = 44e9ae9e83673899914b02d3cf4341d1
MD5 (promtail_2.5.0_amd64.deb) = bf05abe54fa353a8d31b597080bef250
