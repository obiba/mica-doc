Installation
============

Mica is a stand-alone `Java <https://www.java.com>`_ server application that requires `MongoDB <https://www.mongodb.com/>`_ as database engine.

Requirements
------------

Server Hardware Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

============ ===============
Component    Requirement
============ ===============
CPU	         Recent server-grade or high-end consumer-grade processor
Disk space	 8GB or more.
Memory (RAM) Minimum: 4GB, Recommended: >4GB
============ ===============

Server Software Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

============= ================= =========================================================================== ========================
Software      Suggested version Download link                                                               Usage
============= ================= =========================================================================== ========================
Java          21                `OpenJDK downloads <https://jdk.java.net/>`_                                Java runtime environment
MongoDB       <= 8.0.x          `MongoDB Community downloads <https://www.mongodb.com/docs/manual/>`_       Database engine
Elasticsearch 8.16.1            `Elasticsearch downloads <https://www.elastic.co/downloads/elasticsearch>`_ Search engine
============= ================= =========================================================================== ========================

While Java is required by Mica server application, MongoDB and Elasticsearch can be installed on other servers.

Install
-------

Mica is distributed as a Debian/RPM package and as a zip file. The resulting installation has default configuration that makes Mica ready to be used (as soon as a MongoDB server is available). Once installation is done, see :doc:`configuration` instructions.

Debian Package Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mica is available as a Debian package from OBiBa Debian repository. To proceed installation, do as follows:

* `Install Debian package <http://www.obiba.org/pages/pkg/>`_. Follow the instructions in the repository main page for installing Mica.
* Manage Mica Service: after package installation, Mica server is running: see how to manage the Service.

RPM Package Installation
~~~~~~~~~~~~~~~~~~~~~~~~

Mica is available as a RPM package from OBiBa RPM repository. To proceed installation, do as follows:

* `Install RPM package <http://www.obiba.org/pages/rpm/>`_. Follow the instructions in the RPM repository main page for installing Mica.
* Manage Mica Service: after package installation, Mica is running: see how to manage the Service.

Zip Distribution Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mica is also available as a Zip file. To install Mica zip distribution, proceed as follows:

* `Download Mica distribution <https://github.com/obiba/mica2/releases>`_
* Unzip the Mica distribution. Note that the zip file contains a root directory named **mica-x.y.z-dist** (where x, y and z are the major, minor and micro releases, respectively). You can copy it wherever you want. You can also rename it.
* Create an ``MICA_HOME`` environment variable
* Separate Mica home from Mica distribution directories (recommended). This will facilitate subsequent upgrades.

Set-up example for Linux:

.. code-block:: bash

  mkdir mica-home
  cp -r mica-x-dist/conf mica-home
  export MICA_HOME=`pwd`/mica-home
  ./mica-x-dist/bin/mica

Launch Mica. This step will create/update the database schema for Mica and will start Mica: see Regular Command.

For the administrator accounts, the credentials are "administrator" as username and "password" as password. See User Directories Configuration to change it.

Docker Image Installation
~~~~~~~~~~~~~~~~~~~~~~~~~

OBiBa is an early adopter of the `Docker <https://www.docker.com/>`_ technology, providing its own images from the `Docker Hub repository <https://hub.docker.com/orgs/obiba/repositories>`_.

A typical `docker compose <https://docs.docker.com/compose/>`_ file (including a MongoDB database) would be:

.. code-block:: yaml

  services:
        mica:
                image: obiba/mica
                ports:
                        - "8872:8082"
                depends_on:
                        - mongo
                        - agate
                        - opal
                        - es8
                environment:
                        - JAVA_OPTS=-Xmx2G
                        - MICA_ADMINISTRATOR_PASSWORD=${MICA_ADMINISTRATOR_PASSWORD}
                        - MONGO_HOST=mongo
                        - MONGO_PORT=27017
                        - OPAL_URL=http://opal:8080
                        - AGATE_URL=http://agate:8081
                        - ELASTICSEARCH_HOST=es8
                volumes:
                        - /opt/mica:/srv
        mongo:
                image: mongo:8.0
        opal:
                image: obiba/opal
                ports:
                        - "8870:8080"
                depends_on:
                        - mongo
                        - rock
                        - agate
                environment:
                        - OPAL_ADMINISTRATOR_PASSWORD=${OPAL_ADMINISTRATOR_PASSWORD}
                        - MONGO_HOST=mongo
                        - MONGO_PORT=27017
                        - AGATE_URL=http://agate:8081
                        - ROCK_HOSTS=rock:8085
                volumes:
                        - /opt/opal:/srv
        rock:
                image: obiba/rock
        agate:
                image: obiba/agate
                ports:
                        - "8871:8081"
                depends_on:
                        - mongo
                environment:
                        - AGATE_ADMINISTRATOR_PASSWORD=${AGATE_ADMINISTRATOR_PASSWORD}
                        - MONGO_HOST=mongo
                        - MONGO_PORT=27017
                        - RECAPTCHA_SITE_KEY=${RECAPTCHA_SITE_KEY}
                        - RECAPTCHA_SECRET_KEY=${RECAPTCHA_SECRET_KEY}
                volumes:
                        - /opt/agate:/srv
        es8:
                image: docker.elastic.co/elasticsearch/elasticsearch:8.16.1
                expose:
                        - 9300
                        - 9200
                environment:
                        - cluster.name=mica
                        - node.name=es8
                        - discovery.type=single-node
                        - bootstrap.memory_lock=true
                        - network.host=0.0.0.0
                        - xpack.security.enabled=false
                        - xpack.security.http.ssl.enabled=false
                        - ES_JAVA_OPTS=-Xms512m -Xmx512m
                ulimits:
                        memlock:
                                soft: -1
                                hard: -1

Then environment variables that are exposed by this image are:

================================= =========================================================================
Environment Variable              Description
================================= =========================================================================
``JAVA_OPTS``                     Java VM arguments.
``MICA_ADMINISTRATOR_PASSWORD``   Mica administrator password, required and set at first start.
``MONGO_HOST``                    MongoDB server host.
``MONGO_PORT``                    MongoDB server port, default is ``27017``.
``MONGO_DB``                      MongoDB database name, default is ``mica``.
``MONGO_USER``                    MongoDB user name (optional).
``MONGO_PASSWORD``                MongoDB user password (optional).
``MONGODB_URI``                   Replaces the above MongoDB variables, represents the MongoDB URI without the `mongodb://` prefix.
``OPAL_URL``                      Opal server URL (optional).
``OPAL_HOST``                     [Deprecated, use ``OPAL_URL``] Opal server host (optional).
``OPAL_PORT``                     [Deprecated, use ``OPAL_URL``] Opal server port, default is ``8443``.
``AGATE_URL``                     Agate server URL.
``AGATE_HOST``                    [Deprecated, use ``AGATE_URL``] Agate server host.
``AGATE_PORT``                    [Deprecated, use ``AGATE_URL``] Agate server port, default is ``8444``.
``ELASTICSEARCH_HOST``            Elasticserch server host.
================================= =========================================================================

Upgrade
-------

The upgrade procedures are handled by the application itself.

Debian Package Upgrade
~~~~~~~~~~~~~~~~~~~~~~

If you installed Mica via the Debian package, you may update it using the command:

.. code-block:: bash

  apt-get install mica

RPM Package Upgrade
~~~~~~~~~~~~~~~~~~~

If you installed Mica via the RPM package, you may update it using the command:

.. code-block:: bash

  yum install mica

Zip Distribution Upgrade
~~~~~~~~~~~~~~~~~~~~~~~~

Follow the Installation of Mica Zip distribution above but make sure you don't overwrite your mica-home directory.

Execution
---------

Server launch
~~~~~~~~~~~~~

**Service**

When Mica is installed through a Debian/RPM package, Mica server can be managed as a service.

Options for the Java Virtual Machine can be modified if Mica service needs more memory. To do this, modify the value of the environment variable ``JAVA_ARGS`` in the file **/etc/default/mica**.

Main actions on Mica service are: ``start``, ``stop``, ``status``, ``restart``. For more information about available actions on Mica service, type:

.. code-block:: bash

  service mica help

The Mica service log files are located in **/var/log/mica** directory.

**Manually**

The Mica server can be launched from the command line. The environment variable ``MICA_HOME`` needs to be setup before launching Mica manually.

==================== ======== ===========
Environment variable Required Description
==================== ======== ===========
``MICA_HOME``        yes      Path to the Mica "home" directory.
``JAVA_OPTS``        no       Options for the Java Virtual Machine. For example: `-Xmx4096m -Xms1024m`.
==================== ======== ===========

To change the defaults update:  ``bin/mica`` or ``bin/mica.bat``

Make sure Command Environment is setup and execute the command line (bin directory is in your execution PATH)):

.. code-block:: bash

  mica

Executing this command upgrades the Mica server and then launches it.

The Mica server log files are located in **MICA_HOME/logs** directory. If the logs directory does not exist, it will be created by Mica.

Usage
~~~~~

To access Mica with a web browser the following urls may be used (port numbers may be different depending on HTTP Server Configuration):

* http://localhost:8082 will provide a connection without encryption,
* https://localhost:8445 will provide a connection secured with ssl.

Troubleshooting
~~~~~~~~~~~~~~~

If you encounter an issue during the installation and you can't resolve it, please report it in our `Mica Issue Tracker <https://github.com/obiba/mica2/issues>`_.

Mica logs can be found in **/var/log/mica**. If the installation fails, always refer to this log when reporting an error.
