%define debug_package %{nil}

Name:       loki
Version:    2.4.2
Release:    1%{?dist}
Summary:    Loki Logging Service
URL:        https://github.com/grafana/loki
Group:      Grafana
License:    AGPL-3.0 License

Source0: https://github.com/grafana/loki/releases/download/v%{version}/%{name}-linux-amd64.zip
Source1: https://github.com/grafana/loki/releases/download/v%{version}/%{name}-canary-linux-amd64.zip
Source2: https://github.com/grafana/loki/releases/download/v%{version}/logcli-linux-amd64.zip
Source3: %{name}.service
Source4: %{name}.default
Source5: %{name}.yml


%{?systemd_requires}
Requires(pre): shadow-utils

%description
Loki is an agent which ships the contents of local logs to a private Loki
instance or Grafana Cloud. It is usually
deployed to every machine that has applications needed to be monitored.

It primarily:

1. Discovers targets
2. Attaches labels to log streams
3. Pushes them to the Loki instance.

Currently, Loki can tail logs from two sources: local log files and the
systemd journal (on AMD64 machines only).

%prep
unzip -o %{SOURCE0}
unzip -o %{SOURCE1}
unzip -o %{SOURCE2}

%build
# nothing to do here

# %install
mkdir -vp %{buildroot}%{_sharedstatedir}/prometheus
install -D -m 755 loki-linux-amd64 %{buildroot}%{_bindir}/loki
install -D -m 755 loki-canary-linux-amd64 %{buildroot}%{_bindir}/loki-canary
install -D -m 755 logcli-linux-amd64 %{buildroot}%{_bindir}/logcli
install -D -m 644 %{SOURCE3} %{buildroot}%{_unitdir}/loki.service
install -D -m 644 %{SOURCE4} %{buildroot}%{_sysconfdir}/default/loki
install -D -m 644 %{SOURCE5} %{buildroot}%{_sysconfdir}/loki.yml

%pre
getent group prometheus >/dev/null || groupadd -r prometheus
getent passwd prometheus >/dev/null || \
  useradd -r -g prometheus -d %{_sharedstatedir}/prometheus -s /sbin/nologin \
          -c "Prometheus services" prometheus
exit 0

%post
%systemd_post %{name}.service

%preun
%systemd_preun %{name}.service

%postun
%systemd_postun %{name}.service

%files
%defattr(-,root,root,-)
%{_bindir}/loki
%{_bindir}/loki-canary
%{_bindir}/logcli
%config(noreplace) %{_sysconfdir}/loki.yml
%config(noreplace) %{_sysconfdir}/default/loki
%{_unitdir}/loki.service
%dir %attr(755, prometheus, prometheus)%{_sharedstatedir}/prometheus