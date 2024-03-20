import { TimeRecord } from './timeRecord';

export type Task = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nTask[];
  tags: string[];
}
export type i18nTask = {
  id: string;
  task_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}
export type TaskRecord = {
  id: string;
  task_id: string;
  users: string[];
  date: Date;
  result: string;
  comments: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  time_record: TimeRecord;
  tags: string[];
  locations?: string[];
}