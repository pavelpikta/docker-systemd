# Docker systemd images #

[![Docker Images CI](https://github.com/pavelpikta/docker-systemd/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/pavelpikta/docker-systemd/actions/workflows/ci.yml)

Docker images that runs `systemd` with a minimal set of services.

Intended for use testing Ansible roles with Molecule

**Development use only. Do not use in production!**

## Supported tags ##

ubuntu:

* `ubuntu-18.04:latest`
* `ubuntu-20.04:latest`

centos:

* `centos7:latest`

## Running ##

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

## License ##

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```

## Author Information ##

Authors:

* [Pavel Pikta](https://github.com/pavelpikta) <pavel_pitka@outlook.com>
