import { Tag } from './tag';
import { Country } from './location';

export type GroupsWithRoles = {
  group_id: string;
  roles: string[];
}

export type i18nEducationLevel = {
  id: string;
  education_level_id: string;
  language: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type education_level = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nEducationLevel[];
}

export type i18nEducationField = {
  id: string;
  education_field_id: string;
  language: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type education_field = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nEducationField[];
}

export type i18nJob = {
  id: string;
  job_id: string;
  language: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type job = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nJob[];
}

export type i18nGender = {
  id: string;
  name: string;
  gender_id: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type gender = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nGender[];
}

export type User = {
  id: string;
  email: string;
  password: string;
  name: string;
  lastname: string;
  birthdate: string;
  gender: gender;
  nid: string;
  telephone: string;
  address: string;
  country: Country;
  education_level: education_level;
  education_field: education_field;
  job: job;
  annual_salary_in_euro: number;
  su: boolean;
  locations: string[];
  subjects: string[];
  groupsWithRoles: GroupsWithRoles[];
  created_at: Date;
  updated_at?: Date;
  tags: Tag[];
  work_assignments: string[];
  task_records: string[];
  action_records: string[];
  occurrence_records?: string[];
}
