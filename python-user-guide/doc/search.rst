Search
======

This command allows to extract published information from the search API of Mica server. The output is in CSV format.

.. code-block:: bash

  mica search <CREDENTIALS> [OPTIONS] [EXTRA]

Options
-------

================================================= ====================================
Option                                            Description
================================================= ====================================
``--target TARGET, -t TARGET``                    The type of document to be listed: variable, dataset, study, population, dce (data collection event) or network.
``--query QUERY, -q QUERY``                       The search query, in RQL (Resource Query Language), that can be copied from the search page. If not specified, no filter is applied.
``--start START, -s START``                       Start search at document position (default is 0).
``--limit LIMIT, -lm LIMIT``                      Max number of documents to be listed (default is 100).
``--locale LOCALE, -lc LOCALE``                   The language of the labels (default is 'en').
``--out OUT, -o OUT``                             Output file path. If not specified, result is printed on the console.
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

Get 1000 published variables.

.. code-block:: bash

  mica search -mk https://mica-demo.obiba.org -u anonymous -p password --target variable --limit 1000

Get 1000 (max) published variables about Alcohol from cohort studies:

.. code-block:: bash

  mica search -mk https://mica-demo.obiba.org -u anonymous -p password --target variable --limit 1000 --query 'variable(in(Mlstr_area.Lifestyle_behaviours,(Alcohol))),study(in(Mica_study.methods-design,cohort_study))'

Get the cohort studies having collected data about Alcohol:

.. code-block:: bash

  mica search -mk https://mica-demo.obiba.org -u anonymous -p password --target study --query 'variable(in(Mlstr_area.Lifestyle_behaviours,(Alcohol))),study(in(Mica_study.methods-design,cohort_study))'
