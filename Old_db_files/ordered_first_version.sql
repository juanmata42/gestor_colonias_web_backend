CREATE TABLE "countries" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "code" TEXT UNIQUE NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_countries" (
  "id" UUID PRIMARY KEY,
  "country_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "education_levels" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_education_levels" (
  "id" UUID PRIMARY KEY,
  "education_level_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "education_fields" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_education_fields" (
  "id" UUID PRIMARY KEY,
  "education_field_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "jobs" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_jobs" (
  "id" UUID PRIMARY KEY,
  "job_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "genders" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_genders" (
  "id" UUID PRIMARY KEY,
  "gender_id" UUID NOT NULL,
  "name" TEXT NOT NULL,
  "language" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "tags" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "actions" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_actions" (
  "id" UUID PRIMARY KEY,
  "action_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "action_records" (
  "id" UUID PRIMARY KEY,
  "action_id" UUID NOT NULL,
  "date" TIMESTAMP NOT NULL,
  "result" TEXT NOT NULL,
  "comments" TEXT NOT NULL,
  "time_record" UUID NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_apps" (
  "id" UUID PRIMARY KEY,
  "app_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "header_title" TEXT NOT NULL,
  "short_header" TEXT NOT NULL,
  "description" TEXT NOT NULL
);

CREATE TABLE "apps" (
  "id" UUID PRIMARY KEY,
  "active" BOOLEAN NOT NULL,
  "color" TEXT NOT NULL,
  "image_id" UUID,
  "levels" INTEGER[],
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP
);

CREATE TABLE "app_permissions" (
  "id" UUID PRIMARY KEY,
  "app_id" UUID NOT NULL,
  "level" INTEGER NOT NULL
);

CREATE TABLE "contacts" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "email" TEXT NOT NULL,
  "telephone" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL,
  "image_id" UUID,
  "user_id" UUID
);

CREATE TABLE "group_types" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_group_types" (
  "id" UUID PRIMARY KEY,
  "group_type_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "groups" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "password" TEXT NOT NULL,
  "privacy_level" INTEGER NOT NULL,
  "address" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL,
  "image_id" UUID,
  "type" UUID NOT NULL
);

CREATE TABLE "location_types" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_location_types" (
  "id" UUID PRIMARY KEY,
  "location_type_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "locations" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL,
  "image_id" UUID,
  "type" UUID NOT NULL,
  "coordinates" GEOGRAPHY(Point,4326) NOT NULL,
  "address" TEXT NOT NULL,
  "country" UUID NOT NULL
);

CREATE TABLE "roles" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_roles" (
  "id" UUID PRIMARY KEY,
  "role_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "subject_types" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_subject_types" (
  "id" UUID PRIMARY KEY,
  "subject_type_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "subjects" (
  "id" UUID PRIMARY KEY,
  "unique_identifier" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT,
  "type" UUID NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL,
  "image_id" UUID
);

CREATE TABLE "tasks" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_tasks" (
  "id" UUID PRIMARY KEY,
  "task_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "task_records" (
  "id" UUID PRIMARY KEY,
  "task_id" UUID NOT NULL,
  "date" TIMESTAMP NOT NULL,
  "result" TEXT NOT NULL,
  "comments" TEXT NOT NULL,
  "time_record" UUID NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "time_records" (
  "id" UUID PRIMARY KEY,
  "checkIn_time" TIMESTAMP NOT NULL,
  "checkOut_time" TIMESTAMP,
  "metadata" JSONB,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP
);

CREATE TABLE "users" (
  "id" UUID PRIMARY KEY,
  "email" TEXT UNIQUE NOT NULL,
  "password" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "lastname" TEXT NOT NULL,
  "birthdate" DATE NOT NULL,
  "gender" UUID NOT NULL,
  "nid" TEXT,
  "telephone" TEXT NOT NULL,
  "address" TEXT NOT NULL,
  "country" UUID NOT NULL,
  "education_level" UUID NOT NULL,
  "education_field" UUID NOT NULL,
  "job" UUID NOT NULL,
  "annual_salary_in_euro" INTEGER NOT NULL,
  "su" BOOLEAN NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP
);

CREATE TABLE "work_assignments" (
  "id" UUID PRIMARY KEY,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_work_assignments" (
  "id" UUID PRIMARY KEY,
  "work_assignment_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "i18n_occurrences" (
  "id" UUID PRIMARY KEY,
  "occurrence_type_id" UUID NOT NULL,
  "language" TEXT NOT NULL,
  "name" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "occurrence_types" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL
);

CREATE TABLE "occurrences" (
  "id" UUID PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_by" UUID NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "updated_at" TIMESTAMP,
  "deleted" BOOLEAN NOT NULL,
  "image_id" UUID,
  "type_id" UUID NOT NULL,
  "location" UUID,
  "time_record" UUID NOT NULL
);

CREATE TABLE "occurrence_tags" (
  "occurrence_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("occurrence_id", "tag_id")
);

CREATE TABLE "occurrence_type_tags" (
  "occurrence_type_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("occurrence_type_id", "tag_id")
);

CREATE TABLE "group_tags" (
  "group_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "tag_id")
);

CREATE TABLE "group_type_tags" (
  "group_type_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("group_type_id", "tag_id")
);

CREATE TABLE "location_tags" (
  "location_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("location_id", "tag_id")
);

CREATE TABLE "location_type_tags" (
  "location_type_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("location_type_id", "tag_id")
);

CREATE TABLE "subject_tags" (
  "subject_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "tag_id")
);

CREATE TABLE "subject_type_tags" (
  "subject_type_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("subject_type_id", "tag_id")
);

CREATE TABLE "task_tags" (
  "task_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("task_id", "tag_id")
);

CREATE TABLE "task_record_tags" (
  "task_record_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("task_record_id", "tag_id")
);

CREATE TABLE "user_tags" (
  "user_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("user_id", "tag_id")
);

CREATE TABLE "action_tags" (
  "action_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("action_id", "tag_id")
);

CREATE TABLE "action_record_tags" (
  "action_record_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("action_record_id", "tag_id")
);

CREATE TABLE "app_tags" (
  "app_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("app_id", "tag_id")
);

CREATE TABLE "contact_tags" (
  "contact_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("contact_id", "tag_id")
);

CREATE TABLE "role_tags" (
  "role_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("role_id", "tag_id")
);

CREATE TABLE "work_assignment_tags" (
  "work_assignment_id" UUID NOT NULL,
  "tag_id" UUID NOT NULL,
  PRIMARY KEY ("work_assignment_id", "tag_id")
);

CREATE TABLE "subject_groups" (
  "subject_id" UUID NOT NULL,
  "group_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "group_id")
);

CREATE TABLE "subject_users" (
  "subject_id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "user_id")
);

CREATE TABLE "subject_locations" (
  "subject_id" UUID NOT NULL,
  "location_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "location_id")
);

CREATE TABLE "subject_work_assignments" (
  "subject_id" UUID NOT NULL,
  "work_assignment_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "work_assignment_id")
);

CREATE TABLE "subject_task_records" (
  "subject_id" UUID NOT NULL,
  "task_record_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "task_record_id")
);

CREATE TABLE "subject_action_records" (
  "subject_id" UUID NOT NULL,
  "action_record_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "action_record_id")
);

CREATE TABLE "subject_occurrences" (
  "subject_id" UUID NOT NULL,
  "occurrence_id" UUID NOT NULL,
  PRIMARY KEY ("subject_id", "occurrence_id")
);

CREATE TABLE "group_countries" (
  "group_id" UUID NOT NULL,
  "country_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "country_id")
);

CREATE TABLE "location_groups" (
  "location_id" UUID NOT NULL,
  "group_id" UUID NOT NULL,
  PRIMARY KEY ("location_id", "group_id")
);

CREATE TABLE "group_users_roles" (
  "group_id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  "role_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "user_id", "role_id")
);

CREATE TABLE "group_contacts" (
  "group_id" UUID NOT NULL,
  "contact_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "contact_id")
);

CREATE TABLE "group_tasks" (
  "group_id" UUID NOT NULL,
  "task_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "task_id")
);

CREATE TABLE "group_roles" (
  "group_id" UUID NOT NULL,
  "role_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "role_id")
);

CREATE TABLE "group_work_assignments" (
  "group_id" UUID NOT NULL,
  "work_assignment_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "work_assignment_id")
);

CREATE TABLE "group_task_records" (
  "group_id" UUID NOT NULL,
  "task_record_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "task_record_id")
);

CREATE TABLE "group_action_records" (
  "group_id" UUID NOT NULL,
  "action_record_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "action_record_id")
);

CREATE TABLE "group_parents" (
  "group_id" UUID NOT NULL,
  "parent_group_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "parent_group_id")
);

CREATE TABLE "group_children" (
  "group_id" UUID NOT NULL,
  "child_group_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "child_group_id")
);

CREATE TABLE "group_occurrences" (
  "group_id" UUID NOT NULL,
  "occurrence_id" UUID NOT NULL,
  PRIMARY KEY ("group_id", "occurrence_id")
);

CREATE TABLE "occurrence_users" (
  "occurrence_id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  PRIMARY KEY ("occurrence_id", "user_id")
);

CREATE TABLE "occurrence_action_records" (
  "occurrence_id" UUID NOT NULL,
  "action_record_id" UUID NOT NULL,
  PRIMARY KEY ("occurrence_id", "action_record_id")
);

CREATE TABLE "occurrence_task_records" (
  "occurrence_id" UUID NOT NULL,
  "task_record_id" UUID NOT NULL,
  PRIMARY KEY ("occurrence_id", "task_record_id")
);

CREATE TABLE "work_assignment_tasks" (
  "work_assignment_id" UUID NOT NULL,
  "task_id" UUID NOT NULL,
  PRIMARY KEY ("work_assignment_id", "task_id")
);

CREATE TABLE "task_record_users" (
  "task_record_id" UUID NOT NULL,
  "user_id" UUID NOT NULL,
  PRIMARY KEY ("task_record_id", "user_id")
);

CREATE TABLE "task_record_locations" (
  "task_record_id" UUID NOT NULL,
  "location_id" UUID NOT NULL,
  PRIMARY KEY ("task_record_id", "location_id")
);

CREATE TABLE "user_locations" (
  "user_id" UUID NOT NULL,
  "location_id" UUID NOT NULL,
  PRIMARY KEY ("user_id", "location_id")
);

CREATE TABLE "user_work_assignments" (
  "user_id" UUID NOT NULL,
  "work_assignment_id" UUID NOT NULL,
  PRIMARY KEY ("user_id", "work_assignment_id")
);

CREATE TABLE "user_action_records" (
  "user_id" UUID NOT NULL,
  "action_record_id" UUID NOT NULL,
  PRIMARY KEY ("user_id", "action_record_id")
);

CREATE TABLE "action_record_locations" (
  "action_record_id" UUID NOT NULL,
  "location_id" UUID NOT NULL,
  PRIMARY KEY ("action_record_id", "location_id")
);

CREATE TABLE "app_children" (
  "app_id" UUID NOT NULL,
  "child_app_id" UUID NOT NULL,
  PRIMARY KEY ("app_id", "child_app_id")
);

CREATE TABLE "app_parents" (
  "app_id" UUID NOT NULL,
  "parent_app_id" UUID NOT NULL,
  PRIMARY KEY ("app_id", "parent_app_id")
);

CREATE TABLE "role_app_permissions" (
  "role_id" UUID NOT NULL,
  "app_permission_id" UUID NOT NULL,
  PRIMARY KEY ("role_id", "app_permission_id")
);

CREATE TABLE "work_assignment_locations" (
  "work_assignment_id" UUID NOT NULL,
  "location_id" UUID NOT NULL,
  PRIMARY KEY ("work_assignment_id", "location_id")
);

ALTER TABLE "i18n_countries" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_education_levels" ADD FOREIGN KEY ("education_level_id") REFERENCES "education_levels" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_education_fields" ADD FOREIGN KEY ("education_field_id") REFERENCES "education_fields" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_jobs" ADD FOREIGN KEY ("job_id") REFERENCES "jobs" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_genders" ADD FOREIGN KEY ("gender_id") REFERENCES "genders" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_actions" ADD FOREIGN KEY ("action_id") REFERENCES "actions" ("id") ON DELETE CASCADE;

ALTER TABLE "action_records" ADD FOREIGN KEY ("action_id") REFERENCES "actions" ("id") ON DELETE RESTRICT;

ALTER TABLE "action_records" ADD FOREIGN KEY ("time_record") REFERENCES "time_records" ("id") ON DELETE RESTRICT;

ALTER TABLE "i18n_apps" ADD CONSTRAINT "fk_app_id" FOREIGN KEY ("app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "app_permissions" ADD FOREIGN KEY ("app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "contacts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE SET NULL;

ALTER TABLE "i18n_group_types" ADD FOREIGN KEY ("group_type_id") REFERENCES "group_types" ("id") ON DELETE CASCADE;

ALTER TABLE "groups" ADD FOREIGN KEY ("type") REFERENCES "group_types" ("id") ON DELETE RESTRICT;

ALTER TABLE "i18n_location_types" ADD FOREIGN KEY ("location_type_id") REFERENCES "location_types" ("id") ON DELETE CASCADE;

ALTER TABLE "locations" ADD FOREIGN KEY ("type") REFERENCES "location_types" ("id") ON DELETE RESTRICT;

ALTER TABLE "locations" ADD FOREIGN KEY ("country") REFERENCES "countries" ("id") ON DELETE RESTRICT;

ALTER TABLE "i18n_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_subject_types" ADD FOREIGN KEY ("subject_type_id") REFERENCES "subject_types" ("id") ON DELETE CASCADE;

ALTER TABLE "subjects" ADD FOREIGN KEY ("type") REFERENCES "subject_types" ("id") ON DELETE RESTRICT;

ALTER TABLE "i18n_tasks" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE CASCADE;

ALTER TABLE "task_records" ADD FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE RESTRICT;

ALTER TABLE "task_records" ADD FOREIGN KEY ("time_record") REFERENCES "time_records" ("id") ON DELETE RESTRICT;

ALTER TABLE "users" ADD CONSTRAINT "fk_user_gender" FOREIGN KEY ("gender") REFERENCES "genders" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_user_country" FOREIGN KEY ("country") REFERENCES "countries" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_user_education_level" FOREIGN KEY ("education_level") REFERENCES "education_levels" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_user_education_field" FOREIGN KEY ("education_field") REFERENCES "education_fields" ("id");

ALTER TABLE "users" ADD CONSTRAINT "fk_user_job" FOREIGN KEY ("job") REFERENCES "jobs" ("id");

ALTER TABLE "i18n_work_assignments" ADD FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "i18n_occurrences" ADD FOREIGN KEY ("occurrence_type_id") REFERENCES "occurrence_types" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrences" ADD FOREIGN KEY ("type_id") REFERENCES "occurrence_types" ("id") ON DELETE RESTRICT;

ALTER TABLE "occurrences" ADD FOREIGN KEY ("location") REFERENCES "locations" ("id") ON DELETE RESTRICT;

ALTER TABLE "occurrences" ADD FOREIGN KEY ("time_record") REFERENCES "time_records" ("id") ON DELETE RESTRICT;

ALTER TABLE "occurrence_tags" ADD CONSTRAINT "fk_occurrence_tag_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_tags" ADD CONSTRAINT "fk_occurrence_tag_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_type_tags" ADD CONSTRAINT "fk_occurrence_type_tags_occurrence_type" FOREIGN KEY ("occurrence_type_id") REFERENCES "occurrence_types" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_type_tags" ADD CONSTRAINT "fk_occurrence_type_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "group_tags" ADD CONSTRAINT "fk_group_tags_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_tags" ADD CONSTRAINT "fk_group_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "group_type_tags" ADD CONSTRAINT "fk_group_type_tags_group_type" FOREIGN KEY ("group_type_id") REFERENCES "group_types" ("id") ON DELETE CASCADE;

ALTER TABLE "group_type_tags" ADD CONSTRAINT "fk_group_type_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "location_tags" ADD CONSTRAINT "fk_location_tags_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "location_tags" ADD CONSTRAINT "fk_location_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "location_type_tags" ADD CONSTRAINT "fk_location_type_tags_location_type" FOREIGN KEY ("location_type_id") REFERENCES "location_types" ("id") ON DELETE CASCADE;

ALTER TABLE "location_type_tags" ADD CONSTRAINT "fk_location_type_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_tags" ADD CONSTRAINT "fk_subject_tags_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_tags" ADD CONSTRAINT "fk_subject_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_type_tags" ADD CONSTRAINT "fk_subject_type_tags_subject_type" FOREIGN KEY ("subject_type_id") REFERENCES "subject_types" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_type_tags" ADD CONSTRAINT "fk_subject_type_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "task_tags" ADD CONSTRAINT "fk_task_tags_task" FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE CASCADE;

ALTER TABLE "task_tags" ADD CONSTRAINT "fk_task_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_tags" ADD CONSTRAINT "fk_task_record_tags_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_tags" ADD CONSTRAINT "fk_task_record_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "user_tags" ADD CONSTRAINT "fk_user_tags_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "user_tags" ADD CONSTRAINT "fk_user_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "action_tags" ADD CONSTRAINT "fk_action_tags_action" FOREIGN KEY ("action_id") REFERENCES "actions" ("id") ON DELETE CASCADE;

ALTER TABLE "action_tags" ADD CONSTRAINT "fk_action_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "action_record_tags" ADD CONSTRAINT "fk_action_record_tags_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "action_record_tags" ADD CONSTRAINT "fk_action_record_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "app_tags" ADD CONSTRAINT "fk_app_tags_app" FOREIGN KEY ("app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "app_tags" ADD CONSTRAINT "fk_app_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "contact_tags" ADD CONSTRAINT "fk_contact_tags_contact" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("id") ON DELETE CASCADE;

ALTER TABLE "contact_tags" ADD CONSTRAINT "fk_contact_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "role_tags" ADD CONSTRAINT "fk_role_tags_role" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "role_tags" ADD CONSTRAINT "fk_role_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_tags" ADD CONSTRAINT "fk_work_assignment_tags_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_tags" ADD CONSTRAINT "fk_work_assignment_tags_tag" FOREIGN KEY ("tag_id") REFERENCES "tags" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_groups" ADD CONSTRAINT "fk_subject_groups_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_groups" ADD CONSTRAINT "fk_subject_groups_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_users" ADD CONSTRAINT "fk_subject_users_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_users" ADD CONSTRAINT "fk_subject_users_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_locations" ADD CONSTRAINT "fk_subject_locations_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_locations" ADD CONSTRAINT "fk_subject_locations_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_work_assignments" ADD CONSTRAINT "fk_subject_work_assignments_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_work_assignments" ADD CONSTRAINT "fk_subject_work_assignments_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_task_records" ADD CONSTRAINT "fk_subject_task_records_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_task_records" ADD CONSTRAINT "fk_subject_task_records_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_action_records" ADD CONSTRAINT "fk_subject_action_records_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_action_records" ADD CONSTRAINT "fk_subject_action_records_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_occurrences" ADD CONSTRAINT "fk_subject_occurrences_subject" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_occurrences" ADD CONSTRAINT "fk_subject_occurrences_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "group_countries" ADD FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_countries" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE CASCADE;

ALTER TABLE "location_groups" ADD CONSTRAINT "fk_location_groups_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "location_groups" ADD CONSTRAINT "fk_location_groups_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_users_roles" ADD CONSTRAINT "fk_group_users_roles_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_users_roles" ADD CONSTRAINT "fk_group_users_roles_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "group_users_roles" ADD CONSTRAINT "fk_group_users_roles_role" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "group_contacts" ADD CONSTRAINT "fk_group_contacts_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_contacts" ADD CONSTRAINT "fk_group_contacts_contact" FOREIGN KEY ("contact_id") REFERENCES "contacts" ("id") ON DELETE CASCADE;

ALTER TABLE "group_tasks" ADD CONSTRAINT "fk_group_tasks_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_tasks" ADD CONSTRAINT "fk_group_tasks_task" FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE CASCADE;

ALTER TABLE "group_roles" ADD CONSTRAINT "fk_group_roles_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_roles" ADD CONSTRAINT "fk_group_roles_role" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "group_work_assignments" ADD CONSTRAINT "fk_group_work_assignments_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_work_assignments" ADD CONSTRAINT "fk_group_work_assignments_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "group_task_records" ADD CONSTRAINT "fk_group_task_records_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_task_records" ADD CONSTRAINT "fk_group_task_records_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "group_action_records" ADD CONSTRAINT "fk_group_action_records_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_action_records" ADD CONSTRAINT "fk_group_action_records_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "group_parents" ADD CONSTRAINT "fk_group_parents_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_parents" ADD CONSTRAINT "fk_group_parents_parent_group" FOREIGN KEY ("parent_group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_children" ADD CONSTRAINT "fk_group_children_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_children" ADD CONSTRAINT "fk_group_children_child_group" FOREIGN KEY ("child_group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_occurrences" ADD CONSTRAINT "fk_group_occurrences_group" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE;

ALTER TABLE "group_occurrences" ADD CONSTRAINT "fk_group_occurrences_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_users" ADD CONSTRAINT "fk_occurrence_users_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_users" ADD CONSTRAINT "fk_occurrence_users_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_action_records" ADD CONSTRAINT "fk_occurrence_action_records_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_action_records" ADD CONSTRAINT "fk_occurrence_action_records_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_task_records" ADD CONSTRAINT "fk_occurrence_task_records_occurrence" FOREIGN KEY ("occurrence_id") REFERENCES "occurrences" ("id") ON DELETE CASCADE;

ALTER TABLE "occurrence_task_records" ADD CONSTRAINT "fk_occurrence_task_records_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_tasks" ADD CONSTRAINT "fk_work_assignment_tasks_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_tasks" ADD CONSTRAINT "fk_work_assignment_tasks_task" FOREIGN KEY ("task_id") REFERENCES "tasks" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_users" ADD CONSTRAINT "fk_task_record_users_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_users" ADD CONSTRAINT "fk_task_record_users_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_locations" ADD CONSTRAINT "fk_task_record_locations_task_record" FOREIGN KEY ("task_record_id") REFERENCES "task_records" ("id") ON DELETE CASCADE;

ALTER TABLE "task_record_locations" ADD CONSTRAINT "fk_task_record_locations_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "user_locations" ADD CONSTRAINT "fk_user_locations_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "user_locations" ADD CONSTRAINT "fk_user_locations_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "user_work_assignments" ADD CONSTRAINT "fk_user_work_assignments_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "user_work_assignments" ADD CONSTRAINT "fk_user_work_assignments_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "user_action_records" ADD CONSTRAINT "fk_user_action_records_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;

ALTER TABLE "user_action_records" ADD CONSTRAINT "fk_user_action_records_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "action_record_locations" ADD CONSTRAINT "fk_action_record_locations_action_record" FOREIGN KEY ("action_record_id") REFERENCES "action_records" ("id") ON DELETE CASCADE;

ALTER TABLE "action_record_locations" ADD CONSTRAINT "fk_action_record_locations_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;

ALTER TABLE "app_children" ADD CONSTRAINT "fk_app_children_app" FOREIGN KEY ("app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "app_children" ADD CONSTRAINT "fk_app_children_child_app" FOREIGN KEY ("child_app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "app_parents" ADD CONSTRAINT "fk_app_parents_app" FOREIGN KEY ("app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "app_parents" ADD CONSTRAINT "fk_app_parents_parent_app" FOREIGN KEY ("parent_app_id") REFERENCES "apps" ("id") ON DELETE CASCADE;

ALTER TABLE "role_app_permissions" ADD CONSTRAINT "fk_role_app_permissions_role" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "role_app_permissions" ADD CONSTRAINT "fk_role_app_permissions_app_permission" FOREIGN KEY ("app_permission_id") REFERENCES "app_permissions" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_locations" ADD CONSTRAINT "fk_work_assignment_locations_work_assignment" FOREIGN KEY ("work_assignment_id") REFERENCES "work_assignments" ("id") ON DELETE CASCADE;

ALTER TABLE "work_assignment_locations" ADD CONSTRAINT "fk_work_assignment_locations_location" FOREIGN KEY ("location_id") REFERENCES "locations" ("id") ON DELETE CASCADE;