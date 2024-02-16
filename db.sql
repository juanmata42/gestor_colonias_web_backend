-- Tag Table
CREATE TABLE IF NOT EXISTS tags (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Users Table
CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  lastname TEXT,
  birthdate DATE,
  gender TEXT,
  nid TEXT,
  telephone TEXT,
  address TEXT,
  country TEXT,
  su BOOLEAN NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Location Table
CREATE TABLE IF NOT EXISTS locations (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE,
  image_id TEXT,
  type TEXT,
  coordinates JSONB,
  address TEXT,
  country TEXT
);

-- Subject Table
CREATE TABLE IF NOT EXISTS subjects (
  id SERIAL PRIMARY KEY,
  uniqueIdentifier TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE,
  image_id TEXT,
  type_id INTEGER REFERENCES subject_types(id),
  evaluator_id INTEGER REFERENCES users(id),
  location_id INTEGER REFERENCES locations(id)
);

-- Subject Types Table
CREATE TABLE IF NOT EXISTS subject_types (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Evaluation Table
CREATE TABLE IF NOT EXISTS evaluations (
  id SERIAL PRIMARY KEY,
  subject_id INTEGER REFERENCES subjects(id),
  user_id INTEGER REFERENCES users(id),
  date DATE NOT NULL,
  result TEXT,
  comments TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE,
  type_id INTEGER REFERENCES evaluation_types(id),
  location_id INTEGER REFERENCES locations(id)
);

-- Evaluation Types Table
CREATE TABLE IF NOT EXISTS evaluation_types (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Group Table
CREATE TABLE IF NOT EXISTS groups (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  password TEXT,
  showLevel INTEGER,
  address TEXT,
  country TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE,
  image_id TEXT,
  type_id INTEGER REFERENCES group_types(id)
);

-- Group Types Table
CREATE TABLE IF NOT EXISTS group_types (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Time Records Table
CREATE TABLE IF NOT EXISTS time_records (
  id SERIAL PRIMARY KEY,
  checkInTime TIMESTAMPTZ NOT NULL,
  checkOutTime TIMESTAMPTZ,
  metadata JSONB,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ
);

-- Work Assignments Table
CREATE TABLE IF NOT EXISTS work_assignments (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- App Table
CREATE TABLE IF NOT EXISTS apps (
  id SERIAL PRIMARY KEY,
  active BOOLEAN NOT NULL,
  color TEXT,
  image_id TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  parent_app_id INTEGER
);

-- App Permissions Table
CREATE TABLE IF NOT EXISTS app_permissions (
  id SERIAL PRIMARY KEY,
  app_id INTEGER REFERENCES apps(id),
  user_id INTEGER REFERENCES users(id),
  level INTEGER,
  parent_app_id INTEGER,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ
);

-- Role Table
CREATE TABLE IF NOT EXISTS roles (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- Task Table
CREATE TABLE IF NOT EXISTS tasks (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nApp Table
CREATE TABLE IF NOT EXISTS i18n_apps (
  id SERIAL PRIMARY KEY,
  app_id INTEGER REFERENCES apps(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  header_title TEXT,
  short_header TEXT,
  tool_name TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nRole Table
CREATE TABLE IF NOT EXISTS i18n_roles (
  id SERIAL PRIMARY KEY,
  role_id INTEGER REFERENCES roles(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nTask Table
CREATE TABLE IF NOT EXISTS i18n_tasks (
  id SERIAL PRIMARY KEY,
  task_id INTEGER REFERENCES tasks(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nGroupType Table
CREATE TABLE IF NOT EXISTS i18n_group_types (
  id SERIAL PRIMARY KEY,
  group_type_id INTEGER REFERENCES group_types(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nEvaluationType Table
CREATE TABLE IF NOT EXISTS i18n_evaluation_types (
  id SERIAL PRIMARY KEY,
  evaluation_type_id INTEGER REFERENCES evaluation_types(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);

-- i18nSubjectType Table
CREATE TABLE IF NOT EXISTS i18n_subject_types (
  id SERIAL PRIMARY KEY,
  subject_type_id INTEGER REFERENCES subject_types(id),
  language TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ,
  deleted BOOLEAN DEFAULT FALSE
);
