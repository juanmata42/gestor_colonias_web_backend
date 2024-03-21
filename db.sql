-- Tag
CREATE TABLE tags (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nAction
CREATE TABLE i18n_actions (
  id UUID PRIMARY KEY,
  action_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  CONSTRAINT fk_action_id FOREIGN KEY (action_id) REFERENCES actions (id) ON DELETE CASCADE
);

-- Action
CREATE TABLE actions (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (i18n, tags) to be implemented separately
);

-- ActionRecord
CREATE TABLE action_records (
  id UUID PRIMARY KEY,
  action_id UUID NOT NULL,
  date TIMESTAMP NOT NULL,
  result TEXT NOT NULL,
  comments TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (users, subjects, locations, time_record, tags) to be implemented separately
);

-- i18nApp
CREATE TABLE i18n_apps (
  id UUID PRIMARY KEY,
  app_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  header_title TEXT NOT NULL,
  short_header TEXT NOT NULL,
  description TEXT NOT NULL
);

-- App
CREATE TABLE apps (
  id UUID PRIMARY KEY,
  active BOOLEAN NOT NULL,
  color TEXT NOT NULL,
  image_id UUID,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  -- relationships (parent_apps, children_apps, i18n, tags) to be implemented separately
);

-- AppPermission
CREATE TABLE app_permissions (
  id UUID PRIMARY KEY,
  app_id UUID NOT NULL,
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
  -- relationships (tags) to be implemented separately
);

-- i18nGroupType
CREATE TABLE i18n_group_types (
  id UUID PRIMARY KEY,
  group_type_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  CONSTRAINT fk_group_type_id FOREIGN KEY (group_type_id) REFERENCES group_types (id) ON DELETE CASCADE
);


-- GroupType
CREATE TABLE group_types (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (tags, i18n) to be implemented separately
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
  type UUID NOT NULL
  -- relationships (locations, users, subjects, contacts, tags, allowed_roles, allowed_tasks, work_assignments, task_records, action_records, parent_groups, children_groups) to be implemented separately
);

-- Group_user_roles
CREATE TABLE group_users_roles (
  group_id UUID NOT NULL,
  user_id UUID NOT NULL,
  role_id UUID NOT NULL,
  CONSTRAINT pk_group_users_roles PRIMARY KEY (group_id, user_id, role_id),
  CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);

-- Group locations
CREATE TABLE group_locations (
  group_id UUID NOT NULL,
  location_id UUID NOT NULL,
  PRIMARY KEY (group_id, location_id),
  CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE,
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE CASCADE
);


-- i18nLocationType
CREATE TABLE i18n_location_types (
  id UUID PRIMARY KEY,
  location_type_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  CONSTRAINT fk_location_type_id FOREIGN KEY (location_type_id) REFERENCES location_types (id) ON DELETE CASCADE
);

-- LocationType
CREATE TABLE location_types (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- Tags relationship to be implemented separately
);

-- Location
CREATE TABLE locations (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  type UUID NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  address TEXT NOT NULL,
  country TEXT NOT NULL,
  CONSTRAINT fk_type FOREIGN KEY (type) REFERENCES location_types (id) ON DELETE SET NULL
  -- relationships (groups, tags) to be implemented separately
);


-- Role
CREATE TABLE roles (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (i18n, tags, app_permissions) to be implemented separately
);

-- i18nRole
CREATE TABLE i18n_roles (
  id UUID PRIMARY KEY,
  role_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- i18nSubjectType
CREATE TABLE i18n_subject_types (
  id UUID PRIMARY KEY,
  subject_type_id UUID NOT
    NOT NULL,
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
  -- relationships (i18n, tags) to be implemented separately
);

-- Subject
CREATE TABLE subjects (
  id UUID PRIMARY KEY,
  unique_identifier TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  type UUID NOT NULL
  -- relationships (groups, assigned_users, locations, tags, work_assignments, task_records, action_records) to be implemented separately
);

-- i18nTask
CREATE TABLE i18n_tasks (
  id UUID PRIMARY KEY,
  task_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
);

-- Task
CREATE TABLE tasks (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (i18n, tags) to be implemented separately
);

-- TaskRecord
CREATE TABLE task_records (
  id UUID PRIMARY KEY,
  task_id UUID NOT NULL,
  date TIMESTAMP NOT NULL,
  result TEXT NOT NULL,
  comments TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (users, time_record, tags, locations) to be implemented separately
);

-- TimeRecord
CREATE TABLE time_records (
  id UUID PRIMARY KEY,
  checkIn_time TIMESTAMP NOT NULL,
  checkOut_time TIMESTAMP,
  metadata JSONB, -- Assuming PostgreSQL for JSONB support, adjust for other DBs
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
  -- relationships (locations, subjects, groups, roles, tags, work_assignments, task_records, action_records) to be implemented separately
);

-- WorkAssignment
CREATE TABLE work_assignments (
  id UUID PRIMARY KEY,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL
  -- relationships (users, subjects, locations, groups, tasks, tags, task_records, action_records) to be implemented separately
);

-- i18n_actions to actions
ALTER TABLE i18n_actions ADD CONSTRAINT fk_action_type_id FOREIGN KEY (action_type_id) REFERENCES actions (id) ON DELETE CASCADE;
-- i18n_apps to apps
ALTER TABLE i18n_apps ADD CONSTRAINT fk_app_id FOREIGN KEY (app_id) REFERENCES apps (id) ON DELETE CASCADE;
-- app_permissions to apps
ALTER TABLE app_permissions ADD CONSTRAINT fk_app_id FOREIGN KEY (app_id) REFERENCES apps (id) ON DELETE CASCADE;
-- i18n_group_types to group_types:
ALTER TABLE i18n_group_types ADD CONSTRAINT fk_group_type_id FOREIGN KEY (group_type_id) REFERENCES group_types (id) ON DELETE CASCADE;
-- i18n_roles to roles:
ALTER TABLE i18n_roles ADD CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE;
-- i18n_subject_types to subject_types:
ALTER TABLE i18n_subject_types ADD CONSTRAINT fk_subject_type_id FOREIGN KEY (subject_type_id) REFERENCES subject_types (id) ON DELETE CASCADE;
-- i18n_tasks to tasks:
ALTER TABLE i18n_tasks ADD CONSTRAINT fk_task_id FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;
-- i18nLocationType to LocationType
ALTER TABLE i18n_location_types ADD CONSTRAINT fk_location_type_id FOREIGN KEY (location_type_id) REFERENCES location_types (id) ON DELETE CASCADE;
-- locations to location_types
ALTER TABLE locations ADD CONSTRAINT fk_type FOREIGN KEY (type) REFERENCES location_types (id) ON DELETE SET NULL;
-- action_records to actions:
ALTER TABLE action_records ADD CONSTRAINT fk_action_id FOREIGN KEY (action_id) REFERENCES actions (id) ON DELETE CASCADE;
-- task_records to tasks:
ALTER TABLE task_records ADD CONSTRAINT fk_task_id FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE;

-- Actions and Tags
CREATE TABLE action_tags (
  action_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (action_id, tag_id),
  CONSTRAINT fk_action FOREIGN KEY (action_id) REFERENCES actions (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Tasks and Tags
CREATE TABLE task_tags (
  task_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (task_id, tag_id),
  CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Users and Tags
CREATE TABLE user_tags (
  user_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (user_id, tag_id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Locations and Tags
CREATE TABLE location_tags (
  location_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (location_id, tag_id),
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

--Location type and Tags
CREATE TABLE location_type_tags (
  location_type_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (location_type_id, tag_id),
  CONSTRAINT fk_location_type FOREIGN KEY (location_type_id) REFERENCES location_types (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Subjects and Tags
CREATE TABLE subject_tags (
  subject_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (subject_id, tag_id),
  CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Groups and Tags
CREATE TABLE group_tags (
  group_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (group_id, tag_id),
  CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- Group type and tags
CREATE TABLE group_type_tags (
  group_type_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (group_type_id, tag_id),
  CONSTRAINT fk_group_type FOREIGN KEY (group_type_id) REFERENCES group_types (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);


-- Roles and Tags
CREATE TABLE role_tags (
  role_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (role_id, tag_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);

-- WorkAssignments and Tags
CREATE TABLE work_assignment_tags (
  work_assignment_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (work_assignment_id, tag_id),
  CONSTRAINT fk_work_assignment FOREIGN KEY (work_assignment_id) REFERENCES work_assignments (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);
-- Location and Group
CREATE TABLE location_groups (
  location_id UUID NOT NULL,
  group_id UUID NOT NULL,
  PRIMARY KEY (location_id, group_id),
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE CASCADE,
  CONSTRAINT fk_group FOREIGN KEY (group_id) REFERENCES groups (id) ON DELETE CASCADE
);
-- Location and Tag
CREATE TABLE location_tags (
  location_id UUID NOT NULL,
  tag_id UUID NOT NULL,
  PRIMARY KEY (location_id, tag_id),
  CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE CASCADE,
  CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags (id) ON DELETE CASCADE
);