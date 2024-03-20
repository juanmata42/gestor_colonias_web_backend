import { Tag } from './tag';
export type Contact = {
  id: string;
  name: string;
  email: string;
  telephone: string;
  created_at: Date;
  updated_at?: Date;
  deleted: boolean;
  image_id?: string;
  tags: Tag[];
  user_id?: string;
}