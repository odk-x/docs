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
  getHashString
  getFormsProviderUri
  platInfo
  convertHashStringToSurveyUri
  hashString
  getFormPath
  openInstance
  initialValuesElementKeyToValueMap
  addInstance
  initialValuesElementKeyToValueMap
  openLink
  relativeOrFullUrl
  fileAttachmentAction
  intentAction
  existingFileAttachmentFieldContent
  captureImageexistingFileAttachmentFieldContent
  captureSignature
  existingFileAttachmentFieldContent
  captureAudio
  existingFileAttachmentFieldContent
  captureVideo
  existingFileAttachmentFieldContent
  chooseImage
  existingFileAttachmentFieldContent
  chooseAudio
  existingFileAttachmentFieldContent
  chooseVideo
  existingFileAttachmentFieldContent
  scanBarcode
  captureGeopoint
  captureGeopointUsingMap
  captureImage

List of Available Methods in odkSurvey.js
----------------------------------------------------------

Here you will find a list of all available methods for you to use that can be found in :file:`system/js/odkSurvey.js`.

isArray
~~~~~~~~

  **Parameters**

  - varToTest: The variable to be tested for array type.

  **Returns**: Boolean value, `true` if the variable is an array, `false` otherwise.

Checks if a given variable is an array and returns a boolean indicating whether it is an array or not.

isString
~~~~~~~~~~~~~~

  **Parameters**

  - str: The value to be checked for string type.

  **Returns**: Boolean value, true if the value is a string, false otherwise.

Determines whether a given value is a string and returns a boolean value accordingly.

getHashString
~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The table ID that the survey is associated with.
  - formId: The form ID for the survey.
  - instanceId: This parameter represents a unique instance ID. It is expected to be either a string or null.
  - screenPath: The path to the specific screen or prompt.
  - elementKeyToValueMap: A mapping of element keys to corresponding values (optional).

  **Returns**: A hash string for constructing a survey URI.

Generates a hash string for constructing a survey URI.
This hash string is used for specifying the parameters required for survey navigation.

getFormsProviderUri
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - platInfo: Platform information, typically containing app-specific details.
  - tableId: The table ID of the form.
  - formId: The form ID.

  **Returns**: The forms provider URI.

Constructs a forms provider URI for accessing specific forms within the ODK-X Survey app.

convertHashStringToSurveyUri
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - hashString: The hash string to be converted.

  **Returns**: A complete survey URI for use in ODK-X Survey.

Converts a hash string into a complete survey URI suitable for invoking ODK-X Survey.
This function is used to reformat hash strings for proper survey navigation.

getFormPath
~~~~~~~~~~~~

  **Parameters**:

  - tableId: The table ID associated with the form.
  - formId: The form ID.

  **Returns**: The file path for the specified form.

Retrieves the file path of a specific form based on the table and form IDs. This is used to locate the form's assets.

openInstance
~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct: An optional parameter for dispatching actions or results.
  - tableId: The table ID for the form.
  - formId: The form ID.
  - instanceId: This parameter represents a unique instance ID. It is expected to be either a string or null.
  - initialValuesElementKeyToValueMap: A mapping of element keys to initial values for pre-filling form fields (optional).

  **Returns**: The result of the action, typically indicating whether the action was successful.

Opens a new survey instance within the ODK-X Survey app, allowing users to start collecting data for a specific form.

addInstance
~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - formId (String): The form ID.
  - initialValuesElementKeyToValueMap (Object): A mapping of element keys to initial values for pre-filling form fields (optional).

  **Returns**: The result of the action, typically indicating whether the action was successful.

Adds a new survey instance within the ODK-X Survey app, generating a new instance ID and allowing users to start data collection for a specific form.

openLink
~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - relativeOrFullUrl (String): The URL to be opened.

  **Returns**: The result of the action, typically indicating whether the action was successful.

Opens a link within the ODK-X Survey app, either using a relative or full URL, allowing for navigation to external web content or internal survey screens.

fileAttachmentAction
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - intentAction (String): The intent action for the specific file attachment action.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the file attachment action, typically indicating whether the action was successful.

Initiates file attachment actions such as capturing images, audio, or video, enabling users to attach files to a specific form instance.

captureImage
~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the image capture action, typically indicating whether the action was successful.

Initiates the action to capture an image, allowing users to take pictures and attach them to a specific form instance.

captureSignature
~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the signature capture action, typically indicating whether the action was successful.

Initiates the action to capture a signature, enabling users to create digital signatures and attach them to a specific form instance.

captureAudio
~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the audio capture action, typically indicating whether the action was successful.

Initiates the action to capture audio, allowing users to record audio clips and attach them to a specific form instance.

captureVideo
~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the video capture action, typically indicating whether the action was successful.

Initiates the action to capture video, allowing users to record video clips and attach them to a specific form instance.

chooseImage
~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the image selection action, typically indicating whether the action was successful.

Initiates the action to choose an image from the device's gallery or file system, allowing users to attach existing images to a specific form instance.

chooseAudio
~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the audio file selection action, typically indicating whether the action was successful.

Initiates the action to choose an audio file from the device's storage, allowing users to attach existing audio files to a specific form instance.

chooseVideo
~~~~~~~~~~~~

  **Parameters:**

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.
  - tableId (String): The table ID for the form.
  - instanceId (String): This parameter represents a unique instance ID. It is expected to be either a string or null.
  - existingFileAttachmentFieldContent (Object): Existing file attachment field content, including content type and URI (optional).

  **Returns**: The result of the video file selection action, typically indicating whether the action was successful.

Initiates the action to choose a video from the device's storage, allowing users to attach existing videos to a specific form instance.

scanBarcode
~~~~~~~~~~~~

  **Parameters:**

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.

  **Returns:** The result of the barcode scanning action.

Initiates a barcode scanning action within the ODK-X Survey app, allowing users to scan barcodes for data collection.

captureGeopoint
~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.

  **Returns**: The result of the geopoint capture action.

Initiates a geopoint capture action within the ODK-X Survey app, enabling users to capture geographic coordinates (latitude and longitude).

captureGeopointUsingMap
~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - dispatchStruct (Any): An optional parameter for dispatching actions or results.

  **Returns**: The result of the geopoint capture action using a map.

Initiates a geopoint capture action using a map within the ODK-X Survey app, allowing users to select geographic coordinates interactively.
