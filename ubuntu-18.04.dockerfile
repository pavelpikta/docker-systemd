FROM ubuntu:18.04

LABEL "maintainer"="Pavel Pikta <pikta.pavel@gmail.com>"

ENV container=docker \
    LANGUAGE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    TERM=xterm \
    DEBIAN_FRONTEND="noninteractive"

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt-get update ; \
    apt-get install -y systemd systemd-sysv apt-utils locales; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    cd /lib/systemd/system/sysinit.target.wants/ ; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp*; \
    localedef -f UTF-8 -i en_US en_US.UTF-8

RUN cp /bin/true /sbin/agetty

STOPSIGNAL SIGRTMIN+3

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT ["/sbin/init"]
