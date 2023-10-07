ODK-X Application Designer
===============================

.. _app-designer-intro:

:dfn:`ODK-X Application Designer` is a tool to help you design :dfn:`data management applications` on top of the ODK-X framework. It works in conjunction with :program:`Excel` or :program:`OpenOffice` for form design, the :program:`Chrome` browser for rendering, and your favorite editor for template design.

In the context of the ODK-X tools, application design consists of:

  - designing the forms used in data collection (by `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_)
  - designing the HTML landing pages and screens used for navigating, curating, and visualizing that data on your Android device (within :doc:`tables`).
  - customizing the look-and-feel of both of these via customized images, logos, and CSS rules.
  - designing mark-sense forms for paper-based data entry (by ODK-X Scan)

.. tip::
  The tools operate independently -- you are not required to use all the tools, or even install them on your device. If you are only interested in data collection, you may only want `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_. Or if you are only interested in data dissemination and visualization, you might only want :doc:`tables`.

  Simply select the combination or individual tool that fits your needs. However, all of these tools require :doc:`services` to access the database, sync to a server, and vend HTML files.

The major goals of the ODK-X Application Designer are:

  #. Simplify the form-design process by providing a preview of your form with the same screen geometry as your target Android device. You no longer have to copy each iteration of your form onto your device to see how it will look or fit on a smaller screen.
  #. Simplify the design and testing of customized list- and detail- views in ODK-X Tables, and in the design of graphical representations of data within ODK-X Tables
  #. Simplify the customization of the look-and-feel of your forms through a simple visual theme editor / generator where your modifications can be immediately viewed and the resulting CSS styles or theme can be saved to a file for later incorporation into your application deployment.
  #. Simplify the conversion of the XLSX file into a form definition by providing a drag-and-drop conversion app running locally on your desktop.
  #. Enable the creation of mark-sense forms (ODK-X Scan Form Designer) that can be scanned by your Android device for data input. The resulting data is available to the other ODK-X tools without need to communicate with a remote server.

.. _app-designer-intro-learn-more:

Learn more about ODK-X Application Designer
-----------------------------------------------------

- :doc:`app-designer-setup`
- :doc:`app-designer-using`
- :doc:`xlsx-converter-intro`
- :doc:`scan-form-designer-intro`

