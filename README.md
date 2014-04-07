tutum-docker-mariadb
=======================

Base docker image to run a MariaDB database server


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


Setting a specific password for the admin account
-------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `MARIADB_PASS` to your specific password when running the container:

        docker run -d -p 5432:5432 -e MARIADB_PASS="mypass" tutum/maria


Mounting the database file volume
---------------------------------

Coming soon!


Migrating an existing MariaDB Server
----------------------------------

Coming soon!
