# Docker systemd images

[![Docker Images CI](https://github.com/pavelpikta/docker-systemd/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/pavelpikta/docker-systemd/actions/workflows/main.yml)

Docker images that runs `systemd` with a minimal set of services.

Intended for use testing Ansible roles with Molecule

**Development use only. Do not use in production!**

## Supported tags

ubuntu:
* `ubuntu-18.04:latest`
* `ubuntu-20.04:latest`

centos:
* `centos7:latest`

## Running

These images were created for using with molecule tool when do testing with docker driver.

To start a service which requires systemd, configure molecule.yml with a systemd compliant image, capabilities, volumes, and command as follows.

```yaml
platforms:
  - name: test-docker-centos7
    image: ghcr.io/pavelpikta/docker-systemd/centos7:latest
    privileged: true
    pre_build_image: true
    command: /sbin/init
    tmpfs:
      - /run
      - /tmp
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    groups:
      - rhel_family

  - name: test-docker-ubuntu1804
    image: ghcr.io/pavelpikta/docker-systemd/ubuntu-18.04:latest
    command: /sbin/init
    privileged: true
    pre_build_image: true
    tmpfs:
      - /run
      - /tmp
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    groups:
      - debian_family
```

## License

Apache [![License](https://img.shields.io/badge/license-Apache-green.svg?style=flat)](https://raw.githubusercontent.com/pavelpikta/docker-systemd/main/LICENSE)

## Author Information

Authors:

- [Pavel Pikta](https://github.com/pavelpikta) <pavel_pitka@outlook.com>
