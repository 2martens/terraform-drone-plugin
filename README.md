# Terraform Drone plugin

[![Apache 2.0 License](https://img.shields.io/github/license/2martens/terraform-drone-plugin?label=License)](https://github.com/2martens/terraform-drone-plugin/blob/main/LICENSE)
[![Docker image version](https://img.shields.io/docker/v/2martens/terraform-drone-plugin?logo=docker&label=Docker+image)](https://hub.docker.com/r/2martens/terraform-drone-plugin)

This Drone plugin uses the Terraform CLI and makes it compatible with Drone.

# Usage

```yaml
- name: Step name
  image: 2martens/terraform-drone-plugin
  settings:
    args: <args>
```

# Example pipeline


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
  - name: login to Terraform cloud
    pull: always
    image: 2martens/terraform-drone-plugin:1.26.2
    settings:
      args: login
  - name: run plan
    pull: always
    image: 2martens/terraform-drone-plugin:1.26.2
    settings:
      args: plan
```