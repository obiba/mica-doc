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
~~~~~~~~~~~~~~~~~~~~~
Under the **Predefined Acti~~~~~~~~~~~~~~~~~~~~~on Names** one can manage the of predefined actions
to be used in a data access~~~~~~~~~~~~~~~~~~~~~ request's history. This only defines the action
key. To translate them: ``d~~~~~~~~~~~~~~~~~~~~~ata-access-request.action-log.config.label.<action-key>``

Amendment Form
**************

Same as the *Application Form*, it uses *Angular Schema Form* to define
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

Permissions
***********

.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Can view all data access request and their amendments.

