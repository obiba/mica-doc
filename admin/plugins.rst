.. _plugins:

Plugins
=======

Repository
----------

Mica plugins available are:


.. list-table::
  :header-rows: 1

  * - Name
    - Type
    - Description
    - Depends
    - API
  * - `mica-search-es8 <https://github.com/obiba/mica-search-es8>`_
    - mica-search
    - | Mica search engine based on Elasticsearch 8.x (default).
      | Requires an external Elasticsearch 8.16.1 server or cluster.
    - Elasticsearch 8.16.1+ server
    - `Search Plugin API <https://github.com/obiba/mica2/tree/master/mica-spi/src/main/java/org/obiba/mica/spi/search>`_
  * - `mica-search-os2 <https://github.com/obiba/mica-search-os2>`_
    - mica-search
    - | Mica search engine based on OpenSearch 2.x.
      | Drop-in replacement for mica-search-es8. Requires an external OpenSearch 2.x server or cluster.
    - OpenSearch 2.x server
    - `Search Plugin API <https://github.com/obiba/mica2/tree/master/mica-spi/src/main/java/org/obiba/mica/spi/search>`_
  * - `mica-tables-spss <https://github.com/obiba/mica-tables-spss>`_
    - mica-tables
    - | Read dataset dictionaries from SPSS files.
      | Reference implementation of the `mica-tables` plugin type.
    - No dependencies
    - `Table Source Plugin API <https://github.com/obiba/mica2/tree/master/mica-spi/src/main/java/org/obiba/mica/spi/tables>`_
  * - `mica-taxonomies-files <https://github.com/obiba/mica-taxonomies-files>`_
    - mica-taxonomies
    - | Read taxonomies from local files or from a URL.
      | Reference implementation of the `mica-taxonomies` plugin type.
    - No dependencies
    - `Taxonomies Plugin API <https://github.com/obiba/mica2/tree/master/mica-spi/src/main/java/org/obiba/mica/spi/taxonomies>`_

Installation
------------

All plugins are to be deployed as a directory at the following location: **MICA_HOME/plugins**.

Configuration-based Installation (Recommended for Search Plugins)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For search plugins specifically, the recommended way to install them is by specifying them in Mica's configuration file **MICA_HOME/conf/application-prod.yml**. Upon startup, Mica will automatically download and install the specified search plugin if it is not already present.

**Search Plugin Configuration**

The default search plugin is ``mica-search-es8`` (Elasticsearch 8.x), which is automatically configured. You do not need to add any configuration for it.

To use OpenSearch instead, add the following to your **application-prod.yml**:

.. code-block:: yaml

  plugins:
    micaSearchPlugin: mica-search-os2

When configured this way, Mica will:

* Check if the specified plugin exists in **MICA_HOME/plugins**
* If not found, automatically download the latest compatible version from the `OBiBa Plugins Repository <http://obiba.org/pages/plugins/>`_
* Install it without requiring a server restart
* Load and activate the plugin

.. note::

  Because having a search engine is an absolute requirement, Mica server will check at startup that there is a plugin of type ``mica-search``. If the configured plugin cannot be downloaded (network issue), the Mica startup will fail and you will need to install the plugin manually.

Manual Installation
~~~~~~~~~~~~~~~~~~~

For all other plugin types (and as an alternative for search plugins), plugins can be installed manually by downloading and extracting them. The manual installation procedure should be performed as follow:

* Download the plugin of interest (zip file) from `OBiBa Plugins Repository <http://obiba.org/pages/plugins/>`_
* Unzip plugin package in **MICA_HOME/plugins** folder. Note that the plugin folder name does not matter, Mica will discover the plugin through the plugin.properties file that is expected to be found in the plugin folder
* Read the installation instructions (if any) of the plugin to identify the system dependencies or any other information
* Restart Mica

Configuration
-------------

The MICA_HOME/plugins folder contains all the Mica plugins that will be inspected at startup. A plugin is enabled if it has:

* A valid plugin.properties file,
* In case of several versions of the same plugin are installed, the latest one is selected.

The layout of the plugin folder is as follow:

.. code-block:: text

  MICA_HOME/
  └── plugins
      └── <plugin-folder>
          ├── lib
          │   └── <plugin-lib>.jar
          ├── LICENSE.txt
          ├── README.md
          ├── plugin.properties
          └── site.properties


Inside the plugin's folder, a properties file, plugin.properties, has two sections:

* The required properties that describe the plugin (name, type, version etc.)
* Some default properties required at runtime (path to third-party executables for instance).

Still in the plugin's folder, a site-specific properties file, site.properties, is to be used for defining the local configuration of the plugin. Note that this file will be copied when upgrading the plugin.

Switching Between Search Engines
---------------------------------

To switch between Elasticsearch and OpenSearch (or upgrade versions), follow these steps:

1. **Update the configuration** in **MICA_HOME/conf/application-prod.yml**:

   .. code-block:: yaml

     plugins:
       micaSearchPlugin: mica-search-os2  # or mica-search-es8

2. **Restart Mica** - The new plugin will be automatically downloaded and installed on startup.

3. **Re-index all data** - After switching search engines, you must re-publish all content to ensure the new search engine is properly populated with indexed documents.

.. note::

  Both ``mica-search-es8`` and ``mica-search-os2`` are compatible drop-in replacements. You can switch between them without data loss, but re-indexing is required.

Backups
-------

Mica assigns a data folder location to the plugin: **MICA_HOME/data/<plugin-name>** where plugin-name is the name defined in the plugin.properties file. This folder is then the one to be backed-up.
