CREATE TABLE feeds (
    --- feed identification
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    display_name TEXT NOT NULL,
    category TEXT,
    --- feed fields structure
    field_link TEXT DEFAULT "link",
    field_title TEXT DEFAULT "title",
    field_summary TEXT DEFAULT "summary",
    field_date TEXT DEFAULT "updated_parsed",
    field_author TEXT DEFAULT "author",
    field_author_type TEXT DEFAULT "cs-list",
    field_id TEXT DEFAULT "id",
    field_tags TEXT DEFAULT "tags"

);

-- Populate with example

INSERT OR IGNORE
INTO feeds(
    url,
    display_name,
    category,
    field_date
) VALUES (
    'http://export.arxiv.org/rss/quant-ph',
    'arxiv:quant-ph',
    'arXiv',
    'published_parsed'
);
