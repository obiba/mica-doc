Document Configuration
======================

Summary
-------

This section provides a description of the web interface for configuring the document types. The document type fields configuration is based on the
`schemaform <http://schemaform.io/>`_ framework that allows to define the form to collect the model of the document.

Operations
----------

Form
~~~~

Document fields configuration consists of providing the necessary information
(in JSON format) to build a form:

* **Schema**: specifies the name and data type to be collected
* **Definition**: specifies how to layout the form (field positions,
  translations, section titles, help text)
* **Preview**: is the result of the interpretation of the `schema` and the
  `definition` by schemaform
* **Model**: displays the data collected (in the preview ) according to the
  specified schema.

.. note::

  Due to the structure of the study type, the form of the study is split in
  several pieces:

  * study: general definition of the study
  * population: each study can have one or more populations, this form applies to
    these only
  * and in case of individual studies, data collection event : each population
    can have one or more data collection events, this form applies to these only.

For detailed documentation on how to use schemaform, see the `schemaform documentation <https://github.com/json-schema-form/angular-schema-form/blob/master/docs/index.md>`_.
The default schema and definition provided by Mica can also be a good starting point for getting into *schemaform* configuration.

Note that not all fields of a document type are configurable: there are some built-in fields such as name, description... that are necessary for Mica to
operate. These fields will appear at the head of the form (when editing a document, not when having a preview of the form configuration). In addition to
that other built-in fields are not handled by schemaform , such as the list of studies of a network, the Opal table(s) associated to a dataset, the persons
that are members of a study or a network...

It is currently not possible to dynamically integrate *schemaform* addons to Mica. Please contact us if you have a specific need.

Search
~~~~~~

Once the fields have been defined, the document search can be configured so that documents can be found by field value. The purpose of the search
configuration is then to define a *taxonomy* specific to the considered document type.

The taxonomy is a classification of existing documents based or their fields. It describes the search criteria used to search documents. A criterion is
defined on the document’s fields and each criterion can (or not) consists in terms related to the values that a field can take. This leads to two criteria types:

* Criteria without terms based on string fields, which leads to a free text search, or based on numerical fields to search a number range.
* Criteria with terms. The terms can be enumerated values for a string, pre-defined number ranges for a numerical field or the values true/false for a Boolean.

Add Criterion
~~~~~~~~~~~~~

A user with administrator rights can add a criterion to the existing taxonomy.

``Name`` (identifier), ``Title``, and ``Description`` are required fields.
Under **Definition**, ``Field`` is required and represents a fully qualified field name under the document model.
Check the ``Repeatable`` definition if search must be an exact match or contained value.
Check the ``Localized`` definition if the field is multilingual.

Under **Display**, one can choose how and if the criterion will be shown.

Checking ``Hidden`` will hide the criterion from the search while ``Facet`` controls whether or not it will be exposed in the list page.

Add Term
~~~~~~~~

A user with administrator rights can add a term to an existing criterion. A term is described by a unique ``Name`` for string criterion or a range for numerical criterion, a ``Title``, a ``Description`` and a set of ``Keywords`` useful when building search requests.

Dataset Specific Search
~~~~~~~~~~~~~~~~~~~~~~~

Despite the fact that study datasets and harmonization datasets can have different fields, there is only one dataset taxonomy that apply to both sub-type of datasets. See the className search criterion that allows to discriminate datasets by their specific type.

In addition to that, datasets in Mica have associated variables that are extracted from Opal. Variable model cannot be configured as it lives in Opal, but variable base taxonomy (i.e. that refers the variable properties) can be adjusted in this section.

Permissions
~~~~~~~~~~~

The permissions that apply to all the documents of the considered type can be specified in this section. See :ref:`Permissions <documents-permissions>` for more information.
