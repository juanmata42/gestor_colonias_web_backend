import { Task } from './task';
import { Tag } from './tag';
export type i18nWorkAssignment = {
  id: string;
  work_assignment_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}
export type WorkAssignment = {
  id: string;
  i18n: i18nWorkAssignment[];
  users: string[];
  subjects: string[];
  locations: string[];
  groups: string[];
  tasks: Task[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
  task_records: string[];
  action_records: string[];
}