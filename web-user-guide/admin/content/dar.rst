Data Access Request Administration
##################################

Summary
-------

The *Administration* menu is available to users with the role
``mica-administrator``. This menu gives access to server configuration and
status.

Definitions
-----------

Application Form
****************

The web application form can be specified both in terms of schema and UI
definition. See *Angular Schema Form* `documentation <https://github.com/json-schema-form/angular-schema-form/blob/master/docs/index.md>`_ for more details.

The *Preview* and *Model* tabs are informational only and can be used to
preview the rendered form and the input data that will be collected.

Under the **Properties** section one can specify the document's *Title Field*
and it's *Summary Field* as defined in the custom *Angular Schema Form*.

Under the **PDF Download** there are two choices:
  * PDF Template
  * Printable Page

Selecting the `PDF Template` option, one has to upload a template (one for each
configured languages) compatible with the custum *Angular Schema Form* model.

The `Printable Page` option makes use of the browser's print capability where
one may choose to either print the document to PDF or simply print.

.. _dar-predefined-action-logs:

Under the **Predefined Action Names** one can manage the name of predefined actions
to be used in a data access request's history. This name is in fact the action
translation key as in the example below:
``data-access-request.action-log.config.label.<action-key>``

  Make sure to precede your key with ``data-access-request.action-log.config.label``.

Amendment Form
**************

Same as the *Application Form*, it uses *Angular Schema Form* to define the
schema and UI definition.

Under the **Properties** section one can specify the document's *Title Field*
and it's *Summary Field* as defined in the custom *Angular Schema Form*.

Notifications
*************

Email notifications can be sent, if configured, to applicant and data access
officers when an event happens on the data access request. Events can be:
status changes or comment additions or updates.

These configurations apply to both the data access requests and their
amendments.

Settings
********

The data access request goes through several steps. Some minimum settings can
be applied to control this workflow, i.e. enabling the *review* status and
making the accepted and rejected status final. Also the pattern to generate
identifiers for data access requests can be configured.

These configurations apply to both the data access requests and their
amendments.

.. _dar-permissions:

Permissions
***********

.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Can view all data access request and their amendments.

There are also two additional (sub) permissions that can be granted to a *Reader*:

- Apply the same permission to associated action logs
- Give access to the private comments section.


Customizing Reports
-------------------

To customize the data access request and amendment reports these files must be created:

- ``/etc/mica2/config/data-access-form/export-csv-schema.json``
- ``/etc/mica2/config/data-access-amendment-form/export-csv-schema.json``

Your Mica administrator can get the default report configuration files as a starting point. Below are the required MongoDB queries needed:

.. code-block:: bash

  - db.getCollection('dataAccessForm').find({}, {csvExportFormat: 1, _id: 0})
  - db.getCollection('dataAccessAmendmentForm').find({}, {csvExportFormat: 1, _id: 0})

Once you have the default configuration JSON files, you can add, remove or change the headers.

The snippet below shows a report configuration file:

.. code-block:: json

  {
    "headers": {
      "title": {
        "en": "<Organisation> Access Office",
        "fr": "<Organisation> Access Office"
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

.. note::

  Fields prefixed by *generic.* are internal and not part of data access request or amendment forms.


Pre-Defined Data Access Request IDs
-----------------------------------

To exclude a pre-defined list of data access request IDs the following steps must be followed:

- create the file ``data-access-request-exclusion-ids-list.yml`` under the folder ``/etc/mica2/config/data-access-form/``.
- add each ID on a separate line as the example below.
- run the command below to make sure the folder and the file have the proper permission:

  .. code-block:: bash

    sudo chown -R mica:adm /etc/mica2

- restart Mica server so the changes take effect.

Here is an example of the exclusion file:

.. code-block:: yaml

  exclusions:
    - "LEGACEY_ID_001"
    - "LEGACEY_ID_002"
    - "LEGACEY_ID_003"

