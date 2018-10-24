.. Mica documentation master file, created by
   sphinx-quickstart on Mon Apr  9 11:43:58 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

OBiBa Mica Documentation
=========================

Developped to meet the needs of individual epidemiological studies and study consortia, the `OBiBa <http://obiba.org/>`_ software stack (Opal, Mica etc.) provides an open-source solution for data management, analysis, harmonization and dissemination. `Opal <http://www.obiba.org/pages/products/opal/>`_, OBiBa's core data warehouse application, provides all the necessary tools to import, manage, describe and transform data. The `Mica <http://www.obiba.org/pages/products/mica/>`_application is used to build searchable web portals disseminating study and variable metadata, as well as research activities of both individual studies and study consortia. Content defined in Mica is published on a personalized web portal using `Drupal <https://www.drupal.org/>`_, a popular open-source content management system used by websites worldwide. Mica works conjointly with `Agate <http://www.obiba.org/pages/products/agate/>`_, `OBiBa <http://obiba.org/>`_'s  authentication server which centralizes user related services such as profile management and email notification systems.

The OBiBa software stack is a core component of the `Maelstrom Research <http://www.maelstrom-research.org/>`_ program. For background information on Opal and Mica and their use for epidemiological research, see:
`Doiron, D., Marcon, Y., Fortier, I., Burton, P., & Ferretti, V. (2017). Software application profile: opal and mica: open-source software solutions for epidemiological data management, harmonization and dissemination. International journal of epidemiology <https://academic.oup.com/ije/article/46/5/1372/4102813>>`_.


.. warning::

  Mica documentation is in the process of being rewritten. See also the :download:`Mica Documentation Archive <archive/MICADOC.pdf>`

.. toctree::
   :maxdepth: 1

   introduction
   documents
   publication-flow

.. toctree::
   :maxdepth: 1
   :caption: Administrator Guide

   admin/installation
   admin/configuration
   admin/plugins

.. toctree::
   :maxdepth: 2
   :caption: Web User Guide

   web-user-guide/index
   web-user-guide/documents-management
   web-user-guide/admin/index
   web-user-guide/data-access-request

.. toctree::
   :maxdepth: 1
   :caption: Drupal User Guide

   drupal-user-guide/index
   drupal-user-guide/configuration

.. toctree::
   :maxdepth: 1
   :caption: Python User Guide

   python-user-guide/index
   python-user-guide/authz
   python-user-guide/doc
   python-user-guide/other

.. toctree::
   :maxdepth: 1
   :caption: R User Guide

   r-user-guide/index
