.. spelling::
  androidlibrary
  androidcommon
  gradle
  Gradle
  prebuilt
  configs
  Artifactory
  Jacoco

Build Scripts
====================

.. _build-scripts-prerequisites:

Prerequisites
------------------

The Android tools, like most Android projects, use `Gradle <https://gradle.org/>`_ for compilation scripting. Before reading this document, you should be familiar with `Gradle for Android <https://developer.android.com/studio/build/index.html>`_.


.. _build-scripts-directory-structure:

Directory Structure
------------------------

The build scripts for the Android tools expect a particular directory structure. They expect a parent directory that contains each of them at the same level. This is **optional**.

If you had all of the Android tools checked out your directory structure would look like this::

  /opendatakit/
      /androidlibrary/
      /androidcommon/
      /gradle-config/
      /scan/
      /sensorsframework/
      /sensorsinterface/
      /services/
      /survey/
      /tables/

There are two cases where this directory structure makes a difference:

  - **Library Projects**:

    - If androidlibrary and androidcommon are present in the same directory, according to the above structure, as the Android tools, then they will build against the local copy. If you want to make changes to Services and androidlibrary simultaneously, for example, this structure would be necessary.

    - If the library projects are not present in the above configuration then a prebuilt binary will be downloaded according to the flavor you are building. For example, new binaries are posted on Snapshot for each commit, or on Master for each release.

  - **Gradle Config**: If the gradle-config project is present in the above configuration, the gradle files in that folder will be used. Otherwise the release version specifies in :file:`settings.gradle` will be used.

.. _build-scripts-building:


Building the Android Tools
-------------------------------

The simplest way to build the tools is often to press the build button in Android Studio. However, the command line can also be used. To invoke the gradle wrapper, enter the root level of the project to be built and run a command that looks like this:

.. code-block:: console

  ./gradlew clean assembleSnapshotBasic

If you are on :program:`Windows` use :file:`gradlew.bat` instead.

.. note::

  If you are building with Android Studio, you will need to select the correct build variant. This is important when you don't have androidlibrary or androidcommon in your :ref:`build-scripts-directory-structure`. These are discussed more in the :ref:`next section <build-scripts-flavors>`.

.. warning::

  The Android tools have a release signing key unique to the ODK-X applications. This key provides authentication for a form of communication between the application called IPC calls. Communication between the applications can only happen when the application signing keys are a match. 
  
  You can find more information on Android app signing in the official `Android Studio documentation <https://developer.android.com/studio/publish/app-signing>`_. Additionally, the key is tied to the Google Maps API key and checked by the Google Maps library.
  
  When you compile the Android tools locally, they get assigned a new key called a default debug key. Your compiled application will only be able to communicate with another locally compiled application because their default debug keys are the same.
  
  It is important to know this because your locally compiled application cannot communicate with other ODK-X Android apps unless the apps are locally compiled. 

.. _build-scripts-flavors:

Flavors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Android tools use two dimensions of `product flavors <https://developer.android.com/studio/build/build-variants.html#product-flavors>`_. The first dimension determines the version of the dependencies to pull. Each of the Android tools depends on the androidlibrary library project, and some depend on androidcommon as well. Binary versions of these are posted to :program:`Maven` and :program:`Ivy` repositories corresponding to the latest version of each of the three branches:

  - **Snapshot** is used if you are running the *development* branch. A new version of the libraries is automatically posted with each new commit that is merged.
  - **Demo** is used if you are running the *demo* branch.
  - **Master** is used if you are running the *master* branch. These are release versions that have been tested and posted by hand.

.. warning::

  The ODK-X tools prefers pull requests to *development*. In unusual circumstances when *development* is undergoing heavy change we may accept pull requests to *demo* or *master* depending on the level of incompatibility that might exist.

The other dimension determines whether to apply changes necessary to run the UI tests. The two options are:

  - **Basic** is used for normal builds
  - **Uitest** is used for builds that will run the UI tests.

Therefore, if you wanted to build the normal version of the *master* branch, you would run:

.. code-block:: console

  ./gradlew clean assembleMasterBasic

See :ref:`build-scripts-building-ui-tests` for an example of the UI testing flavor.

.. _build-scripts-building-linting:

Running Lint
~~~~~~~~~~~~~~~~~~

To run Lint:

.. code-block:: console

  ./gradlew clean lintSnapshotBasicRelease

.. _build-scripts-building-unit-tests:

Unit Testing
~~~~~~~~~~~~~~~~~~

To run unit tests:

.. code-block:: console

  ./gradlew clean testSnapshotBasicDebug

.. _build-scripts-building-connected-tests:

Connected Testing
~~~~~~~~~~~~~~~~~~

To run the connected device tests:

.. code-block:: console

  ./gradlew clean connectedSnapshotBasicDebugAndroidTest

.. _build-scripts-building-ui-tests:

UI Testing
~~~~~~~~~~~~~~~~~~

To run the UI tests:

.. code-block:: console

  ./gradlew clean connectedSnapshotUitestDebugAndroidTest


.. note::

  The previous commands can be run together. For example, to run the two unit test commands you would run:

  .. code-block:: console

      ./gradlew clean testSnapshotBasicDebug connectedSnapshotBasicDebugAndroidTest

Build Variants
~~~~~~~~~~~~~~~~~~


ODK-X has a modular framework design with inter-dependencies between various ODK-X tools. To manage accepting code contributions, bug fixes, and other enhancements that might affect other tools in an unforeseen way ODK-X uses a 3 staged release workflow that involves 3 branches.

- development: the branch where new development, upgrades, and features are contributed and tested
- demo: This branch is the last stable version of development. This provides a staging area used for testing before moving to an official release. This is where preview releases are staged.
- master: The current stable release.

Since the branches are at different stages of development the dependency libraries are at different stages of development. To make sure you are building against the correct dependencies you need to either checkout a local copy of the dependencies using the same branch name in the same directory OR you can adjust the build variant to match the dependencies causing Gradle and Android Studio to fetch the correct dependencies when compiling. Each build variant represents a different version of your app that you can build.

.. note::

  The build variant corresponding to the source branches:

  1. **development**:  **snapshotBasicRelease** is the build variant that corresponds to a release build of the development branch. **snapshotBasicDebug** is the build variant that corresponds to a debug build of the development branch. This branch is where the new development, upgrades, and features are contributed and tested.
  2. **demo**:  **demoBasicRelease** is the build variant that corresponds to a release build of the demo branch. **demoBasicDebug** is the build variant that corresponds to a debug build of the demo branch. This is the preview release of an application before launching the official release. This branch can be used by project maintainers for testing out the application if it is not creating any errors.
  3. **master**:  **masterBasicRelease** is the build variant that corresponds to a release build of the master branch. **masterBasicDebug** is the build variant that corresponds to a debug build of the master branch. It is the official and stable release of an application, this is the latest release of ODK-X application.

Gradle creates a build variant for every possible combination of the product flavor and build types that you configure. As different code bases is used for each flavor variant.

Steps to change build variants in Android Studio:

1. To change the build variant Android Studio uses, select **Build** > **Select Build Variant** in the menu bar.
2. The Build Variants panel has two columns: **Module** and **Active Build Variant**. The **Active Build Variant** value for the module determines which build variant the Android Studio deploys to your connected device and is visible in the editor.

.. image:: /img/survey-using/build-variants.*
    :alt: "Change build variant"
    :class: device-screen-vertical

.. _build-scripts-internal:

Internal Build Files
------------------------

This section covers the files that are stored inside each of the Android projects. These paths follow the same pattern for each Android project, just the project name differs. For clarity, the root level of the project will be referred to as :file:`root` and the app/lib level of the project will be referred to as :file:`app`. So, for example, the path :file:`services/services_app/build.gradle` becomes :file:`project/app/build.gradle`.

.. _build-scripts-internal-settings:

:file:`root/settings.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file determines where to look for the :ref:`build-scripts-external`.

The :code:`gradleConfigVersion` corresponds to a tag in the `Gradle Config repository <https://github.com/odk-x/gradle-config>`_. If the local gradle files are not found, the versions of those files committed under that tag will be downloaded and used.


Before downloading those files, this file checks the local :ref:`build-scripts-directory-structure` for gradle-config. If it is found, that is used. Whichever path is chosen, this linkage is established here and made available to all the rest of the gradle files.

This file also looks for library projects in the local directory structure. If they are found, they are built as dependencies. If not, their prebuilt binaries are downloaded.

.. _build-scripts-internal-build:

:file:`root/build.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file establishes URLs to use for resolving dependencies. Links to each of the prebuilt binary repositories are included (demo, master, snapshot).

The dependency versions are also managed here.

.. _build-scripts-internal-inner-build:

:file:`root/app/build.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The file contains the specific build configuration for this project. The ODK-X projects do not differ greatly from established norms in this configuration. However, many of the constants and version numbers are stored in :ref:`build-scripts-external-variables` and variables are used here. This allows the tools to be upgraded and maintained in unison, and they can be forced to stay in sync.

This file also establishes the product flavors, signing configs, build types, and other standard options found in many Android projects. The unique aspect comes in the :code:`dependencies` block. The different flavors have different dependencies (they will download different prebuilt binaries for their library projects). The demo and snapshot flavors build against the latest from their repositories, while the master flavor is hard-coded to a specific version.

.. _build-scripts-external:

External Build Files
------------------------

These build files are centralized in the `Gradle Config repository <https://github.com/odk-x/gradle-config>`_. They included shared configuration, versions, and tasks.

.. _build-scripts-external-variables:

:file:`variables.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains all the versions and variables strings shared among the projects. Most notably this includes the release code version, the compile targets, the :program:`Java` version, and the composed project build and variant names.

.. _build-scripts-external-runnables:

:file:`runnables.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains miscellaneous Gradle tasks necessary to the ODK-X tools. Mostly these exist to make Jenkins or Artifactory work.

.. _build-scripts-external-uitests:

:file:`uitests.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains tasks to make the UI tests work on a build server. In particular, they disable animations and grant external storage permissions.

.. _build-scripts-external-remotet:

:file:`remote.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains the paths to the remote versions of these files stored on Github or in the directory structure. This is used by :ref:`build-scripts-internal-settings` to fetch the appropriate files.

.. _build-scripts-external-publish:

:file:`publish.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains parameters related to the different binary publishing versions the tools use.

.. _build-scripts-external-jacoco:

:file:`jacoco.gradle`
~~~~~~~~~~~~~~~~~~~~~~~~~~~

This file contains definitions and versions for the Jacoco code coverage tool.
