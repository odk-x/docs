Sample Application Overview
===================================

.. _survey-sample-app-overview:

We have provided a sample application to help you acquaint yourself with the various features of `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_. 

.. list-table:: Six sample forms feature comparison table
  :header-rows: 1

  * - | Sample Name
    - OVERVIEW
    - IS A SUBFORM?
    - OTHER DETAILS
  * - | **Example Form**
    - a form with many examples of data entry widgets.
    - No
    -
  * - | **Grid Screen Form**
    - | a form used to demonstrate a new screen layout 
      | that allows fully customized prompt placement.
    - No
    -
  * - | **Household Survey**
    - a form used to gather information about a household. 
    - No
    - | To operate correctly, this requires the *Household Member Survey* sub-form and the *Education* sub-form 
      | (you should not open those sub-forms directly, they are launched from within Household Survey).
  * - | **Select Examples** 
    - | a form with several examples of selected widgets, including widgets 
      | that access data on Yahoo servers, and others that access CSV files for their choice lists.
    - No
    - It also demonstrates the use of custom CSS styles to change the look of the form.
  * - | **Household Member Survey**
    - a form used to gather information about household members. 
    - | Yes, a sub-form of the Household Survey form 
      | (you should not open it directly -- it is launched from within Household Survey). 
    - | `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_ eliminates the repeat group concept and replaces it with sub-forms.
      | From within the Household Survey, you navigate into this sub-form by entering information about individuals in a household.

  * - | **Education**
    - a form used to gather educational information about household members. 
    - | Yes, a sub-form of the Household Survey form 
      | (you should not open it directly -- it is launched from within Household Survey). 
    - | This sub-form saves information to the same underlying data table (household_members) as the Household Member Survey form,
      | but it asks different questions. This demonstrates the use of multiple forms to revise different sets of values within a data table. 
      | From within the Household Survey, you navigate into this form when you enter education information about individuals in a household.

 
.. note::

  Since the *Education* and *Household Member Survey* operate on the same table, you will only see five tables in ODK-X Tables and in the Cloud Endpoint even though there are six forms.

.. _survey-sample-app-overview-learn-more:

Learn More
-----------------------

For instructions on creating your own Survey applications, view the :ref:`build-app-designing-a-form` guide.

