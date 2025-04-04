CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    tags TEXT
);

-- Populate with example

INSERT OR IGNORE
INTO authors
(name, tags)
VALUES
('Bloch', 'cold atoms, lattices'),
('Dalibard', 'cold atoms'),
('Langen', 'cold atoms, molecules'),
('Ketterle', 'cold atoms');
