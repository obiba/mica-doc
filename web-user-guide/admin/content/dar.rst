Data Access Request Administration
==================================

Summary
-------

The *Administration* menu is available to users with the role
``mica-administrator``. This menu gives access to server configuration and
status.

Definitions
-----------

Application Form
****************

The web application form can be specified both in terms of data structure
( Schema ) and data display and validation ( Definition ). See form `schemaform documentation <https://github.com/json-schema-form/angular-schema-form/blob/master/docs/index.md>`_ for more details.

The *Preview* and *Model* tabs are informational only and can be used to
preview the rendered form and the input data that will be collected.

Notifications
*************

Email notifications can be sent, if configured, to applicant and data access
officers when an event happens on the data access request. Events can be:
status changes or comment additions or updates.

Settings
********

The data access request goes through several steps. Some minimum settings can
be applied to control this workflow, i.e. enabling the *review* stat us and
making the accepted and rejected status final. Also the pattern to generate
identifiers for data access requests can be configured.
