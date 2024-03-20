export type TimeRecord = {
  id: string;
  checkIn_time: Date;
  checkOut_time?: Date; // Optional, in case the user hasn't checked out yet
  metadata?: any; // Optional, for storing additional data like location or device info
  created_at: Date;
  updated_at?: Date;
}
