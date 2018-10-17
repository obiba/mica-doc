Data Access Request Administration
##################################

Definitions
-----------

Application Form
****************

The web application form can be specified both in terms of schema and UI
definition. See *Angular Schema Form* `documentation <https://github.com/json-schema-form/angular-schema-form/blob/master/docs/index.md>`_ for more details.

The *Preview* and *Model* tabs are informational only and can be used to
preview the rendered form and the input data that will be collected.

Properties
**********

.. list-table::
  :widths: 25 75

  * - Title Field
    - Specifies the field value to be used as the document's title.
  * - Summary Field
    - Specifies the field value to be used as the document's summary.
  * - Enable Amendments
    - Enables the capability of requesting amendments to an approved data access request. This option is disabled by default.

Form Download
*************

The data collected in the form can be downloaded in the following formats:

*PDF Template*, this option requires uploading a template (one for each
configured languages) compatible with the custom *Angular Schema Form* model.

*Printable Page*, this option renders the form as a printable page in the browser so the user can either save the form as a PDF or send it to a printer.

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


.. list-table::
  :widths: 25 75

  * - **Apply the same permission to associated action logs**
    - This permission grants viewing the action logs.
  * - **Give access to the private comments section**
    - This permission grants viewing and editing of private comments.

Customizing Reports
-------------------

To customize the data access request and amendment reports these files must be created:

- ``/etc/mica2/config/data-access-form/export-csv-schema.json``
- ``/etc/mica2/config/data-access-amendment-form/export-csv-schema.json``

To get the current report configuration files execute these queries in a MongoDB client of your choice:

.. code-block:: bash

  - db.getCollection('dataAccessForm').find({}, {csvExportFormat: 1, _id: 0})
  - db.getCollection('dataAccessAmendmentForm').find({}, {csvExportFormat: 1, _id: 0})

Once you have obtained these files you can go agead and modify the content.

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

.. note::

  Fields prefixed by *generic.* are internal and not part of the data access request or amendment form schemas.


TODO: give an example...

Importing Legacy Data Access Requests
-------------------------------------

Before importing legacy data access requests the following pre-conditions must be satisfied:

- The data access request form schema must be already defined and match the legacy form model. A mismatch will cause data loss upon saving as the legacy form model cannot be mapped to the form schema.
- To prevent legacy data access form IDs to be re-used, an *ID exclusion file* must be created and placed under Mica config folder.

Importing Legacy Forms
**********************

The process of importing legacy data access requests into Mica must be done manually and preferably via the Mica website UI as it enforces field validations defined in the form schema and definition. The following steps must be followed **before** `Excluding Legacy IDs`_:

- create a new data access request
- fill the new form based on the information in your legacy document
- save the form
- repeat these steps until all legacy data access requests are added
- proceed with excluding IDs as described above
- restart Mica

Use :doc:`Mica Python Client </python-user-guide/other/rest>` to batch import legacy data access requests. The disadvantage of this method is the lack of any data entry validation and any JSON format error block the process. Choose this method if you are comfortable using a terminal and the python client. 


- create a new data access request and fill as many field as possible so your template document be complete
- get the new data access document vi Mica Python Client:

  .. code-block:: bash

    mica rest "/data-access-request/<REUQETS-ID>" -m GET -mk <MICA-SERVER-IP:PORT> -u <USER> -p <PASSWORD> -a application/json > template-dar.json


TODO: complete steps

Excluding Legacy IDs
********************

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

