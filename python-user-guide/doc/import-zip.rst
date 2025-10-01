Import Zip
==========

This command allows to import a zip-archived file produced by Mica. The result of the import will be the creation or the update of the packaged documents and their attachments.

.. code-block:: bash

  mica import-zip  <CREDENTIALS> [EXTRA] PATH

A very useful usage of this command is when a series of associated documents should be imported together. For instance, this command permits to import an individual-study, its network and all its associated collected-datasets. Here is how the documents should be organized into sub-folders and archived such that the import command recognizes it as a valid input:

.. code-block:: text

  - study
    - individual-study-name
      - network-something.json
      - collected-dataset1.json
      - collected-dataset2.json
      - collected-dataset3.json
      - individual-study-name.json
      - attachments
        - attachment-id1
        - attachment-id2

.. note::

  attachment-id is the ID used in the document attachments list in the JSON file, this should not be the filename.

.. warning::

  Use this command with special care to prevent overriding existing documents and breaking associations.

Arguments
---------

============ ===========
Argument     Description
============ ===========
``PATH``     Path to the zip file or directory that contains zip files to be imported.
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

.. include:: ../common-credentials.rst

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

Import the file import.zip in Mica server running on localhost with user administrator.

.. code-block:: bash

  mica import-zip -mk https://localhost:8445 -u administrator -p password  /path/to/the/file/import.zip

Import all the zip files located in a directory with user editor.

.. code-block:: bash

  mica import-zip -mk https://localhost:8445 -u editor -p password  /path/to/the/zips/directory
