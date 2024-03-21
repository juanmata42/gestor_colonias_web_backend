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
  action_type_id UUID NOT NULL,
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
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
  deleted BOOLEAN NOT NULL
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

-- Location
CREATE TABLE locations (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP,
  deleted BOOLEAN NOT NULL,
  image_id UUID,
  type TEXT NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  address TEXT NOT NULL,
  country TEXT NOT NULL
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
