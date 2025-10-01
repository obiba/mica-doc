File Management
===============

This command is for advanced users wanting to directly access to the File System API of Mica server.

.. code-block:: bash

  mica file PATH <CREDENTIALS> [OPTIONS] [EXTRA]

Arguments
---------

======== ===========
Argument Description
======== ===========
``PATH`` Path of file or folder in the file system, for instance: /study/foo
======== ===========

Options
-------

================================================= ====================================
Option                                            Description
================================================= ====================================
``--download, -dl``                               Download file.
``--upload UPLOAD, -up UPLOAD``                   Upload a local file to a folder in Mica file system, requires the folder to be in DRAFT state. If the destination folder does not exist it will be created.
``--create CREATE, -c CREATE``                    Create a folder at a specific location, requires the file to be in DRAFT state.
``--copy COPY, -cp COPY``                         Copy a file to the specified destination folder.
``--move MOVE, -mv MOVE``                         Move a file to the specified destination folder, requires the file to be in DRAFT state.
``--delete, -d``                                  Delete a file on Mica file system, requires the file to be in DELETED state.
``--name NAME, -n NAME``                          Rename a file, requires the file to be in DRAFT state.
``--status STATUS, -st STATUS``                   Change file status.
``--publish, -pu``                                Publish a file, requires the file to be in UNDER_REVIEW state.
``--unpublish, -un``                              Unpublish a file.
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

Get the JSON representation of file /study/foo/bar.pdf

.. code-block:: bash

  mica file /study/foo/bar.pdf -mk https://mica-demo.obiba.org -u administrator -p password -j

Download file /study/foo/bar.pdf

.. code-block:: bash

  mica file /study/foo/bar.pdf -mk https://mica-demo.obiba.org -u administrator -p password --download > bar.pdf

Upload a file to /study/foo

.. code-block:: bash

  mica file /study/foo -mk https://mica-demo.obiba.org -u administrator -p password --upload ~/bar.pdf

Change status and publish file /study/foo/bar.pdf

.. code-block:: bash

  mica file /study/foo/bar.pdf -mk https://mica-demo.obiba.org -u administrator -p password --status UNDER_REVIEW
  mica file /study/foo/bar.pdf -mk https://mica-demo.obiba.org -u administrator -p password --publish
