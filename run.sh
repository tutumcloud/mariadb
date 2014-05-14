#!/bin/bash

if [ ! -f /.maria_admin_created ]; then
        /create_mariadb_admin_user.sh
fi

exec mysqld_safe 
