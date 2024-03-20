import { AppPermission } from './app';
import { Tag } from './tag';
export type Role = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  i18n: i18nRole[];
  tags: Tag[];
  app_permissions: AppPermission[];
}
export type i18nRole = {
  id: string;
  role_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}