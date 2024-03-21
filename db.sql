
-- Country
CREATE TABLE countries (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  code TEXT NOT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nCountry
CREATE TABLE i18n_countries (
  id UUID PRIMARY KEY,
  country_id UUID NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Education Level Tables
CREATE TABLE education_levels (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

CREATE TABLE i18n_education_levels (
  id UUID PRIMARY KEY,
  education_level_id UUID NOT NULL REFERENCES education_levels(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Education Field Tables
CREATE TABLE education_fields (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

CREATE TABLE i18n_education_fields (
  id UUID PRIMARY KEY,
  education_field_id UUID NOT NULL REFERENCES education_fields(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Job Tables
CREATE TABLE jobs (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

CREATE TABLE i18n_jobs (
  id UUID PRIMARY KEY,
  job_id UUID NOT NULL REFERENCES jobs(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Gender Tables
CREATE TABLE genders (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

CREATE TABLE i18n_genders (
  id UUID PRIMARY KEY,
  gender_id UUID NOT NULL REFERENCES genders(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  language TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Tag
CREATE TABLE tags (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Action
CREATE TABLE actions (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nAction
CREATE TABLE i18n_actions (
  id UUID PRIMARY KEY,
  action_id UUID NOT NULL REFERENCES actions(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- ActionRecord
CREATE TABLE action_records (
  id UUID PRIMARY KEY,
  action_id UUID NOT NULL REFERENCES actions(id) ON DELETE CASCADE,
  date TIMESTAMP NOT NULL,
  result TEXT NOT NULL,
  comments TEXT NOT NULL,
  time_record UUID NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nApp
CREATE TABLE i18n_apps (
  id UUID PRIMARY KEY,
  app_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  header_title TEXT NOT NULL,
  short_header TEXT NOT NULL,
  description TEXT NOT NULL,
  CONSTRAINT fk_app_id FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE
);

-- App
CREATE TABLE apps (
  id UUID PRIMARY KEY,
  active BOOLEAN NOT NULL,
  color TEXT NOT NULL,
  image_id UUID,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP
);

-- AppPermission
CREATE TABLE app_permissions (
  id UUID PRIMARY KEY,
  app_id UUID NOT NULL REFERENCES apps(id) ON DELETE CASCADE,
  level INTEGER NOT NULL
);

-- Contact
CREATE TABLE contacts (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  telephone TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  user_id UUID
);

-- GroupType
CREATE TABLE group_types (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- Tags relationship implemented in a junction table below
);

-- i18nGroupType
CREATE TABLE i18n_group_types (
  id UUID PRIMARY KEY,
  group_type_id UUID NOT NULL REFERENCES group_types(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Group
CREATE TABLE groups (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  password TEXT NOT NULL,
  showLevel INTEGER NOT NULL,
  address TEXT NOT NULL,
  -- countries array of ids
  countries UUID[] NOT NULL REFERENCES countries(id),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  type UUID NOT NULL REFERENCES group_types(id) ON DELETE SET NULL
  -- Additional relationships (locations, users, etc.) to be implemented separately
);

-- LocationType
CREATE TABLE location_types (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- Tags relationship to be implemented in a junction table
);

-- i18nLocationType
CREATE TABLE i18n_location_types (
  id UUID PRIMARY KEY,
  location_type_id UUID NOT NULL REFERENCES location_types(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Location
CREATE TABLE locations (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  type UUID NOT NULL REFERENCES location_types(id) ON DELETE SET NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  address TEXT NOT NULL,
  country UUID NOT NULL
  -- Tags relationship to be implemented in a junction table
);

-- Role
CREATE TABLE roles (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships with i18nRoles and app_permissions to be implemented separately
);

-- i18nRole
CREATE TABLE i18n_roles (
  id UUID PRIMARY KEY,
  role_id UUID NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- SubjectType
CREATE TABLE subject_types (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nSubjectType
CREATE TABLE i18n_subject_types (
  id UUID PRIMARY KEY,
  subject_type_id UUID NOT NULL REFERENCES subject_types(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Subject
CREATE TABLE subjects (
  id UUID PRIMARY KEY,
  unique_identifier TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  type UUID NOT NULL REFERENCES subject_types(id),
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID
  -- relationships to groups, tags, etc., to be implemented separately
);

-- Task
CREATE TABLE tasks (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- i18n and tags relationships to be implemented separately
);

-- i18nTask
CREATE TABLE i18n_tasks (
  id UUID PRIMARY KEY,
  task_id UUID NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- TaskRecord
CREATE TABLE task_records (
  id UUID PRIMARY KEY,
  task_id UUID NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  date TIMESTAMP NOT NULL,
  result TEXT NOT NULL,
  comments TEXT NOT NULL,
  time_record UUID NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- time_record, locations, and tags relationships to be implemented separately
);

-- TimeRecord
CREATE TABLE time_records (
  id UUID PRIMARY KEY,
  checkIn_time TIMESTAMP NOT NULL,
  checkOut_time TIMESTAMP,
  metadata JSONB, -- Use JSONB for storing JSON data, adjust for other DBs
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP
);

-- User
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  lastname TEXT NOT NULL,
  birthdate DATE NOT NULL,
  gender UUID NOT NULL,
  nid TEXT,
  telephone TEXT,
  address TEXT,
  country UUID,
  education_level UUID,
  education_field UUID,
  job UUID,
  su BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  CONSTRAINT fk_user_gender FOREIGN KEY (gender) REFERENCES genders(id),
  CONSTRAINT fk_user_country FOREIGN KEY (country) REFERENCES countries(id),
  CONSTRAINT fk_user_education_level FOREIGN KEY (education_level) REFERENCES education_levels(id),
  CONSTRAINT fk_user_education_field FOREIGN KEY (education_field) REFERENCES education_fields(id),
  CONSTRAINT fk_user_job FOREIGN KEY (job) REFERENCES jobs(id)
);


-- WorkAssignment
CREATE TABLE work_assignments (
  id UUID PRIMARY KEY,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships with users, subjects, locations, groups, tasks, tags, task_records, action_records to be implemented separately
);

-- Junction Tables:

-- Tags ------

-- Junction Table for Group Tags
CREATE TABLE group_tags (
  group_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (group_id, tag_id),
  CONSTRAINT fk_group_tags_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for GroupType Tags
CREATE TABLE group_type_tags (
  group_type_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (group_type_id, tag_id),
  CONSTRAINT fk_group_type_tags_group_type FOREIGN KEY (group_type_id) REFERENCES group_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_type_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Location Tags
CREATE TABLE location_tags (
  location_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (location_id, tag_id),
  CONSTRAINT fk_location_tags_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE,
  CONSTRAINT fk_location_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Location Type Tags
CREATE TABLE location_type_tags (
  location_type_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (location_type_id, tag_id),
  CONSTRAINT fk_location_type_tags_location_type FOREIGN KEY (location_type_id) REFERENCES location_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_location_type_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Subject Tags
CREATE TABLE subject_tags (
  subject_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (subject_id, tag_id),
  CONSTRAINT fk_subject_tags_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for SubjectType Tags
CREATE TABLE subject_type_tags (
  subject_type_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (subject_type_id, tag_id),
  CONSTRAINT fk_subject_type_tags_subject_type FOREIGN KEY (subject_type_id) REFERENCES subject_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_type_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Task Tags
CREATE TABLE task_tags (
  task_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (task_id, tag_id),
  CONSTRAINT fk_task_tags_task FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE,
  CONSTRAINT fk_task_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for TaskRecord Tags
CREATE TABLE task_record_tags (
  task_record_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (task_record_id, tag_id),
  CONSTRAINT fk_task_record_tags_task_record FOREIGN KEY (task_record_id) REFERENCES task_records(id) ON DELETE CASCADE,
  CONSTRAINT fk_task_record_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for User Tags
CREATE TABLE user_tags (
  user_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (user_id, tag_id),
  CONSTRAINT fk_user_tags_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_user_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Action Tags
CREATE TABLE action_tags (
  action_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (action_id, tag_id),
  CONSTRAINT fk_action_tags_action FOREIGN KEY (action_id) REFERENCES actions(id) ON DELETE CASCADE,
  CONSTRAINT fk_action_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Action Record Tags
CREATE TABLE action_record_tags (
  action_record_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (action_record_id, tag_id),
  CONSTRAINT fk_action_record_tags_action_record FOREIGN KEY (action_record_id) REFERENCES action_records(id) ON DELETE CASCADE,
  CONSTRAINT fk_action_record_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for App Tags
CREATE TABLE app_tags (
  app_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (app_id, tag_id),
  CONSTRAINT fk_app_tags_app FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
  CONSTRAINT fk_app_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Contact Tags
CREATE TABLE contact_tags (
  contact_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (contact_id, tag_id),
  CONSTRAINT fk_contact_tags_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE,
  CONSTRAINT fk_contact_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for Role Tags
CREATE TABLE role_tags (
  role_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (role_id, tag_id),
  CONSTRAINT fk_role_tags_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
  CONSTRAINT fk_role_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Junction Table for WorkAssignment Tags
CREATE TABLE work_assignment_tags (
  work_assignment_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (work_assignment_id, tag_id),
  CONSTRAINT fk_work_assignment_tags_work_assignment FOREIGN KEY (work_assignment_id) REFERENCES work_assignments(id) ON DELETE CASCADE,
  CONSTRAINT fk_work_assignment_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Subjects -----

-- Junction Table for subjects and groups
CREATE TABLE subject_groups (
  subject_id UUID NOT NULL,
  group_id UUID NOT NULL,
  PRIMARY KEY (subject_id, group_id),
  CONSTRAINT fk_subject_groups_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_groups_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);

-- Junction Table for subjects and users
CREATE TABLE subject_users (
  subject_id UUID NOT NULL,
  user_id UUID NOT NULL,
  PRIMARY KEY (subject_id, user_id),
  CONSTRAINT fk_subject_users_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_users_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Junction Table for subjects and locations
CREATE TABLE subject_locations (
  subject_id UUID NOT NULL,
  location_id UUID NOT NULL,
  PRIMARY KEY (subject_id, location_id),
  CONSTRAINT fk_subject_locations_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_locations_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE
);

-- Junction Table for subjects and work assignments
CREATE TABLE subject_work_assignments (
  subject_id UUID NOT NULL,
  work_assignment_id UUID NOT NULL,
  PRIMARY KEY (subject_id, work_assignment_id),
  CONSTRAINT fk_subject_work_assignments_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_work_assignments_work_assignment FOREIGN KEY (work_assignment_id) REFERENCES work_assignments(id) ON DELETE CASCADE
);

-- Junction Table for subjects and task records
CREATE TABLE subject_task_records (
  subject_id UUID NOT NULL,
  task_record_id UUID NOT NULL,
  PRIMARY KEY (subject_id, task_record_id),
  CONSTRAINT fk_subject_task_records_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_task_records_task_record FOREIGN KEY (task_record_id) REFERENCES task_records(id) ON DELETE CASCADE
);

-- Junction Table for subjects and action records
CREATE TABLE subject_action_records (
  subject_id UUID NOT NULL,
  action_record_id UUID NOT NULL,
  PRIMARY KEY (subject_id, action_record_id),
  CONSTRAINT fk_subject_action_records_subject FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
  CONSTRAINT fk_subject_action_records_action_record FOREIGN KEY (action_record_id) REFERENCES action_records(id) ON DELETE CASCADE
);

-- Groups -------

-- Junction Table for Locations and groups
CREATE TABLE location_groups (
  location_id UUID NOT NULL,
  group_id UUID NOT NULL,
  PRIMARY KEY (location_id, group_id),
  CONSTRAINT fk_location_groups_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE,
  CONSTRAINT fk_location_groups_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE
);

-- Junction Table for Group Users Roles
CREATE TABLE group_users_roles (
  group_id UUID NOT NULL,
  user_id UUID NOT NULL,
  role_id UUID NOT NULL,
  PRIMARY KEY (group_id, user_id, role_id),
  CONSTRAINT fk_group_users_roles_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_users_roles_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_users_roles_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Junction Table for Group Contacts
CREATE TABLE group_contacts (
  group_id UUID NOT NULL,
  contact_id UUID NOT NULL,
  PRIMARY KEY (group_id, contact_id),
  CONSTRAINT fk_group_contacts_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_contacts_contact FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE
);

-- Junction Table for Group allowed tasks
CREATE TABLE group_tasks (
  group_id UUID NOT NULL,
  task_id UUID NOT NULL,
  PRIMARY KEY (group_id, task_id),
  CONSTRAINT fk_group_tasks_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_tasks_task FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
);

-- Junction Table for Group allowed roles
CREATE TABLE group_roles (
  group_id UUID NOT NULL,
  role_id UUID NOT NULL,
  PRIMARY KEY (group_id, role_id),
  CONSTRAINT fk_group_roles_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_roles_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- Junction Table for Group work assignments
CREATE TABLE group_work_assignments (
  group_id UUID NOT NULL,
  work_assignment_id UUID NOT NULL,
  PRIMARY KEY (group_id, work_assignment_id),
  CONSTRAINT fk_group_work_assignments_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_work_assignments_work_assignment FOREIGN KEY (work_assignment_id) REFERENCES work_assignments(id) ON DELETE CASCADE
);

-- Junction Table for Group task records
CREATE TABLE group_task_records (
  group_id UUID NOT NULL,
  task_record_id UUID NOT NULL,
  PRIMARY KEY (group_id, task_record_id),
  CONSTRAINT fk_group_task_records_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_task_records_task_record FOREIGN KEY (task_record_id) REFERENCES task_records(id) ON DELETE CASCADE
);

-- Junction Table for Group action records
CREATE TABLE group_action_records (
  group_id UUID NOT NULL,
  action_record_id UUID NOT NULL,
  PRIMARY KEY (group_id, action_record_id),
  CONSTRAINT fk_group_action_records_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_action_records_action_record FOREIGN KEY (action_record_id) REFERENCES action_records(id) ON DELETE CASCADE
);

-- Junction Table for Group and parent groups
CREATE TABLE group_parents (
  group_id UUID NOT NULL,
  parent_group_id UUID NOT NULL,
  PRIMARY KEY (group_id, parent_group_id),
  CONSTRAINT fk_group_parents_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_parents_parent_group FOREIGN KEY (parent_group_id) REFERENCES groups(id) ON DELETE CASCADE
);

-- Junction Table for Group and child groups
CREATE TABLE group_children (
  group_id UUID NOT NULL,
  child_group_id UUID NOT NULL,
  PRIMARY KEY (group_id, child_group_id),
  CONSTRAINT fk_group_children_group FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE,
  CONSTRAINT fk_group_children_child_group FOREIGN KEY (child_group_id) REFERENCES groups(id) ON DELETE CASCADE
);

-- Other relationships junction tables -------

-- Junction Table for App permissions and Roles (roles can have multiple app permissions)
CREATE TABLE role_app_permissions (
  role_id UUID NOT NULL,
  app_permission_id UUID NOT NULL,
  PRIMARY KEY (role_id, app_permission_id),
  CONSTRAINT fk_role_app_permissions_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
  CONSTRAINT fk_role_app_permissions_app_permission FOREIGN KEY (app_permission_id) REFERENCES app_permissions(id) ON DELETE CASCADE
);