# Runs systemd (with apache)
# Based off: http://developerblog.redhat.com/2014/05/05/running-systemd-within-docker-container/

FROM registry.hub.docker.com/fedora:20
MAINTAINER amitsaha.in@gmail.com
RUN yum -y install systemd; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ "\$i" == systemd-tmpfiles-setup.service ] || rm -f "\$i"; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
RUN yum -y install httpd
RUN systemctl enable httpd

# Expose port
EXPOSE 80
CMD ["/usr/sbin/init"]
