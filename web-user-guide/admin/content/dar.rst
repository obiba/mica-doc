Data Access Request Administration
==================================

Application Form
----------------

The web application form can be specified both in terms of schema and UI
definition. See *Schema Form* `documentation <https://github.com/json-schema-form/angular-schema-form/blob/master/docs/index.md>`_ for more details.

The *Preview* and *Model* tabs are informational only and can be used to
preview the rendered form and the input data that will be collected.

Properties
~~~~~~~~~~

.. list-table::
  :widths: 25 75

  * - Title Field
    - Specifies the field value to be used as the document's title.
  * - Summary Field
    - Specifies the field value to be used as the document's summary.
  * - Enable Amendments
    - Enables the capability of requesting amendments to an approved data access request. This option is disabled by default.

PDF Download
~~~~~~~~~~~~

The data collected in the form can be downloaded in the following formats:

**PDF Template**, this option requires uploading a template (one for each
configured languages) compatible with the custom *Schema Form* model.

**Printable Page**, this option renders the form as a printable page in the browser so the user can either save the form as a PDF or send it to a printer.

.. _dar-predefined-action-logs:

Predefined Action Names
~~~~~~~~~~~~~~~~~~~~~~~

*Predefined Action Names* are common actions that *data access officers* perform while processing the data access requests. These actions can then be logged in the data access request :ref:`history section <dar-history>`.

The action names defined here are in fact translation keys that must be created in :doc:`/web-user-guide/admin/system/translation`.

The following steps demonstrate how these names are added:

- add the action names without any spaces or any of these invalid characters: ``. ~ !``
- save the configuration
- add the action keys in :doc:`/web-user-guide/admin/system/translation`

.. note::

  An action key is the action name preceded by its translation path: ``data-access-request.action-log.config.label.<action-name>``.


Feasibility Form
----------------

Same as the *Application Form*, it uses *Schema Form* to define the schema and UI definition.

Amendment Form
--------------

Same as the *Application Form*, it uses *Schema Form* to define the schema and UI definition.

Under the **Properties** section one can specify the document's *Title Field* and it's *Summary Field* as defined in the custom *Schema Form*.

Notifications
-------------

Email notifications can be sent, if configured, to applicant and data access
officers when an event happens on the data access request. Events can be:
status changes or comment additions or updates.

These configurations apply to both the data access requests and their
amendments.

Settings
--------

The data access request goes through several steps. Some minimum settings can
be applied to control this workflow, i.e. enabling the *review* status and
making the accepted and rejected status final. Also the pattern to generate
identifiers for data access requests can be configured.

These configurations apply to both the data access requests and their
amendments.

.. _dar-permissions:

Permissions
-----------

.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Can view all data access request and their amendments.

There are also two additional (sub) permissions that can be granted to a *Reader*:


.. list-table::
  :widths: 25 75

  * - **Apply the same permission to associated action logs**
    - This permission grants viewing the action logs.
  * - **Give access to the private comments section**
    - This permission grants viewing and editing of private comments.

Customizing Reports
-------------------

.. warning::
  This is an **experimental** functionality, make sure to backup your database beforehand.



Follow these steps to customize the data access request and amendment reports:

- stop Mica server
- get the current report configuration files as templates:

  .. code-block:: bash

    mongo mica --eval 'db.dataAccessForm.find({}, {csvExportFormat: 1, _id: 0})'
    mongo mica --eval 'db.dataAccessAmendmentForm.find({}, {csvExportFormat: 1, _id: 0})'

- make sure ``/etc/mica2/config/data-access-form/`` and ``/etc/mica2/config/data-access-amendment-form/``  directories exist
- copy your templates ``export-csv-schema.json`` under the previously created directories

- clear the `csvExportFormat` field in dataAccessForm and dataAccessAmendmentForm:

  .. code-block:: bash

    mongo mica --eval 'db.dataAccessForm.update({_id: "default"}, {$set: {csvExportFormat: ""}})'
    mongo mica --eval 'db.dataAccessAmendmentForm.update({_id: "default"}, {$set: {csvExportFormat: ""}})'

- edit your templates:

  - ``/etc/mica2/config/data-access-form/export-csv-schema.json``
  - ``/etc/mica2/config/data-access-amendment-form/export-csv-schema.json``

- to make sure that these files can be accessed by Mica server run the following shell command:

  .. code-block:: bash

    ``sudo chown -R mica:adm /etc/mica2``

- start Mica server

The snippet below shows a report configuration file:

.. code-block:: json

  {
    "headers": {
      "title": {
        "en": "<Organization> Access Office",
        "fr": "<Organisation> Bureau d'accès"
      },
      "subtitle": {
        "en": "Access Requests Report",
        "fr": "Rapport sur les demandes d'accès"
      },

    },
    "table": {
      "generic.accessRequestId": {
        "en": "ACCESS REQUEST ID",
        "fr": "ID DE LA DEMANDE D'ACCÈS"
      },
      "projectTitle": {
        "en": "TITLE",
        "fr": "TITRE"
      },

    }
  }


Where fields under ``headers`` are fixed (built-in) but their translations can
be modified. Fields under ``table`` can be fully customized (removed, re-ordered, added, etc).

The ``table`` properties can be inferred from the document's schema. They are
the fields found in the model.

.. note::

  Properties prefixed by *generic.* are internal and not part of the data access request or amendment form schemas and are considered `built-ins`.
  They can be removed, however.
