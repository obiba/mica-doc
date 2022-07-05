Document Permission
===================

This command is used to manage the permissions of a document. These permissions affects the **draft** version and apply to all associated files in their draft version.

.. code-block:: bash

  mica perm-<DOCUMENT> ID <CREDENTIALS> [OPTIONS] [EXTRAS]

Arguments
---------

============ ===========
Argument     Description
============ ===========
``DOCUMENT`` Mica document: ``network``, ``individual-study``, ``harmonization-study`` [1]_, ``collected-dataset``, ``harmonized-dataset``  [2]_ (see :doc:`../../documents`)
``ID``       Identifier of the document
============ ===========

Options
-------

================================================= ====================================
Option                                            Description
================================================= ====================================
``--add, -a``                                     Add a permission
``--delete, -d``                                  Delete a permission
``--permission, -pe``                             Permission to apply: ``reader``, ``editor`` or ``reviewer``
``--subject, -s``                                 Subject name to which the access will be granted
``--type TYPE, -ty TYPE``                         Subject type: ``user`` or ``group``
================================================= ====================================

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

**Network**

Add reader permission for the user demouser on the network demo:

.. code-block:: bash

  mica perm-network --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --add --permission reader demo

Remove the above permission:

.. code-block:: bash

  mica perm-network --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --delete demo

**Individual Study**

Add reader permission for the user demouser on the individual study demo:

.. code-block:: bash

  mica perm-individual-study --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --add --permission reader demo

Remove the above permission:

.. code-block:: bash

  mica perm-individual-study --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --delete demo

.. [1] ``harmonization-study`` refers to ``Harmonization Initiative``.
.. [2] ``harmonized-dataset`` refers to ``Harmonization Protocol``.