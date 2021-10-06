Mica R Client
#############

Mica R client, available as a R package, enables data exploration of a Mica server published content.

Installation
============

Requirements: R 3.x must be installed on the system. See more about R .

You can install Mica R package using devtools `devtools <https://cran.r-project.org/package=devtools>`_:

.. code-block:: r

  # Install dependencies
  if (!require("httr")) {
    install.package(c("httr"), dependencies=TRUE)
  }
  # Install from source code repository (see releases at https://github.com/obiba/micar/releases)
  devtools::install_github("obiba/micar", ref="1.0.0")

Usage
=====

All the R commands that perform search return data frames. The query parameter that can be passed as an argument is the one that can be
copied from the search page.

Example of usage:

.. code-block:: r

    # Load library
    library(micar)

    # Open connection
    m <- mica.login(url="https://mica-demo.obiba.org")

    # Get networks
    mica.networks(m)
    mica.networks(m, query="network(in(Mica_network.studyIds,clsa))")
    mica.networks(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))", locale="en", from=0, limit=10)

    # Get studies, populations and DCEs
    mica.studies(m)
    mica.studies(m, query="study(in(Mica_study.methods-design,cohort_study))")
    mica.studies(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))", locale="en", from=0, limit=10)
    mica.study.populations(m)
    mica.study.dces(m)

    # Get datasets
    mica.datasets(m)
    mica.datasets(m, query="dataset(in(Mica_dataset.className,HarmonizationDataset))")
    mica.datasets(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")

    # Get variables
    mica.variables(m)
    mica.variables(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")
    mica.variables(m, query="dataset(in(Mica_dataset.className,HarmonizationDataset))")

    # Get taxonomies, vocabularies, terms
    mica.taxonomies(m,target="variable")
    mica.taxonomies(m,target="variable", query="sex", locale="en", taxonomies = list("Mlstr_area", "Mlstr_additional"))
    mica.taxonomies(m,target="study")
    mica.vocabularies(m,target="variable", query="cancer", locale = "en")

    # Close connection
    mica.logout(m)

