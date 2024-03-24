import { Tag } from './tag';
import { TimeRecord } from './timeRecord';

export type i18nOccurrence = {
  id: string;
  occurrence_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type OccurrenceType = {
  id: string;
  i18n: i18nOccurrence[];
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
};

export type Occurrence = {
  id: string;
  name: string;
  created_by: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: OccurrenceType;
  location: string;
  tags: Tag[];
  related_subjects?: string[];
  related_users?: string[];
  related_groups?: string[];
  related_locations?: string[];
  related_actions?: string[];
  related_tasks?: string[];
  time_record: TimeRecord;
}