FROM ubuntu:18.04

LABEL "maintainer"="Pavel Pikta <pikta.pavel@gmail.com>"

ENV container=docker \
  LANGUAGE=en_US.UTF-8 \
  LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8 \
  TERM=xterm \
  DEBIAN_FRONTEND="noninteractive"

# Enable all repositories
RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt-get update && \
  apt-get install -y sudo bash apt-utils locales iproute2 \
  ca-certificates dbus dbus-user-session gnupg systemd libsystemd-dev rsyslog systemd-cron && \
  rm -rf /var/lib/apt/lists/* && \
  locale-gen en_US.UTF-8

RUN rm -Rf /var/lib/apt/lists/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm -f /lib/systemd/system/multi-user.target.wants/* \
  && rm -f /etc/systemd/system/*.wants/* \
  && rm -f /lib/systemd/system/local-fs.target.wants/* \
  && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
  && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
  && rm -f /lib/systemd/system/basic.target.wants/* \
  && rm -f /lib/systemd/system/anaconda.target.wants/* \
  && rm -f /lib/systemd/system/plymouth* \
  && rm -f /lib/systemd/system/systemd-update-utmp* \
  && rm -f /lib/systemd/system/systemd*udev* \
  && rm -f /lib/systemd/system/getty.target \
  && rm -Rf /usr/share/doc && rm -Rf /usr/share/man

RUN apt-get update && \
  apt-get install -y \
  python3 \
  python3-pip \
  python3-setuptools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

RUN cp /bin/true /sbin/agetty

STOPSIGNAL SIGRTMIN+3

VOLUME ["/sys/fs/cgroup"]

CMD ["/sbin/init"]
