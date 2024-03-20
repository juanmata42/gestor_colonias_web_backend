import { Task } from './task';
import { Tag } from './tag';
export type WorkAssignment = {
  id: string;
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