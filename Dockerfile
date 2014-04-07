FROM ubuntu:saucy
MAINTAINER FENG, HONGLIN <hfeng@tutum.co>

RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://mirrors.syringanetworks.net/mariadb/repo/10.0/ubuntu saucy main'
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pwgen

ADD create_mariadb_admin_user.sh /create_mariadb_admin_user.sh
ADD run.sh /run.sh
RUN chmod 775 /*.sh

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
