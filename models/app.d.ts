export type App = {
  [key: string]: string | i18nApp[]  |  boolean | undefined | Date
  id: string;
  active: boolean;
  color: string;
  image_id: string;
  created_at: Date;
  updated_at?: Date;
  parent_app_id?: string;
  i18n: i18nApp[];
};

export type NestedApp = App & {
  [key: string]: string | i18nApp[]  |  boolean | undefined | Date | NestedApp[]
  sub_apps?: NestedApp[]
}

export type i18nApp = {
  id: string;
  app_id: string;
  language: string;
  name: string;
  header_title: string;
  short_header: string;
  tool_name: string;
}

export type AppPermission = {
  [key: string]: string | number | undefined
  id: string;
  app_id: string;
  user_id: string;
  level: number;
  parent_app_id?: string;
}
