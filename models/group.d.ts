import { Tag } from './tag';
import { Task } from './task';
import { WorkAssignment } from './workAssignment';

export type i18nGroupType = {
  id: string;
  group_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}
export type GroupType = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
  i18n: i18nGroupType[];
}
export type Group = {
  id: string;
  name: string;
  password: string;
  showLevel: number;
  address: string;
  country: string;
  locations: string[];
  users: string[];
  subjects: string[];
  contacts: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: GroupType;
  tags: Tag[];
  allowed_roles: string[];
  allowed_tasks: Task[];
  work_assignments: WorkAssignment[];
  parent_groups: string[];
  children_groups: string[];
}
