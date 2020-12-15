Public Pages Configuration
==========================

Starting from Mica 4.0, the administration user interface is distinct from the public pages, i.e. pages that are to be accessed by regular users. These pages are based on templates that can be customized, extended or overridden. The template engine that is used is `FreeMarker <https://freemarker.apache.org/>`_ which has a clean and powerful syntax.

Page Templates
--------------

Configuring Pages
~~~~~~~~~~~~~~~~~

The main public pages are:

======================== ==================
Page                     Description
======================== ==================
``index``                The home page
``profile``              The user profile page for updating personal information and password
``signin``               The login page
``signup``               The user registration page
``signup-with``          The user registration page, with form pre-filled with personal information extracted from a OpenID Connect server
``forgot-password``      The page to ask for password reset
``just-registered``      The welcome page after a user has registered
``networks``             The list of networks
``network``              The network page
``studies``              The list of studies
``study``                The study page (can be individual or harmonization)
``datasets``             The list of datasets
``dataset``              The dataset page (can be collection or harmonization)
``variable``             The variable page (can be collected, data schema or harmonized)
``search``               The catalog search page
``projects``             The list of approved projects
``project``              The approved project page
``data-access-process``  The data access process presentation page
``data-accesses``        The list of data access requests (restricted access)
``data-access``          The data access request main page (there are other pages for each of the data access request forms and features)
``contact``              The "Contact Us" form to send a contact request to the administrators or data access officers
``cart``                 The variables cart page
======================== ==================

The `templates structure <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/>`_ is organized in a way that it should not be necessary to override these main pages definitions. Instead of that, it is recommended to change/extend the theme/style as described in this guide.

The process of configuring these pages is the following (by order of priority):

1. Alter default settings
^^^^^^^^^^^^^^^^^^^^^^^^^

Some template variables (date formats, branding, favicon etc.) are defined in `libs/settings.ftl <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/libs/settings.ftl>`_ and can be altered in the file **models/settings.ftl** that would be added in your configuration folder as follows:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── models
              └── settings.ftl

If enough, this is the less intrusive approach. Note that you do not need to redefine all the settings, just reassign the ones of interest.

**General settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``defaultLang``
     - The default language to be used when extraction labels from documents. If no text version is found for the page's language, this default language's version will be looked up.
   * - ``datetimeFormat``
     - The format in which the date-time values should be rendered.
   * - ``date``
     - The format in which the date values should be rendered.
   * - ``faviconPath``
     - The location of the favicon, to be modified to match your own.
   * - ``brandImageSrc``
     - The location of your organization's logo.
   * - ``brandImageClass``
     - CSS classes to apply to the logo.
   * - ``brandTextEnabled``
     - Logical to show/hide a text aside of the logo.
   * - ``brandTextClass``
     - CSS classes to apply to the text aside of the logo.
   * - ``networkIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a network.
   * - ``studyIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a study.
   * - ``datasetIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a dataset.
   * - ``harmoDatasetIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a harmonization dataset.
   * - ``variableIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a variable.
   * - ``projectIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a project.
   * - ``taxonomyIcon``
     - CSS classes to apply to the <i> element to render the icon that represents a taxonomy.
   * - ``adminLTEPath``
     - The location of the `AdminLTE <https://adminlte.io/>`_ theme if this one has been modified (see the **Theme** section in this documentation).

**Home page settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``networksLink``
     - The link to list the networks. Default is the **Networks** menu.
   * - ``studiesLink``
     - The link to list the studies. Default is the **Studies** menu.
   * - ``datasetsLink``
     - The link to list the datasets. Default is the **Datasets** menu.
   * - ``portalLink``
     - The link applied to the logo. Default is the data portal itself (same as **Home** menu), but it could also be the organization's main portal.

**Cart page settings**


.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``cartEnabled``
     - Logical to show/hide the cart links (**Cart** menu, addition/removal to/from cart buttons). Default is consistent with the application's general configuration, but can be fine-tuned to make the cart visible to users within roles or groups.
   * - ``listsEnabled``
     - Logical to show/hide the lists links (**Lists** menu, addition to list buttons). Default is consistent with the application's general configuration, but can be fine-tuned to make the lists visible to users within roles or groups.
   * - ``showCartDownload``
     - Logical to allow downloading the content of the cart. Default is restricted to users with administration-related role.
   * - ``showCartViewDownload``
     - Logical to allow downloading the content of the cart in the format of Opal views (for creating views in Opal from a variable selection). Default is restricted to users with administration-related role.

**Contact Us page settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``contactEnabled``
     - Logical to show/hide the **Contact** menu. Default is **true**, but can be restricted to users within roles or groups.

**User Profile page settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``showProfileRole``
     - Logical to show/hide the role to which the user belongs.
   * - ``showProfileGroups``
     - Logical to show/hide the groups to which the user belongs.

**Repository list pages settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``listDisplays``
     - Enumerate the different ways of rendering the lists of documents (networks, studies or datasets). Possible values are **lines**, **table** and **cards**. Some can be omitted (at least one is required) and the order matters.
   * - ``listDefaultDisplay``
     - Default display of a list of documents (networks, studies or datasets). Default is **lines**.
   * - ``networkListDisplays``
     - Specific enumeration of the different ways of rendering the lists of networks. Default is the same as specified by ``listDisplay``.
   * - ``networkListDefaultDisplay``
     - Default display of a list of the networks. Default is the same as specified by ``listDefaultDisplay``.
   * - ``studyListDisplays``
     - Specific enumeration of the different ways of rendering the lists of networks. Default is the same as specified by ``listDisplay``.
   * - ``studyListDefaultDisplay``
     - Default display of a list of the studies. Default is the same as specified by ``listDefaultDisplay``.
   * - ``datasetListDisplays``
     - Specific enumeration of the different ways of rendering the lists of networks. Default is the same as specified by ``listDisplay``.
   * - ``datasetListDefaultDisplay``
     - Default display of a list of the studies. Default is **cards**.

**Search page settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``defaultSearchState``
     - The state of the Search interface when entering the page. Default is showing the list of studies or the list of variables when there is only one study.
   * - ``downloadQueryEnabled``
     - Logical to show/hide the button for downloading the results of the query. Default is **true**, but can be restricted to users within roles or groups.
   * - ``showCopyQuery``
     - Logical to show/hide the button for copying the query string, that can be used in the R or Python API. Default is restricted to users with administration-related role.
   * - ``mapName``
     - Map name to be used in the graphic **geographical-distribution-chart**. Default is **world**, possible values are **world**, **europe**, **north-america**, **south-america**, **asia**, **africa** or **oceania**.
   * - ``searchCharts``
     - Show/hide and order the graphics by specifying their name. Possible values are **geographical-distribution-chart**, **study-design-chart**, **number-participants-chart**, **bio-samples-chart** or **study-start-year-chart**.
   * - ``searchVariableListDisplay``
     - Logical to show/hide the list of variables resulting from the search. Default is consistent with the application's general configuration.
   * - ``searchDatasetListDisplay``
     - Logical to show/hide the list of datasets resulting from the search. Default is consistent with the application's general configuration.
   * - ``searchStudyListDisplay``
     - Logical to show/hide the list of studies resulting from the search. Default is consistent with the application's general configuration.
   * - ``searchNetworkListDisplay``
     - Logical to show/hide the list of networks resulting from the search. Default is consistent with the application's general configuration.
   * - ``searchVariableColumns``
     - Show/hide and order the column names for the list of variables. Possible values are **label**, **label+description** (variable label with a tooltip that shows the description), **valueType**, **annotations**, **type**, **study** or **dataset**.
   * - ``searchDatasetColumns``
     - Show/hide and order the column names for the list of datasets. Possible values are **name**, **type**, **networks**, **studies** or **variables**.
   * - ``searchStudyColumns``
     - Show/hide and order the column names for the list of studies. Possible values are **name**, **type**, **study-design**, **data-sources-available**, **participants**, **networks**, **individual** or **harmonization**.
   * - ``searchNetworkColumns``
     - Show/hide and order the column names for the list of networks. Possible values are **name**, **studies**, **datasets** or **variables**.
   * - ``searchVariableFields``
     - List of the variable fields to be extracted from search results.
   * - ``searchDatasetFields``
     - List of the dataset fields to be extracted from search results.
   * - ``searchStudyFields``
     - List of the study fields to be extracted from search results.
   * - ``searchNetworkFields``
     - List of the network fields to be extracted from search results.
   * - ``searchVariableSortFields``
     - List of the variable fields to be used for sorting the search.
   * - ``searchDatasetSortFields``
     - List of the dataset fields to be used for sorting the search.
   * - ``searchStudySortFields``
     - List of the study fields to be used for sorting the search.
   * - ``searchNetworkSortFields``
     - List of the network fields to be used for sorting the search.
   * - ``searchCoverageDisplay``
     - Logical to show/hide the **Coverage** search results tab.
   * - ``searchGraphicsDisplay``
     - Logical to show/hide the **Graphics** search results tab.
   * - ``searchListDisplay``
     - Logical to show/hide the **List** search results tab.
   * - ``searchCriteriaMenus``
     - Show/hide the search criteria in the sidebar by specifying their type (possible values are **variable**, **dataset**, **study**, **network**).

**Variable page settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``showHarmonizedVariableSummarySelector``
     - For a dataschema variable, allow the possibility to display the summary statistics of a specific harmonized variable. Default is **true**.

**Data Access pages settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``dataAccessInstructionsEnabled``
     - Show/hide the instructions panel on the side of the data access form. Default is **true**.
   * - ``dataAccessCalloutsEnabled``
     - Show/hide the callout panels on the head of the data access pages. Default is **true**.
   * - ``dataAccessReportTimelineEnabled``
     - Show/hide the report timeline in the dashboard page when the data access is approved. Applies only when a project end date can be found. Default is **true**.
   * - ``dataAccessArchiveEnabled``
     - Show/hide the **Archive** button, to users with appropriate permissions and when the data access request is completed. Default is **true**.

**Charts settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``barChartBackgroundColor``
     - Background color of the chart elements (the bars or the countries for instance).
   * - ``barChartBorderColor``
     - Border color of the chart elements.
   * - ``colors``
     - List of colors to be used for a set of chart elements (portions of a pie chart for instance).

**Files settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``showFiles``
     - Logical to show/hide the files that are associated to the documents (networks, studies, populations, data collection events, datasets). Default is **true**, but can be restricted to users within roles or groups. Note that the files can themselves require permissions.
   * - ``showNetworkFiles``
     - Logical to show/hide the files that are associated to the networks. Default is the same as what specified by ``showFiles``.
   * - ``showStudyFiles``
     - Logical to show/hide the files that are associated to the studies. Default is the same as what specified by ``showFiles``.
   * - ``showStudyPopulationFiles``
     - Logical to show/hide the files that are associated to the study populations. Default is the same as what specified by ``showFiles``.
   * - ``showStudyDCEFiles``
     - Logical to show/hide the files that are associated to the study data collection events. Default is the same as what specified by ``showFiles``.
   * - ``showDatasetFiles``
     - Logical to show/hide the files that are associated to the datasets. Default is the same as what specified by ``showFiles``.

**Variables classifications charts settings**

.. list-table::
   :widths: 10 90
   :header-rows: 1

   * - Variable
     - Description
   * - ``variablesClassificationsTaxonomies``
     - Enumerate the taxonomy names to render the charts of variables classifications coverage (count of variables annotated with each vocabulary). Default is **Mlstr_area**. If the list is empty, no chart will be displayed.
   * - ``networkVariablesClassificationsTaxonomies``
     - Enumerate the taxonomy names to render the charts of variables classifications coverage in the network page. Default value is ``variablesClassificationsTaxonomies``.
   * - ``studyVariablesClassificationsTaxonomies``
     - Enumerate the taxonomy names to render the charts of variables classifications coverage in the study page. Default value is ``variablesClassificationsTaxonomies``.
   * - ``datasetVariablesClassificationsTaxonomies``
     - Enumerate the taxonomy names to render the charts of variables classifications coverage in the dataset page. Default value is ``variablesClassificationsTaxonomies``.

2. Override one of the page model templates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The model templates are to be found in the `models <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/models>`_ folder. This allows to alter some portions of the pages, without affecting the general layout.

The override of the template is done by installing a file with same name, at the same relative location in the application's configuration folder.

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── models
              └── <template name>.ftl

This is the preferred approach when a document's model was modified (new fields added/removed to the network, study, dataset etc.).

3. Override the main page templates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These templates are located at the `templates' root <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/models>`_ folder. This gives full control of the page content but may ignore enhancements or break when upgrading the application.

The override of the template is done by installing a file with same name, at the same relative location in the application's configuration folder.

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── <template name>.ftl

Adding Pages
~~~~~~~~~~~~

It is possible to add new pages, for providing additional information or guidance to the regular user. This can be done as follows:

* Install a new page templates
* Add a new menu entry

1. Install custom page template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The new template page is to be declared in the configuration folder:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── custom.ftl

You can check at the provided templates to make your template fit in the site theme and structure. The `profile page template <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/profile.ftl>`_ could be a good starting point.

`FreeMarker <https://freemarker.apache.org/>`_ will look at its context to resolve variable values. For a custom page the objects available in the context are:

================ ================
Object           Description
================ ================
``config``       The Mica configuration
``user``         The user object (if user is logged in)
``roles``        The list of user roles: ``mica-administrator``, ``mica-reviewer``, ``mica-editor``, ``mica-data-access-officer`` or ``mica-user`` (if user is logged in)
``query``        The URL query parameters as a map of strings
================ ================

This custom template page can load any CSS or JS file that might be useful. These files can be served directly by adding them as follows (there are no restrictions regarding the naming and the structure of these files, as soon as they are located in the **static** folder):

.. code-block:: bash

  MICA_HOME
  └── conf
      └── static
          ├── custom.css
          └── custom.js

The URL of this custom page will be for instance: ``https://mica.example.org/page/custom``.

2. Custom menu entry
^^^^^^^^^^^^^^^^^^^^

To link to a custom page (or an external page), some templates can be defined to extend the default menus: left menu can be extended on its right and right menu can be extended on its left. The corresponding templates are:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── models
              ├── navbar-menus-left.ftl
              └── navbar-menus-right.ftl

Check at the default `left <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/libs/navbar-menus-left.ftl>`_ and `right <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/libs/navbar-menus-right.ftl>`_ menus implementation as a reference.

Theme and Style
---------------

Theme
~~~~~

The default theme is the one provided by the excellent `AdminLTE <https://adminlte.io/>`_ framework. It is based on `Bootstrap <https://getbootstrap.com/>`_ and `JQuery <https://jquery.com/>`_. In order to overwrite this default theme, the procedure is the following:

* Build a custom AdminLTE distribution
* Install this custom distribution
* Change the template settings so that pages refer to this custom distribution instead of the default one

**1. Build custom AdminLTE**

This requires some knowledge in CSS development in a Node.js environment:

* Download `AdminLTE source <https://github.com/ColorlibHQ/AdminLTE>`_ (source code or a released version)
* Reconfigure `Sass <https://sass-lang.com/>`_ variables
* Rebuild AdminLTE (see instructions in the README file, contributions section)

**2. Install custom AdminLTE**

The objective is to have the web server to serve this new set of stylesheet and javascript files. This is achieved by creating the folder **MICA_HOME/conf/static** and copying the AdminLTE custom distribution in that folder. Not all the AdminLTE are needed, only the **dist** and **plugins** ones. The folder tree will look like:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── static
          └── admin-lte
              ├── dist
              └── plugins


**3. Template settings**

Now that the custom AdminLTE distribution is installed in the web server environment, this new location must be declared in the page templates. The default templates settings are defined in the `libs/settings.ftl <https://github.com/obiba/mica2/blob/master/mica-webapp/src/main/resources/_templates/libs/settings.ftl>`_ template file. See the **adminLTEPath** variable. This variable can be altered by defining a custom **settings.ftl** file as follows:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── models
              └── settings.ftl

In this custom **settings.ftl** file the new AdminLTE distribution location will be declared:

.. code-block:: xml

  adminLTEPath = "/admin-lte"/>

Style
~~~~~

As an alternative to theming, it is also possible to alter the style of the pages by loading your own stylesheet and tweaking the pages' layout using javascript (and `JQuery <https://jquery.com/>`_). The procedure is the following:

* Install custom CSS and/or JS files
* Custom the templates to include these new CSS and/or JS assets

**1. Install custom CSS/JS**

The objective is to have the web server to serve this new set of stylesheet and javascript files. This is achieved by creating the folder **MICA_HOME/conf/static** and copying any CSS/JS files that will be included in the template pages. The folder tree will look like:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── static
          ├── custom.css
          └── custom.js

**2. Custom templates**

For the CSS files, the **models/head.ftl** template allows to extend the HTML pages "head" tag content with custom content. For the JS files, the **models/scripts.ftl** template allows to extend the HTML pages "script" tags. The folder tree will look like:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── templates
          └── models
              ├── head.ftl
              └── scripts.ftl

Where the **head.ftl** template will be:

.. code-block:: xml

  <link rel="stylesheet" href="/custom.css"/>

And the **scripts.ftl** template will be:

.. code-block:: xml

  <script src="/custom.js"/>


Translations
------------

The translations are performed in the following order, for a given ``locale``:

1. check for the message key in the messages_<locale>.properties (at different locations)
2. check for the message key in the <locale> JSON object as defined the **Administration > Translations** section of the administration interface

For the messages_* properties, the translations can be added/overridden as follows:

.. code-block:: bash

  MICA_HOME
  └── conf
      └── translations
          ├── messages_fr.properties
          └── messages_en.properties

Note that you can declare only the messages_* properties files that are relevant (locales available from the website) and the content of these files can contain only the translation keys that you want to override.
