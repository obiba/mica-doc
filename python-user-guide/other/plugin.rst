Plugin
======

Manage system plugins. See :ref:`plugins` documentation.

.. code-block:: bash

  mica plugin <CREDENTIALS> [OPTIONS] [EXTRAS]

Options
-------

======================================== ====================================
Option                                   Description
======================================== ====================================
``--list, -ls``                          List the installed plugins.
``--updates, -lu``                       List the installed plugins that can be updated.
``--available, -la``                     List the new plugins that could be installed.
``--install INSTALL, -i INSTALL``        Install a plugin by providing its name or name:version. If no version is specified, the latest version is installed. Requires system restart to be effective.
``--remove REMOVE, -rm REMOVE``          Remove a plugin by providing its name. Requires system restart to be effective.
``--reinstate REINSTATE, -ri REINSTATE`` Reinstate a plugin that was previously removed by providing its name.
``--fetch FETCH, -f FETCH``              Get the named plugin description.
``--configure CONFIGURE, -c CONFIGURE``  Configure the plugin site properties. Usually requires to restart the associated service to be effective.
``--status STATUS, -su STATUS``          Get the status of the service associated to the named plugin.
``--start START, -sa START``             Start the service associated to the named plugin.
``--stop STOP, -so STOP``                Stop the service associated to the named plugin.
======================================== ====================================

Credentials
-----------

Authentication is done by username/password credentials.

==================================== ====================================
Option                               Description
==================================== ====================================
``--mica MICA, -mk MICA``            Mica server base url.
``--user USER, -u USER``             User name. User with appropriate permissions is expected depending of the REST resource requested.
``--password PASSWORD, -p PASSWORD`` User password.
==================================== ====================================

Extras
------

================= =================
Option            Description
================= =================
``-h, --help``    Show the command help's message
``--verbose, -v`` Verbose output
================= =================

Example
-------

List the plugins that are currently installed:

.. code-block:: bash

  mica plugin -mk https://mica-demo.obiba.org -u administrator -p password --list --json
