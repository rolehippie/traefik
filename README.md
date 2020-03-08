# traefik

[![Build Status](https://cloud.drone.io/api/badges/rolehippie/traefik/status.svg)](https://cloud.drone.io/rolehippie/traefik)

Ansible role to configure traefik

## Table of content

* [Default Variables](#default-variables)
  * [traefik_accesslog_buffer](#traefik_accesslog_buffer)
  * [traefik_accesslog_format](#traefik_accesslog_format)
  * [traefik_additional_entrypoints](#traefik_additional_entrypoints)
  * [traefik_additional_middlewares](#traefik_additional_middlewares)
  * [traefik_additional_ports](#traefik_additional_ports)
  * [traefik_api_dashboard](#traefik_api_dashboard)
  * [traefik_api_debug](#traefik_api_debug)
  * [traefik_api_enabled](#traefik_api_enabled)
  * [traefik_api_insecure](#traefik_api_insecure)
  * [traefik_cert_resolvers](#traefik_cert_resolvers)
  * [traefik_check_new_version](#traefik_check_new_version)
  * [traefik_dashboard_cert_resolver](#traefik_dashboard_cert_resolver)
  * [traefik_dashboard_host_rule](#traefik_dashboard_host_rule)
  * [traefik_dashboard_http_entrypoint](#traefik_dashboard_http_entrypoint)
  * [traefik_dashboard_https_entrypoint](#traefik_dashboard_https_entrypoint)
  * [traefik_dashboard_middlewares](#traefik_dashboard_middlewares)
  * [traefik_dashboard_users](#traefik_dashboard_users)
  * [traefik_docker_bind_port_ip](#traefik_docker_bind_port_ip)
  * [traefik_docker_default_rule](#traefik_docker_default_rule)
  * [traefik_docker_exposed_by_default](#traefik_docker_exposed_by_default)
  * [traefik_docker_network_name](#traefik_docker_network_name)
  * [traefik_environment_variables](#traefik_environment_variables)
  * [traefik_force_restart](#traefik_force_restart)
  * [traefik_forwarding_dial_timeout](#traefik_forwarding_dial_timeout)
  * [traefik_forwarding_idle_timeout](#traefik_forwarding_idle_timeout)
  * [traefik_forwarding_response_timeout](#traefik_forwarding_response_timeout)
  * [traefik_hostresolver_cname_flattening](#traefik_hostresolver_cname_flattening)
  * [traefik_hostresolver_resolv_config](#traefik_hostresolver_resolv_config)
  * [traefik_hostresolver_resolv_depth](#traefik_hostresolver_resolv_depth)
  * [traefik_image](#traefik_image)
  * [traefik_insecure_skip_verify](#traefik_insecure_skip_verify)
  * [traefik_log_format](#traefik_log_format)
  * [traefik_log_level](#traefik_log_level)
  * [traefik_max_idle_conns](#traefik_max_idle_conns)
  * [traefik_ping_entrypoint](#traefik_ping_entrypoint)
  * [traefik_prometheus_buckets](#traefik_prometheus_buckets)
  * [traefik_prometheus_enabled](#traefik_prometheus_enabled)
  * [traefik_prometheus_entrypoint](#traefik_prometheus_entrypoint)
  * [traefik_prometheus_entrypoint_labels](#traefik_prometheus_entrypoint_labels)
  * [traefik_prometheus_service_labels](#traefik_prometheus_service_labels)
  * [traefik_provider_throttle_duration](#traefik_provider_throttle_duration)
  * [traefik_root_certificates](#traefik_root_certificates)
  * [traefik_send_anonymous_usage](#traefik_send_anonymous_usage)
  * [traefik_standard_entrypoints](#traefik_standard_entrypoints)
  * [traefik_standard_middlewares](#traefik_standard_middlewares)
  * [traefik_standard_ports](#traefik_standard_ports)
  * [traefik_tls_additional_certificates](#traefik_tls_additional_certificates)
  * [traefik_tls_cipher_suites](#traefik_tls_cipher_suites)
  * [traefik_tls_default_certificate](#traefik_tls_default_certificate)
  * [traefik_tls_min_version](#traefik_tls_min_version)
  * [traefik_tls_standard_certificates](#traefik_tls_standard_certificates)
  * [traefik_tracing_128bit_spans](#traefik_tracing_128bit_spans)
  * [traefik_tracing_collector_endpoint](#traefik_tracing_collector_endpoint)
  * [traefik_tracing_collector_password](#traefik_tracing_collector_password)
  * [traefik_tracing_collector_user](#traefik_tracing_collector_user)
  * [traefik_tracing_enabled](#traefik_tracing_enabled)
  * [traefik_tracing_header_name](#traefik_tracing_header_name)
  * [traefik_tracing_local_agent](#traefik_tracing_local_agent)
  * [traefik_tracing_name_limit](#traefik_tracing_name_limit)
  * [traefik_tracing_propagation_format](#traefik_tracing_propagation_format)
  * [traefik_tracing_sampling_param](#traefik_tracing_sampling_param)
  * [traefik_tracing_sampling_server](#traefik_tracing_sampling_server)
  * [traefik_tracing_sampling_type](#traefik_tracing_sampling_type)
  * [traefik_tracing_service_name](#traefik_tracing_service_name)
* [Dependencies](#dependencies)
* [License](#license)
* [Author](#author)

---

## Default Variables

### traefik_accesslog_buffer

Access log buffering size

#### Default value

```YAML
traefik_accesslog_buffer: 0
```

### traefik_accesslog_format

Access log format

#### Default value

```YAML
traefik_accesslog_format: common
```

### traefik_additional_entrypoints

Additional available entrypoints

#### Default value

```YAML
traefik_additional_entrypoints: []
```

### traefik_additional_middlewares

Additional available middlewares

#### Default value

```YAML
traefik_additional_middlewares: []
```

### traefik_additional_ports

Additional available ports

#### Default value

```YAML
traefik_additional_ports: []
```

### traefik_api_dashboard

Enable dashboard API

#### Default value

```YAML
traefik_api_dashboard: true
```

### traefik_api_debug

Enable debug mode within API

#### Default value

```YAML
traefik_api_debug: false
```

### traefik_api_enabled

Enable API endpoints

#### Default value

```YAML
traefik_api_enabled: true
```

### traefik_api_insecure

Enable insecure access for API

#### Default value

```YAML
traefik_api_insecure: false
```

### traefik_cert_resolvers

List of certificate resolvers

#### Default value

```YAML
traefik_cert_resolvers: []
```

#### Example usage

```YAML
traefik_cert_resolvers:
  - name: default-dns
    email: webmaster@example.com
    dns_challenge:
      provider: cloudflare
  - name: default-http
    email: webmaster@example.com
    http_challenge:
      entrypoint: http
  - name: default-tls
    email: webmaster@example.com
    tls_challenge: True
```

### traefik_check_new_version

Check for a new version online

#### Default value

```YAML
traefik_check_new_version: false
```

### traefik_dashboard_cert_resolver

Cert resolver for the dashboard

#### Default value

```YAML
traefik_dashboard_cert_resolver:
```

### traefik_dashboard_host_rule

Host rule for the dashboard

#### Default value

```YAML
traefik_dashboard_host_rule: '{{ ansible_fqdn }}'
```

### traefik_dashboard_http_entrypoint

Insecure entrypoint for the dashboard

#### Default value

```YAML
traefik_dashboard_http_entrypoint: http
```

### traefik_dashboard_https_entrypoint

Secure entrypoint for the dashboard

#### Default value

```YAML
traefik_dashboard_https_entrypoint: https
```

### traefik_dashboard_middlewares

Middlewares used for the dashboard

#### Default value

```YAML
traefik_dashboard_middlewares:
  - traefik@file
```

### traefik_dashboard_users

Users used for the dashboard

#### Default value

```YAML
traefik_dashboard_users: []
```

### traefik_docker_bind_port_ip

Use bind port ip for docker provider

#### Default value

```YAML
traefik_docker_bind_port_ip: false
```

### traefik_docker_default_rule

Default rule for docker provider

#### Default value

```YAML
traefik_docker_default_rule: Host(`{{ normalize .Name }}`)
```

### traefik_docker_exposed_by_default

Expose service by default for docker provider

#### Default value

```YAML
traefik_docker_exposed_by_default: false
```

### traefik_docker_network_name

Docker network used by docker provider

#### Default value

```YAML
traefik_docker_network_name:
```

#### Example usage

```YAML
traefik_docker_network_name: traefik
```

### traefik_environment_variables

List of available environment variables

#### Default value

```YAML
traefik_environment_variables: []
```

#### Example usage

```YAML
traefik_environment_variables:
  - key: CF_API_EMAIL
    value: webmaster@example.com
  - key: CF_API_KEY
    value: as0oiGu2Chier3aepaeceeG7oiY2aezawe5te
```

### traefik_force_restart

Force a restart of the service

#### Default value

```YAML
traefik_force_restart: false
```

### traefik_forwarding_dial_timeout

Server transport forwarding dial timeout

#### Default value

```YAML
traefik_forwarding_dial_timeout: 30
```

### traefik_forwarding_idle_timeout

Server transport forwarding idle connection timeout

#### Default value

```YAML
traefik_forwarding_idle_timeout: 90
```

### traefik_forwarding_response_timeout

Server transport forwarding response timeout

#### Default value

```YAML
traefik_forwarding_response_timeout: 0
```

### traefik_hostresolver_cname_flattening

Enable cname flattening for resolver

#### Default value

```YAML
traefik_hostresolver_cname_flattening: false
```

### traefik_hostresolver_resolv_config

Path to host resolv config

#### Default value

```YAML
traefik_hostresolver_resolv_config: /etc/resolv.conf
```

### traefik_hostresolver_resolv_depth

Max resolv depth for the host resolver

#### Default value

```YAML
traefik_hostresolver_resolv_depth: 5
```

### traefik_image

Docker image to use

#### Default value

```YAML
traefik_image: library/traefik:2.0
```

### traefik_insecure_skip_verify

Server transport insecure skip verify

#### Default value

```YAML
traefik_insecure_skip_verify: true
```

### traefik_log_format

General log format

#### Default value

```YAML
traefik_log_format: common
```

### traefik_log_level

General log level

#### Default value

```YAML
traefik_log_level: ERROR
```

### traefik_max_idle_conns

Server transport max idle connections per host

#### Default value

```YAML
traefik_max_idle_conns: 100
```

### traefik_ping_entrypoint

Entrypoint used for ping

#### Default value

```YAML
traefik_ping_entrypoint:
```

### traefik_prometheus_buckets

List of buckets for prometheus metrics

#### Default value

```YAML
traefik_prometheus_buckets:
  - 0.1
  - 0.3
  - 1.2
  - 5.0
```

### traefik_prometheus_enabled

Enable prometheus exporter

#### Default value

```YAML
traefik_prometheus_enabled: true
```

### traefik_prometheus_entrypoint

Entrypoint used for prometheus metrics

#### Default value

```YAML
traefik_prometheus_entrypoint: metrics
```

### traefik_prometheus_entrypoint_labels

Add entrypoint labels for prometheus metrics

#### Default value

```YAML
traefik_prometheus_entrypoint_labels: true
```

### traefik_prometheus_service_labels

Add service labels for prometheus metrics

#### Default value

```YAML
traefik_prometheus_service_labels: true
```

### traefik_provider_throttle_duration

Provider throttle duration

#### Default value

```YAML
traefik_provider_throttle_duration: 0
```

### traefik_root_certificates

List of available root certificates

#### Default value

```YAML
traefik_root_certificates: []
```

#### Example usage

```YAML
traefik_root_certificates:
  - /path/to/root1.crt
  - /path/to/root2.crt
  - /path/to/root3.crt
```

### traefik_send_anonymous_usage

Send anonymous usage information to authors

#### Default value

```YAML
traefik_send_anonymous_usage: true
```

### traefik_standard_entrypoints

General available entrypoints

#### Default value

```YAML
traefik_standard_entrypoints:
  - name: metrics
    address: :8082
  - name: traefik
    address: :8080
  - name: http
    address: :80
  - name: https
    address: :443
```

### traefik_standard_middlewares

General available middlewares

#### Default value

```YAML
traefik_standard_middlewares:
  - name: traefik
    kind: basicAuth
    attrs:
      users: '{{ traefik_dashboard_users }}'
      realm: Traefik
  - name: https
    kind: redirectScheme
    attrs:
      scheme: https
      permanent: true
  - name: secure
    kind: headers
    attrs:
      forceSTSHeader: true
      stsIncludeSubdomains: false
      stsPreload: true
      stsSeconds: 315360000
      sslRedirect: true
      customFrameOptionsValue: SAMEORIGIN
      contentTypeNosniff: true
      browserXssFilter: true
      referrerPolicy: strict-origin-when-cross-origin
```

### traefik_standard_ports

General available ports

#### Default value

```YAML
traefik_standard_ports:
  - 80:80
  - 443:443
```

### traefik_tls_additional_certificates

Additional available certificates

#### Default value

```YAML
traefik_tls_additional_certificates: []
```

#### Example usage

```YAML
traefik_tls_additional_certificates:
  - crt: /etc/ssl/certs/wildcard.example.com.crt
    key: /etc/ssl/private/wildcard.example.com.key
  - crt: /etc/ssl/certs/wildcard.foo.com.crt
    key: /etc/ssl/private/wildcard.foo.com.key
  - crt: /etc/ssl/certs/wildcard.bar.com.crt
    key: /etc/ssl/private/wildcard.bar.com.key
```

### traefik_tls_cipher_suites

Cipher suites to enable for TLS

#### Default value

```YAML
traefik_tls_cipher_suites:
  - TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
  - TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
  - TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305
  - TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305
  - TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
  - TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
  - TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
  - TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
  - TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
  - TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
```

### traefik_tls_default_certificate

Default certificate used for any request without a matching router

#### Default value

```YAML
traefik_tls_default_certificate:
```

#### Example usage

```YAML
traefik_tls_default_certificate:
  crt: /etc/ssl/certs/wildcard.example.com.crt
  key: /etc/ssl/private/wildcard.example.com.key
```

### traefik_tls_min_version

Minimal version used for TLS

#### Default value

```YAML
traefik_tls_min_version: VersionTLS12
```

### traefik_tls_standard_certificates

General available certificates

#### Default value

```YAML
traefik_tls_standard_certificates: []
```

#### Example usage

```YAML
traefik_tls_standard_certificates:
  - crt: /etc/ssl/certs/wildcard.example.com.crt
    key: /etc/ssl/private/wildcard.example.com.key
  - crt: /etc/ssl/certs/wildcard.foo.com.crt
    key: /etc/ssl/private/wildcard.foo.com.key
  - crt: /etc/ssl/certs/wildcard.bar.com.crt
    key: /etc/ssl/private/wildcard.bar.com.key
```

### traefik_tracing_128bit_spans

Jaeger tracing gen 128bit spans

#### Default value

```YAML
traefik_tracing_128bit_spans: false
```

### traefik_tracing_collector_endpoint

Jaeger tracing collector endpoint

#### Default value

```YAML
traefik_tracing_collector_endpoint:
```

### traefik_tracing_collector_password

Jaeger tracing collector password

#### Default value

```YAML
traefik_tracing_collector_password:
```

### traefik_tracing_collector_user

Jaeger tracing collector user

#### Default value

```YAML
traefik_tracing_collector_user:
```

### traefik_tracing_enabled

Enable distributed tracing

#### Default value

```YAML
traefik_tracing_enabled: false
```

### traefik_tracing_header_name

Jaeger tracing context header name

#### Default value

```YAML
traefik_tracing_header_name: uber-trace-id
```

### traefik_tracing_local_agent

Jaeger tracing local agent host and port

#### Default value

```YAML
traefik_tracing_local_agent:
```

### traefik_tracing_name_limit

Tracing span name limit

#### Default value

```YAML
traefik_tracing_name_limit: 0
```

### traefik_tracing_propagation_format

Jaeger tracing propagation format

#### Default value

```YAML
traefik_tracing_propagation_format: jaeger
```

### traefik_tracing_sampling_param

Jaeger tracing sampling rate

#### Default value

```YAML
traefik_tracing_sampling_param: 1.0
```

### traefik_tracing_sampling_server

Jaeger tracing sampling server url

#### Default value

```YAML
traefik_tracing_sampling_server:
```

### traefik_tracing_sampling_type

Jaeger tracing sampling type

#### Default value

```YAML
traefik_tracing_sampling_type: const
```

### traefik_tracing_service_name

Tracing service name to send

#### Default value

```YAML
traefik_tracing_service_name: traefik
```

## Dependencies

- '['
- '  "[docker](https://github.com/rolehippie/docker)"'
- ']'

## License

Apache-2.0

## Author

[Thomas Boerger](https://github.com/tboerger)
