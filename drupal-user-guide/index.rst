Mica Drupal Client
===================

`Drupal <http://drupal.org/>`_ is a Content Management System (CMS) allowing to build a web portal with a friendly administration interface and with extensible capabilities. What is referred to Mica Drupal Client in this documentation consists of a set of Drupal modules and theme. These modules/theme will get the published data from the Mica server (through its web services) and will deliver them as Drupal pages. Drupal supports user authentication which is itself extended to use Agate user directory. This way Drupal users can authenticate on Agate and get the Mica pages adapted to their permissions.

This guide describes how to set up a Drupal server with Mica client modules/theme configured. It is intended for the the system administrators.

Requirements
------------

Server Hardware Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

============ ===============
Component    Requirement
============ ===============
CPU	         Recent server-grade or high-end consumer-grade processor
Disk space	 2GB or more.
Memory (RAM) Minimum: 4GB, Recommended: >4GB
============ ===============

Server Software Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

======================================== ================== ========================
Software                                 Suggested version  Usage
======================================== ================== ========================
Drupal                                   7.x                Drupal application that will host Mica Client modules/theme.
Drupal requirements (PHP, database etc.) PHP >=5.5          See Drupal Requirements
======================================== ================== ========================

Dependencies
------------

System dependencies
~~~~~~~~~~~~~~~~~~~

For Linux systems the following dependencies need to be installed:

* Debian

.. code-block:: bash

  apt-get update
  apt-get install mariadb-server php5.6 php5.6-mysql php5.6-curl php5.6-gd php5.6-cli php5.6-xml

* CentOS

.. code-block:: bash

  yum clean all
  yum install mariadb-server php56w php56w-mysql php56w-gd php56w-cli php56w-xml

Drush and Composer
~~~~~~~~~~~~~~~~~~

It is recommended to install `Drush <http://www.drush.org/>`_ 7 (Drupal Shell) using `Composer <https://getcomposer.org/>`_ (Dependency Manager for PHP). See `Drush install documentation <http://docs.drush.org/en/7.x/install/>`_.

Install Composer:

.. code-block:: bash

  # Install Composer at system level (root access required)
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

Install Drush via Composer tool:

.. code-block:: bash

  # Install Drush and add composer installation directory to your execution path
  composer global require drush/drush:7.*
  echo "export PATH=\$HOME/.composer/vendor/bin:\$PATH" | tee -a $HOME/.bashrc
  # For CentOS 7 you have to use :
  echo "export PATH=\$HOME/.config/composer/vendor/bin:\$PATH" | tee -a $HOME/.bashrc
  source .bashrc

  # Verify Drush install
  drush status

  # Install composer module for Drush (allows Drush to use Composer)
  drush dl composer-8.x-1.x

Drupal Server
~~~~~~~~~~~~~

Now you can install Drupal 7. The installation with Drush is recommended. See `Drupal Documentation <https://www.drupal.org/docs/7>`_ for details (we recommend you the installation with drush).

.. note::

  **CentOS**
  If you have problems about authorization (like httpd code 403 from apache), this error could be related to SELinux. You can disable SELinux (command : setenforce 0) to check if this resolves your problem (temporarily). See SELinux documentation for details.


Installation
------------

The following modules and theme are required to have a fully functional Mica Drupal Client:

=============== ======= =============================================== =============================================
Name            Type    Drupal Link                                     Usage
=============== ======= =============================================== =============================================
obiba_mica      modules	https://www.drupal.org/project/obiba_mica       Uses Mica web services to render published content, data summaries and manage data access requests.
obiba_agate     module  https://www.drupal.org/project/obiba_agate      Uses Agate web services to authenticate Mica users.
obiba_bootstrap theme   https://www.drupal.org/project/obiba_bootstrap  Bootstrap based Drupal theme with appropriate style sheets and page templates. Extension of bootstrap theme.
=============== ======= =============================================== =============================================

Once `Drupal is installed <https://www.drupal.org/documentation/install>`_ on your system, run the following commands:

.. code-block:: bash

  # Go to Drupal installation directory
  cd DRUPAL_DIR

  # Download and enable Obiba bootstrap theme
  drush en -y bootstrap
  drush en -y obiba_bootstrap

  # Download and enable Obiba Mica module
  drush en -y obiba_mica

  # Download and enable Obiba Agate module
  drush en -y obiba_agate

  # Download and enable Obiba Mica Data Access module (optional)
  drush en -y obiba_mica_data_access_request

  # Download Obiba Javascript dependencies
  drush download-mica-dependencies

  # Generate the autoload composer dependencies
  drush composer-json-rebuild
  cd sites/default/files/composer/
  composer update
  composer dump-autoload -o
  cd DRUPAL_DIR
  # Choose option 9 (to clear registry cache)
  drush cc registry

  # Apply JQuery settings
  drush vset -y --format=string jquery_update_jquery_version 1.10
  drush vset -y --format=string jquery_update_jquery_admin_version 1.10

  # Download and enable Autologout module (optional)
  drush dl -y autologout
  drush en -y autologout
  drush vset -y autologout_redirect_url "<front>"
  drush vset -y autologout_no_dialog TRUE

* Debian

.. code-block:: bash

  # Apply some folder permissions
  chown www-data:www-data ./sites/default/files/composer/

* CentOS

.. code-block:: bash

  # Apply some folder permissions
  chown apache\: ./sites/default/files/composer/

To enable the mode_rewrite on Debian:

.. code-block:: bash

  sudo a2enmod rewrite
  sudo service apache2 restart

On CentOS the rewrite_mode is enabled by default.

* Make sure that the apache config on Debian and CentOS allow overriding via .htaccess, to do so make sure the apache config file has the following directive:

.. code-block:: bash

  <Directory "/var/www/html">
  ...
  AllowOverride All
  ...
  </Directory>

* Go to http://localhost/drupal/#overlay=admin/config/search/clean-urls
* Check "Enable clean URLs" and save.
* Due to an incompatibility with a nonvalid ssl certificate in CentOS, you need to set mica url and agate url without ssl. To do this :

  - Go to http://localhost/drupal/admin/config/obiba-agate/agate-settings
  - Replace Agate address with : http://localhost:8081
  - In Application Key, set : changeIt
  - Save

  - Go to http://localhost/drupal/admin/config/obiba-mica/obiba-mica-settings
  - Replace Mica address with : http://localhost:8082
  - Save

Upgrade
-------

Before proceeding, make sure that the PHP version is 5.6 and Mica server version is >= 2.0.0.

The following instructions apply when upgrading from obiba_mica 7.x-1.3 or older.

.. code-block:: bash

  # Go to Drupal installation directory
  cd DRUPAL_DIR

  # Upgrade Obiba modules
  drush up obiba_mica
  drush up obiba_bootstrap
  drush up obiba_agate

  # Install Obiba javascript dependencies
  drush download-mica-dependencies

  # Replace the old search module with the new one
  drush dis obiba_mica_search
  drush en obiba_mica_repository

  # Generate the autoload composer dependencies
  drush composer-json-rebuild
  cd sites/default/files/composer/
  composer update
  composer dump-autoload -o
  cd DRUPAL_DIR
  # Choose option 9 (to clear registry cache)
  drush cc

  # Install Obiba Agate module new dependency
  drush en autologout

  # Clear all caches
  drush cc

If some templates have been overridden, please compare with the new original one.

If you have defined a sub-theme of obiba_bootstrap's theme, you might need to update your style sheet.
