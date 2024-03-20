import { Tag } from './tag';

export type i18nActionType = {
  id: string;
  action_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type ActionType = {
  id: string;
  name: string;
  i18n: i18nActionType[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
}

export type Action = {
  id: string;
  subject_id?: string;
  user_id: string;
  date: Date;
  result: string;
  comments: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  type: ActionType;
  location?: string;
  tags: Tag[];
}