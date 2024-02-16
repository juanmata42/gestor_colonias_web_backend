//ENGLISH MONTHS

export const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

//APP RELATED KEYS

export const createAppKeys = ['id', 'active', 'color', 'report', 'route_patients_page', 'route_page', 'component'];

export const updateAppKeys = ['image', 'active', 'color', 'report', 'route_patients_page', 'route_page', 'component', 'languages', 'treeList', 'parent_app_id'];

export const JSONAppKeys = ['lang', 'treeList'];

export const JSONBooleanAppKeys = ['active', 'report'];

//EMPLOYEE RELATED KEYS

export const employeeKeys = ['name', 'lastname', 'birthdate', 'gender', 'nid', 'telephone', 'email', 'address', 'country', 'role'];

export const encryptionEmployeeKeys = ['name', 'lastname', 'birthdate', 'gender', 'nid', 'telephone', 'email', 'address', 'country', 'role'];

//NODE RELATED KEYS

export const updateNodeKeys = ['score', 'min', 'max', 'interval', 'type', 'category', 'table', 'image', 'ref'];

export const createNodeKeys = ['type', 'tree_id', 'i18nNode'];

export const JSONNodeKeys = ['interval', 'language', 'children'];

//TREE RELATED KEYS

export const createTreeKeys = ['type', 'category'];

export const updateTreeKeys = ['type', 'category', 'interval', 'root_id'];

export const validTreeTypes = ['covid', 'health', 'minorInjuries'];

//PROFESSION RELATED KEYS

export const professionKeys = ['name', 'displayName', 'type', 'evaluation'];

//DATABASE

export const basicFunctionalTables = ['factories', 'regions', 'i18n-Regions', 'trees', 'nodes', 'i18n-Nodes', 'childrenNodes', 'apps', 'i18n-Apps', 'appsTrees',
  'users', 'activities', 'i18n-Activities', 'constants'];

//IMAGES

export const imageMymetypes = ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'];

//DOCUMENTS

export const docsMimetypes = ['application/pdf', 'image/png', 'image/jpeg', 'image/jpg', 'image/gif'];

//INTERVENTIONS

export const createInterventionKeys = ['factory_id', 'factory_contact', 'type', 'arrival_time', 'departure_time'];

export const updateInterventionKeys = ['user_id', 'factory_id', 'factory_contact', 'type', 'date', 'deleted', 'arrival_time', 'departure_time', 
  'discrepancies', 'description_EN', 'description_BN', 'created_at', 'updated_at'];

export const orderInterventionKeys = ['factory_id', 'factory_name', 'user_email', 'factory_contact', 'signer', 'type', 'date', 'created_at'];

// FACTORIES

export const createFactoryKeys = ['id', 'name', 'address', 'showLevel', 'country', 'sector', 'coordinates'];

export const updateFactoryKeys = ['name', 'address', 'showLevel', 'country', 'sector', 'coordinates', 
  'api', 'employees', 'lines', 'type', 'sims_id'];

export const factorySectors = ['rmg'];

export const orderFactoryKeys = ['name', 'sector', 'id'];

// EMAILS

export const orderEmailKeys = ['date', 'subject', 'pdfAttached'];

// MANUFACTURERS

export const orderManufacturerKeys = ['name', 'short_name'];