Draft Network
=============

Manage operation on a single network in draft mode.

Get
---

.. http:get:: /draft/network/(string: id)?[key=(string:key)]

   Get a network in draft mode.

   This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role. Other users may provide an temporary access key.

   **Example requests**

   Using cURL

   .. sourcecode:: shell

      curl --user administrator:password https://mica-demo.obiba.org/ws/draft/network/bioshare-eu

   Using Python command line tool

   .. sourcecode:: shell

      mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method GET /draft/network/bioshare-eu --json

   **Example response**

   .. sourcecode:: http

     HTTP/1.1 200 OK
     Content-Type: application/json

     {
       "id": "bioshare-eu",
       "name": [
         {
           "lang": "en",
           "value": "Biobank Standardisation and Harmonisation for Research Excellence in the European Union"
         }
       ],
       "acronym": [
         {
           "lang": "en",
           "value": "BioSHaRE-EU"
         }
       ],
       "description": [
         {
           "lang": "en",
           "value": "<p>&nbsp;</p>\r\n\r\n<p>BioSHaRE is a consortium of European leading biobanks and international researchers from all domains of biobanking science. The overall aim of the project is to build upon tools and methods available to achieve solutions for researchers to use pooled data from different cohort and biobank studies. This, in order to obtain the very large sample sizes needed to investigate current questions in multifactorial diseases. This aim is achieved through the development of harmonization and standardization tools, implementation of these tools and demonstration of their applicability.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>As part of its mission, BioSHaRE will document information collected by participant biobanks and harmonize, integrate and co-analyse biobank-specific data to answer key research questions on chronic diseases.</p>\r\n"
         }
       ],
       "content": "{\"website\":\"http://www.bioshare.eu\",\"maelstromAuthorization\":{\"authorized\":false,\"authorizer\":null}}",
       "studyIds": [
         "finrisk-2007",
         "ship",
         "lifelines"
       ],
       "studySummaries": [],
       "logo": {
         "id": "9e000dc1-564b-4561-92f2-9484fb07054b",
         "fileName": "Bioshare.png",
         "type": "logo",
         "lang": "en",
         "size": 42718,
         "md5": "0c64fd3fb833e28abf8c97e6a8678615",
         "timestamps": {
           "created": "2021-04-12T06:38:04.502Z"
         }
       },
       "memberships": [],
       "permissions": {
         "view": true,
         "edit": true,
         "delete": true,
         "publish": true
       },
       "published": true,
       "timestamps": {
         "created": "2021-04-12T06:38:00.904Z",
         "lastUpdate": "2021-04-12T06:38:04.547Z"
       },
       "obiba.mica.EntityStateDto.state": {
         "publishedTag": "3",
         "revisionsAhead": 0,
         "revisionStatus": "DRAFT",
         "publicationDate": "2021-04-12T06:38:04.571Z",
         "publishedBy": "administrator",
         "publishedId": "57c9b73f7eec70a4ea471e96c741ddd4c41737e9",
         "permissions": {
           "view": true,
           "edit": true,
           "delete": true,
           "publish": true
         }
       }
     }

   :query string key: Optional temporary access key.

   :>json string id: The document unique identifier.
   :>json object acronym: The acronym (short name) of the document, as an object that describes a localized string.
   :>json object name: The name of the document, as an object that describes a localized string.
   :>json object description: The description of the document, as an object that describes a localized string.
   :>json string content: The document's model content, as a stringified JSON object.
   :>json object logo: The associated logo file.
   :>json strings studyIds: The identifiers of the studies that are part of the network.
   :>json array studySummaries: The list of the associated studies' summary object.
   :>json array memberships: The list of the associated members object.
   :>json object permissions: The different actions that can be performed on this document.
   :>json boolean published: Whether the document is published.
   :>json object timestamps: The date times (format ISO-8601) at which the document was created and updated.
   :>json object obiba.mica.EntityStateDto.state: The publication state of the document.

   :reqheader Authorization: As described in the :ref:`rest-auth` section
   :reqheader Accept: ``*/*``
   :resheader Content-Type: ``application/json``
   :statuscode 200: The document.
   :statuscode 401: Unauthorized access.
   :statuscode 500: Server error.

Upate
-----

.. http:put:: /draft/network/(string: id)?[comment=(string:comment)]

   Update a network.

   This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role.

   **Example requests**

   Using cURL

   .. sourcecode:: shell

      curl --user administrator:password -X PUT -H "Content-Type: application/json" --data-binary "@network.json" https://mica-demo.obiba.org/ws/draft/network/bioshare-eu

   Using Python command line tool

   .. sourcecode:: shell

      mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT --accept "application/json" /draft/network/bioshare-eu < network.json

   :query string comment: Optional revision comment.

   :reqheader Authorization: As described in the :ref:`rest-auth` section
   :reqheader Accept: ``*/*``
   :resheader Content-Type: ``application/json``
   :statuscode 204: Successful update of the document.
   :statuscode 401: Unauthorized access.
   :statuscode 404: The document does not exist.
   :statuscode 500: Server error.

Get Model
---------

.. http:get:: /draft/network/(string: id)/model

  Get the model part of a network.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/model

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method GET /draft/network/bioshare-eu/model --json

  **Example response**

  .. sourcecode:: http

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "website": "http://www.bioshare.eu",
      "maelstromAuthorization": {
        "authorized": false,
        "authorizer": null
      }
    }

  :reqheader Authorization: As described in the :ref:`rest-auth` section
  :reqheader Accept: ``*/*``
  :resheader Content-Type: ``application/json``
  :statuscode 200: The document's model content.
  :statuscode 401: Unauthorized access.
  :statuscode 500: Server error.

Update Model
------------

.. http:put:: /draft/network/(string: id)/model

   Update the model part of a network.

   This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role.

   **Example requests**

   Using cURL

   .. sourcecode:: shell

      curl --user administrator:password -X PUT -H "Content-Type: application/json" --data-binary "@model.json" https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/model

   Using Python command line tool

   .. sourcecode:: shell

      mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT --accept "application/json" /draft/network/bioshare-eu/model < model.json

Index
-----

.. http:put:: /draft/network/(string: id)/_index

  Rebuild both draft and published indices for a network.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X PUT https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/_index

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT /draft/network/bioshare-eu/_index --json

Update Status
-------------

.. http:put:: /draft/network/(string: id)/_status?value=(string:status)

  Update the edition status of a network: ``DRAFT`` when the document is being edited, ``UNDER_REVIEW`` when the document is to be reviewed for publication, ``DELETED`` when the document is marked for permanent removal.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X PUT https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/_publish

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT /draft/network/bioshare-eu/_publish --json

  :query string status: The edition status which can be one of ``DRAFT``, ``UNDER_REVIEW``, ``DELETED``.

Publish
-------

.. http:put:: /draft/network/(string: id)/_publish

  Publish a network.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X PUT https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/_publish

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT /draft/network/bioshare-eu/_publish --json

Unpublish
---------

.. http:delete:: /draft/network/(string: id)/_publish

  Unpublish a network.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X DELETE https://mica-demo.obiba.org/ws/draft/network/bioshare-eu/_publish

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method DELETE /draft/network/bioshare-eu/_publish --json

Remove
------

.. http:delete:: /draft/network/(string: id)

  Remove a network (unpublish it if necessary).

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X DELETE https://mica-demo.obiba.org/ws/draft/network/bioshare-eu

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method DELETE /draft/network/bioshare-eu --json
