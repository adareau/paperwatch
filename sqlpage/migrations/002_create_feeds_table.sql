CREATE TABLE feeds (
    --- feed identification
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    display_name TEXT NOT NULL,
    category TEXT,
    disabled BOOLEAN DEFAULT False,
    save_all BOOLEAN DEFAULT False,
    --- feed fields structure
    field_link TEXT DEFAULT "link",
    field_title TEXT DEFAULT "title",
    field_summary TEXT DEFAULT "summary",
    field_date TEXT DEFAULT "updated_parsed",
    field_date_type TEXT DEFAULT "timestruct",
    field_author TEXT DEFAULT "author",
    field_author_type TEXT DEFAULT "cs-list",
    field_paper_id TEXT DEFAULT "id",
    field_tags TEXT DEFAULT "tags",
    field_tags_type TEXT DEFAULT "arxiv",
    field_doi TEXT DEFAULT "doi"

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
