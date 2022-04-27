# Loki RPM Builder

Build `loki` & `promtail` rpm based on official zip archive.

Latest Version [2.5.0](https://github.com/Vonng/loki-rpm/releases/tag/v2.5.0) [Official](https://github.com/grafana/loki/releases/tag/v2.5.0)


### Download

```bash
make download
```

Will download loki archive from Official Release: [2.5.0](https://github.com/grafana/loki/releases/tag/v2.5.0) 

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

* [loki-2.5.0.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/loki-2.5.0.x86_64.rpm)
* [loki_2.5.0_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/loki_2.5.0_amd64.deb)
* [promtail-2.5.0.x86_64.rpm](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/promtail-2.5.0.x86_64.rpm)
* [promtail_2.5.0_amd64.deb](https://github.com/Vonng/loki-rpm/releases/download/v2.5.0/promtail_2.5.0_amd64.deb)

```bash
MD5 (loki-2.5.0.x86_64.rpm) = ec93589804dce48359fbcca3fee740c4
MD5 (loki_2.5.0_amd64.deb) = eea964f04bf58ef9c461b0f08d26b0ff
MD5 (promtail-2.5.0.x86_64.rpm) = fc3c944c804feefabdc3eb636e3b3c96
MD5 (promtail_2.5.0_amd64.deb) = 1cb20d572e3f2d41d5f63f92bed3e626

```