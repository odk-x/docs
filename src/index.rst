.. spelling:word-list::

  geotagging

ODK-X Documentation
================================================

TL;DR
--------------

ODK-X Tool Suite is a set of free and open-source software designed for data collection, management, and utilization in resource-constrained environments. It offers features like two-way data sync, offline data collection, linked surveys, customizable survey flows, user access control, and more. The suite includes tools like ODK-X Survey for data collection, ODK-X Tables for data curation and visualization, ODK-X Services for data synchronization, and ODK-X Application Designer for building custom applications.


FAQ
--------------
Click here <https://docs.odk-x.org/faq/>`_: to navigate to Frequently Asked Questions
--------------

.. _odk-x-introduction:
--------------
The ODK-X Tool Suite is free and open-source software for collecting, managing, and using data in resource-constrained environments.

In ODK-X developers and data managers can create data management applications that consist of survey forms as well as Javascript-based apps. These allow you to render a fully customizable user interface to gather, manage, and visualize data on an Android device.

A major goal of these ODK-X tools was to eliminate the need for any software engineering skills (for example: Java programming, Android software development environment, source code version control systems) when designing data management applications. The skills required to build a data management application range from scripting a form definition in XLSX (similar to constructing ODK Collect forms using XLSX files processed by the XLSForm tool), to simple web programming -- modifying boilerplate HTML and JavaScript for custom presentations of the collected data. Advanced web programmers can implement entirely custom web pages.

.. _odk-x-intro-key-features:

Key features
------------

.. _odk-x-two-way-data:

Two-way data sync
"""""""""""""""""
A two-way synchronization protocol allows you to create data management applications with:

 - Follow-up surveys and repeat data collection locations

 - Pre-filled forms for faster data collection

 - Data can be synced to all devices from the server through manual trigger by the user, by clicking the sync button.

.. _odk-x-offline-data:

Offline data collection
"""""""""""""""""""""""
Allows users to collect data without an internet connection. Form data can be synced to the server when the user has internet access.

.. _odk-x-linked-surveys:

Linked and embedded surveys
"""""""""""""""""""""""""""
ODK-X tools enable you to open and edit other surveys with links back to the originating survey. Create a sub-form (nested) relationship among surveys (for example: household and household-member) or relational links across your data (for example: tea-houses and tea-types).

.. _odk-x-view-on-device:

View data on device
"""""""""""""""""""
Investigate and visualize entire datasets directly on the device through graphical, map, tabular displays, and filtered views.

.. _odk-x-uac:

User access control
""""""""""""""""""""
Control data viewing, editing, and deleting privileges for different users and groups.

.. _customize-flows-and-appearance:

Customizable survey flows and appearance
""""""""""""""""""""""""""""""""""""""""
Use basic web development (HTML, JavaScript, and CSS) to specify the layout of nearly all the screens viewed by the data collectors.

.. _odk-x-intro-list-of-tools:

List of Tools
--------------
The ODK-X Tool Suite consists of:

  - :doc:`survey-using` - a customizable data **collection** application.
  - :doc:`tables` - a data **curation and visualization** application that can also run custom-built data collection workflows.
  - :doc:`services` - an application for **user authentication and data synchronization** between the ODK-X applications.
  - :doc:`cloud-endpoints-intro` - a **cloud server** to host data and application files, and to support bi-directional data synchronization across mobile devices.
  - :doc:`suitcase-intro` - a **desktop tool** for synchronizing data with a cloud endpoint.
  - :doc:`app-designer-intro` - a design environment for **creating, customizing, and previewing** your forms, data curation, and visualization applications. This is where you build your ODK-X applications.

.. note::
  ODK-X mobile applications are available for Android devices only.

.. _odk-x-intro-selecting-the-right-tools:

Selecting the Right Tools to Use
--------------------------------

The ODK-X tools can operate independently – you are not required to use all the tools, or even install them on your device. Some example tool combinations are:

.. _odk-x-data-collection:

Field data collection
"""""""""""""""""""""

 - ODK-X Application Designer: data collection form creation
 - `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_: data collection
 - ODK-X Services: data sync and database access
 - ODK-X Cloud Endpoints: data and application files cloud server

.. _data-sharing-and-visualization:

Data sharing and visualization
""""""""""""""""""""""""""""""

 - ODK-X Tables: data display and visualization
 - ODK-X Services: data sync and database access
 - ODK-X Cloud Endpoints: data and application files cloud server

See :doc:`reference-apps` for examples of ODK-X tools in use.

.. _odk-x-intro-trying-it-out:

Trying It Out
-------------

The :doc:`survey-sample-app` walks you through the process of using a basic survey-focused application and submitting data to the server.
The :doc:`tables-sample-app` walks you through the process of using a basic tables-focused application and submitting data to the server.

Frequently Asked Questions
--------------

1. What is ODK-X?
ODK-X, or Open Data Kit-X, is a suite of tools for collecting, managing, and using data in environments with limited resources. It offers customizable data collection applications and data curation tools.

2. What are the key features of ODK-X?
ODK-X features include two-way data synchronization, offline data collection, linked and embedded surveys, data visualization on the device, user access control, and customizable survey flows and appearance.

3. What tools are included in the ODK-X Tool Suite?
The suite includes ODK-X Survey for data collection, ODK-X Tables for data curation and visualization, ODK-X Services for data synchronization, ODK-X Cloud Endpoints for cloud hosting, ODK-X Suitcase for desktop data synchronization, and ODK-X Application Designer for building custom applications.

4. How does ODK-X handle data synchronization?
ODK-X allows two-way synchronization of data between devices and servers, enabling follow-up surveys, pre-filled forms, and offline data collection. Users can manually trigger data sync or sync automatically when an internet connection is available.

5. Can ODK-X tools be used independently?
Yes, ODK-X tools can operate independently, and users can choose to use only the tools they need. For example, for field data collection, one can use ODK-X Application Designer for form creation, ODK-X Survey for data collection, ODK-X Services for data sync, and ODK-X Cloud Endpoints for cloud storage.

6. Is ODK-X available for all devices?
ODK-X mobile applications are currently available for Android devices only.

7. How can I get started with ODK-X?
You can try out ODK-X Survey and ODK-X Tables by following the step-by-step guides provided for basic survey-focused and tables-focused applications. These guides walk you through the process of using the applications and submitting data to the server.


.. toctree::
  :maxdepth: 1
  :hidden:

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Getting Started

  select-tool-suite
  basics-install
  survey-sample-app
  tables-sample-app
  getting-started-2-architect
  reference-apps
  trouble-shooting

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Building your own Application

  build-app
  app-designer-intro
  app-designer-setup
  app-designer-using
  xlsx-converter-intro
  tables-web-pages
  injected-interfaces

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Mobile Apps

  survey-using
  tables
  services
  notify-install

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Cloud Apps

  cloud-endpoints-intro
  sync-endpoint
  sync-endpoint-cloud-setup
  sync-endpoint-manual-setup
  sync-endpoint-user-instructions.rst

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Desktop Apps

  suitcase-intro

.. .. toctree::
..   :maxdepth: 2
..   :hidden:
..   :caption: Notify

..   notify-install
..   notify-using

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Advanced Topics

  advanced-topics-architect
  advanced-topics-developer

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Contributing

  contributing

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Currently Not Supported

  scan-intro
  scan-form-designer-intro
  aggregate-tables-extension

.. toctree::
  :maxdepth: 2
  :hidden:
  :caption: Reference
