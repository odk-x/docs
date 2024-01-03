.. spelling:word-list::

  getTableMetadata
  tableMetadataCache
  getTableMetadataRevision
  putTableMetadata
  getOdkDataIf
  getViewData
  getRoles
  getDefaultGroup
  getUsers
  getAllTableIds
  whereClause
  sqlBindParams
  groupBy
  orderByElementKey
  orderByDirection
  includeKVS
  arbitraryQuery
  sqlCommand
  sqlBindParams
  getRows
  getMostRecentRow
  changeAccessFilterOfRow
  defaultAccess
  rowOwner
  groupReadOnly
  groupModify
  groupPrivileged
  updateRow
  deleteRow
  addRow
  failureCallbackFn
  addCheckpoint
  successCallbackFn
  failureCallbackFn
  saveCheckpointAsIncomplete
  columnNameValueMap
  saveCheckpointAsComplete
  deleteAllCheckpoints
  deleteLastCheckpoint
  createLocalOnlyTableWithColumns
  columnNameTypeMap
  deleteLocalOnlyTable
  insertLocalOnlyRow
  updateLocalOnlyRows
  deleteLocalOnlyRows
  simpleQueryLocalOnlyTables
  arbitrarySqlQueryLocalOnlyTables
  queueRequest
  invokeCallbackFn
  jsonResult
  cbId
  requestMap
  responseAvailable
  getter

List of Available Methods in odkData.js
----------------------------------------------------------

Here you will find a list of all available methods for you to use that can be found in :file:`system/js/odkData.js`.

_getTableMetadata
~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.

  **Returns**: The function returns the table metadata, which is an object representing information about the specified table.
  If the ``tableId`` is ``null`` or ``undefined``, the function returns ``null``.
  If the table metadata is not found in the ``_tableMetadataCache``, it returns ``null``. Otherwise, it returns the table metadata object.

This function is used to retrieve metadata (information) about a specific table.
The table metadata is stored in a cache (_tableMetadataCache).
The function takes the ``tableId`` as a parameter and checks if the table metadata exists in the cache.
If the tableId is null or ``undefined``, or if the metadata is not found in the cache, the function returns ``null``. Otherwise,
it returns the table metadata object for the specified ``tableId``.

_getTableMetadataRevision
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: A string representing the table ID.

  **Returns**: The function returns the revision (version) of the table metadata, which is a numeric value.
  If the ``tableId`` is ``null`` or ``undefined``, the function returns ``null``. If the table metadata is not found in the ``_tableMetadataCache``, it returns ``null``.
  Otherwise, it returns the revision of the table metadata.

This function is used to retrieve the revision (version) of the metadata for a specific table.
The table metadata and its revision are stored in a cache (``_tableMetadataCache``).
The function takes the ``tableId`` as a parameter and checks if the table metadata exists in the cache. If the ``tableId`` is ``null`` or ``undefined``,
or if the metadata is not found in the cache, the function returns ``null``.
Otherwise, it returns the revision (metadata version) of the table metadata for the specified ``tableId``.

_putTableMetadata
~~~~~~~~~~~~~~~~~~

  **Parameters:**

  - tableId: A string representing the table ID.
  - metadata: The metadata associated with the table.

  **Returns**: This function does not have an explicit return statement. It stores the metadata in the ``_tableMetadataCache`` for the specified ``tableId``.

This function is used to store the metadata associated with a specific table in the ``_tableMetadataCache``. The function takes two parameters: ``tableId`` and ``metadata``.
If the ``tableId`` is ``null`` or ``undefined``, the function does nothing and returns without modifying the cache.

getOdkDataIf
~~~~~~~~~~~~~

  **Parameters**: This function does not take any parameters.

  **Returns**: This function returns the ``window.odkDataIf`` object.

This function is a getter function that is used to retrieve the ``odkDataIf object`` from the global ``window`` object.

getViewData
~~~~~~~~~~~~

  **Parameters**:

  - successCallbackFn: A success callback function that is called when the view data is successfully retrieved.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the view data.
  - limit: An optional parameter that specifies the maximum number of rows to retrieve. It has a default value of ``null``.
  - offset: The number of rows to skip before starting to return rows. It has a default value of ``null``.

This function is used to retrieve view data. It takes in success and failure callback functions to handle the result of the data retrieval.
The ``limit`` and ``offset`` parameters allow you to specify how many rows to retrieve and from which position in the result set.
The function internally uses the ``getOdkDataIf().getViewData`` method to perform the data retrieval and passes the request to the ``queueRequest`` function for handling callbacks.

getRoles
~~~~~~~~~

  **Parameters**:

  - successCallbackFn: A success callback function that is called when the roles are successfully retrieved.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the roles.

This function is used to retrieve the roles associated with the current user.
It takes in success and failure callback functions to handle the result of the role retrieval.
The function internally uses the ``getOdkDataIf().getRoles`` method to perform the retrieval and passes the request to the ``queueRequest`` function for handling callbacks.

getDefaultGroup
~~~~~~~~~~~~~~~~

  **Parameters**:

  - successCallbackFn: A success callback function that is called when the default group is successfully retrieved.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the default group.

This function is used to retrieve the default group for the current user.
It takes in success and failure callback functions to handle the result of the default group retrieval.
The function internally uses the **getOdkDataIf().getDefaultGroup** method to perform the retrieval and passes the request to the **queueRequest** function for handling callbacks.

getUsers
~~~~~~~~

  **Parameters**:

  - successCallbackFn: A success callback function that is called when the list of users is successfully retrieved.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the list of users.

This function is used to retrieve the list of users.
It takes in success and failure callback functions to handle the result of the user list retrieval.
The function internally uses the ``getOdkDataIf().getUsers`` method to perform the retrieval and passes the request to the ``queueRequest`` function for handling callbacks.

getAllTableIds
~~~~~~~~~~~~~~~

  **Parameters**:

  - successCallbackFn: A success callback function that is called when the list of table IDs is successfully retrieved.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the list of table IDs.

This function is used to retrieve the list of all available table IDs.
It takes in success and failure callback functions to handle the result of the table ID retrieval.
The function internally uses the ``getOdkDataIf().getAllTableIds`` method to perform the retrieval and passes the request to the ``queueRequest`` function for handling callbacks.

query
~~~~~~

  **Parameters**:

  - tableId: The ID of the table on which to perform the query.
  - whereClause: The SQL WHERE clause for filtering the data.
  - sqlBindParams: An array of SQL bind parameters to be used in the query.
  - groupBy: The SQL GROUP BY clause for grouping the data.
  - having: The SQL HAVING clause for filtering grouped data.
  - orderByElementKey: The key for ordering the data.
  - orderByDirection: The direction (ASC or DESC) for ordering the data.
  - limit: The maximum number of rows to return.
  - offset: The number of rows to skip before starting to return rows.
  - includeKVS: A boolean value indicating whether to include key value stores in the query results.
  - successCallbackFn: A success callback function that is called when the query is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in the query.

This function is used to perform a query on a specified table.
It allows you to filter, group and sort the data in the table.
The function takes in various query parameters, including the ``whereClause``, ``groupBy``, ``orderByElementKey``, and others.
It also allows you to include Key-Value Stores (KVS) in the query results.
The query parameters are passed to the ``getOdkDataIf().query`` method, and the request is queued for handling callbacks using the ``queueRequest`` function.

arbitraryQuery
~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table on which to perform the arbitrary query.
  - sqlCommand: The SQL command for the arbitrary query.
  - sqlBindParams: An array of SQL bind parameters to be used in the query.
  - limit: The maximum number of rows to return.
  - offset: The number of rows to skip before starting to return rows.
  - successCallbackFn: A success callback function that is called when the arbitrary query is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in the arbitrary query.

This function is used to perform an arbitrary SQL query on a specified table.
You can provide a custom SQL command and bind parameters for the query.
The ``limit`` and ``offset`` parameters allow for pagination of the query results.
The function serializes the SQL bind parameters to JSON and passes the query to the ``getOdkDataIf().arbitraryQuery`` method.
Callback functions are registered to handle the success or failure of the arbitrary query.

getRows
~~~~~~~

  **Parameters**:

  - tableId: The ID of the table from which to retrieve rows.
  - rowId: The ID of the specific row to retrieve. This can be ``null`` to retrieve all rows.
  - successCallbackFn: A success callback function that is called when the retrieval of rows is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the rows.

This function is used to retrieve rows from a specified table.
You can either retrieve all rows from the table by passing ``null`` as the ``rowId``, or you can specify a particular row to retrieve.
The function uses the ``getOdkDataIf().getRows`` method to fetch the rows.
Callback functions are registered to handle the success or failure of the retrieval operation.

getMostRecentRow
~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table from which to retrieve the most recent row.
  - rowId: The ID of the specific row to retrieve, typically the one you consider as the most recent. This can be ``null`` to retrieve the most recent row from the entire table.
  - successCallbackFn: A success callback function that is called when the retrieval of the most recent row is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in retrieving the most recent row.

This function is used to retrieve the most recent row from a specified table.
You can either specify a particular row as the most recent one, or you can retrieve the most recent row from the entire table by passing ``null`` as the rowId.
The function uses the ``getOdkDataIf().getMostRecentRow`` method to fetch the most recent row.
Callback functions are registered to handle the success or failure of the retrieval operation.

changeAccessFilterOfRow
~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table to which the row belongs.
  - defaultAccess: The default access control for the row.
  - rowOwner: The access control for the row owner.
  - groupReadOnly: The access control for a group with read-only permission.
  - groupModify: The access control for a group with modify permission.
  - groupPrivileged: The access control for a privileged group.
  - rowId: The ID of the specific row for which access control is to be changed.
  - successCallbackFn: A success callback function that is called when the access control change operation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in changing the access control.

This function is used to change the access control filter settings of a specific row in a table.
It allows you to set access control settings for various user categories (e.g., the row owner, different groups) for a specific row.
The function uses the ``getOdkDataIf().changeAccessFilterOfRow`` method to update the access control settings for the row.
Callback functions are registered to handle the success or failure of the access control change operation. For more information about Row-level Access Filters, checkout `here <https://docs.odk-x.org/data-permission-filters/#row-level-access-filters>`

updateRow
~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table to which the row belongs.
  - columnNameValueMap: A JSON object representing the column name to new value mapping for the row.
  - rowId: The ID of the specific row to be updated.
  - successCallbackFn: A success callback function that is called when the row update operation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in updating the row.

This function is used to update a specific row in a table with new values for the specified columns.
It takes a JSON object ``columnNameValueMap`` that maps column names to their new values.
The function uses the ``getOdkDataIf().updateRow`` method to update the row with the provided values.
Callback functions are registered to handle the success or failure of the update operation.

deleteRow
~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table from which the row should be deleted.
  - columnNameValueMap: A JSON object representing the column name to value mapping for identifying the row to be deleted.
  - rowId: The ID of the specific row to be deleted.
  - successCallbackFn: A success callback function that is called when the row deletion operation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in deleting the row.

This function is used to delete a specific row from a table.
It takes a JSON object ``columnNameValueMap`` that maps column names to their values, and a ``rowId`` to identify the row to be deleted.
The function uses the ``getOdkDataIf().deleteRow`` method to delete the row based on the provided criteria.
Callback functions are registered to handle the success or failure of the delete operation.

addRow
~~~~~~~

  Parameters:

  - tableId: The ID of the table to which the new row should be added.
  - columnNameValueMap: A JSON object representing the column name to value mapping for the new row.
  - rowId: The ID for the new row.
  - successCallbackFn: A success callback function that is called when the row addition operation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in adding the row.

This function is used to add a new row to a table.
It takes a JSON object ``columnNameValueMap`` that maps column names to their values for the new row.
The ``rowId`` is used to specify the ID of the new row.
The function uses the ``getOdkDataIf().addRow`` method to add the new row to the specified table.
Callback functions are registered to handle the success or failure of the addition operation.

addCheckpoint
~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table where the checkpoint should be added.
  - columnNameValueMap: A JSON object representing the column name to value mapping for the checkpoint.
  - rowId: The ID for the checkpoint.
  - successCallbackFn: A success callback function that is called when the checkpoint addition operation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in adding the checkpoint.

This function is used to add a checkpoint to a table.
A checkpoint is a saved state or record of the data at a specific point in time.
It takes a JSON object ``columnNameValueMap`` that maps column names to their values for the checkpoint.
The ``rowId`` is used to specify the ID of the checkpoint.
The function uses the ``getOdkDataIf().addCheckpoint`` method to add the checkpoint to the specified table.
Callback functions are registered to handle the success or failure of the addition operation. For more information about check points see `here <https://docs.odk-x.org/services-using/#resolving-checkpoint-issues>`

saveCheckpointAsIncomplete
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table where the checkpoint should be saved as incomplete.
  - columnNameValueMap: A JSON object representing the column name to value mapping for the incomplete checkpoint.
  - rowId: The ID for the incomplete checkpoint.
  - successCallbackFn: A success callback function that is called when the operation to save the checkpoint as incomplete is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in saving the checkpoint as incomplete.

This function is used to save a checkpoint as incomplete in a table.
An incomplete checkpoint is typically used to represent an ongoing or partially filled-out form or data entry.
It takes a JSON object ``columnNameValueMap`` that maps column names to their values for the incomplete checkpoint.
The ``rowId`` is used to specify the ID of the incomplete checkpoint.
The function uses the ``getOdkDataIf().saveCheckpointAsIncomplete`` method to save the checkpoint as incomplete in the specified table.
Callback functions are registered to handle the success or failure of the operation. For more information about check points see `here <https://docs.odk-x.org/services-using/#resolving-checkpoint-issues>`

saveCheckpointAsComplete
~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table where the checkpoint should be saved as complete.
  - columnNameValueMap: A JSON object representing the column name to value mapping for the complete checkpoint.
  - rowId: The ID for the complete checkpoint.
  - successCallbackFn: A success callback function that is called when the operation to save the checkpoint as complete is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in saving the checkpoint as complete.

This function is used to save a checkpoint as complete in a table. A complete checkpoint typically represents a fully filled-out form or completed data entry.
It takes a JSON object ``columnNameValueMap`` that maps column names to their values for the complete checkpoint.
The ``rowId`` is used to specify the ID of the complete checkpoint.
The function uses the ``getOdkDataIf().saveCheckpointAsComplete`` method to save the checkpoint as complete in the specified table.
Callback functions are registered to handle the success or failure of the operation. For more information about check points see `here <https://docs.odk-x.org/services-using/#resolving-checkpoint-issues>`

deleteAllCheckpoints
~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table from which all checkpoints for a specific row should be deleted.
  - rowId: The ID of the row for which all checkpoints should be deleted.
  - successCallbackFn: A success callback function that is called when the operation to delete all checkpoints is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in deleting all checkpoints.

This function is used to delete all checkpoints associated with a specific row in a table.
It takes the ``tableId`` and ``rowId`` as parameters to identify the target row and its associated checkpoints.
The function uses the ``getOdkDataIf().deleteAllCheckpoints`` method to perform the deletion.
Callback functions are registered to handle the success or failure of the operation. For more information about check points see `here <https://docs.odk-x.org/services-using/#resolving-checkpoint-issues>`

deleteLastCheckpoint
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the table from which the last checkpoint for a specific row should be deleted.
  - rowId: The ID of the row for which the last checkpoint should be deleted.
  - successCallbackFn: A success callback function that is called when the operation to delete the last checkpoint is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in deleting the last checkpoint.

This function is used to delete the last checkpoint associated with a specific row in a table.
It takes the ``tableId`` and ``rowId`` as parameters to identify the target row and its last checkpoint.
The function uses the ``getOdkDataIf().deleteLastCheckpoint`` method to perform the deletion.
Callback functions are registered to handle the success or failure of the operation. For more information about check points see `here <https://docs.odk-x.org/services-using/#resolving-checkpoint-issues>`

createLocalOnlyTableWithColumns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table that you want to create.
  - columnNameTypeMap: A map of column names to their respective data types. This map defines the columns of the local-only table.
  - successCallbackFn: A success callback function that is called when the local-only table creation is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in creating the local-only table.

This function is used to create a local-only table with the specified table ID and column definitions.
The ``columnNameTypeMap`` parameter is a map that defines the column names and their associated data types for the local-only table.
The function uses the ``getOdkDataIf().createLocalOnlyTableWithColumns`` method to perform the table creation.
Callback functions are registered to handle the success or failure of the operation.

deleteLocalOnlyTable
~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table that you want to delete.
  - successCallbackFn: A success callback function that is called when the local-only table deletion is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in deleting the local-only table.

This function is used to delete a local-only table with the specified table ID.
It calls the ``getOdkDataIf().deleteLocalOnlyTable`` method to perform the table deletion.
Callback functions are registered to handle the success or failure of the operation.

insertLocalOnlyRow
~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table where you want to insert a new row.
  - columnNameValueMap: An object that represents the column names and their corresponding values for the new row.
  - successCallbackFn: A success callback function that is called when the insertion of the local-only row is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in inserting the local-only row.

This function is used to insert a new row into a local-only table with the specified table ID.
It takes an object ``columnNameValueMap`` where keys are column names and values are the corresponding values for the new row.
The ``getOdkDataIf().insertLocalOnlyRow`` method is called to perform the row insertion.
Callback functions are registered to handle the success or failure of the operation.

updateLocalOnlyRows
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table where you want to update rows.
  - columnNameValueMap: An object that represents the column names and their corresponding values that you want to update in the rows.
  - whereClause: A SQL WHERE clause that specifies the conditions for which rows should be updated.
  - sqlBindParams: An array of SQL bind parameters used in the WHERE clause, allowing for dynamic conditions.
  - successCallbackFn: A success callback function that is called when the update of local-only rows is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in updating the local-only rows.

This function is used to update rows in a local-only table with the specified table ID.
It takes an object ``columnNameValueMap`` where keys are column names and values are the corresponding values that you want to update in the rows.
The ``whereClause`` allows you to specify conditions for which rows should be updated, and ``sqlBindParams`` can be used for dynamic conditions.
The ``getOdkDataIf().updateLocalOnlyRows`` method is called to perform the row updates.
Callback functions are registered to handle the success or failure of the operation.

deleteLocalOnlyRows
~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table from which you want to delete rows.
  - whereClause: A SQL WHERE clause that specifies the conditions for which rows should be deleted.
  - sqlBindParams: An array of SQL bind parameters used in the WHERE clause, allowing for dynamic conditions.
  - successCallbackFn: A success callback function that is called when the deletion of local-only rows is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in deleting the local-only rows.

This function is used to delete rows from a local-only table with the specified table ID.
It allows you to specify conditions for which rows should be deleted using the ``whereClause``.
``sqlBindParams`` can be used for dynamic conditions. The ``getOdkDataIf().deleteLocalOnlyRows`` method is called to perform the row deletions.
Callback functions are registered to handle the success or failure of the operation.

simpleQueryLocalOnlyTables
~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table you want to query.
  - whereClause: A SQL WHERE clause that specifies the conditions for the query.
  - sqlBindParams: An array of SQL bind parameters used in the WHERE clause for dynamic conditions.
  - groupBy: A SQL GROUP BY clause for grouping query results.
  - having: A SQL HAVING clause for filtering grouped results.
  - orderByElementKey: The element key by which the query results should be ordered.
  - orderByDirection: The direction (ASC or DESC) in which the results should be ordered.
  - limit: The maximum number of rows to return. If null, no limit is applied.
  - offset: The number of rows to skip before starting to return rows. If null, no offset is applied.
  - successCallbackFn: A success callback function that is called when the query is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in the query.

This function is used to query local-only tables with the specified table ID.
You can provide conditions for the query using the ``whereClause`` and ``sqlBindParams`` for dynamic conditions.
You can also specify grouping, having, ordering, and result limits.
The ``getOdkDataIf().simpleQueryLocalOnlyTables`` method is used to perform the query, and callback functions are registered to handle the query's success or failure.

arbitrarySqlQueryLocalOnlyTables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  **Parameters**:

  - tableId: The ID of the local-only table you want to query.
  - sqlCommand: The SQL command that specifies the query to be executed.
  - sqlBindParams: An array of SQL bind parameters used in the SQL command for dynamic conditions.
  - limit: The maximum number of rows to return. If null, no limit is applied.
  - offset: The number of rows to skip before starting to return rows. If null, no offset is applied.
  - successCallbackFn: A success callback function that is called when the query is successful.
  - failureCallbackFn: A failure callback function that is called when there is an error in the query.

This function is used to perform an arbitrary SQL query on local-only tables with the specified table ID.
You can provide the SQL query as ``sqlCommand`` and include dynamic parameters using ``sqlBindParams``.
You can also specify a limit on the number of rows to return and an offset to skip rows.
The ``getOdkDataIf().arbitrarySqlQueryLocalOnlyTables`` method is used to execute the SQL query, and callback functions are registered to handle the success or failure of the query.

queueRequest
~~~~~~~~~~~~~

  **Parameters**:

  - type: A string that specifies the type of the request.
  - successCallbackFn: A callback function to be executed upon a successful response.
  - failureCallbackFn: A callback function to be executed upon a failed response.

This function is responsible for queuing requests by adding them to the ``_requestMap`` array, which holds information about active requests.
It generates a unique callback ID (``cbId``) for each request. The ``type`` parameter is used to specify the type of the request.
Callback functions (``successCallbackFn`` and ``failureCallbackFn``) are associated with the request for handling success and failure.

invokeCallbackFn
~~~~~~~~~~~~~~~~~

  **Parameters**:

  - jsonResult: The result of an asynchronous operation, typically containing the response data.
  - cbId: The callback ID associated with the request.

This function is used to handle the results of asynchronous operations and execute the appropriate callbacks. Here's how it works:

It checks if ``cbId`` is not null or undefined. If it is, it logs an error and returns.

If there's an error message in the ``jsonResult``, it sets the ``errorMsg`` variable to that error message.
The error message can be included in the response to indicate a failure.

It iterates through the ``_requestMap`` array, searching for the request with a matching ``callbackId`` (``cbIdNum``).
When a matching request is found, it removes it from the _requestMap.

If an error message is present (``errorMsg``), it logs an error and checks if the error indicates unauthorized access.
If so, it displays an access denied message and triggers the failure callback if it exists.

If no error is found in the response, it logs a success message and executes the success callback.
It also creates a ``reqData`` object from the result data and passes it to the success callback.

If no matching request is found in the ``_requestMap``, it logs an error indicating that no callback was found for the given ``cbId``.

This function essentially routes the result data to the appropriate success or failure callback based on the associated callback ID.
It also handles error messages and unauthorized access scenarios.

responseAvailable
~~~~~~~~~~~~~~~~~~

It sets up a ``setTimeout`` function to execute a block of code asynchronously.
Inside the ``setTimeout`` function, it does the following:
Calls ``that.getOdkDataIf().getResponseJSON()`` to retrieve the response data as a JSON string.
Parses the JSON string into a JavaScript object, which is stored in the ``result`` variable.
Extracts the callback function name (as a string) from the ``callbackJSON`` property of the ``result`` object.
Calls the ``invokeCallbackFn`` function with the ``result`` object and the callback function name.
