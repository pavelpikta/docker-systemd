FROM ubuntu:24.04

LABEL maintainer="Pavel Pikta <devops@pavelpikta.com>"

ENV container docker
ENV LC_ALL C
ENV TERM xterm
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends systemd systemd-sysv && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /lib/systemd/system/multi-user.target.wants/* && \
    rm -f /etc/systemd/system/*.wants/* && \
    rm -f /lib/systemd/system/local-fs.target.wants/* && \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
    rm -f /lib/systemd/system/basic.target.wants/* && \
    rm -f /lib/systemd/system/anaconda.target.wants/* && \
    rm -f /lib/systemd/system/plymouth* && \
    rm -f /lib/systemd/system/systemd-update-utmp* && \
    cd /lib/systemd/system/sysinit.target.wants/ && \
    rm $(ls | grep -v systemd-tmpfiles-setup)

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/lib/systemd/systemd"]
