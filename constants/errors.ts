import { CustomError } from 'models/error';
interface CustomErrors {
  [key: string]: CustomError;
}
const ERRORS: CustomErrors = {
  ERROR_UNAUTHORIZED: {
    code: 'ERROR_UNAUTHORIZED',
    level: 'error',
    status: 401,
    description: 'No credentials or invalid ones'
  },
  ERROR_FORBIDDEN: {
    code: 'ERROR_FORBIDDEN',
    level: 'error',
    status: 403,
    description: 'User is unauthorized'
  },
  ERROR_SERVER: {
    code: 'ERROR_SERVER',
    level: 'error',
    status: 500,
    description: 'Server error'
  },
  ERROR_GET_NODES: {
    code: 'ERROR_GET_NODES',
    level: 'error',
    status: 500,
    description: 'Error getting nodes'
  },
  ERROR_GET_CHILDREN_NODES: {
    code: 'ERROR_GET_CHILDREN_NODES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting childrenNodes'
  },
  ERROR_GET_NODES_ON_EDIT: {
    code: 'ERROR_GET_NODES_ON_EDIT',
    level: 'error',
    status: 500,
    description: 'Error getting nodes on edit mode'
  },
  ERROR_GET_NODE_BY_ID: {
    code: 'ERROR_GET_NODE_BY_ID',
    level: 'error',
    status: 500,
    description: 'Error getting node by id'
  },
  ERROR_GET_TREES: {
    code: 'ERROR_GET_TREES',
    level: 'error',
    status: 500,
    description: 'Error getting trees'
  },
  ERROR_GET_TREE_BY_ID: {
    code: 'ERROR_GET_TREE_BY_ID',
    level: 'error',
    status: 500,
    description: 'Error getting tree by ID'
  },
  ERROR_GET_TREES_BY_CRITERIA: {
    code: 'ERROR_GET_TREES_BY_CRITERIA',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting trees by criteria'
  },
  ERROR_GET_TREES_BY_TYPE: {
    code: 'ERROR_GET_TREES_BY_TYPE',
    level: 'error',
    status: 500,
    description: 'Error getting trees by type'
  },
  ERROR_GET_TREES_BY_APP: {
    code: 'ERROR_GET_TREES_BY_APP',
    level: 'error',
    status: 500,
    description: 'Error getting trees by app'
  },
  ERROR_GET_TREES_BY_VERSION_TYPE: {
    code: 'ERROR_GET_TREES_BY_VERSION_TYPE',
    level: 'error',
    status: 500,
    description: 'Error getting trees by version and type'
  },
  ERROR_GET_NODES_TREE: {
    code: 'ERROR_GET_NODES_TREE',
    level: 'error',
    status: 500,
    description: 'Error getting all nodes of a tree'
  },
  ERROR_GET_PATIENTS: {
    code: 'ERROR_GET_PATIENTS',
    level: 'error',
    status: 500,
    description: 'Error getting patients'
  },
  ERROR_GET_INIT_PATIENTS: {
    code: 'ERROR_GET_INIT_PATIENTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting initial patients'
  },
  ERROR_GET_DIAGNOSTICS: {
    code: 'ERROR_GET_DIAGNOSTICS',
    level: 'error',
    status: 500,
    description: 'Error getting diagnostics'
  },
  ERROR_GET_INIT_DIAGNOSTICS: {
    code: 'ERROR_GET_INIT_DIAGNOSTICS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting initial diagnostics'
  },
  ERROR_GET_DIAGNOSTICS_BY_CRITERIA: {
    code: 'ERROR_GET_DIAGNOSTICS_BY_CRITERIA',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting diagnostics by specified criteria'
  },
  ERROR_GET_DIAGNOSTIC_BY_ID: {
    code: 'ERROR_GET_DIAGNOSTICS_BY_ID',
    level: 'error',
    status: 500,
    description: 'Error getting diagnostic by ID'
  },
  ERROR_GET_APPS: {
    code: 'ERROR_GET_APPS',
    level: 'error',
    status: 500,
    description: 'Error getting apps'
  },
  ERROR_APP_NOT_FOUND: {
    code: 'ERROR_APP_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'App not found in database'
  },
  ERROR_APP_ALREADY_EXISTS: {
    code: 'ERROR_APP_ALREADY_EXISTS',
    level: 'error',
    status: 400,
    description: 'App already exists in database'
  },
  ERROR_APP_FORMAT: {
    code: 'ERROR_APP_FORMAT',
    level: 'error',
    status: 400,
    description: 'Invalid app format'
  },
  ERROR_CREATE_APP: {
    code: 'ERROR_CREATE_APP',
    level: 'error',
    status: 500,
    description: 'Error creating app in database'
  },
  ERROR_CREATE_INIT_APP: {
    code: 'ERROR_CREATE_INIT_APP',
    level: 'error',
    status: 500,
    description: 'Error creating initial app in database'
  },
  ERROR_CREATE_SERVER_APP: {
    code: 'ERROR_CREATE_SERVER_APP',
    level: 'error',
    status: 500,
    description: 'Error creating server app in database'
  },
  ERROR_UPDATE_APP: {
    code: 'ERROR_UPDATE_APP',
    level: 'error',
    status: 500,
    description: 'Error updating app in database'
  },
  ERROR_UPDATE_SERVER_APP: {
    code: 'ERROR_UPDATE_SERVER_APP',
    level: 'error',
    status: 500,
    description: 'Error updating server app in database'
  },
  ERROR_DELETE_APP: {
    code: 'ERROR_DELETE_APP',
    level: 'error',
    status: 500,
    description: 'Error deleting app in database'
  },
  ERROR_DELETE_SERVER_APP: {
    code: 'ERROR_DELETE_SERVER_APP',
    level: 'error',
    status: 500,
    description: 'Error deleting server app in database'
  },
  ERROR_GET_USERS: {
    code: 'ERROR_GET_USERS',
    level: 'error',
    status: 500,
    description: 'Error getting users'
  },
  ERROR_GET_INIT_USERS: {
    code: 'ERROR_GET_INIT_USERS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting initial users'
  },
  ERROR_GET_USER_BY_ID: {
    code: 'ERROR_GET_USER_BY_ID',
    level: 'error',
    status: 500,
    description: 'Error getting user by ID'
  },
  ERROR_GET_USER_BY_NID: {
    code: 'ERROR_GET_USER_BY_NID',
    level: 'error',
    status: 500,
    description: 'Error getting user by NID'
  },
  ERROR_CREATE_USER: {
    code: 'ERROR_CREATE_USER',
    level: 'error',
    status: 500,
    description: 'Error creating user'
  },
  ERROR_CREATE_INIT_USER: {
    code: 'ERROR_CREATE_INIT_USER',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating initial user'
  },
  ERROR_GENERATE_TOKEN: {
    code: 'ERROR_GENERATE_TOKEN',
    level: 'error',
    status: 500,
    description: 'Error generating user token'
  },
  ERROR_INVALID_TOKEN: {
    code: 'ERROR_INVALID_TOKEN',
    level: 'error',
    status: 400,
    description: 'Token format or type is not correct'
  },
  ERROR_EXPIRED_TOKEN: {
    code: 'ERROR_EXPIRED_TOKEN',
    level: 'error',
    status: 401,
    description: 'Token is expired'
  },
  ERROR_FACTORY_FORMAT: {
    code: 'ERROR_FACTORY_FORMAT',
    level: 'error',
    status: 400,
    description: 'Error factory format'
  },
  ERROR_CREATE_FACTORY: {
    code: 'ERROR_CREATE_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error creating factory'
  },
  ERROR_CREATE_SERVER_FACTORY: {
    code: 'ERROR_CREATE_SERVER_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error creating server factory'
  },
  ERROR_FACTORY_NOT_FOUND: {
    code: 'ERROR_FACTORY_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Factory not found in database'
  },
  ERROR_UPDATE_FACTORY: {
    code: 'ERROR_UPDATE_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error updating factory'
  },
  ERROR_UPDATE_SERVER_FACTORY: {
    code: 'ERROR_UPDATE_SERVER_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error updating server factory'
  },
  ERROR_DELETE_FACTORY: {
    code: 'ERROR_DELETE_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error deleting factory'
  },
  ERROR_DELETE_SERVER_FACTORY: {
    code: 'ERROR_DELETE_SERVER_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error deleting server factory'
  },
  ERROR_GET_FACTORIES: {
    code: 'ERROR_GET_FACTORIES',
    level: 'error',
    status: 500,
    description: 'Error getting factories'
  },
  ERROR_FACTORY_ALREADY_EXISTS: {
    code: 'ERROR_FACTORY_ALREADY_EXISTS',
    level: 'error',
    status: 400,
    description: 'Factory already exists in database'
  },
  ERROR_FACTORY_ID_ALREADY_EXISTS: {
    code: 'ERROR_FACTORY_ID_ALREADY_EXISTS',
    level: 'error',
    status: 400,
    description: 'Factory ID already exists in database. Please use a different ID'
  },
  ERROR_SELECT_LATEST_FACTORY_ID: {
    code: 'ERROR_GET_LATEST_FACTORY_ID',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting latest factory ID'
  },
  ERROR_GENERATE_ID: {
    code: 'ERROR_GENERATE_ID',
    level: 'error',
    status: 500,
    description: 'Error generating ID'
  },
  ERROR_GENERATE_TOPIC: {
    code: 'ERROR_GENERATE_TOPIC',
    level: 'error',
    status: 500,
    description: 'Error generating topic'
  },
  ERROR_LOGIN: {
    code: 'ERROR_LOGIN',
    level: 'error',
    status: 500,
    description: 'Error login user'
  },
  ERROR_LOGOUT: {
    code: 'ERROR_LOGOUT',
    level: 'error',
    status: 500,
    description: 'Error logout user'
  },
  ERROR_INVALID_FILE_FORMAT: {
    code: 'ERROR_INVALID_FILE_FORMAT',
    level: 'error',
    status: 400,
    description: 'Invalid file format'
  },
  ERROR_INVALID_SCORE: {
    code: 'ERROR_INVALID_SCORE',
    level: 'error',
    status: 400,
    description: 'Score out of range'
  },
  ERROR_INIT_REMOTE_FACTORY: {
    code: 'ERROR_INIT_REMOTE_FACTORY',
    level: 'error',
    status: 500,
    description: 'Error while creating data on remote factory'
  },
  ERROR_GET_DATABASE: {
    code: 'ERROR_GET_DATABASE',
    level: 'error',
    status: 500,
    description: 'Error while getting database'
  },
  ERROR_SELECT_DATABASE_TABLE_NAMES: {
    code: 'ERROR_SELECT_DATABASE_TABLE_NAMES',
    level: 'error',
    status: 500,
    description: 'Error while selecting table names in the database'
  },
  ERROR_TABLE_NOT_FOUND: {
    code: 'ERROR_TABLE_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'At least one of the specified tables does not exist in database'
  },
  ERROR_CREATE_DATABASE: {
    code: 'ERROR_CREATE_DATABASE',
    level: 'error',
    status: 500,
    description: 'Error while creating database'
  },
  ERROR_GET_REGIONS: {
    code: 'ERROR_GET_REGIONS',
    level: 'error',
    status: 500,
    description: 'Error while getting regions'
  },
  ERROR_GET_ACTIVITIES: {
    code: 'ERROR_GET_ACTIVITIES',
    level: 'error',
    status: 500,
    description: 'Error while getting activities'
  },
  ERROR_GET_ACTIVITIES_BY_CRITERIA: {
    code: 'ERROR_GET_ACTIVITIES_BY_CRITERIA',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting activities by specified criteria'
  },
  ERROR_INIT: {
    code: 'ERROR_INIT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while backend init'
  },
  ERROR_GET_EXCEL_FILE: {
    code: 'ERROR_GET_EXCEL_FILE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting Excel file'
  },
  ERROR_GET_REGION_LABELS: {
    code: 'ERROR_GET_REGION_LABELS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting region labels'
  },
  ERROR_GET_NESTED_REGIONS: {
    code: 'ERROR_GET_NESTED_REGIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting nested regions'
  },
  ERROR_CREATE_MQTT_MESSAGE: {
    code: 'ERROR_CREATE_MQTT_MESSAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating MQTT Message'
  },
  ERROR_GET_MQTT_MESSAGES: {
    code: 'ERROR_GET_MQTT_MESSAGES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting MQTT messages'
  },
  ERROR_SEND_MQTT_MESSAGE: {
    code: 'ERROR_SEND_MQTT_MESSAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while sending specified MQTT message'
  },
  ERROR_MQTT_MESSAGE_NOT_FOUND: {
    code: 'ERROR_MQTT_MESSAGE_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'MQTT message not found in database'
  },
  ERROR_CHECK_MQTT_RECEIVED: {
    code: 'ERROR_CHECK_MQTT_RECEIVED',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting MQTT received message'
  },
  ERROR_CREATE_MQTT_RECEIVED: {
    code: 'ERROR_CREATE_MQTT_RECEIVED',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating MQTT received message'
  },
  ERROR_CHECK_EXISTS: {
    code: 'ERROR_CHECK_EXISTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while checking if exists by ID'
  },
  ERROR_RESEND_MQTT_MESSAGES: {
    code: 'ERROR_RESEND_MQTT_MESSAGES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while trying to resend MQTT messages. Maybe mqttmessages index does not exist?'
  },
  ERROR_SEND_ACKNOWLEDGE: {
    code: 'ERROR_SEND_ACKNOWLEDGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while sending MQTT acknowledge'
  },
  ERROR_MQTT_ON_MESSAGE: {
    code: 'ERROR_MQTT_ON_MESSAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error when MQTT message has been received from server'
  },
  ERROR_CREATE_CONSTANT: {
    code: 'ERROR_CREATE_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating single constant'
  },
  ERROR_CREATE_SERVER_CONSTANT: {
    code: 'ERROR_CREATE_SERVER_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating constant received from mqtt'
  },
  ERROR_CREATE_BULK_SERVER_CONSTANTS: {
    code: 'ERROR_CREATE_BULK_SERVER_CONSTANTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk constants received from mqtt'
  },
  ERROR_CREATE_BULK_CONSTANTS: {
    code: 'ERROR_CREATE_BULK_CONSTANTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating several constants'
  },
  ERROR_GET_CONSTANT: {
    code: 'ERROR_GET_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting constant'
  },
  ERROR_CONSTANT_NOT_FOUND: {
    code: 'ERROR_CONSTANT_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Constant not found in database'
  },
  ERROR_SELECT_BY_CONDITION: {
    code: 'ERROR_SELECT_BY_CONDITION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting row by condition from specified table'
  },
  ERROR_INSERT_APP: {
    code: 'ERROR_INSERT_APP',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting app into database'
  },
  ERROR_INSERT_BULK_APPS: {
    code: 'ERROR_INSERT_BULK_APPS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting several apps into database'
  },
  ERROR_INSERT_BULK_I18N_APPS: {
    code: 'ERROR_INSERT_BULK_I18N_APPS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting bulk i18n-Apps into database'
  },
  ERROR_INSERT_BULK_APP_TREES: {
    code: 'ERROR_INSERT_BULK_APP_TREES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting bulk appTrees into database'
  },
  ERROR_CREATE_APP_PERMISSIONS: {
    code: 'ERROR_CREATE_APP_PERMISSIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating app permissions'
  },
  ERROR_INSERT_APP_PERMISSION: {
    code: 'ERROR_INSERT_APP_PERMISSION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting appPermission into database'
  },
  ERROR_SELECT_APPS: {
    code: 'ERROR_SELECT_APPS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting appPermission into database'
  },
  ERROR_UPDATE_APP_SERVICE: {
    code: 'ERROR_UPDATE_APP_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating app in database'
  },
  ERROR_INSERT_CONSTANT: {
    code: 'ERROR_INSERT_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting constant into database'
  },
  ERROR_INSERT_BULK_CONSTANTS: {
    code: 'ERROR_INSERT_BULK_CONSTANTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting several constants into database'
  },
  ERROR_INSERT_FACTORY: {
    code: 'ERROR_INSERT_FACTORY',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting factory into database'
  },
  ERROR_INSERT_BULK_FACTORIES: {
    code: 'ERROR_INSERT_BULK_FACTORIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting bulk factories into database'
  },
  ERROR_SELECT_FACTORIES: {
    code: 'ERROR_SELECT_FACTORIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting factories from database'
  },
  ERROR_UPDATE_FACTORY_SERVICE: {
    code: 'ERROR_UPDATE_FACTORY_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating factories in database'
  },
  ERROR_INSERT_MQTTRECEIVED: {
    code: 'ERROR_INSERT_MQTTRECEIVED',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting MQTTReceived into database'
  },
  ERROR_SELECT_MQTTMESSAGES: {
    code: 'ERROR_SELECT_MQTTMESSAGES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting MQTTMessages from database'
  },
  ERROR_INSERT_MQTTMESSAGE: {
    code: 'ERROR_INSERT_MQTTMESSAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting MQTTMessages into database'
  },
  ERROR_CHECK_MQTTRECEIVED: {
    code: 'ERROR_CHECK_MQTTRECEIVED',
    level: 'error',
    status: 500,
    description: 'Unexpected error while checking MQTTMessage exists'
  },
  ERROR_DELETE_BY_CONDITION: {
    code: 'ERROR_DELETE_BY_CONDITION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting resource(s) by condition in database'
  },
  ERROR_SELECT_ALL: {
    code: 'ERROR_SELECT_ALL',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting all resources from specified table from database'
  },
  ERROR_CREATE_INIT: {
    code: 'ERROR_CREATE_INIT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating init table in database'
  },
  ERROR_EXISTS_INIT: {
    code: 'ERROR_EXISTS_INIT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while checking if init table exists in database'
  },
  ERROR_DELETE_DB: {
    code: 'ERROR_DELETE_DB',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting database'
  },
  ERROR_INVALID_DATE: {
    code: 'ERROR_INVALID_DATE',
    level: 'error',
    status: 400,
    description: 'Invalid date. Format must be ISO standard (YYYY-MM-DD) or (DD-MM-YYYY) and cannot be a future date'
  },
  ERROR_INVALID_DATABASE_DATA: {
    code: 'ERROR_INVALID_DATABASE_DATA',
    level: 'error',
    status: 400,
    description: 'Invalid data. Maybe an obligatory table is not present in the input data'
  },
  ERROR_CREATE_IMAGE: {
    code: 'ERROR_CREATE_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving image in the database'
  },
  ERROR_CREATE_BULK_IMAGES: {
    code: 'ERROR_CREATE_BULK_IMAGES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving multiple images in the database'
  },
  ERROR_INSERT_IMAGE: {
    code: 'ERROR_INSERT_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting image in the database'
  },
  ERROR_INSERT_BULK_IMAGES: {
    code: 'ERROR_INSERT_BULK_IMAGES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting several images in the database'
  },
  ERROR_GET_IMAGE: {
    code: 'ERROR_GET_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting image from the database'
  },
  ERROR_IMAGE_NOT_FOUND: {
    code: 'ERROR_IMAGE_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Image not found in the database. Check ID is correct'
  },
  ERROR_DELETE_IMAGE: {
    code: 'ERROR_DELETE_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unpexpected error while trying to delete an image from the database'
  },
  ERROR_IMAGE_EXISTS: {
    code: 'ERROR_IMAGE_EXISTS',
    level: 'error',
    status: 400,
    description: 'Image with specified reference already exists in the database'
  },
  ERROR_CREATE_DOCUMENT: {
    code: 'ERROR_CREATE_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving document in the database'
  },
  ERROR_CREATE_BULK_DOCUMENTS: {
    code: 'ERROR_CREATE_BULK_DOCUMENTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving multiple documents in the database'
  },
  ERROR_INSERT_DOCUMENT: {
    code: 'ERROR_INSERT_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting document in the database'
  },
  ERROR_INSERT_BULK_DOCUMENTS: {
    code: 'ERROR_INSERT_BULK_DOCUMENTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting several documents in the database'
  },
  ERROR_GET_DOCUMENT: {
    code: 'ERROR_GET_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting document from the database'
  },
  ERROR_DOCUMENT_NOT_FOUND: {
    code: 'ERROR_DOCUMENT_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Document not found in the database. Check ID is correct'
  },
  ERROR_DELETE_DOCUMENT: {
    code: 'ERROR_DELETE_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unpexpected error while trying to delete a document from the database'
  },
  ERROR_DOCUMENT_EXISTS: {
    code: 'ERROR_DOCUMENT_EXISTS',
    level: 'error',
    status: 400,
    description: 'Document with specified reference already exists in the database'
  },
  ERROR_CREATE_SERVER_IMAGE: {
    code: 'ERROR_CREATE_SERVER_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving image received from server in the database'
  },
  ERROR_CREATE_BULK_SERVER_IMAGE: {
    code: 'ERROR_CREATE_BULK_SERVER_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving bulk images received from server in the database'
  },
  ERROR_DELETE_SERVER_IMAGE: {
    code: 'ERROR_DELETE_SERVER_IMAGE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting image from server in the database'
  },
  ERROR_CREATE_SERVER_DOCUMENT: {
    code: 'ERROR_CREATE_SERVER_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving document received from server in the database'
  },
  ERROR_CREATE_BULK_SERVER_DOCUMENTS: {
    code: 'ERROR_CREATE_BULK_SERVER_DOCUMENTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while saving bulk documents received from server in the database'
  },
  ERROR_DELETE_SERVER_DOCUMENT: {
    code: 'ERROR_CREATE_SERVER_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting document from server in the database'
  },
  ERROR_SEND_APP: {
    code: 'ERROR_SEND_APP',
    level: 'error',
    status: 500,
    description: 'Unexpected error while sending app through MQTT'
  },
  ERROR_FIXES: {
    code: 'ERROR_FIXES',
    level: 'error',
    status: 500,
    description: 'Unexpected error executing a fix'
  },
  ERROR_SELECT_IMAGES_BY_TREE_ID: {
    code: 'ERROR_SELECT_IMAGES_BY_TREE_ID',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting images from the database'
  },
  ERROR_SELECT_DOCUMENTS_BY_TREE_ID: {
    code: 'ERROR_SELECT_DOCUMENTS_BY_TREE_ID',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting documents from the database'
  },
  ERROR_CREATE_INTERVENTION: {
    code: 'ERROR_CREATE_INTERVENTION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating an intervention in the database'
  },
  ERROR_INTERVENTION_FORMAT: {
    code: 'ERROR_INTERVENTION_FORMAT',
    level: 'error',
    status: 400,
    description: 'Invalid body or missing a required field'
  },
  ERROR_INSERT_INTERVENTION: {
    code: 'ERROR_INSERT_INTERVENTION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting an intervention in the database'
  },
  ERROR_GET_INTERVENTIONS: {
    code: 'ERROR_GET_INTERVENTIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting interventions'
  },
  ERROR_GET_PAGED_INTERVENTIONS: {
    code: 'ERROR_GET_PAGED_INTERVENTIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting paged interventions'
  },
  ERROR_SEARCH_INTERVENTIONS: {
    code: 'ERROR_SEARCH_INTERVENTIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while searching interventions'
  },
  ERROR_SEARCH_INTERVENTIONS_SERVICE: {
    code: 'ERROR_SEARCH_INTERVENTIONS_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while searching interventions in the database'
  },
  ERROR_SELECT_INTERVENTIONS: {
    code: 'ERROR_SELECT_INTERVENTIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting interventions from the database'
  },
  ERROR_SELECT_PAGED_INTERVENTIONS: {
    code: 'ERROR_SELECT_PAGED_INTERVENTIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting paged interventions from the database'
  },
  ERROR_INTERVENTION_NOT_FOUND: {
    code: 'ERROR_INTERVENTION_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Intervention not found in the database. Check ID'
  },
  ERROR_UPDATE_INTERVENTION: {
    code: 'ERROR_UPDATE_INTERVENTION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating an intervention in the database'
  },
  ERROR_UPDATE_INTERVENTION_SERVICE: {
    code: 'ERROR_UPDATE_INTERVENTION_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating an intervention in the database'
  },
  ERROR_DELETE_INTERVENTION: {
    code: 'ERROR_DELETE_INTERVENTION',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting an intervention from the database'
  },
  ERROR_INVALID_PASSWORD: {
    code: 'ERROR_INVALID_PASSWORD',
    level: 'error',
    status: 400,
    description: 'Password must contain 8-20 characters, 1 lower case character, 1 upper case character and 1 number'
  },
  ERROR_GET_NESTED_APPS: {
    code: 'ERROR_GET_NESTED_APPS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting nested apps'
  },
  ERROR_VERIFY_AUTH_TOKEN: {
    code: 'ERROR_VERIFY_AUTH_TOKEN',
    level: 'error',
    status: 500,
    description: 'Unexpected error while verifying authentication token'
  },
  ERROR_CREATE_EXTERNAL_DOCUMENT: {
    code: 'ERROR_CREATE_EXTERNAL_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating external document'
  },
  ERROR_EMAIL_FORMAT: {
    code: 'ERROR_EMAIL_FORMAT',
    level: 'error',
    status: 400,
    description: 'Email format is not valid'
  },
  ERROR_CREATE_FACTORY_CONTACT: {
    code: 'ERROR_CREATE_FACTORY_CONTACT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating a factory contact'
  },
  ERROR_SELECT_FACTORY_CONTACT: {
    code: 'ERROR_SELECT_FACTORY_CONTACT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting a factory contact from database'
  },
  ERROR_GET_FACTORY_CONTACTS: {
    code: 'ERROR_GET_FACTORY_CONTACTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting factory contacts'
  },
  ERROR_SELECT_FACTORY_CONTACTS: {
    code: 'ERROR_SELECT_FACTORY_CONTACTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting factory contacts from database'
  },
  ERROR_FACTORY_CONTACT_ALREADY_EXISTS: {
    code: 'ERROR_FACTORY_CONTACT_ALREADY_EXISTS',
    level: 'error',
    status: 400,
    description: 'The contact email already exists in database'
  },
  ERROR_DELETE_FACTORY_CONTACT: {
    code: 'ERROR_DELETE_FACTORY_CONTACT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting a factory contact'
  },
  ERROR_INVALID_CRITERIA: {
    code: 'ERROR_INVALID_CRITERIA',
    level: 'error',
    status: 400,
    description: 'The criteria introduced to perform this action is not valid'
  },
  ERROR_UPDATE_FACTORY_CONTACT: {
    code: 'ERROR_UPDATE_FACTORY_CONTACT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updaqting factory contact'
  },
  ERROR_FACTORY_CONTACT_NOT_FOUND: {
    code: 'ERROR_FACTORY_CONTACT_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Factory contact not found in database'
  },
  ERROR_SEARCH_FACTORIES: {
    code: 'ERROR_SEARCH_FACTORIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while searching factories in database'
  },
  ERROR_DELETE_FACTORY_SERVICE: {
    code: 'ERROR_DELETE_FACTORY_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting factory in database'
  },
  ERROR_CREATE_BULK_I18N_REGIONS: {
    code: 'ERROR_CREATE_BULK_I18N_REGIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk i18n regions'
  },
  ERROR_CREATE_BULK_NODES: {
    code: 'ERROR_CREATE_BULK_NODES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk nodes'
  },
  ERROR_UPDATE_TREE: {
    code: 'ERROR_UPDATE_TREE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating tree'
  },
  ERROR_CREATE_BULK_ACTIVITIES: {
    code: 'ERROR_CREATE_BULK_ACTIVITIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk activities'
  },
  ERROR_CREATE_BULK_I18N_ACTIVITIES: {
    code: 'ERROR_CREATE_BULK_I18N_ACTIVITIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk i18n activities'
  },
  ERROR_CREATE_TREE_FROM_FILE: {
    code: 'ERROR_CREATE_TREE_FROM_FILE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating tree from file'
  },
  ERROR_INVALID_PATH: {
    code: 'ERROR_INVALID_PATH',
    level: 'error',
    status: 400,
    description: 'Invalid URL path. Please check it again'
  },
  ERROR_GET_EXTERNAL_DOCUMENT: {
    code: 'ERROR_GET_EXTERNAL_DOCUMENT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting external document'
  },
  ERROR_CREATE_INIT_BULK_PATIENTS: {
    code: 'ERROR_CREATE_INIT_BULK_PATIENTS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk patients'
  },
  ERROR_GET_NODES_TO_SEND: {
    code: 'ERROR_GET_NODES_TO_SEND',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting nodes to send to new device'
  },
  ERROR_CREATE_BULK_REGIONS: {
    code: 'ERROR_CREATE_BULK_REGIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk regions'
  },
  ERROR_CREATE_BULK_TREES: {
    code: 'ERROR_CREATE_BULK_TREES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk trees'
  },
  ERROR_CREATE_BULK_INIT_USERS: {
    code: 'ERROR_CREATE_BULK_INIT_USERS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk init users'
  },
  ERROR_CREATE_INIT_BULK_APP_PERMISSIONS: {
    code: 'ERROR_CREATE_INIT_BULK_APP_PERMISSIONS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk init app permissions'
  },
  ERROR_CREATE_INIT_BULK_USER_FACTORIES: {
    code: 'ERROR_CREATE_INIT_BULK_USER_FACTORIES',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating bulk init user factories'
  },
  ERROR_GET_MANUFACTURERS: {
    code: 'ERROR_GET_MANUFACTURERS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while getting manufacturers'
  },
  ERROR_SELECT_MANUFACTURERS: {
    code: 'ERROR_SELECT_MANUFACTURERS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while selecting manufacturers from database'
  },
  ERROR_MANUFACTURER_NOT_FOUND: {
    code: 'ERROR_MANUFACTURER_NOT_FOUND',
    level: 'error',
    status: 404,
    description: 'Manufacturer not found in database'
  },
  ERROR_CREATE_MANUFACTURER: {
    code: 'ERROR_CREATE_MANUFACTURER',
    level: 'error',
    status: 500,
    description: 'Unexpected error while creating a manufacturer'
  },
  ERROR_INSERT_MANUFACTURER: {
    code: 'ERROR_INSERT_MANUFACTURER',
    level: 'error',
    status: 500,
    description: 'Unexpected error while inserting a manufacturer in database'
  },
  ERROR_UPDATE_MANUFACTURER: {
    code: 'ERROR_UPDATE_MANUFACTURER',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating a manufacturer in database'
  },
  ERROR_DELETE_MANUFACTURER: {
    code: 'ERROR_DELETE_MANUFACTURER',
    level: 'error',
    status: 500,
    description: 'Unexpected error while deleting a manufacturer from database'
  },
  ERROR_SEARCH_MANUFACTURERS_SERVICE: {
    code: 'ERROR_SEARCH_MANUFACTURERS_SERVICE',
    level: 'error',
    status: 500,
    description: 'Unexpected error while searching manufacturers in database'
  },
  ERROR_SEARCH_MANUFACTURERS: {
    code: 'ERROR_SEARCH_MANUFACTURERS',
    level: 'error',
    status: 500,
    description: 'Unexpected error while searching manufacturers'
  },
  ERROR_TELEPHONE_FORMAT: {
    code: 'ERROR_TELEPHONE_FORMAT',
    level: 'error',
    status: 400,
    description: 'Telephone format is not valid'
  },
  ERROR_UPDATE_CONSTANT: {
    code: 'ERROR_UPDATE_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating constant'
  },
  ERROR_UPDATE_SERVER_CONSTANT: {
    code: 'ERROR_UPDATE_SERVER_CONSTANT',
    level: 'error',
    status: 500,
    description: 'Unexpected error while updating server constant'
  }
};

export default ERRORS;
