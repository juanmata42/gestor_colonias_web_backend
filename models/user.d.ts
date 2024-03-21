import { Tag } from './tag';

export type User = {
  id: string;
  email: string;
  password: string;
  name: string;
  lastname: string;
  birthdate: string;
  gender: string;
  nid: string;
  telephone: string;
  address: string;
  country: string;
  education_level: string;
  education_field: string;
  job: string;
  su: boolean;
  locations: string[];
  subjects: string[];
  groups: string[];
  created_at: Date;
  updated_at?: Date;
  roles: string[];
  tags: Tag[];
  work_assignments: string[];
  task_records: string[];
  action_records: string[];
}
