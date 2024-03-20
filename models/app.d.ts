import { Tag } from './tag';

export type App = {
  id: string;
  active: boolean;
  color: string;
  image_id: string;
  created_at: Date;
  updated_at?: Date;
  parent_apps?: string[];
  children_apps: string[];
  i18n: i18nApp[];
  tags: Tag[];
};

export type i18nApp = {
  id: string;
  app_id: string;
  language: string;
  name: string;
  header_title: string;
  short_header: string;
  description: string;
}

export type AppPermission = {
  id: string;
  app_id: string;
  level: number;
}
