# Docker systemd images #

[![Docker Images CI](https://github.com/pavelpikta/docker-systemd/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/pavelpikta/docker-systemd/actions/workflows/ci.yml)

Docker images that runs `systemd` with a minimal set of services.

**Development use only. Do not use in production!**

## Supported tags ##

* `docker-systemd:ubuntu-20.04`
* `docker-systemd:ubuntu-22.04`
* `docker-systemd:ubuntu-24.04`

## Usage ##

### Running Docker images with systemd ###

To run the Docker images with `systemd`, use the following command:

```sh
docker run --privileged --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -d <image_name>
```

Replace `<image_name>` with the appropriate image tag (e.g., `docker-systemd:ubuntu-20.04`).

### Examples ###

#### Running Ubuntu 20.04 Docker image with systemd ####

```sh
docker run --privileged --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -d docker-systemd:ubuntu-20.04
```

#### Running Ubuntu 22.04 Docker image with systemd ####

```sh
docker run --privileged --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -d docker-systemd:ubuntu-22.04
```

#### Running Ubuntu 24.04 Docker image with systemd ####

```sh
docker run --privileged --volume /sys/fs/cgroup:/sys/fs/cgroup:ro -d docker-systemd:ubuntu-24.04
```

## Contributing ##

We welcome contributions to this repository. Please follow the guidelines below:

1. Read and follow the [Contributor Covenant Code of Conduct](.github/CODE_OF_CONDUCT.md).
2. Review the [CODEOWNERS](.github/CODEOWNERS) file to understand the code ownership and review process.
3. Fork the repository and create a new branch for your feature or bugfix.
4. Submit a pull request with a clear description of your changes.

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

* [Pavel Pikta](https://github.com/pavelpikta) <devops@pavelpikta.com>
