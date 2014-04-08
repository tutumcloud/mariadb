#!/bin/bash

#change bind address to 0.0.0.0
sed -i -r 's/bind-address.*$/bind-address = 0.0.0.0/' /etc/mysql/my.cnf

if [ ! -f /.maria_admin_created ]; then
        /create_mariadb_admin_user.sh
fi

exec mysqld_safe 
