ODK Aggregate Tables Extension
=================================
.. warning::
    Aggregate is deprecated and no longer supported.

.. _aggregate-tables-extension-intro:

:dfn:`ODK Aggregate Tables Extensions` enable the ODK-X tools to share data via bi-directional synchronization with a central ODK Aggregate server. However, this approach is no longer supported, please migrate to :doc:`sync-endpoint`.

The `ODK-X REST Protocol <https://docs.odk-x.org/odk-2-sync-protocol/>`_ is compatible with ODK Aggregate v1.4.15. The sync protocol has been augmented to cache the user's permissions on the device and, for super-users or administrators, to cache the full set of users and all of their permissions (so that the super-user and/or administrator can assign rows to particular individuals).

.. _aggregate-tables-extension-server-setup:

Server Setup
-------------------

First you’ll have to install ODK Aggregate v1.4.15 to a server.

  #. Install ODK Aggregate v1.4.15 to a server.
  #. Log onto your ODK Aggregate v1.4.15 instance.
  #. Go to the :menuselection:`Site Admin --> Preferences` page.
  #. Check the checkbox for :guilabel:`ODK-X Tables Synchronization Functionality`.
  #. Go to the :menuselection:`Site Admin --> Permissions` page.
  #. Add ODK Aggregate usernames by typing one or more users' e-mail addresses into the text area and clicking :guilabel:`Add User`.
  #. If you have created an ODK Aggregate username, be sure to :guilabel:`Change Password` on that account to set the initial password for the account.
  #. Grant these users the :guilabel:`Synchronize Tables` permissions.
  #. Select at least one user to be the administrator and grant them :guilabel:`Administer Tables` permissions. This user will have the ability to :guilabel:`Reset App Server` from the Android device and add or remove tables and configuration files on the server. This is the equivalent of the Form Manager permissions in ODK deployments.
  #. Click :guilabel:`Save Changes`. These changes will not take effect until you do!

.. _aggregate-tables-extension-changing-appname:

Changing the AppName
-----------------------

ODK Aggregate is configured by default to use the **default** application name. To change the name, go to the :menuselection:`Site Admin --> Preferences` screen and click the :guilabel:`Change ODK-X App Name` button, and enter a new application name. For example, the https://opendatakit-surveydemo.appspot.com server is configured with *survey* as its application name.

.. note::

  The ODK-X tools are designed to support multiple, independent, ODK-X applications running on the Android device. Each of the tools has the ability to run in the context of either a default application name, or a specified application name.

By default, all the ODK-X tools run under the default application name. Application names correspond to the name of the directory under :file:`/sdcard/opendatakit` where the data files for that application are stored.

When you run ODK-X Services from within ODK-X Survey, the ODK-X Survey tool informs ODK-X Services to run in the context of the application name under which the ODK-X Survey tool is running. When ODK-X Services then interacts with ODK Aggregate, it reports that application name to the server. The server must be configured with exactly the same application name or it will reject the requests from ODK-X Services. This also applies when launching ODK-X Services from within ODK-X Tables.

.. _aggregate-tables-extension-syncing:

Using Device Synchronization
------------------------------------

For more information on syncing, see :ref:`ODK-X Services Syncing <services-using-sync>`.
