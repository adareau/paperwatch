CREATE TABLE analysis (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    success BOOLEAN DEFAULT FALSE,
    papers_analyzed INT DEFAULT 0,
    papers_selected INT DEFAULT 0,
    log TEXT
);
