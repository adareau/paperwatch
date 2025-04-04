CREATE TABLE papers (
    --- automatic & meta
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_added timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    harvest_id INTEGER NOT NULL,

    --- paper data
    link TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    summary TEXT,
    author TEXT NOT NULL,
    paper_id TEXT,
    feed_tags TEXT,
    doi TEXT,

    --- feed data
    date_published DATETIME NOT NULL,
    feed_url TEXT NOT NULL,
    feed_id INT NOT NULL,

    --- status & score : automatic analysis
    analyzed BOOLEAN DEFAULT False,
    analysis_id INT,
    total_score INT DEFAULT 0,
    keywords_score INT DEFAULT 0,
    authors_score INT DEFAULT 0,
    keywords_tags TEXT,
    authors_tags TEXT,
    followed_authors TEXT,
    score_detail TEXT,
    new BOOLEAN DEFAULT True,

    --- status & score : manual review
    viewed BOOLEAN DEFAULT False,
    selected BOOLEAN DEFAULT False,
    man_score INT DEFAULT 0
);
