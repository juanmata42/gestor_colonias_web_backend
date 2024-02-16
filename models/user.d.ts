import { AppPermission } from './app';
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
  su: boolean;
  locations: string[];
  subjects: string[];
  groups: string[];
  created_at: Date;
  updated_at?: Date;
  appPermissions: AppPermission[];
  roles: string[];
  tags: Tag[];
}
