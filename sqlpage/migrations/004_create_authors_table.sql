CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    tags TEXT
);

-- Populate with example

INSERT OR IGNORE
INTO authors
(name)
VALUES
('Bloch'),
('Dalibard'),
('Ketterle');
