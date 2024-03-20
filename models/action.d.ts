import { Tag } from './tag';
import { TimeRecord } from './timeRecord';

export type i18nAction = {
  id: string;
  action_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type Action = {
  id: string;
  name: string;
  i18n: i18nAction[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
}

export type ActionRecord = {
  id: string;
  action_id: string;
  users: string[];
  subjects?: string[];
  date: Date;
  result: string;
  comments: string;
  locations?: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  time_record: TimeRecord;
  tags: Tag[];
}