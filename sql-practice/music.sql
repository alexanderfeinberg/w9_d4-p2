-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS musicians_instruments;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);

CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  bands_id INTEGER REFERENCES bands(id)
  -- FOREIGN KEY (bands_id) REFERENCES bands(id)
);
CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);

CREATE TABLE musicians_instruments (
  id INTEGER PRIMARY KEY,
  musician_id INTEGER REFERENCES musicians(id),
  instruments_id INTEGER REFERENCES instruments(id)
  -- FOREIGN KEY (musician_id) NOT NULL REFERENCES musicians(id),
  -- FOREIGN KEY (instruments_id) REFERENCES instruments(id)
);
