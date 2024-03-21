import { Tag } from './tag';

export type i18nLocationType = {
  id: string;
  location_type_id: string;
  language: string;
  name: string;
  description: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
}

export type LocationType = {
  id: string;
  name: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  tags: Tag[];
  i18n: i18nLocationType[];
}

export type Location = {
  id: string;
  name: string;
  groups: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: LocationType;
  coordinates: {
    latitude: number;
    longitude: number;
  };
  address: string;
  country: string;
  tags: Tag[];
}
    