Indexing
========

Summary
-------

The `search engine <https://www.elastic.co/elasticsearch/>`_ is based on indexed documents. Each index can be rebuilt without affecting the history of changes and the publication status of the documents.

Definitions
-----------

.. list-table::
  :widths: 24 75
  :header-rows: 1

  * - Type
    - Description
  * - **All**
    - Indices about any type of document: network, study, dataset (and associated variables), file, person.
  * - **Networks**
    - Index that allows to search for networks.
  * - **Individual Studies / Harmonization Initiatives**
    - Index that allows to search for individual studies and harmonization initiatives.
  * - **Collected Datasets / Harmonization Protocols**
    - Index that allows to search for collected datasets and harmonization protocols and their associated variables.
  * - **Collected Datasets**
    - Index that allows to search for collected datasets and associated variables.
  * - **Harmonization Protocols**
    - Index that allows to search for harmonization protocols and associated variables.
  * - **Persons**
    - Index that allows to search persons who can be associated to studies, initiatives or networks.
  * - **Files**
    - Index that allows to search files associated with all Mica documents.
  * - **Projects**
    - Index that allows to search projects.
  * - **Taxonomies**
    - Index that allows to search for taxonomy terms (i.e. the search criteria).

.. note::
  In order to keep the inferred annotations of individual studies up-to-date, the order of indexing must be as follows:

  #. Index the collected datasets which will index their associated vatiables as well.

  #. Index the individual studies to update the inferred variable annotations.
