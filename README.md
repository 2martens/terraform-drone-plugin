# Qodana JVM Community Drone plugin

[![Apache 2.0 License](https://img.shields.io/github/license/2martens/qodana-jvm-community-drone-plugin?label=License)](https://github.com/2martens/qodana-jvm-community-drone-plugin/blob/master/LICENSE)
[![Docker image version](https://img.shields.io/docker/v/2martens/qodana-jvm-community-drone-plugin?logo=docker&label=Docker+image)](https://hub.docker.com/r/2martens/qodana-jvm-community-drone-plugin)

This Drone plugin uses the Qodana JVM Community linter and makes it compatible with Drone.

# Usage

```yaml
- name: Step name
  image: 2martens/qodana-jvm-community-drone-plugin
  settings:
    qodana_token: <qodana-cloud-token>
    args: <args>
```

To use the quality gate feature, add `--fail-threshold <number>` to the args setting.

To use baseline feature, add `--baseline qodana.sarif.json` to the args setting. 
This file has to be checked-in to the root of your project.

# Example pipeline

This example pipeline uses host volumes and has to be trusted. The Qodana docker stores the cache
under /data/cache in the container and this pipeline makes sure that this cache is stored on the
host instead.

```yaml
kind: pipeline
name: default
type: docker

platform:
  os: linux
  arch: arm64

clone:
  skip_verify: true

steps:
  - name: run code analysis
    pull: always
    image: 2martens/qodana-jvm-community-drone-plugin:2023.2
    settings:
      qodana_token:
        from_secret: qodana_token
      args: --baseline qodana.sarif.json --fail-threshold 0
    volumes:
      - name: cache
        path: /data/cache

volumes:
  - name: cache
    host:
      path: /var/lib/drone/cache
```