.. spelling:word-list::

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
  isArray
  varToTest
  typeof
  assertOpenTypes
  args
  fnName
  openTable
  sqlSelectionArgs
  TableDisplayActivity
  openTableToListView
  openTableToMapView
  sqlWhereClause
  odkTablesIf
  setSubListView
  setSubListViewArbitraryQuery
  sqlCommand
  launchHTML
  MainActivity
  editRowWithSurveyDefault
  editRowWithSurvey
  addRowWithSurveyDefault
  addRowWithSurvey
  jsonMap
  SplashScreenActivity
  openTableToListViewArbitraryQuery
  openTableToMapViewArbitraryQuery
  openTableToNavigateView
  defaultRowId
  defaultRowId
  openTableToNavigateViewArbitraryQuery
  defaultRowId
  openTableToSpreadsheetView
  openDetailView
  openDetailViewArbitraryQuery
  openDetailWithListView
  openDetailWithListViewArbitraryQuery

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
  - sqlWhereClause: A string representing a SQL WHERE clause (optional, can be null or undefined).
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
  - sqlCommand: A string representing a SQL command.
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
  - sqlCommand: A string representing a SQL command.
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
  - sqlWhereClause: A string representing a SQL WHERE clause (optional, can be null or undefined).
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
  - sqlCommand: A string representing a SQL command.
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
  - sqlWhereClause: A string representing a SQL WHERE clause (optional, can be null or undefined).
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
  - sqlCommand: A string representing a SQL command.
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
  - sqlCommand: A string representing a SQL command.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  **Returns**: The function returns the result of calling another function ``odkCommon.doAction``.
  It passes the ``dispatchStruct``, target activity ("org.opendatakit.tables.activities.TableDisplayActivity"), and intent arguments to ``odkCommon.doAction``.

This function is similar to the ``openDetailWithListView`` function but is designed to handle an arbitrary SQL query (specified in ``sqlCommand``) rather than a simple query.

setSubListView
~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.
  - sqlWhereClause: A string representing a SQL WHERE clause.
  - sqlSelectionArgs: An array representing SQL selection arguments (optional, can be null or undefined).
  - relativePath: A string representing a relative path (optional, can be null or undefined).

  - **Returns**: The function doesn't have a return value. Instead, it performs an action using the odkTablesIf.setSubListView function.

The purpose of this function is to set a sub-list view in the context of the application, allowing users to define and configure how data is displayed in a sub-list view within the specified table.
The ``relativePath`` parameter provides additional flexibility for specifying a file path if needed for the action.

setSubListViewArbitraryQuery
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.
  - sqlCommand: A string representing a SQL command.
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
