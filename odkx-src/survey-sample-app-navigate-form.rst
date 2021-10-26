.. spelling::
  prepopulate
  prepopulated

Navigating a Form
========================

.. _survey-sample-app-navigating-form:

Forms in Survey are defined in HTML, CSS, and JavaScript. A default look-and-feel, along with an extensive selection of prompt widgets, is provided by the ODK-X framework, but this can be customized by your organization.

To navigate forms using the default look-and-feel:

  - Tap on the name of the survey in the top left to access a pop-up menu of options.
  - Tap the :guilabel:`Back` or :guilabel:`Next` buttons in the top right of the form to navigate through the form.

Let's fill out the instance of the :menuselection:`Example Form` that we opened in the previous section. After tapping the :guilabel:`Create new instance` button you should see the following screen:

  .. image:: /img/survey-sample-app/survey-example-start.*
    :alt: Survey Example Form Start Screen
    :class: device-screen-vertical

Use the :guilabel:`Next` button in the top right to progress to the first question.

.. _survey-sample-app-initial-value:

Initial Value
--------------------

  .. image:: /img/survey-sample-app/survey-example-initial-rating.*
    :alt: Survey Example Form Initial Rating
    :class: device-screen-vertical

This prompt asks you to give the form an initial rating. Its purpose in this example is to show how Survey can use previously collected data to populate and calculate later fields. Enter any number you like and it will be used later.

Press the :guilabel:`Next` button in the top right to progress to the next question.

.. _survey-sample-app-prompt-selection:

Prompt Selection
-----------------------

  .. image:: /img/survey-sample-app/survey-example-prompt-selection.*
    :alt: Survey Example Form Prompt Selection
    :class: device-screen-vertical

This prompt allows you to choose which sections of the form to complete. Survey form navigation can be completely customized, even at runtime, to include or exclude sections, repeat portions, jump directly to different prompts based on entered values, and more. For this example, we will complete the :menuselection:`label features`, :menuselection:`computed assignment of initial values`, and :menuselection:`custom template` sections. However, feel free to enter any combination you like and explore.

Press the :guilabel:`Next` button in the top right to progress to the next question. Note that we skip the :menuselection:`intent launching` section and progress directly to :menuselection:`label features`.

.. _survey-sample-app-label-features:

Label Features
----------------------

  .. image:: /img/survey-sample-app/survey-example-label-html.*
    :alt: Survey Example Form Label Customization
    :class: device-screen-vertical

This prompt shows that the label and hint fields of the prompt can be customized by editing the HTML and CSS. This allows your organization to modify the look-and-feel of the prompts to suit their needs.

Press :guilabel:`Next` to see a more complex example:

  .. image:: /img/survey-sample-app/survey-example-label-media.*
    :alt: Survey Example Form Label Customization
    :class: device-screen-vertical

This prompt shows a label that has been edited to include media files including an image and an audio clip. Press play on the audio clip to hear a bird call. However, media can also be added via spreadsheet columns, which is generally easier.

Press :guilabel:`Next` to advance to the next section.

.. _survey-sample-app-reuse-values:

Reading Previous Values
---------------------------

  .. image:: /img/survey-sample-app/survey-example-name-prompt.*
    :alt: Survey Example Form Name Prompt
    :class: device-screen-vertical

This prompt is requesting a value that will be used to render the next question. Enter any name you like and press :guilabel:`Next`.

  .. image:: /img/survey-sample-app/survey-example-name-use.*
    :alt: Survey Example Form Name Used
    :class: device-screen-vertical

This prompt shows that a prompt can use a previously collected value in the rendering of a prompt. For example, a subject's name and gender could be used to properly address them throughout a survey.

Press :guilabel:`Next` to see another example of data reuse.

  .. image:: /img/survey-sample-app/survey-example-coffee-prompt.*
    :alt: Survey Example Form Coffee Prompt
    :class: device-screen-vertical

This prompt is requesting a value that will be used to render the next question. Enter any value you like and press :guilabel:`Next`.

  .. image:: /img/survey-sample-app/survey-example-coffee-autofill.*
    :alt: Survey Example Form Coffee Autofill
    :class: device-screen-vertical

This prompt will prepopulate the entered data with the value from the previous prompt. In general, you can prepopulate a prompt with any previously collected value. In another example, you might record a subject's address and then prepopulate that address on their household members address prompts.

Press :guilabel:`Next` to advance to the next section.

.. _survey-sample-app-custom-template:

Custom Template
-----------------------

  .. image:: /img/survey-sample-app/survey-example-graph-prompt.*
    :alt: Survey Example Form Graph Prompt
    :class: device-screen-vertical

This prompt is requesting data that will be used in the next prompt to render a custom template. We will also use this to demonstrate constraints. Enter an age that is greater than 20 and press :guilabel:`Next`.

  .. image:: /img/survey-sample-app/survey-example-graph-validate.*
    :alt: Survey Example Form Graph Validate
    :class: device-screen-vertical

Survey will not allow you to progress until you've entered a valid value. This validation can be done dynamically as well. For example, you could have a running average of crop heights you have measured, and disallow crop heights that differ by more than three standard deviations.

Enter a valid age, weight, and height, and press :guilabel:`Next`.

  .. image:: /img/survey-sample-app/survey-example-graph-render.*
    :alt: Survey Example Form Graph Render
    :class: device-screen-vertical

This prompt will show the data point you entered in the previous prompt, rendered on a plot of average weights. This is a custom prompt defined in JavaScript for this example, it is not a default display option provided by the ODK-X framework. It demonstrates that Survey can be customized to whatever level your organization requires without the effort of rewriting and recompiling the Android tools.

Press :guilabel:`Next` to advance to the next section.

.. _survey-sample-app-update-value:

Update Value
---------------------

  .. image:: /img/survey-sample-app/survey-example-update-value.*
    :alt: Survey Example Form Update Value
    :class: device-screen-vertical

This prompt is prepopulated from the initial value we entered in the first prompt. Whatever you entered for that field will be filled in here. Updating this field will update the value in the database.

This was the final prompt for this example. Press :guilabel:`Next` to advance to the final screen of the form.

.. _survey-sample-app-complete:

Complete Form Instance
------------------------------

  .. image:: /img/survey-sample-app/survey-example-finish.*
    :alt: Survey Example Form Complete
    :class: device-screen-vertical

This screen tells you that you have reached the end of the form. This **does not** mean that you have entered data for every field. In this example we skipped the majority of the questions. From here you can navigate backwards and update any of your previous answers. You can also use the button in the upper left to navigate to previous questions or leave the form instance.

.. warning::

  Updating answers may cause later prompts to render differently or be invalidated.

To save the form instance, either press :guilabel:`Finalize` or :guilabel:`Incomplete`.

  - :guilabel:`Finalize` will mark the form as *Finalized* and indicate that this instance is completed.
  - :guilabel:`Incomplete` will mark the form as *Incomplete* and indicate that this form should be revisited and completed in the future. Use this option to save your progress if you have to pause while filling out a form.

After pressing one of the above options you will be returned to the Survey home-screen. If you select :menuselection:`Example Form` again you will see this form instance at the top of the list of previously saved instances, with the date you saved it and the state you chose.

.. _survey-sample-app-navigating-learn-more:

Learn More
-------------------

For more detailed instructions on navigating Survey forms, view the :ref:`survey-navigating` guide.


