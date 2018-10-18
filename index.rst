.. Mica documentation master file, created by
   sphinx-quickstart on Mon Apr  9 11:43:58 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

OBiBa Mica Documentation
=========================

Targeted at individual studies and study consortia, `OBiBa <http://obiba.org/>`_ software stack (Opal, Mica etc.) provides a software solution for epidemiological data management, analysis and publication. While `Opal <http://www.obiba.org/pages/products/opal/>`_, the core data warehouse application, provides all the necessary tools to import, transform and describe data, `Mica <http://www.obiba.org/pages/products/mica/>`_ provides everything needed to build personalized web data portals and publish content of research activities of both studies and consortia. Based on the content defined in Mica, `Drupal <https://www.drupal.org/>`_ is the preferred platform to build your personalized web portal.
Mica is to be used with `Agate <http://www.obiba.org/pages/products/agate/>`_, the `OBiBa <http://obiba.org/>`_'s central authentication server which centralizes user related services such as profile management, and a notification system using emails.

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
