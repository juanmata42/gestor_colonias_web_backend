import { Tag } from './tag';

export type i18nSubjectType = {
  id: string;
  subject_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type SubjectType = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nSubjectType[];
  tags: Tag[];
}

export type Subject = {
  id: string;
  unique_identifier: string;
  name: string;
  description: string;
  groups: string[];
  assigned_users: string[];
  locations: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: SubjectType;
  tags: Tag[];
}