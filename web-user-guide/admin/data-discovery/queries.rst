Building Queries
================

Summary
-------

The search module allows users to filter and explore Mica documents by building taxonomy based queries. There are several types of criteria where each criterion is associated with one vocabulary. Below are some of the different types of criteria:

- Matching Criterion is used on vocabularies of type string.
- In Criterion are used on vocabularies of type string with several terms each term describing a possible value.
- Range Criterion are used on vocabularies of numeric type having several terms each term describing a bounding tuple [from, to).
- Numeric Criterion are used on vocabularies of numeric type without terms in a given range [from, to).

There are four main taxonomies each of which is used for searching a corresponding Mica document:

- Variable taxonomies
- Dataset taxonomy
- Study taxonomy
- Network taxonomy

The Variable taxonomies is a set of three specific taxonomies, two of which are described and imported from Opal and are developed by Maelstrom Research to allow annotating study and harmonized variables:

- **Areas of information**: classification developed by Maelstrom Research
- **Source & Target**: information about the collected variable

The only variable related taxonomy defined in Mica is **Variable properties** that is used to describe the Opal variable attributes.

Operations
----------

Create a search criterion
*************************

Below are the three possible ways of creating query criteria:

*Search box*

The search box is a quick way of searching taxonomy vocabularies/terms to create a criterion. Typing keywords displays a type-ahead suggesting all matching terms and their corresponding vocabularies in all found taxonomies.

*Search properties*

The Search properties is a taxonomy specific browser that allows the selection of vocabularies and terms. The left-most column contains the list of all vocabularies, the middle column lists the terms of a selected vocabulary and the last column is the selected term. A criterion can be created by adding a selected vocabulary or one of its terms to the query.

*Classifications*

The classification section is a more descriptive view of the taxonomies grouped by Mica document types, namely, Variable, Dataset, Study and Network. Similar to Search properties, a criterion can be created either by selecting a vocabulary or one its terms.
