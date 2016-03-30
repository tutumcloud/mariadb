tutum-docker-mariadb
====================

**This image will be deprecated soon. Please use the docker official image:** https://hub.docker.com/_/mariadb/

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Base docker image to run a MariaDB database server


MariaDB version
---------------

If you want to use MySQL, please check our `tutum/mysql` image: https://github.com/tutumcloud/tutum-docker-mysql

Usage
-----

To create the image `tutum/mariadb`, execute the following command on the tutum-docker-mariadb folder:

        docker build -t tutum/mariadb .

To run the image and bind to port 3306:

        docker run -d -p 3306:3306 tutum/mariadb

The first time that you run your container, a new user `admin` with all privileges
will be created in MariaDB with a random password. To get the password, check the logs
of the container by running:

        docker logs <CONTAINER_ID>

You will see an output like the following:

        ========================================================================
        You can now connect to this MariaDB Server using:

            mysql -uadmin -pxVN33tWOhM3u -h<host> -P<port>

        Please remember to change the above password as soon as possible!
        MariaDB user 'root' has no password but only allows local connections
        ========================================================================


In this case, `xVN33tWOhM3u` is the password assigned to the `admin` user.

Done!


Environment Variables
---------------------

Environment variables can be used to preset admin account username & password,
import SQL and create a database at startup.

The following environment variables can be used:

        MARIADB_USER - Sets the admin account username (defaults to 'admin')
        MARIADB_PASS - Sets the admin account password (defaults to random string, see docker logs <CONTAINER_ID>)
        STARTUP_SQL  - SQL to import at startup (needs to exist, can be mounted)
        ON_CREATE_DB - Database to create at startup.


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `MARIADB_PASS` to your specific password when running the container:

        docker run -d -p 3306:3306 -e MARIADB_PASS="mypass" tutum/mariadb


Mounting the database file volume from other containers
------------------------------------------------------

One way to persist the database data is to store database files in another container.
To do so, first create a container that holds database files:

    docker run -d -v /var/lib/mysql --name db_vol -p 22:22 tutum/ubuntu-trusty

This will create a new ssh-enabled container and use its folder `/var/lib/mysql` to store MariaDB database files.
You can specify any name of the container by using `--name` option, which will be used in next step.

After this you can start your MariaDB image using volumes in the container created above (put the name of container in `--volumes-from`)

    docker run -d --volumes-from db_vol -p 3306:3306 tutum/mariadb
