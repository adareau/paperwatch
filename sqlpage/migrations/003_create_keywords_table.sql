CREATE TABLE keywords (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    short_name TEXT NOT NULL,
    keywords TEXT
);

-- Populate with example

INSERT OR IGNORE
INTO keywords(
    category,
    short_name,
    keywords
) VALUES (
    'Ytterbium & Clock',
    'Yb_Clock',
    'ytterbium,clock transition,clock laser,clock lattice'
);
