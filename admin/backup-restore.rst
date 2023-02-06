Backup and Restore
==================

The Mica system manages data both in the MongoDB database and in its local configuration/data files.

Mica
----

Some configuration and data are stored in local files (as defined by **MICA_HOME**) and must be backup explicitly:

* ``conf``, contains the application's configuration files, including instance specific templates and taxonomies.
* ``data``, contains the history of changes of the various documents and the local keystore.
* ``plugins``, contains the plugins binary libraries and specific configurations for the Mica server.
* ``work``, [optional] contains files that can be rebuilt such as the caches and the search index.

Note: in the Mica Docker container, **MICA_HOME** is ``/srv``.

Mica application includes its own internal upgrade mechanism, then when restoring the runtime environment with a more recent version of Mica, the upgrade process will be automatically triggered. Still, it is recommended to look at the release notes on `obiba.org <https://www.obiba.org>`_ to verify if there are any manual upgrade actions: if this is the case, restore the Mica server one version after the other.

MongoDB
-------

The MongoDB database contains the different Mica documents in there latest version. See official MongoDB documentation about the different methods for `MongoDB Backup/Restore <https://www.mongodb.com/docs/manual/core/backups/>`_.

Using Docker
------------

When Mica and MongoDB are managed by Docker, you may consider backup and restore containers volumes the Docker's way: see `Backup, Restore or Migrate Data Volumes - Docker documentation <https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes>`_.
