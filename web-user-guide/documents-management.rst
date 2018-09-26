Documents Management
====================

View, Edit, Publish
-------------------

Summary
~~~~~~~
This guide provides a description of the web interface for viewing and managing documents .


Operations
~~~~~~~~~~

*Edit*
******

Users with Editor or Reviewer permission can modify the properties of a document with status Draft. See :ref:`Permissions <documents-permissions>` and :doc:`../publication-flow` for
more information.

*Publish*
*********

Users with Reviewer permission can publish a document with status Under Review.

*Unpublish*
***********
Users with Reviewer permission can unpublish an already published document.

*Delete*
********
Users with Reviewer permission can delete a document with status Deleted.

*Status Change*
***************
Users with Editor or Reviewer permission can change the status of a document. See :doc:`../publication-flow` for more information.

Network Operations
~~~~~~~~~~~~~~~~~~

*Manage Contacts*
*****************
Users with Editor or Reviewer permission can manage (add/remove/edit) the list of contacts.


*Manage Investigators*
**********************
Users with Editor or Reviewer permission can manage the list of investigators.

*Manage Studies*
****************
Users with Editor or Reviewer permission can manage the list of studies.

*Manage Networks*
*****************
Users with Editor or Reviewer permission can manage the list of networks.


Individual Study Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Manage Contacts*
*****************
Users with Editor or Reviewer permission can manage (add/remove/edit) the list of contacts.
Manage InvestigatorsUsers with Editor or Reviewer permission can manage the list of investigators.

*Manage Populations*
********************
Users with Editor or Reviewer permission can manage the list of populations.

*Manage Data Collection Events*
*******************************
Users with Editor or Reviewer permission can manage the list of data collection events of a population.

Harmonization Study Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Manage Contacts*
*****************
Users with Editor or Reviewer permission can manage (add/remove/edit) the list of contacts.

*Manage Investigators*
**********************
Users with Editor or Reviewer permission can manage the list of investigators.

*Manage Populations*
********************
Users with Editor or Reviewer permission can manage the list of populations.

Collected Dataset Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Manage Study Table*
********************
Users with Editor or Reviewer permission can manage (add/remove/edit) the associated study table.

Harmonized Dataset Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Manage Study Tables*
*********************
Users with Editor or Reviewer permission can manage (add/remove/edit) the list of study tables. This operation only applies to harmonized
datasets having a collection of study tables.

Revisions
---------

Summary
~~~~~~~
Each time a document is edited a new history revision is added. The revisions are ordered from the most recent (current) to the oldest. If the
document is published, a star indicates which revision is currently online.

Operations
~~~~~~~~~~

*View*
******
Shows a read-only view of the network of the selected revision.

*Restore*
*********
Restores the selected revision by replacing the current document. This operation is tracked as a new revision.

Files
-----

Summary
~~~~~~~
Mica File System is a repository of files associated with all Mica domain documents . Similar to their associated documents, files have a
publication flow and history revisions. The publication flow can apply to one or a group of files. Folders can be used to organize and group files
into logical hierarchies but do not represent real data and therefore some operations such as searching do not apply to them.

Operations
~~~~~~~~~~

*Status Change*
***************
Refer to :doc:`../publication-flow` page for details.

*Rename*
********

Users with Editor or Reviewer permission on the containing document can rename a File and Folder. Names cannot contain the following
characters: ``$ / % #``.

*Copy*
******
Selected files and folders can be copied and pasted in other folders.

*Move*
******
Selected files and folders can cut and pasted in other folders.

File Specific Operations
~~~~~~~~~~~~~~~~~~~~~~~~

*Upload*
********
A file from the local file system can be uploaded into the selected folder in the Mica file system.

*Download*
**********
A file from Mica file system can be download into the local file system.

*Search*
********
Files can be searched in two ways:

- free-text where the keyword is matched against the file name , type or description .
- predefined searches listed in the search panel.

The predefined searches are all recursive in that the search query matches all files in all folder hierarchies. By toggling the Recursive button
a free-text search can be recursive or applied to the current folder.

*Type Edition*
**************
File types can be considered as tags and are a comma separated list of keywords associated with a file. They can be edited in the file detailpanel.

*Description Edition*
*********************
File description is localized and can be edited in the file detail panel.

Folder Specific Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Folder Creation*
*****************
Folders can added as a single folder ( baseline ) or in form of a path ( baseline/temp ).

Batch Operations
~~~~~~~~~~~~~~~~

Operations such as copy, move and publication flow can be performed in batch mode when they are applied to a group of selected files and/or
folders.

.. _files-permissions:

Permissions
~~~~~~~~~~~
Permissions are applied to the file's associated document and not on the file itself. The following table describes each role the corresponding
permitted operations:

.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Can only view and download a file.
  * - Editor
    - Can only edit and change the status of a file.
  * - Reviewer
    - All operations are permitted.

Comments
--------

Summary
~~~~~~~
All Mica domain :doc:`documents <../documents>` can be commented on by all users with the proper permissions. The content can be pure text or in `Markdown <https://guides.github.com/features/mastering-markdown/>`_ format.

Operations
~~~~~~~~~~

*Comment*
*********
The entered text (markdown) will be associated with the current document.

*Preview*
*********
A preview of the rendered markdown text is presented.

*Edit*
******
The comment text can be updated and previewed.

*Delete*
********
Deletes the selected comment.

Permissions
~~~~~~~~~~~
.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Can add, edit and delete own comment. Can view comments of others.
  * - Editor
    - Can add, edit and delete own comment. Can view comments of others.
  * - Reviewer
    - Can add, edit and delete own comment. Can view comments of others.
  * - Administrator
    - Can view, add, edit and delete all comments.

Permissions
-----------

Summary
~~~~~~~

Access to each publishable :doc:`documents <../documents>` can be controlled. There are actually two sets of privileges:

- **permissions** that apply to **draft** documents: only users having a permission on the draft document can see it,
- **accesses** that apply to **published** documents: by default published documents are open access, i.e. anyone (even a anonymous web
  portal visitor) can see the publications. This setting ``Open access`` can be changed in the :doc:`../web-user-guide/admin/system/general`.

Operations
~~~~~~~~~~

*Add Permission*
****************

Adding a permission gives a role to a named user or group of users on the draft document. The available roles are:

.. list-table::
  :widths: 25 75
  :header-rows: 1

  * - Role
    - Description
  * - Reader
    - Read-only access to the document in draft mode with its revisions and its associated files.
  * - Editor
    - Edit access to the document in draft mode with its revisions and its associated files. Publication or permanent deletion are not permitted.
  * - Reviewer
    - Full access to the document, including its publication, permanent deletion and permissions.

*Edit Permission*
*****************
selected permission role can be modified.

*Delete Permission*
*******************
Delete selected permission.

*Add Access*
************
This operation is only available if the ``Open access`` general setting has been disabled. Adding an access gives the right to see the published
document to a named user or group of users. As the :ref:`Files permissions <files-permissions>` on the associated files can be managed independently, when adding an access there is an option for applying same access to all the files (selected by default). Note that user (or group) name * (star) is an alias for *Anyone* (or *Any group* ).

*Delete Access*
***************
Delete selected access.
