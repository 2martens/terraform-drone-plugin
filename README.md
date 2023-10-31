# Terraform Drone plugin

[![Apache 2.0 License](https://img.shields.io/github/license/2martens/terraform-drone-plugin?label=License)](https://github.com/2martens/terraform-drone-plugin/blob/main/LICENSE)
[![Docker image version](https://img.shields.io/docker/v/2martens/terraform-drone-plugin?logo=docker&label=Docker+image)](https://hub.docker.com/r/2martens/terraform-drone-plugin)

This Drone plugin uses the Terraform CLI and makes it compatible with Drone.

# Usage

```yaml
- name: Step name
  image: 2martens/terraform-drone-plugin
  settings:
    api_token: <api_token>
    cloud_organization: <cloud_organization>
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
  - name: run plan
    pull: always
    image: 2martens/terraform-drone-plugin
    settings:
      api_token:
        from_secret: api_token
      cloud_organization:
        from_secret: cloud_organization
      args: plan
```