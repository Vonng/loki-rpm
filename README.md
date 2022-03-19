# Loki RPM Builder

Build `loki` & `promtail` rpm based on official zip archive.

Latest Version [2.4.2](https://github.com/Vonng/loki-rpm/releases/tag/v2.4.2) [Official](https://github.com/grafana/loki/releases/tag/v2.4.2)


### Download

```bash
make download
```

Will download loki archive from Official Release: [2.4.2](https://github.com/grafana/loki/releases/tag/v2.4.2) 

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
* [loki-2.4.2-1.el7.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.4.2/loki-2.4.2-1.el7.x86_64.rpm)
* [promtail-2.4.2-1.el7.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.4.2/promtail-2.4.2-1.el7.x86_64.rpm)