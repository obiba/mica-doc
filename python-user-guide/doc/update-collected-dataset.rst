Update Collected Dataset
========================

This command is for updating and/or publishing an existing Collected Dataset. The goal is to automate the linkage between a table in Opal with a collected dataset in Mica.

.. code-block:: bash

  mica update-collected-dataset ID <CREDENTIALS> [OPTIONS] [EXTRA]

Arguments
---------

============ ===========
Argument     Description
============ ===========
``ID``       The collected dataset identifier
============ ===========

Options
-------

================================================= ====================================
Option                                            Description
================================================= ====================================
``--study STUDY, -std STUDY``                     The associated study.
``--population POP, -pop POP``                    The population of the associated study.
``--dce DCE, -dce DCE``                           The data collection event in the population of the associated study.
``--project PROJECT, -prj PROJECT``               The associated Opal project.
``--table TABLE, -tbl TABLE``                     The table in the associated Opal project.
``--publish, -pu``                                Publish the collected dataset.
``--unpublish, -un``                              Unpublish the collected dataset.
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

Link a collected dataset in local Mica to a table in Opal.

.. code-block:: bash

  mica update-collected-dataset -u administrator -p password --project CLS --table Wave1 cls-wave1

Associate a collected dataset to a study data collection event in Mica.

.. code-block:: bash

  mica update-collected-dataset -u administrator -p password --study cls --population 1 --dce 1 cls-wave1

Publish a collected dataset.

.. code-block:: bash

  mica update-collected-dataset -u administrator -p password --publish cls-wave1
