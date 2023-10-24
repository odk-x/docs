.. spelling::

  odkCommon
  odkData
  odkTables
  odkSurvey
  deviceId
  src
  formIds
  js
  registerListener
  hasListener
  getPlatformInfo
  stringified
  appName
  baseUri
  logLevel
  getFileAsUrl
  getRowFileAsUrl
  relativePath
  url
  tableId
  rowId
  rowPathUri
  rowpath
  uriFragment
  isString
  lookupToken
  stringToken
  localizable
  extractLangOnlyLocale
  getPreferredLocale
  getLocaleDetails
  usingDeviceLocale
  preferredLocale
  isoLanguage
  displayLanguage
  hasLocalization
  nToken
  hasFieldLocalization
  fieldName
  hasTextLocalization
  localizeText
  hasImageLocalization
  hasAudioLocalization
  hasVideoLocalization
  localizeUrl
  formPath
  toDateFromOdkTimeStamp
  dateTime
  iso
  nano
  toDateFromOdkTime
  refJsDate
  toDateFromOdkTimeInterval
  timeInterval
  padWithLeadingZeros
  padWithLeadingSpaces
  toOdkTimeStampFromDate
  jsDate
  toOdkTimeFromDate
  toOdkTimeIntervalFromDate
  loggingString
  getActiveUser
  getProperty
  propertyId
  getBaseUrl
  setSessionVariable
  elementPath
  jsonValue
  getSessionVariable
  genUUID
  constructSurveyUri
  screenPath
  elementKeyToValueMap
  doAction
  dispatchStruct
  webkit
  MediaCaptureImageActivity
  intentObject
  setData
  setPackage
  setType
  setAction
  addCategory
  componentPackage
  componentActivity
  setComponent
  getProperty
  appName
  dispatchStruct
  viewFirstQueuedAction
  removeFirstQueuedAction
  closeWindow
  resultCode
  keyValueBundle
  viewFirstQueuedAction
  refAction
  jsonValue
  urlhash
  uri
  opendatakit
  Url
  resultCodeOfAction
  newJsDate
  formId
  instanceId
  isoCountry
  displayCountry
  localizeTokenField
  setResult
  yyyy
  ddTHH
  HH
  sssssssss
  timestamp
  Timestamp
  org
  reconstructive


ODK-X WebKit
===================================

.. _injected-interfaces:

.. contents:: :local:

The Java framework on the Android device injects two Java interfaces (`odkCommonIf` and `odkDataIf`) into both Tables and Survey WebKits. Additionally, it injects one additional Java interface into each: `odkTablesIf` into Tables WebKits and `odkSurveyStateManagement` into Survey WebKits.

Within the Javascript, it is expected that all interactions with these interfaces will be done through wrapper objects. Specifically, for *odkCommonIf* and *odkDataIf*, Javascript programmers would invoke methods on the `odkCommon` and `odkData` objects defined in

  - :file:`system/js/odkCommon.js`
  - :file:`system/js/odkData.js`

The Tables-specific interface is interacted with via the `odkTables` object defined in:

  - :file:`system/tables/js/odkTables.js`

This wrapper object mostly invokes `odkCommon` to perform its actions, but does call the `odkTablesIf` injected interface's one method to load the list view portion of the split-screen detail-with-list-view layout.

The Survey interface is invoked within the Javascript that implements the survey presentation and navigation logic and should not be directly called by form designers.


.. _injected-interfaces-odkcommon:

odkCommon.js
-----------------

This creates a `window.odkCommon` object that wraps calls to the injected `odkCommonIf` Java interface. When loaded inside the App Designer, it also creates a mock implementation of the injected interface.

This `class <https://github.com/odk-x/app-designer/blob/development/app/system/js/odkCommon.js>`_ provides support for:

  #. obtaining information about the runtime environment (e.g., Android OS version, etc.)
  #. obtaining information about the currently-selected locale.
  #. obtain the active user.
  #. obtain system properties (e.g., deviceId).
  #. emitting log messages to an application log.
  #. translations of text, media files and urls.
  #. conversion functions for retrieving and storing timestamps and intervals.
  #. storing and retrieving session variables (transient values that persist for the lifetime of this WebKit).
  #. converting relative paths of configuration files and of row-level attachments into URLs suitable for use in HTML documents (e.g., image src attributes).
  #. constructing form references used to launch `ODK-X Survey <https://docs.odk-x.org/survey-using/>`_.
  #. invoking arbitrary intents (external programs) on Android devices.
  #. obtaining the results from an intent that was previously invoked.
  #. exiting the current WebKit and specifying a return intent status value and extras bundle.

The explicit session variable interfaces (:code:`odkCommon.getSessionVariable(elementPath)` and :code:`odkCommon.setSessionVariable(elementPath, value)`) provide a mechanism to preserve the state of a webpage within the Java Activity stack so that no matter how nested the call stack to external applications becomes, it can be unwound and the state of the webpage recovered. Similarly, the invoking of arbitrary intents and the retrieving of their result intent status and extras bundle (excluding byte arrays) provides direct access to Android's native application inter-operation capabilities from within the WebKit.  This interface is used within Survey for media captures; the internal methods that accomplish this are in :file:`system/survey/js/odkSurvey.js`. Within Tables, this capability is used to navigate between HTML pages for general content, list views, and detail views (largely via the higher-level methods of the `odkTables` wrapper object). As a webpage designer, there is nothing preventing you from performing media captures from Tables web pages, or from defining custom prompts within Survey that launch into Tables list views, etc. by leveraging one or the other of the `odkSurvey` or `odkTables` objects.

.. _injected-interfaces-odkdata:

odkData.js
--------------------

This creates a :code:`window.odkData` object that wraps calls to the injected `odkDataIf` Java interface. When loaded inside the App Designer, a mock implementation of the injected interface is loaded that uses W3C SQL to emulate the injected interface's capabilities.

This class provides support for asynchronous interactions with a SQL database (internally, this is implemented via a SQLite database).

The interaction to get the active user's roles would be:

.. code-block:: javascript

    // declare a success function
    var successFn = function( resultObj ) {
      // do success handling
      var roles = resultObj.getRoles();
      // this will be a list of the roles and groups the user
      // belongs to.
    };
    // declare the failure function
    var failureFn = function( errorMsg) {
      // errorMsg is a text string. Typically the getMessage()
      // of the Java Exception that occurred during processing.
      // do failure handling
    };
    //
    // make the asynchronous request
    odkData.getRoles(successFn, failureFn);

If the request failed, the `errorMsg` is the message returned from within the Java layer. As noted, this is typically the :code:`getMessage()` of an exception.

Otherwise, the :code:`resultObj` returned contains information about the outcome. This object is a wrapper object with accessor methods defined in the `odkData.js <https://github.com/odk-x/app-designer/blob/development/app/system/js/odkData.js#L349)>`_ file.

.. note::

  #. the color information is only present within Tables. It is not computed and returned within Survey.
  #. the display names will need to be localized before use. See the APIs provided by `odkCommon`.

.. _injected-interfaces-odktables:

odkTables.js
--------------------

As noted, this is here:

    :file:`system/tables/js/odkTables.js`

It provides methods to open Tables generic web pages and list and detail views. These are generally just wrappers for calls to `odkCommon` to invoke the intents for those views.

.. _injected-interfaces-odksurvey:

odkSurvey.js
------------------

As noted, this is here:

    :file:`system/survey/js/odkSurvey.js`

It provides methods to capture media files and. like `odkTables` these are generally just wrappers for calls to `odkCommon` to invoke the intents for those actions.

.. _injected-interfaces-other:

Other system/survey/js files
-----------------------------

These files are generally not used by web page developers. They implement the survey form execution logic and their functions will be broadly covered later in this document.

.. _injected-interfaces-methods:

List of Available Methods in odkCommon.js
----------------------------------------------------------

Here you will find a list of all available methods for you to use that can be found in :file:`system/js/odkCommon.js`.

We also provide access to this array of field names: in FieldNames: [ 'text', 'image', 'audio', 'video' ]

registerListener
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

listener: A listener that will be invoked when an action is available. For example, the Java code can direct a change in the JS code without it being initiated by the JS side.

Should be invoked once after registration and after all initialization is complete to ensure that any queued action is processed.

hasListener
~~~~~~~~~~~~~~~~~~~~

  **Returns**: True if there is a listener already registered.

getPlatformInfo
~~~~~~~~~~~~~~~~~~~~

  **Returns**: The platform info as a stringified JSON object containing the keys: container, version, appName, baseUri, and logLevel.

getFileAsUrl
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - relativePath: The path of a file relative to the app folder

  **Returns**: An absolute url by which the file can be accessed.

getRowFileAsUrl
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId
  - rowId
  - rowPathUri

  **Returns**: URL that media attachment can be accessed by.

Convert the rowpath value for a media attachment (For example, uriFragment) field into a url by which it can be accessed.

isString
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - obj

  **Returns**: True if obj is a String.

lookupToken
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - stringToken

  **Returns**: The content of a display object for the given token.

Note that the return might include text, hint, image, etc. that are then localizable. In general, the resulting object can be customized further in survey XLSX files by specifying overrides for these fields.

extractLangOnlyLocale
~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale: Device locale strings are of the form: language + "_" + country.

  **Returns**: The language String extracted from the locale String.

getPreferredLocale
~~~~~~~~~~~~~~~~~~~~

  **Returns**: An object representing the locale that was configured by the user in the Java-side's Device Settings.

getLocaleDetails
~~~~~~~~~~~~~~~~~~~~

  **Returns**: Object containing details about the locale.

Get an object containing details about the preferred locale (preferredLocale), whether
the preferred locale is the same as the Device's locale (usingDeviceLocale), and other
information about the device locale (isoCountry, displayCountry, isoLanguage, displayLanguage)

hasLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: True if there is some type of localization for the given i18nToken and locale OR
  if there is a 'default' localization value.

The localization might be any of: a text, image, audio, or video element (For example, the field name that can be localized is not specified).

hasFieldLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken
  - fieldName

  **Returns**: True if there is some type of localization for the given fieldName in the given
  i18nToken and locale.

localizeTokenField
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken
  - fieldName

  **Returns**: The localization for a given fieldName in a given i18nToken and locale.

hasTextLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: True if there is a localization for text in a given i18nToken and locale.

localizeText
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: The localization for text in a given i18nToken and locale.

hasImageLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: True if there is a localization for an image in a given i18nToken and locale.


hasAudioLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: True if there is a localization for audio in a given i18nToken and locale.

hasVideoLocalization
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken

  **Returns**: True if there is a localization for video in a given i18nToken and locale.

localizeUrl
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - locale
  - i18nToken
  - fieldName
  - formPath

  **Returns**: The localization for a given fieldName in a given i18nToken and locale and prefixes
  it with the given formPath if the url is not already prefixed with a slash or http prefix.

toDateFromOdkTimeStamp
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - timestamp: The ODK-X Timestamp string
    used to represent dateTime and date values. It is an iso8601-style UTC date
    extended to nanosecond precision: yyyy-mm-ddTHH:MM:SS.sssssssss. This value is assumed
    to be UTC and the value is assumed to be in the AD calendar (no BC dates please).
    'date' types use T00:00:00.000000000 for the time portion of the timestamp.

  **Returns**: A JavaScript Date() object.

Convert an ODK-X Timestamp string to a JavaScript Date() object.

NOTE: This method discards the nano fields.

toDateFromOdkTime
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - refJsDate: A Date() object.
  - time: Time to start at. 00-24hr nanosecond-extended iso8601-style representation: HH:MM:SS.sssssssss.

  **Returns**: A JavaScript Date() object.

A conversion that retrieves the LOCAL TIME ZONE year, month, day from 'refJsDate', then CONSTRUCTS A NEW DATE OBJECT beginning
with that LOCAL TIME ZONE year, month, day, and applying the time to that object and
returns the adjusted Date() object. The time is added to the zero hour, so that changes
in daylight savings and standard time do not affect the calculations (HH can reach
24 hr during fall back days).

NOTE: This method discards the nano fields.

toDateFromOdkTimeInterval
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - refJsDate: A Date() object.
  - timeInterval: Time intervals are padded with leading zeros and are of the form:
    HHHHHHHH:MM:SS.sssssssss OR HHHHHHHH:MM:SS.sssssssss-. The negative sign, if present,
    is at the far right end.

  **Returns**: A JavaScript Date() object.

A conversion that retrieves the LOCAL TIME ZONE year, month, day from 'refJsDate', then CONSTRUCTS A NEW DATE
OBJECT beginning with that UTC date and applying the +/- time interval to that object
and returns the adjusted Date() object.

If the 'refJsDate' and 00:00:00.0000 for the
time portion, if a timeInterval is positive, this produces a Date() with the time-of-day
of the time interval. For example, this works correctly for the 'time' data type.

The padded
precision of the hour allows representation of the full 9999 year AD calendar range
of time intervals.

padWithLeadingZeros
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - value: Integer
  - places: Integer number of leading zeros

  **Returns**: A string after padding the indicated integer value with leading zeros so that
  the string representation ends up with at least 'places' number of characters (more if
  the value has more significant digits than that).

Examples: padWithLeadingZeros(45, 4) => '0045'. padWithLeadingZeros(-45, 4) => '-0045'.

padWithLeadingSpaces
~~~~~~~~~~~~~~~~~~~~


  **Parameters**:

  - value: Integer
  - places: Integer number of leading zeros

  **Returns**: A string after padding the indicated integer value with leading spaces so that
  the string representation ends up with at least 'places' number of characters (more if
  the value has more significant digits than that). Note the treatment of negative values

Examples: padWithLeadingSpaces(0, 4) => '   0'. padWithLeadingSpaces(45, 4) => '  45'.
padWithLeadingSpaces(-45, 4) => '-  45'.

toOdkTimeStampFromDate
~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - jsDate: JavaScript Date. This value is assumed to be UTC and the value is assumed to be in
    the AD calendar (no BC dates please).

  **Returns**: ODK-X Timestamp.

Converts a JavaScript Date to an ODK-X Timestamp. See toDateFromOdkTimeStamp() for the
format of a timestamp. This zero-fills to extend the accuracy of the JavaScript Date
object to nanosecond accuracy.

The UTC values of the supplied JavaScript dateTime
object are used.

Values destined for 'date' types should set
the UTC time to all-zeros for the time portion of the timestamp. Or adjust this
after-the-fact in their own code.

toOdkTimeFromDate
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - jsDate: JavaScript Date. Times are padded with leading zeros
    and are 00-23hr form: HH:MM:SS.sssssssss.

  **Returns**: The LOCAL TIME of a JavaScript Date object.

Time is extracted as the millisecond offset from
the start of the local day, and then converted to a string representation. This ensures
that changes in daylight savings time / standard time are properly handled and can result
in HH being 24 during fall back days.

toOdkTimeIntervalFromDate
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - refJsDate: JavaScript Date. Time intervals are padded with leading zeros and are of the form:
    HHHHHHHH:MM:SS.sssssssss OR HHHHHHHH:MM:SS.sssssssss-. For example, the negative sign, if present,
    is at the far right end.
  - newJsDate: JavaScript Date. Time intervals are padded with leading zeros and are of the form:
    HHHHHHHH:MM:SS.sssssssss OR HHHHHHHH:MM:SS.sssssssss-. For example, the negative sign, if present,
    is at the far right end.

  **Returns**: A ODKTimeInterval that represents (newJsDate - refJsDate).

Calculates the interval of time between two JavaScript Date objects and returns an
OdkTimeInterval.

The padded
precision of the hour allows representation of the full 9999 year AD calendar range of
time intervals.

log
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - level: Levels are A, D, E, I, S, V, W.
  - loggingString: String to log.
  - detail: Detail to add to log.

Log messages using WebLogger. Given loggingString will
be logged with given detail added.

getActiveUser
~~~~~~~~~~~~~~~~~~~~
  **Returns**: Active user.

getProperty
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - propertyId

  **Returns**: Device properties.

getBaseUrl
~~~~~~~~~~~~~~~~~~~~
  **Returns**: The base url.

setSessionVariable
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - elementPath
  - jsonValue

Store a persistent key-value. This lasts throughout the duration of this screen and is retained
under screen rotations. Useful if browser cookies don't work.

getSessionVariable
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - elementPath

  **Returns**: A persistent key-value.

Retrieve a persistent key-value. This lasts throughout the duration of this screen and is retained
under screen rotations. Useful if browser cookies don't work.

genUUID
~~~~~~~~~~~~~~~~~~~~
  **Returns**: A generated globally unique id.

constructSurveyUri
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId
  - formId
  - rowId
  - screenPath
  - elementKeyToValueMap

  **Returns**: A String representing a URI.

Constructs a uri of the form "content://org.opendatakit.provider.forms/<appName>/<tableId>
/<formId>/#instanceId=<rowId>&screenPath=<screenPath>" followed by "&<key>=<value>" for each
key in the elementKeyToValueMap.

doAction
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: Can be anything -- holds reconstructive state for JS If this is null,
    then the JavaScript layer is not notified of the result of this action. It
    transparently happens and the webkit might reload as a result of the activity
    swapping out.
  - action: The intent. For example, org.opendatakit.survey.activities.MediaCaptureImageActivity
  - intentObject: An object with the following structure:

    + "uri" : intent.setData(value)
    + "data" : intent.setData(value)  (preferred over "uri")
    + "package" : intent.setPackage(value)
    + "type" : intent.setType(value)
    + "action" : intent.setAction(value)
    + "category" : either a single string or a list of strings for intent.addCategory(item)
    + "flags" : the integer code for the values to store
    + "componentPackage" : If both package and activity are specified,
    + "componentActivity" : will call intent.setComponent(new ComponentInfo(package, activity))
    + "extras" : { key-value map describing extras bundle }. If a value is of the form: opendatakit-macro(name), then substitute
      this with the result of getProperty(name). If the action begins with "org.opendatakit."
      then we also add an "appName" property into the intent extras if it was not specified.

  **Returns**: One of the following.

   - "IGNORE"                -- there is already a pending action
   - "JSONException"         -- something is wrong with the intentObject
   - "OK"                    -- request issued
   - "Application not found" -- could not find app to handle intent

Execute an action (intent call).

If the request has been issued, and the dispatchStruct is not null then
the JavaScript will be notified of the availability of a result via the
registerListener callback. That callback should fetch the results via
``odkCommon.viewFirstQueuedAction()``.
And they are removed from the queue via
``odkCommon.removeFirstQueuedAction();``

closeWindow
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - resultCode:

    + resultCode === 0 -- RESULT_CANCELLED
    + resultCode === -1  -- RESULT_OK
    + any result code >= 1 is user-defined. Unclear the level of support

  - keyValueBundle: What to set the intent's extras to.

Terminate the current webkit by calling:

activity.setResult(resultCode, intent);
finish();

Where the intent's extras are set to the content of the keyValueBundle.

This will log errors but any errors will cause a RESULT_CANCELLED exit.
See the logs for what the error was.

viewFirstQueuedAction
~~~~~~~~~~~~~~~~~~~~~~~

  **Returns**: The oldest queued action outcome or Url change or null if there are none.
  The action remains queued until removeFirstQueuedAction is called.

  - The return value is either a structure:

    + dispatchStruct: dispatchStruct,
    + action: refAction,
    + jsonValue: {

      - status: resultCodeOfAction, // 0 === success
      - result: JSON representation of Extras bundle from result intent
  - or, a string value beginning with #:

    + "#urlhash"   (if the Java code wants the JavaScript to take some action without a reload)

removeFirstQueuedAction
~~~~~~~~~~~~~~~~~~~~~~~~~~

Removes the first queued action.

List of Available Methods in odkTables.js
----------------------------------------------------------

Here you will find a list of all available methods for you to use that can be found in :file:`system/js/odkTables.js`.

isArray
~~~~~~~~

  **Parameters**

  - varToTest

  **Returns:**

  ``true`` (boolean): If varToTest is an array.

  ``false`` (boolean): If varToTest is not an array.

Returns true if the variable is an array, false otherwise.

isString
~~~~~~~~~

  **Parameters:**

  - str : The variable to be tested to determine if it is a string.

  **Returns**: The function returns a Boolean value. It returns true if the str is a string, and false if it is not a string.

This function is designed to check whether the provided variable str is a string or not.
It does so by using the typeof operator, which returns a string that indicates the type of the variable, and then it compares that string to 'string'.
If the comparison is true, it means the variable is a string, and the function returns true. If the comparison is false, the function returns false.

assertOpenTypes
~~~~~~~~~~~~~~~~

  **Parameters:**

  - fnName
  - tableId
  - where
  - args
  - paths

This function ensures that the input parameters meet the expected types for a specific function (fnName).
If any parameter is of the incorrect type, an exception is thrown to indicate the issue.
This is a common pattern in JavaScript for ensuring that functions receive the correct types of arguments.

openTable
~~~~~~~~~~

  **Parameters:**

  - dispatchStruct
  - tableId
  - sqlWhereClause
  - sqlSelectionArgs

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``

openTableToListView
~~~~~~~~~~~~~~~~~~~~

  **Parameters:**

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlWhereClause: A string representing an SQL WHERE clause (optional, can be null or undefined).
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

This function is to facilitate the interaction with tables.

openTableToListViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.


openTableToMapView
~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct
  - tableId
  - sqlWhereClause
  - sqlSelectionArgs
  - relativePath

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

openTableToMapViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

This function is similar to the ``openTableToMapView`` function but is designed to handle an arbitrary SQL query (specified in sqlCommand) rather than a simple query.

openTableToNavigateView
~~~~~~~~~~~~~~~~~~~~~~~~

**Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlWhereClause: A string representing an SQL WHERE clause (optional, can be null or undefined).
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - defaultRowId: A value representing the default row ID.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to facilitate the interaction with tables, specifically opening a table view to a navigate view within tables.
The defaultRowId allows for specifying the starting point in the navigate view, which can be helpful for users navigating through data sets.

openTableToNavigateViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - defaultRowId: A value representing the default row ID.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is similar to the previous one, but it is specifically tailored to handle arbitrary SQL queries,
providing flexibility for more complex data retrieval and navigation scenarios within odk-x tables.

openTableToSpreadsheetView
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlWhereClause: A string representing an SQL WHERE clause (optional, can be null or undefined).
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to facilitate the interaction with tables, specifically opening a table view to a spreadsheet view within the odk-x tables.
It is useful for visualizing and working with tabular data in a spreadsheet format.

openDetailView
~~~~~~~~~~~~~~~

  **Parameters**:

  dispatchStruct: An object representing the dispatch structure.
  tableId: A string representing the table ID.
  rowId: A string representing the row ID.
  relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to facilitate the interaction with data tables, allowing users to open a detail view for a specific row.
The relativePath parameter provides additional flexibility for specifying a file path if needed for the action.

openDetailViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

This function is similar to the ``openDetailView`` function but is designed to handle an arbitrary SQL query (specified in sqlCommand) rather than a simple query.

openDetailWithListView
~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - rowId: A string representing the row ID.
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to facilitate the interaction with data tables, allowing users to open a detail view with a list view for a specific row.
The ``relativePath`` parameter provides additional flexibility for specifying a file path if needed for the action.

openDetailWithListViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

This function is similar to the ``openDetailWithListView`` function but is designed to handle an arbitrary SQL query (specified in ``sqlCommand``) rather than a simple query.

setSubListView
~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.
  - sqlWhereClause: A string representing an SQL WHERE clause.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  - **Returns**: The function doesn't have a return value. Instead, it performs an action using the odkTablesIf.setSubListView function.

The purpose of this function is to set a sub-list view in the context of the application, allowing users to define and configure how data is displayed in a sub-list view within the specified table.
The ``relativePath`` parameter provides additional flexibility for specifying a file path if needed for the action.

setSubListViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.
  - sqlCommand: A string representing an SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function doesn't have a return value. Instead, it performs an action using the ``odkTablesIf.setSubListViewArbitraryQuery`` function.

This function is similar to the ``setSubListView`` function but is designed to handle an arbitrary SQL query (specified in ``sqlCommand``) rather than a simple query.

launchHTML
~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - relativePath: A string representing a relative path to an HTML file.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.MainActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to allow users to open and view HTML content specified by the ``relativePath``
parameter within the application's context, providing a way to display HTML-based content to the user.

editRowWithSurveyDefault
~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - rowId: A string representing the row ID or null.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.survey.activities.SplashScreenActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to allow users to edit a row with a default survey form specified by the ``tableId`` and ``rowId``
parameters within the application's context, providing a seamless transition to the survey form for data entry or modification.

editRowWithSurvey
~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - rowId: A string representing the row ID or null.
  - formId: A string representing the form ID or null.
  - screenPath: A string representing the screen path or null.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.survey.activities.SplashScreenActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to allow users to edit a row with a specific survey form specified by the ``tableId``, ``rowId``, ``formId``,
and screenPath parameters within the application's context, providing a seamless transition to the survey form for data entry or modification.

addRowWithSurveyDefault
~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.survey.activities.SplashScreenActivity"), and intent arguments to ``odkCommon.doAction``.

The purpose of this function is to allow users to add a new row with a default survey form specified by the ``tableId`` parameter within the application.
It generates a new row ID and sets up the necessary parameters for adding the row and launching the survey form for data entry.

addRowWithSurvey
~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An object representing the dispatch structure.
  - tableId: A string representing the table ID.
  - formId: An optional string representing the form ID (default is null if not provided).
  - screenPath: An optional string representing the screen path (default is null if not provided).
  - jsonMap: An optional JSON map (object) containing additional data (default is null if not provided).

  **Returns**: The function returns the result of calling another function odkCommon.doAction.
  It passes the dispatchStruct, target activity ("org.opendatakit.survey.activities.SplashScreenActivity"), and intent arguments to odkCommon.doAction.

The purpose of this function is to allow users to add a new row with a specific survey form specified by the ``tableId``, ``formId``, ``screenPath``, and optional ``jsonMap`` parameters within the application.
It generates a new row ID and sets up the necessary parameters for adding the row and launching the specified survey form for data entry.
