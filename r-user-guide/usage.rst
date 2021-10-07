R Usage
=======

All the R commands that perform search return data frames. The query parameter that can be passed as an argument is the one that can be
copied from the search page.

Connection
----------

.. code-block:: r

    # Load library
    library(micar)

    # Open connection
    m <- mica.login(url="https://mica-demo.obiba.org")

    # Make queries
    # ...

    # Close connection
    mica.logout(m)

Search
------

A unified search service allows to get any kind of document type, given search criteria applied to same or other document types. Only the published documents can be searched.

Networks
~~~~~~~~

Search for published networks.

.. code-block:: r

    mica.networks(m)
    mica.networks(m, query="network(in(Mica_network.studyIds,clsa))")
    mica.networks(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))", locale="en", from=0, limit=10)

Studies
~~~~~~~

Search for studies, populations and data collection events.

.. code-block:: r

    mica.studies(m)
    mica.studies(m, query="study(in(Mica_study.methods-design,cohort_study))")
    mica.studies(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))", locale="en", from=0, limit=10)
    mica.study.populations(m)
    mica.study.dces(m)

Datasets
~~~~~~~~

Search for datasets.

.. code-block:: r

    mica.datasets(m)
    mica.datasets(m, query="dataset(in(Mica_dataset.className,HarmonizationDataset))")
    mica.datasets(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")


Variables
~~~~~~~~~

Search for variables.

.. code-block:: r

    mica.variables(m)
    mica.variables(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")
    mica.variables(m, query="dataset(in(Mica_dataset.className,HarmonizationDataset))")


Taxonomies
~~~~~~~~~~

The taxonomies describe the variable annotations, used to build the search criteria.

.. code-block:: r

    # Get taxonomies, vocabularies, terms
    mica.taxonomies(m,target="variable")
    mica.taxonomies(m,target="variable", query="sex", locale="en", taxonomies = list("Mlstr_area", "Mlstr_additional"))
    mica.taxonomies(m,target="study")
    mica.vocabularies(m,target="variable", query="cancer", locale = "en")
