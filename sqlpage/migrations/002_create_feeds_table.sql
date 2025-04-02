CREATE TABLE feeds (
    --- manual entries / informations
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    display_name TEXT NOT NULL,
    category TEXT,
    save_all BOOLEAN DEFAULT FALSE,
    check_date BOOLEAN DEFAULT FALSE
);

-- Populate with example

INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    save_all,
    check_date
) VALUES (
    'http://export.arxiv.org/rss/quant-ph',
    'arxiv:quant-ph',
    'arXiv',
    False,
    False
);
