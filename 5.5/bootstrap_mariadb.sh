#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

# Sleep until MariaDB is up and running
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MariaDB service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

# Run startup scripts
/create_admin_user.sh
/create_default_db.sh
/startup_sql_import.sh

mysqladmin -uroot shutdown
