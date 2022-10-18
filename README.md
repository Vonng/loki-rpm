# Loki RPM Builder

Build `loki` & `promtail` rpm based on official zip archive.

Latest Version [2.6.1](https://github.com/Vonng/loki-rpm/releases/tag/v2.6.1) [Official](https://github.com/grafana/loki/releases/tag/v2.6.1)


### Download

```bash
make download
```

Will download loki archive from Official Release: [2.6.1](https://github.com/grafana/loki/releases/tag/v2.6.1) 

```bash
bin/loki-canary-linux-amd64.zip
bin/loki-linux-amd64.zip
bin/logcli-linux-amd64.zip
bin/promtail-linux-amd64.zip
```

### Build 

```bash
brew install nfpm
make
```

Will use [pigsty](https://github.com/Vonng/pigsty) meta node as build environment and generate following rpms:

* [loki-2.6.1.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.6.1/loki-2.6.1.x86_64.rpm)
* [loki_2.6.1_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.6.1/loki_2.6.1_amd64.deb)
* [promtail-2.6.1.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.6.1/promtail-2.6.1.x86_64.rpm)
* [promtail_2.6.1_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.6.1/promtail_2.6.1_amd64.deb)

```bash
MD5 (loki-2.6.1.x86_64.rpm) = 4651b7ecd6ce4eb62d6aca69032014b0
MD5 (loki_2.6.1_amd64.deb) = 4c3bf3afbb78cadd80b40f1cd496c1d4
MD5 (promtail-2.6.1.x86_64.rpm) = 0120787e97ef173ced2a08020060d620
MD5 (promtail_2.6.1_amd64.deb) = a3b1cc52be392f0601bd82058d9969af
```