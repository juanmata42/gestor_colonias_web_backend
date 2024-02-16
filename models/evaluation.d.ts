import { Tag } from './tag';

export type i18nEvaluationType = {
  id: string;
  evaluation_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type EvaluationType = {
  id: string;
  name: string;
  i18n: i18nEvaluationType[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
}

export type Evaluation = {
  id: string;
  subject_id: string;
  user_id: string;
  date: Date;
  result: string;
  comments: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  type: EvaluationType;
  location: string;
  tags: Tag[];
}