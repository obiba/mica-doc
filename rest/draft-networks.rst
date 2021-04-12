Draft Networks
==============

Manage operations on the list of networks in draft mode.

List
----

.. http:get:: /draft/networks

   List a summary of the networks in draft mode.

   This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role, otherwise an empty list is returned.

   **Example requests**

   Using cURL

   .. sourcecode:: shell

      curl --user administrator:password https://mica-demo.obiba.org/ws/draft/networks

   Using Python command line tool

   .. sourcecode:: shell

      mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method GET /draft/networks --json

   **Example response**

   .. sourcecode:: http

      HTTP/1.1 200 OK
      Content-Type: application/json

      [
        {
          "id": "bioshare-eu",
          "acronym": [
            {
              "lang": "en",
              "value": "BioSHaRE-EU"
            }
          ],
          "name": [
            {
              "lang": "en",
              "value": "Biobank Standardisation and Harmonisation for Research Excellence in the European Union"
            }
          ],
          "studyIds": [
            "finrisk-2007",
            "ship",
            "lifelines"
          ],
          "permissions": {
            "delete": true,
            "edit": true,
            "publish": true,
            "view": true
          },
          "published": true,
          "timestamps": {
            "created": "2021-04-12T06:38:00.904Z",
            "lastUpdate": "2021-04-12T06:38:04.547Z"
          },
          "obiba.mica.EntityStateDto.networkSummaryState": {
            "permissions": {
              "delete": true,
              "edit": true,
              "publish": true,
              "view": true
            },
            "publicationDate": "2021-04-12T06:38:04.571Z",
            "publishedBy": "administrator",
            "publishedId": "57c9b73f7eec70a4ea471e96c741ddd4c41737e9",
            "publishedTag": "3",
            "revisionStatus": "DRAFT",
            "revisionsAhead": 0
          }
        }
      ]

   :query string study: List networks linked to the study with provided identifier.
   :query string query: RQL search query.
   :query numeric from: List offset. Default value is ``0``.
   :query numeric limit: List maximum count of documents.
   :query string sort: Sorting field. Default value is ``id``.
   :query string order: Sorting order. Default value is ``asc``.
   :query strings exclude: Document identifiers to be excluded from the list.
   :query string filter: Document state filter which possible values are: ``ALL``, ``PUBLISHED``, ``UNDER_REVIEW``, ``IN_EDITION``, ``TO_DELETE``. Default value is ``ALL``.

   :>jsonarr string id: The document unique identifier.
   :>jsonarr object acronym: The acronym (short name) of the document, as an object that describes a localized string.
   :>jsonarr object name: The name of the document, as an object that describes a localized string.
   :>jsonarr strings studyIds: The identifiers of the studies that are part of the network.
   :>jsonarr object permissions: The different actions that can be performed on this document.
   :>jsonarr boolean published: Whether the document is published.
   :>jsonarr object timestamps: The date times (format ISO-8601) at which the document was created and updated.
   :>jsonarr object obiba.mica.EntityStateDto.networkSummaryState: The publication state of the document.

   :reqheader Authorization: As described in the :ref:`rest-auth` section
   :reqheader Accept: ``*/*``
   :resheader Content-Type: ``application/json``
   :statuscode 200: The documents list to which user has read access rights.
   :statuscode 500: Server error.

Create
------

.. http:post:: /draft/networks

   Create a network in draft mode.

   This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` or ``mica-reviewer`` or ``mica-editor`` role.

Index
-----

.. http:put:: /draft/networks/_index

  Rebuild both draft and published indices for all networks.

  This entry point requires :ref:`rest-auth` of a user with ``mica-administrator`` role.

  **Example requests**

  Using cURL

  .. sourcecode:: shell

    curl --user administrator:password -X PUT https://mica-demo.obiba.org/ws/draft/networks/_index

  Using Python command line tool

  .. sourcecode:: shell

    mica rest -mk https://mica-demo.obiba.org -u administrator -p password --method PUT /draft/networks/_index --json

  :reqheader Authorization: As described in the :ref:`rest-auth` section
  :statuscode 200: The indices rebuild task is scheduled.
  :statuscode 401: User does not have the permission to perform this operation.
  :statuscode 500: Server error.
