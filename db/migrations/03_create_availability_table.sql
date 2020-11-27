CREATE TABLE availability (
  id SERIAL PRIMARY KEY,
  space_id INT NOT NULL,
  date DATE,
  CONSTRAINT fk_spaces
    FOREIGN KEY(space_id)
      REFERENCE spaces (id)
);
