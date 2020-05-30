FROM centos:7

RUN yum -y install net-tools wget epel-release

RUN wget https://ast.tucny.com/repo/tucny-asterisk.repo -O /etc/yum.repos.d/tucny-asterisk.repo

RUN rpm --import https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny

RUN yum -y --enablerepo asterisk-16 install asterisk asterisk-sip && yum clean all

EXPOSE 5060/udp

COPY asterisk_start.sh asterisk_start.sh

CMD ./asterisk_start.sh
