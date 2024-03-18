.. spelling:word-list::
  testForm
  getHashString
  tableId
  isAdult
  yesno
  prepopulate
  defaultViewType
  detailViewFileName
  listViewFileName
  WebView
  SkipLogic

Building an Application
====================================================

.. _build-app:

This will walk you through the steps of building a Data Management Application from scratch. The goal is to start with an empty folder and show you the necessary steps to create a working application that runs on your Android device.

.. _build-app-data-mgt-apps:

ODK-X Data Management Applications
---------------------------------------

The ODK-X Android tools (:doc:`survey-using`, :doc:`tables`, :doc:`services`) are Android Application Packages (APKs) that are designed to work together to create a coherent tailored application experience for an end-user.

.. note::

  Together the ODK-X tools create a platform, on top of which you can build your own data management applications.

ODK-X tools access configuration files and store data under sub-directories of the :file:`opendatakit` directory in the :file:`sdcard` root directory (whether your device has a physical SD card or not): :file:`/sdcard/opendatakit`. User applications constructed using the ODK-X tools are identified by the name of the sub-directory holding those configuration and data files. Thus, :file:`/sdcard/opendatakit/mytestapp` would contain all the files and data for the *mytestapp* application, where *mytestapp,* is the **AppName** of that application. The default **AppName** for the ODK-X tools is *default.* However, when configured appropriately, the ODK-X tools can run under another **AppName**, accessing configuration and saving data in a different subdirectory under opendatakit.

This is handled in such a way that each user application is isolated from all other user applications, with separate configurations, data tables, and server settings. This allows one device to run multiple user applications built on top of the ODK-X tools without any coordination among the teams developing those applications.

.. _build-app-prereqs:

Prerequisites
---------------------

You will need to install:

  - :doc:`app-designer-intro`
  - :doc:`services`
  - :doc:`survey-using`
  - :doc:`tables`

Before getting started, be sure you have familiarized yourself with the ODK-X platform. The :doc:`survey-using`, :doc:`tables-using` and :doc:`getting-started-2-architect` guides are a good place to start. The :doc:`survey-sample-app` and :doc:`tables-sample-app` are also good reference points.

.. _build-app-clean-app-designer:

Cleaning App Designer
-----------------------------------

Your freshly installed copy of Application Designer comes with lots of example forms, tables, and configurations. This is useful for learning the tools and as reference when building our application, the files can be found in the :file:`app/config/tables` directory. 

After building your own application, you may choose to delete all the examples forms and configurations before pushing your files to your device. The files can be very large and take up a lot of space on the device.

To delete all the example forms and configurations, open the terminal and type *grunt empty*, this removes all the files and creates an empty app-designer folder to work with.  

.. code-block:: console

  $ grunt empty

.. _build-app-designing-a-form:

`ODK-X Survey <https://docs.odk-x.org/survey-using/>`_: Designing a Form
---------------------------------------------------------------------------

When creating a new form, the appropriate directory structure must be created. Once this directory structure is in place, a :file:`.xlsx` form can be created. From this :file:`.xlsx` form, a :file:`formDef.json` file will be generated using the XLSX Converter. This :file:`formDef.json`, in the appropriate directory, is what the system will use to create the Survey form.

.. _build-app-creating-directory:

Creating the Directory Structure
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

New forms must be placed under the :file:`app/config/tables/` directory as described in the :ref:`app-designer-dirs-app-config-tables` section. Given a form with the name *formId*, it will have a *tableId* of the same name unless you explicitly specify otherwise. The directory structure that should be created is :file:`app/config/tables/tableId/forms/formId` (where, under many circumstances, the value for *tableId* will be the same as the value for *formId*). 

.. note::

  If you have not used ODK-X Application Designer before, see :doc:`getting-started-2-architect` before continuing.

To get started: 

  1. Navigate to :file:`app/config/tables/` and create a folder with the tableId, where tableId is the name of your new form and table. For example, to create a census form, the folder would be named census.

  2. In the census folder, create the following new folders:
   
    - :th:`forms`
    - :th:`html`
    - :th:`js`

This creates the required directory structure for an individual table, including the forms directory.

Navigate into the forms directory (:file:`app/config/tables/census/forms/` in our example), and create a directory with the form ID as its name. For our example, create a :file:`app/config/tables/census/forms/census` directory. Within that directory, `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_ expects to find the :file:`formDef.json` that defines the form.

.. tip::
  We recommend placing the :file:`.xlsx` file used to generate that :file:`formDef.json` in this folder as well. Survey will not use this file, but it is a useful reference and provides an easy-to-remember storage location in case the form needs to be updated in the future.

Any custom screen, prompt templates, or other media related to the form should be also placed in this directory (or in a sub-directory).

.. _build-app-creating-xlsx-form:

Creating an :file:`xlsx` Form
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With the proper directory structure in place, you can now create your form. The :doc:`xlsx-converter-intro` documentation extensively details the full range of options, settings, and features available when creating a form. For this basic example, follow these instructions:

  1. Create a new file :file:`census.xlsx` inside the :file:`app/config/tables/census/forms/census` folder created in the previous section.

  2. Create a *settings* worksheet. This sheet holds general settings for the form. Create the following headers:

    - :th:`setting_name`: has defined options, such as :tc:`form_id`.
    - :th:`value`: the value of the named setting.
    - :th:`display.title.text`: the text shown to the user inside Survey.

    Reminder: the *settings* worksheet, and any other worksheets to be defined later, are to be created within the `.xlsx` file you created above. DO NOT create separate `.xlsx` files for each worksheet.

  3. Create the following rows:

    .. list-table:: *settings* worksheet
      :header-rows: 1

      * - setting_name
        - value
        - display.title.text
      * - form_id
        - census
        -
      * - form_version
        - 20180101
        -
      * - table_id
        - census
        -
      * - survey
        -
        - Census Form

  4. Create a *survey* worksheet. This sheet defines the questions and flow of your form. Create the following headers:

    - :th:`type`: the prompt type.
    - :th:`values_list`: the name of the list of choices for a multiple-choice question.
    - :th:`name`: the variable name.
    - :th:`display.prompt.text`: the question the user will see in Survey

  5. Create the following rows:

    .. list-table:: *survey* worksheet
      :header-rows: 1

      * - type
        - values_list
        - name
        - display.prompt.text
      * - text
        -
        - name
        - What is your name?
      * - select_one
        - yesno
        - isAdult
        - Are you 18 years or older?

  6. Create a *choices* worksheet. This sheet contains the lists of responses you define for your multiple choice questions. Add the following headers:

    - :th:`choice_list_name`: the group name for all the responses in a choice set
    - :th:`data_value`: the data value to be selected
    - :th:`display.title.text`: the text the user will see to select this value

  7. Create the following rows:

    .. list-table:: *choices* worksheet
      :header-rows: 1

      * - choice_list_name
        - data_value
        - display.title.text
      * - yesno
        - y
        - Yes
      * - yesno
        - n
        - No

With this :file:`.xlsx` file, you've created a simple Survey form that will ask the user to type in their name and respond whether they are 18 years old or not. This form will be titled *Census* and it will write to a table in the database with table ID *census*.

.. _build-app-creating-framework:

Creating :file:`framework.xlsx`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :file:`framework.xlsx` file is central to the structure of the Application Designer. It defines which forms exist. It has no persistent data. In this case, it only presents a list of forms and allows you to open them.

  1. Navigate to the following existing directories: :file:`config/assets/framework/forms/framework/`. Inside that folder, there is a :file:`framework` and :file:`framework.clean` folder, as well as other folders that are not as important for this process.

  2. Delete the existing :file:`framework` folder. The :file:`framework.clean` folder contains a :file:`framework.xlsx` file, the file contains the boilerplate worksheet structure that you'll use to create a working :file:`framework.xlsx` file for your application.
 
  3. Rename the :file:`framework.clean` folder to :file:`framework`

  4. The *initial* worksheet of :file:`framework.xlsx` should have a header: :th:`clause` and value :tc:`do section survey`.

    .. list-table:: *initial* worksheet
      :header-rows: 1

      * - clause
      * - do section survey

  5. The *settings* worksheet should have the :th:`setting_name`, :th:`value`, :th:`display.title.text` headers.

  6. The rows should look like the example below:

    .. list-table:: *settings* worksheet
      :header-rows: 1

      * - setting_name
        - value
        - display.title.text
      * - table_id
        - framework
        -
      * - form_version
        - 20210707
        -
      * - form_id
        - framework
        -
      * - survey
        -
        - Common JavaScript Framework

  7. Next, there is a *framework_translations* sheet. This sheet allows you to translate or customize the text displayed in buttons, messages, and other system text. Translations for your form would be specified in its own *translations* sheet in its :file:`.xlsx` file. This worksheet is already populated, you do not need to edit this worksheet.

  8. The *choices* sheet contains the following headers: :th:`choice_list_name`, :th:`data_value`, :th:`display.title.text`.

  9. Substitute the :th:`form_id_here` under the :th:`data_value` with the *form_id* and :th:`form_title_here` under the :th:`display.title.text` with the *form title*. The row should look like the table below:

    .. list-table:: *choices* worksheet
      :header-rows: 1

      * - choice_list_name
        - data_value
        - display.title.text
      * - test_forms
        - census
        - Census Form

  10. In the *survey* worksheet, check that these headers: :th:`branch_label`, :th:`url`, :th:`clause`, :th:`condition`, :th:`type`, :th:`values_list`, :th:`display.prompt.text` are present.

  11. Update the following rows as shown below. This worksheet tells the software what to do if you're previewing in :program:`Chrome`.

  .. note::

    This is only tested and expected to work in :program:`Chrome` and not other browsers like :program:`Firefox`, :program:`Safari`, or :program:`Edge`.

    .. list-table:: *survey* worksheet
      :header-rows: 1

      * - branch_label
        - url
        - clause
        - condition
        - type
        - values_list
        - display.prompt.text
      * -
        -
        - if
        - | opendatakit.getPlatformInfo().container == "Chrome"
        -
        -
        -
      * -
        -
        -
        -
        - user_branch
        - test_forms
        - Choose a test form
      * -
        -
        - else
        -
        -
        -
        -
      * -
        -
        -
        -
        - note
        -
        - This is the default form.
      * -
        -
        - end if
        -
        -
        -
        -
      * -
        -
        - exit section
        -
        -
        -
        -
      * - census
        -
        -
        -
        -
        -
        -
      * -
        - | ''?' + odkSurvey.getHashString('census')
        -
        -
        - external_link
        -
        - Open form
      * -
        -
        - exit section
        -
        -
        -
        -

.. _build-app-updating-framework:

Updating :file:`framework.xlsx`
"""""""""""""""""""""""""""""""""""

To add another new form to an existing :file:`framework.xlsx` file, take the following steps.

.. note::

  These steps are not part of the running example. They are provided here for reference.

Assuming you have created a :file:`testForm.xlsx`, the appropriate directory structures for :file:`testForm.xlsx`, and then properly generated and saved the :file:`formDef.json`, the following lines would need to be added to the :file:`framework.xlsx` *survey* worksheet.

.. csv-table:: Example Framework Survey Worksheet
  :header: "branch_label", "url", "clause", "condition", "type", "values_list", "display.text", "display.hint"

  "testForm",
  , "''?' + odkSurvey.getHashString('testForm')",,, "external_link",,"Open form",
  ,,"exit section",

The following changes will also need to be made to the :file:`framework.xlsx` **choices worksheet**

.. csv-table:: Example Framework Choices Worksheet
  :header: "choice_list_name", "data_value", "display.text"

  "test_forms", "testForm", "testForm"

The changes to the *choices* sheet add the *testForm* form as one of the choices that is shown in the :tc:`user_branch` prompt (a user-directed branching prompt type). The changes on the *survey* sheet add a branch label, :tc:`testForm`, that matches the :th:`data_value` from the *choices* sheet (this branch label will be jumped to if the user selects the :tc:`testForm` selection on the :tc:`user_branch` screen). The new branch label then renders an :tc:`external_link` prompt type that has the necessary arguments to open the *testForm*.

.. note::

   You should run :file:`framework.xlsx` through the XLSX Converter to save the changes, as the :file:`framework.xlsx` should be converted again to include the latest changes.


.. _build-app-generate-formdef:

Generating :file:`formDef.json`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you have saved your :file:`.xlsx` file, you can use the XLSX Converter to create a :file:`formDef.json`. Make sure your Application Designer is running (see :doc:`app-designer-launching`) and navigate to the :guilabel:`XLSX Converter` tab. Drag the :file:`.xlsx` form or select it with the :guilabel:`Choose File` button and use the :guilabel:`Save to File System` button to save the form definition file back to the file system.

For the ongoing example, convert the :file:`app/config/assets/framework/forms/framework/framework.xlsx` using the instructions above. Then repeat this process with :file:`app/config/tables/census/forms/census/census.xlsx`

.. warning::

  The :guilabel:`Save to File System` button uses the *form_id* and *table_id* within the :file:`.xlsx` file to identify where to write the :file:`formDef.json` file. If you have copied the :file:`.xlsx` file from some other location and forgot to edit it, it may update back to that older location! If the *form_id* is equal to the *table_id*, two additional files are written that define the table's user data fields and that define the key-value properties for the table.

Once you have made these changes and used XLSX Converter on the :file:`framework.xlsx` file to update the :file:`app/config/assets/framework/forms/framework/formDef.json` file, you should see your new form show up in the :guilabel:`Preview` tab of the Application Designer. Clicking on that should open your form.

.. tip::

  If you don't see your form in the :guilabel:`Preview`, try refreshing your browser.

.. tip::

  You can also convert your forms with the :program:`Grunt` command:

  .. code-block:: console

    grunt xlsx-convert-all

.. _build-app-debugging-survey:

Debugging your Survey
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The XLSX Converter should report most problems with your survey.

If the form is not being rendered correctly but your survey generates a :file:`formDef.json` without an error, first try purging the database (dropping all the existing data tables) using the :guilabel:`Purge Database` button on the :guilabel:`Preview` tab. You will typically need to purge the database whenever you add or remove fields from your form or change their data type.

If that does not resolve the issue, try stopping the :program:`grunt` command (on Windows, :kbd:`Control-C` should produce a prompt asking to confirm whether to stop or not. On Mac, :kbd:`Control-C` kills the process with no prompt.), and re-running it. :program:`Grunt` can sometimes get overwhelmed with changes and stop working. After restarting, test your form.

If there are other problems, the contents of the JavaScript Console will be helpful to the ODK-X core team for debugging. Open the JavaScript Console by clicking the icon with the three bars in the top right, select :guilabel:`More Tools`, select :guilabel:`Developer Tools`, and then select the :guilabel:`Console` tab. Select all of the debugging output, then copy it, save it to a file, and post it to the |forum|_ or create a ticket on the `Github Issue Tracker <https://github.com/odk-x/tool-suite-X/issues>`_.

.. _build-app-move-to-device:

Moving Files To The Device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note::
  You must have USB debugging enabled on your device in order to perform this step. See `these instructions <https://www.phonearena.com/news/How-to-enable-USB-debugging-on-Android_id53909>`_ for help.

In order to see these changes on an Android device, you must first have `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_ installed on your device. Then:

  #. Connect the device to your computer via a USB cable
  #. Open a :program:`cmd` or :program:`terminal` window within the :guilabel:`Application Designer` directory (the one containing :file:`Gruntfile.js`), as described in the :doc:`app-designer-directories` documentation.
  #. Type:

  .. code-block:: console

    $ grunt adbpush

  .. note::

    If it gives you an error, you may need to run :code:`grunt adbpush -f` to force it.

  .. note::

    If you do not see the form, you may need to :ref:`reset the configuration <services-managing-reset-config>`.

This will copy all of the files under config onto your device. You should then be able to launch `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_, and it will display your form in its list of forms. Click the form to open it.

More :program:`grunt` commands can be found in :ref:`build-app-pushing`.



.. _build-app-design-view:

ODK-X Tables: Designing a Custom View
----------------------------------------

One of the most powerful aspects of ODK-X Tables is its ability to run HTML and
JavaScript pages as the skin of the app. Through a JavaScript API presented to these files, you can query the database and control the app.

Writing an app using HTML and JavaScript yields a lot of power. However, it can lead to a complicated design cycle.

The HTML and JavaScript files you write rely on the JavaScript API implemented within the ODK-X Tables APK to retrieve database values for your application. This JavaScript API, since it is implemented in the APK, makes it difficult to debug your custom views off the phone. At present, the only way to test your HTML pages is on the device. Fortunately, on Android 4.4 and higher, :program:`Chrome` can access the browser Console and set breakpoints on the device, providing a clumsy but viable debug environment.

.. _build-app-understanding-web-file:

Understanding the Web File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are several pieces of boilerplate you have to include in your own code in order to debug the files in :program:`Chrome`.

In the default Application Designer, navigate to  :file:`app/config/tables/SkipLogic/html` and open :file:`SkipLogic_list.html`. Notice the following lines in :file:`<head>`

.. Alternatively, if you are doing the running example, open :file:`app/config/tables/census/html/census_list.html`, which should have been automatically created for you. Notice the following four lines in :code:`<head>`:

.. code-block:: html

    <!-- Bootstrap CSS -->
    <link href="../../../assets/css/bootstrap-5.1.0/bootstrap.min.css" type="text/css" rel="stylesheet">

    <!-- Load internationalization definitions -->
    <script defer src="../../../assets/commonDefinitions.js"></script>
    <script defer src="../tableSpecificDefinitions.js"></script>

    <!-- Load ODK-X libs -->
    <script defer src="../../../../system/js/odkCommon.js"></script>
    <script defer src="../../../../system/js/odkData.js"></script>
    <script defer src="../../../../system/tables/js/odkTables.js"></script>

In the first line, you are making the :program:`Bootstrap` styles available to your code. :program:`Bootstrap` is a free and open-source CSS framework directed at responsive web development. In the next three lines, you are adding the *odkCommon*, *odkTables*, and *odkData* objects if they are not already provided by the browser environment. When running on the device, the ODK-X Tables APK will provide these, and the contents of these files will be ignored. When running in Application Designer on your computer, these files provide the approximate functionality of the APK, allowing you to create and debug your scripts. However, at the moment, these implementations make use of RequireJS, which the ODK-X Tables HTML files do not use (RequireJS is extensively used by ODK-X Survey). This causes these to break in Application Designer **Previews**.

More detail is provided in :doc:`tables-web-pages`.

.. _build-app-creating-web-file:

Creating Web Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To write your own file, first, decide on the *tableId* for your table and create the directory structure as shown in :ref:`build-app-creating-directory`. If you completed the example in :ref:`build-app-designing-a-form` you have already done this for the *census* survey form.

For this section, we would be looking at the example List and Detail view of the `Skip Logic <https://github.com/odk-x/app-designer/tree/basic-tables-example/app/config/tables/SkipLogic>`_ survey form.

.. note::

  These files need content from your data table to display. It is recommended that you first design a Survey form (for example, using :ref:`this guide <build-app-designing-a-form>`) which you can use to populate data. You can also prepopulate data into the database with a :file:`tables.init` file. Further instructions are available in the :ref:`tables-managing-config-at-startup` guide.

.. _build-app-creating-web-file-list-view:

Creating a List View
""""""""""""""""""""""""""

Open or create the file :file:`app/config/tables/SkipLogic/html/SkipLogic_list.html`. This will display a list of data collected with the Skip Logic form.

The file looks like this:

.. code-block:: html

      <!doctype html>
        <html lang="en">
          <head>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1">

              <!-- Bootstrap CSS -->
              <link href="../../../assets/css/bootstrap-5.1.0/bootstrap.min.css" type="text/css" rel="stylesheet">

              <!-- Load internationalization definitions -->
              <script defer src="../../../assets/commonDefinitions.js"></script>
              <script defer src="../tableSpecificDefinitions.js"></script>

              <!-- Load ODK-X libs -->
              <script defer src="../../../../system/js/odkCommon.js"></script>
              <script defer src="../../../../system/js/odkData.js"></script>
              <script defer src="../../../../system/tables/js/odkTables.js"></script>

              <!-- Load SkipLogic list view lib -->
              <script defer src="../js/SkipLogic_list.js"></script>
          </head>
          <body>
          <main id="wrapper" class="d-none my-3">
              <div class="container-fluid">
                  <h1 class="text-center display-3">Skip Logic List View</h1>

                  <div id="skipLogicList" class="vstack gap-2"></div>
              </div>
          </main>

          <template id="skipLogicListTemplate">
              <div class="card">
                  <div class="card-body">
                      <p class="skip-logic-list-name"></p>
                      <p class="skip-logic-list-order"></p>

                      <a href="#" class="btn btn-primary stretched-link skip-logic-detail-view-link">Detail View</a>
                  </div>
              </div>
          </template>

          <!-- Bootstrap JS -->
          <script src="../../../assets/js/bootstrap-5.1.0/bootstrap.bundle.min.js"></script>
          </body>
        </html>

This HTML file should be minimal. It links all the source files and provides :code:`<div>` to put the list in. Most of the work happens in the JavaScript file. Open the :file:`app/config/tables/SkipLogic/js/SkipLogic_list.js` file. Its contents should look like this:

.. code-block:: javascript

  /* global odkTables, odkData */

  'use strict';

  (function () {
    var openDetailViewOnClick = function (rowId) {
      return function () {
        odkTables.openDetailView(null, 'SkipLogic', rowId);
      };
    };

    var listViewCallbackSuccess = function (result) {
      var resultCount = result.getCount();

      var template = document.getElementById('skipLogicListTemplate');
      var listContainer = document.getElementById('skipLogicList');

      for (var i = 0; i < resultCount; i++) {
        var listItem = document.importNode(template.content, true);

        listItem
          .querySelector('.skip-logic-list-name')
          .textContent = result.getData(i, 'name');

        listItem
          .querySelector('.skip-logic-list-order')
          .textContent = result.getData(i, 'menu');

        listItem
          .querySelector('.skip-logic-detail-view-link')
          .addEventListener('click', openDetailViewOnClick(result.getRowId(i)));

        listContainer.appendChild(listItem);
      }
    };

    var listViewCallbackFailure = function (error) {
      console.error(error);
    };

    document.addEventListener('DOMContentLoaded', function () {
      odkData.getViewData(listViewCallbackSuccess, listViewCallbackFailure);

      document.getElementById('wrapper').classList.remove('d-none');
    });
  })();

The HTML and JavaScript files also depend on a few more files. For convenience, the example reuses CSS and image files from the :doc:`tables-sample-app`. Open up a default Application Designer and copy the following files to this application's directory (using the same directory paths):

  - :file:`config/assets/css/list.css`
  - :file:`config/assets/img/little_arrow.png`
  - :file:`config/assets/css/bootstrap-5.1.0/bootstrap.min.css`
  - :file:`config/assets/js/bootstrap-5.1.0/bootstrap.bundle.min.js`

.. _build-app-creating-web-file-detail-view:

Creating a Detail View
""""""""""""""""""""""""""

A *Detail View* will display the details of a record. It is commonly used alongside *List View* to provide options to browse through a data set and learn more about a particular record.

Open or create :file:`app/config/tables/SkipLogic/html/SkipLogic_detail.html`. Ensure the file looks like this:

.. code-block:: html

  <!doctype html>
  <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="../../../assets/css/bootstrap-5.1.0/bootstrap.min.css" type="text/css" rel="stylesheet">

        <!-- Load internationalization definitions -->
        <script defer src="../../../assets/commonDefinitions.js"></script>
        <script defer src="../tableSpecificDefinitions.js"></script>

        <!-- Load ODK-X libs -->
        <script defer src="../../../../system/js/odkCommon.js"></script>
        <script defer src="../../../../system/js/odkData.js"></script>
        <script defer src="../../../../system/tables/js/odkTables.js"></script>

        <!-- Load SkipLogic detail view lib -->
        <script defer src="../js/SkipLogic_detail.js"></script>
    </head>
    <body>
      <main id="wrapper" class="d-none my-3">
          <div class="container-fluid">
              <h1 class="text-center display-3">Skip Logic Detail View</h1>
              <h2 class="text-center display-6 text-secondary">Order Detail</h2>

              <div id="skipLogicDetailContainer" class="vstack gap-2 mx-4 mt-4"></div>
          </div>
      </main>

    <template id="skipLogicDetailTemplate">
        <div class="hstack gap-2 justify-content-between">
            <span class="pe-4 fw-bold skip-logic-detail-label"></span>
            <span class="d-inline-block text-end text-truncate fw-light skip-logic-detail-value"></span>
        </div>
    </template>

  <!-- Bootstrap JS -->
  <script src="../../../assets/js/bootstrap-5.1.0/bootstrap.bundle.min.js"></script>
  </body>
  </html>

This HTML file should define the user interface elements that will be populated by database calls in the JavaScript. Open or create :file:`app/config/tables/SkipLogic/js/SkipLogic_detail.js`. Ensure its contents look like this:

.. code-block:: javascript

  'use strict';

  (function () {
    var detailViewFields = {
      name: 'Name',
      state: 'State',
      menu: 'Order',
      size: 'Size',
      flavor: 'Flavor',
      box: 'Quantity',
    };

    var detailViewCallbackSuccess = function (result) {
      var template = document.getElementById('skipLogicDetailTemplate');
      var fieldsContainer = document.getElementById('skipLogicDetailContainer');

      Object.entries(detailViewFields).forEach(function (entry) {
        var fieldValue = result.get(entry[0]);

        if (fieldValue !== undefined && fieldValue !== null) {
          var detailField = document.importNode(template.content, true);

          detailField.querySelector('.skip-logic-detail-label').textContent = entry[1];
          detailField.querySelector('.skip-logic-detail-value').textContent = fieldValue;

          fieldsContainer.appendChild(detailField);
        }
      });
    };

    var detailViewCallbackFailure = function (error) {
      console.error(error);
    };

    document.addEventListener('DOMContentLoaded', function () {
      odkData.getViewData(detailViewCallbackSuccess, detailViewCallbackFailure);

      document.getElementById('wrapper').classList.remove('d-none');
    });
  })();

As with the *List View*, this view requires a separate CSS file. Copy the following file from a default Application Designer, maintaining the directory path in this application's directory:

  - :file:`config/assets/css/detail.css`


.. _build-app-creating-web-file-properties:

Defining Default View Files
""""""""""""""""""""""""""""

The :file:`.xlsx` form should be updated to indicate the default view type, and where to find the HTML files for *Detail View* and *List View*. Open :file:`app/config/tables/SkipLogic/forms/SkipLogic/SkipLogic.xlsx` and add a new worksheet titled *properties*. The worksheet has the following headers: :th:`partition`, :th:`aspect`, :th:`key`, :th:`type`, and :th:`value`.

Add the following rows to set your *List View* and *Detail View* default files:

.. list-table:: *properties* worksheet
  :header-rows: 1

  * - partition
    - aspect
    - key
    - type
    - value
  * - Table
    - default
    - defaultViewType
    - string
    - LIST
  * - Table
    - default
    - detailViewFileName
    - string
    - config/tables/SkipLogic/html/SkipLogic_detail.html
  * - Table
    - default
    - listViewFileName
    - string
    - config/tables/SkipLogic/html/SkipLogic_list.html

Follow the example above to create your tables *properties* worksheet. See :ref:`xlsx-ref-properties` for more details about specifying custom HTML files.

The :file:`.xlsx` should be run through the XLSX Converter again (:ref:`build-app-generate-formdef`) to update the configuration.

After that, you can deploy your app to your device. Open Survey and fill in a few Skip Logic records. Then, open Tables and select the *Skip Logic* table. This should automatically launch the *List View* defined above. Tapping an item in the *List View* should launch the detail view.

.. _build-app-debugging-tables:

Debugging Tables Web Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use the :program:`Chrome` browser on your computer to inspect for devices and connect to this custom screen on your Android device and debug from there. For this, you will need to set up remote debugging with the instructions found in the guide on `Remote debugging Android devices using Chrome DevTools <https://developer.chrome.com/docs/devtools/remote-debugging/>`_ and perform the following steps.
  
  #. Open up the ODK-X Tables app on your phone. 
  #. Select the table (census table created above for example) you want to debug.
  #. Open `chrome://inspect <chrome://inspect>`_ page on your computer’s :program:`Chrome` browser. Since the ODK-X Tables application uses WebViews to display your custom web pages, the inspect tab should list debug-enabled WebViews on your device. From the list, you should see the ODK-X Tables app WebView as shown in the figure below. 
  #. Click inspect below the table WebView you want to debug. 

  .. figure:: /img/app-designer-overview/odk-x-debugging.png
    :alt: Alt text. Chrome inspect tab showing ODK-X Table WebView.

    Sample inspect tool preview showing ODK-X Table WebView.

 Some useful guides include:

  - `Get Started with Debugging JavaScript in Chrome DevTools <https://developers.google.com/web/tools/chrome-devtools/javascript/>`_
  - `Get Started with Remote Debugging Android Devices <https://developers.google.com/web/tools/chrome-devtools/remote-debugging/>`_
  - `Open a WebView in DevTools <https://developer.chrome.com/docs/devtools/remote-debugging/webviews/>`_

.. warning::
  The edit-debug cycle is awkward because you must make the HTML or JavaScript change on your computer then push the change to your device, and reload the page (for example, by rotating the screen). When you do rotate the screen, however, it is rendered in a new web page, necessitating connecting to that new page to resume debugging (the prior page sits idle and will eventually be destroyed. If you don't see any activity, it is likely because you are pointing at the wrong web page. Return to inspect devices, and select the newest page).
.. note::
  If your default view is a spreadsheet view, ODK-X Table WebView will not show up in the :program:`Chrome` inspect tool.
  You will need to change the default view type to **LIST** using the instructions found in :ref:`tables-using-view-data-change-views`.

As with `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_, you can use the JavaScript Console to look for and fix errors in your HTML/JavaScript. If you are having trouble please check on the |forum|_. Keep in mind that the debug objects only emit a subset of the data in your ODK-X Tables database.

.. _build-app-pushing:

Pushing and Pulling Files
-------------------------------

.. note::
  You must have USB debugging enabled on your device in order to perform this step. See `these instructions <https://www.phonearena.com/news/How-to-enable-USB-debugging-on-Android_id53909>`_ for help.

There are several times during app development when you will need to push and pull files to and from your device.

 - The :command:`push` command is used to push the entire app directory to the device.
 - The :command:`pull` command is used to pull the database or exported CSVs from the device to the desktop computer.

.. tip::
  Exported CSVs can be used to set up :file:`tables.init` to load test data.

:program:`Grunt` tasks have been written in :file:`Gruntfile.js` that perform these operations for you.

These commands can be run anywhere within the :file:`Application Designer` directory.

  - :command:`grunt adbpush`: Pushes everything under the app directory to the device.
  - :command:`grunt adbpull-db`: Pulls the database from the device to the PC.
  - :command:`grunt adbpull-csv`: Pull the exported CSVs from the device to the PC.

The pull commands will place the pulled content in the :file:`app/output/` directory.

The database is a :program:`SQLite` database and can be viewed using :program:`SQLite Browser`. This tool can also be used to view the content of the database used by :program:`Chrome` on your computer (the location of that file is OS-dependent).

If you pull the CSV files, they will be under the :file:`output/csv/` directory. You can then copy them to the :file:`config/assets/csv/` directory and set up the :file:`tables.init` file to read them in order to provision test data for your development effort. If you need any of this data in production, you will want to sync to a server, then export the CSV files and copy them to the :file:`config/assets/csv/` directory so that they have all of their metadata field values populated.

.. tip::
  Running :command:`grunt adbpull` will perform all the pull tasks.

.. tip::
  There are a number of additional grunt tasks available. Assuming you have installed grunt and node, you can view the available tasks by running :command:`grunt --help` anywhere in the repo.

Useful Grunt Commands
~~~~~~~~~~~~~~~~~~~~~~~~

:guilabel:`grunt adbpull` : Perform all the Android Debug Bridge pull tasks.

:guilabel:`grunt adbpull-logs` : Pull any logs stored in the device for debugging purposes.

:guilabel:`grunt adbpull-csv` : Pull any exported CSV files from the device.

:guilabel:`grunt adbpush` : Perform all the Android Debug Bridge push tasks.

:guilabel:`grunt addtable:tableid` : Will create the required directory structure for an individual table, including the forms directory.

:guilabel:`grunt clean` : Wipes the device of all ODK-X data.

:guilabel:`grunt empty` : Remove unnecessary files to make an empty app-designer directory to work with.

:guilabel:`grunt killall` : Force stops survey, tables, and services on the connected device.

:guilabel:`grunt setup` : Launches the login and sync screen on the connected device.

:guilabel:`grunt uninstall` : Uninstall ODK-X tools from the connected device.

:guilabel:`grunt xlsx-convert-all` : Takes all `.xlsx` files and converts them into a `formDef.json file`. Can be used instead of the `XLSX` converter on the app designer.

Troubleshooting
~~~~~~~~~~~~~~~~~~~~

There are several issues that may occur while trying to push your survey onto your device. Below are some common issues and tips and tricks to help:

- Try checking :command:`adb -version`. If the version does not show, make sure that `Android SDK <https://docs.odk-x.org/app-designer-prereqs/?highlight=android%20debug#android-sdk>`_ is appropriately installed on your computer because this is what installs the :program:`Android Debug Bridge (adb)` software.
- Check that your computer sees your device. Enter :command:`adb devices` in the command line. Should show a *device detected*.
- Check the device to see if it has a message about authorizing the computer. If so, authorize the device.
- Check the device settings to ensure USB debugging is enabled and that the device is linked as a media device (not camera or other settings)
- Make sure your app-designer only has the necessary working files. Any random files or older versions of your survey saved within app-designer will cause the push to fail.
- Do not have any :program:`Excel` forms open on your computer. If you do, this will cause errors with $filename or ~$filename in the file path when pushing.
- Check that your computer sees your device. In your command window type the command adb devices. It should show a device detected.

.. _build-app-deploying:

Deploying an Application
----------------------------

This step requires that you first set up :doc:`cloud-endpoints-intro`.

  1. Push your application to a clean device (guide: :ref:`build-app-pushing`).

  2. Authenticate as a user in the table administrator group (guide: :ref:`services-using-change-user`).

  3. Reset the App Server (guide: :ref:`services-using-reset-app-server`).

The application is now deployed to your server. Other devices can synchronize with that server to download the application and start collecting data.

.. _build-app-deploying-updating:

Updating an Application
~~~~~~~~~~~~~~~~~~~~~~~~~

To update any app-level or table-level files, or to modify the database schema (like adding a new field to your form that adds a database column), you will need to reset the app server. Make the changes on your PC as normal, push them to the device, and reset the app server.

    .. warning::

      Resetting the app server will start a new data set. If you want to keep the old data, you should download it to a separate database.

:th:`To update versions`: 

You need to download the new `app designer <https://github.com/odk-x/app-designer/releases/latest>`_ and delete the unneeded default files using

.. code-block:: console

  $ grunt empty

Then copy over your entire :file:`config/assets` from your previous version to the new one. If you have customized anything in :th:`framework` you'll need to copy that too into the :file:`config/assets` of the new version, but in case ODK-X has also updated it, you'll need to manually merge both copies. Finally, re-convert everything using 

.. code-block:: console

  $ grunt xlsx-convert-all 

and your app designer should be set. You will also need to update the software on Android devices and the server to the same version as well.
