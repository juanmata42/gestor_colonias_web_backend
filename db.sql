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
  country TEXT NOT NULL,
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
  country TEXT NOT NULL
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
  gender TEXT,
  nid TEXT,
  telephone TEXT,
  address TEXT,
  country TEXT,
  education_level TEXT,
  education_field TEXT,
  job TEXT,
  su BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP
  -- relationships with locations, subjects, groups, roles, tags, work_assignments, task_records, action_records to be implemented separately
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

-- Additional considerations for extending tagging to other entities:
-- Ensure each entity that can be tagged has a corresponding junction table.
-- For new entities that require tagging, follow the pattern established in these junction table definitions.
-- Consider indexing the columns used in joins and searches to improve performance as your dataset grows.

-- Example index creation for a frequently joined column in a junction table:
-- CREATE INDEX ON group_tags(group_id);
-- CREATE INDEX ON group_tags(tag_id);
-- Adjust the indexing strategy based on query patterns and performance testing.


