REST API Introduction
=====================

The REST API allows to do all necessary operations for managing :doc:`../documents` and handling :doc:`../publication-flow`. As Mica manages both ``draft`` and ``published`` states of each document, there are distinct REST entry points, requiring different level of permissions.

.. _rest-auth:

Authentication
--------------

Mica supports `Basic authentication <https://tools.ietf.org/html/rfc7617>`_, which consists of a HTTP request's header field in the form of ``Authorization: Basic <credentials>``, where credentials is the Base64 encoding of user's (or application's) ID and password joined by a single colon ``:``.

Using cURL, it is as simple as providing the `--user <https://curl.se/docs/manpage.html#-u>`_ option:

.. sourcecode:: shell

   curl --user <id>:<password> [...]

Authorization
-------------

Authorizations are role based. The built-in roles are:

============================ ===============
Role                         Description
============================ ===============
``mica-administrator``       Can edit/publish data and change system configuration.
``mica-reviewer``            Can edit draft data and publish them.
``mica-editor``              Can edit data draft data.
``mica-data-access-officer`` Can manage data access requests.
``mica-user``                Can view published data.
============================ ===============

Clients
-------

Usage examples provided are based on `cURL <https://curl.se/>`_, a command line client, the Python command line tool (see :doc:`../python-user-guide/index`) and the R package `micar <https://github.com/obiba/micar>`_ (published content only).
