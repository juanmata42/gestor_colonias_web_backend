import { Tag } from './tag';

export type Location = {
  id: string;
  name: string;
  groups: string[];
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  type: string;
  coordinates: {
    latitude: number;
    longitude: number;
  };
  address: string;
  country: string;
  tags: Tag[];
}
    