Document Access
===============

This command is used to manage the access to a document. This access affects the **published** version and also applies to all associated files in their published version (unless the access to the files is explicitly excluded).

.. code-block:: bash

  mica access-<DOCUMENT> ID <CREDENTIALS> [OPTIONS] [EXTRAS]

Arguments
---------

============ ===========
Argument     Description
============ ===========
``DOCUMENT`` Mica document: ``network``, ``individual-study``, ``harmonization-study`` [1]_, ``collected-dataset``, ``harmonized-dataset`` [2]_ (see :doc:`../../documents`)
``ID``       Identifier of the document
============ ===========

Options
-------

================================================= ====================================
Option                                            Description
================================================= ====================================
``--add, -a``                                     Add an access
``--delete, -d``                                  Delete an access
``--no-file, -nf``                                Do not grant access to associated files
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

Add access for the user demouser on the network demo:

.. code-block:: bash

  mica access-network --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --add demo

Remove the above permission:

.. code-block:: bash

  mica access-network --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --delete demo

**Individual Study**

Add access for the user demouser on the individual study demo:

.. code-block:: bash

  mica access-individual-study --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --add demo

Remove the above permission:

.. code-block:: bash

  mica access-individual-study --mica http://mica-demo.obiba.org --user administrator --password password --type USER --subject demouser --delete demo

.. [1] ``harmonization-study`` refers to ``Harmonization Initiative``.
.. [2] ``harmonized-dataset`` refers to ``Harmonization Protocol``.