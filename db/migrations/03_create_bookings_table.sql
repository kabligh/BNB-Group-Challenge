CREATE TABLE bookings (id SERIAL PRIMARY KEY,
  user_id integer REFERENCES users (id),
  space_id integer REFERENCES spaces (id),
  booking_date DATE,
  booked BOOLEAN
);
