General Administration
======================

Summary
~~~~~~~

The *Administration* menu is available to users with the role
``mica-administrator``. This menu gives access to server configuration and
status.

Configuration
~~~~~~~~~~~~~

Properties
----------

This section allows to define all general Mica configuration as
`Server Identification`, `Content`, `Data Source` and `Documents Sections`.

+-----------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
| Section               | Name                                   | Description                                                                                                        |
+=======================+========================================+====================================================================================================================+
| Server Identification | Name                                   | The name of the organization using this instance of Mica server. It will be used when sending notification emails. |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Public URL                             | Public base URL of the server. It will be used when sending notification emails.                                   |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Portal URL                             | Public base URL of the portal that will be used when sharing drafts.                                               |
+-----------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
| Content               | Languages                              | The languages in which the data pertaining to studies, networks and/or datasets will be entered in Mica.           |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Default Character Set                  | The character set with which the data will be entered in Mica e.g. , UTF-8, iso-8859-1, etc.                       |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Open access                            | If checked, access to published documents will be opened to everyone.                                              |
+-----------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|Data Source            | Primary Opal server Public URL         | This Opal server is the primary source of variables and data summaries. (see below)                                |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Participant Privacy Threshold          | No data summary will be returned from Opal if the number of participants is below this threshold.                  |
+-----------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|Sections               | Single study enabled                   | If checked, only one study is present in Mica                                                                      |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Network section enabled                | If checked, n etwork section is accessible.                                                                        |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Single network enabled                 | If checked, only one network is present in Mica.                                                                   |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Study datasets section enabled         | If checked, study datasets section is accessible.                                                                  |
|                       +----------------------------------------+--------------------------------------------------------------------------------------------------------------------+
|                       | Harmonization datasets section enabled | If checked, harmonization datasets section is accessible.                                                          |
+-----------------------+----------------------------------------+--------------------------------------------------------------------------------------------------------------------+

To edit a field, click on "Edit" and edit or modify the content the fields therein.

.. note::
  **Terminology**

  By the *primary* Opal server , we mean the Opal server on which Mica looks for data if no other Opal is specified in a study definition.
  Initially, the primary Opal server is set in Mica Configuration Files , but that entry is overridden by what you enter in here.


.. note::
  **Notifications**

  Mica requires Agate to send email notifications, which should be configured in Mica Configuration Files .


Roles
-----

Networks and Studies can have a list of members associated with them, which are
grouped in roles. The list of available roles can be edited and by default the
roles contact and investigator are present.

.. note::
  Removing a role from the system is permanent and affects all networks and studies in Mica, i.e. removing and role and recreating it
  again with the same identifier, won't recover the list of members for that role. However you can still recover the list of members if you
  revert to an old revision where the role was defined in the system.

Encryption keys
---------------

This section presents the tool related to the encryption–through HTTPS–of
transactions between Mica and its clients by means of a trusted or a
self-signed certificate.

.. note::
  In the instruction below, when you are told to cut and paste the content of the certificate, private key or of an *.pem file, make sure that
  you copy **all** content, that is **including** the lines containing " -----BEGIN XXXXXXXX-----" and " -----END XXXXXXXX----- ".


Create a (self-signed) certificate
**********************************

Go to **Administration > Encryption Keys**, click on the *Add Keys* drop-down
under the subsection title *Encryption Keys* and select *Create*

#. Click on the *Add Keys* drop-down under the subsection title Encryption
   Keys.
#. Select *Create*.
#. Fill in the form and click on *Save*.
#. Click on the *Download Certificate* button under the section title
   *Encryption Keys*.


Your certificate (\*.pem file) should automatically be downloaded on your
computer.


Import a certificate
********************

Go to **Administration > Encryption Keys**, click on the *Add Keys* drop-down
under the subsection title *Encryption Keys*"and select *Import*.
Here you may use (1) certificate and (2) private key that you created using
third party software e.g., OpenSSL. Note that:

#. Both the certificate and the private key must in PEM format i.e., you can
   read them and the file starts with a ----- BEGIN [...].
#. You must copy the certificate (or the content of the \*.crt file) in the
   public key box and the private key (or the content of the \*.key file) in
   the private key box.

In either case, you finish by clicking on *Save*. Finally, in order for the
changes to be taken in account you need to restart Mica with

.. code-block:: bash

  sudo service mica2 restart


Opals Credentials
-----------------

In order to establish a secured connection with an Opal server, you must
create a user in Opal along with the proper permissions, tell Mica to
communicate with that Opal using this user. To do so, there are various
scenarios available: you may connect to Opal by means of an SSL certificate or
via authentication, these methods are explained in the following three
sub-sections. Finally, the last section is about the permission of the user you
created in Opal.

.. note::
  In any scenario and for security reasons, never let Mica connect to an Opal as Opal's administrator. You must configure a specific user
  with appropriate reading permissions.

In **Administration > Opal Credentials** When you click on the drop-down menu
*Add Opal Credentials* under the subsection title "Opal Credentials", you are
presented with three choices, each corresponding to one of the next three
subsections.

Create a certificate
********************

With this first option, you can create a certificate directly in Mica with
which you can create a user in Opal. In order to proceed that way:

#. Select "Create" in the drop down menu *Add Opal Credential*.
#. Fill in the necessary information to create the certificate and click on
   "Save".
#. The Opal you described at point 2 should now appear in the list under the
   *Add Opal Credential* drop-down. At the end of the line for that Opal, click
   on the download button in the Action column to download the \*.pem file
   which is the certificate created taking in account the information you
   entered for that Opal and which will be use to add a user with certificate
   below.

   .. note::
     The URL for that Opal must begin with https:// if we are about to use a certificate as the authentication method.
#. Login Opal and go to **Administration > Data Access > Users and Groups**.
#. Click on the drop-down menu Add a User and select the option "Add a user
   with certificate...".
#. Fill in the info and paste in the content of the \*.pem file.
#. Save the information.

The user should now be in the list. You'll be done after restarting Mica with

.. code-block:: bash

  sudo service mica2 restart

Import a certificate
********************

In the case that you have already have a pair of keys, you may import it here
to secure the communication with Opal. You may select "Import" and:

#. Fill in the fields (Opal's URL, public and private keys) appropriately.

   .. note::
     Restrictions on how to fill the public key and private key fields using \*.pem , \*.crt and \*.key files are the same as in
     **Encryption Keys > Import a Certificate** above.
#. You can now proceed as in the instruction to Create a Certificate starting
   from point 4.

The user should now be in the list and you'll be done after restarting Mica
server.


Opal Credentials
****************

This last point is probably the easiest:

#. Go in **Opal Administration > Data Access > Users and Groups**
#. Click on the drop-down menu *Add a User* and select the option
   "Add a user with password...".
#. and you create a user filling the form.

With that user's credentials i.e. , username and password, you select the item
"Username" in the "Add Opal Credential" Menu. You fill in the form using Opal's
URL and the credentials of the user you created in Opal.

Last step: giving proper permissions to the Mica server
+++++++++++++++++++++++++++++++++++++++++++++++++++++++

You must now give the user you just created the proper permissions on tables in
Opal so that he can carry out his tasks. Here are the steps to do so:

.. note::
  Recommended permission is View dictionaries and summaries. You can grant such a permission by

  #. Going in Opal
  #. In **Project > <some specific project> > <some specific table of that project>**
  #. Click on the "Permissions" tab
  #. Click on the "Add Permission" button and on "Add user permission" in the drop-down menu
  #. In the pop-up window, add the name of the user to which you want to grant access and select "View dictionaries and
     summaries" permission
  #. Click on save
  #. Repeat steps 1-6 for any other table you want the user to have access to
