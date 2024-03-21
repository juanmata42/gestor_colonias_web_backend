import { Tag } from './tag';

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
export type UsersWithRoles = {
  user_id: string;
  roles: string[];
}
export type Group = {
  id: string;
  name: string;
  password: string;
  showLevel: number;
  address: string;
  country: string;
  locations: string[];
  usersWithRoles: UsersWithRoles[];
  subjects: string[];
  contacts: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: GroupType;
  tags: Tag[];
  allowed_roles: string[];
  allowed_tasks: string[];
  work_assignments: string[];
  task_records: string[];
  action_records: string[];
  parent_groups: string[];
  children_groups: string[];
}
