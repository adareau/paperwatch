CREATE TABLE harvest (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    feeds TEXT NOT NULL,
    success BOOLEAN DEFAULT FALSE,
    papers_collected INT DEFAULT 0,
    papers_collected_new INT DEFAULT 0,
    papers_errors INT DEFAULT 0,
    log TEXT
);
