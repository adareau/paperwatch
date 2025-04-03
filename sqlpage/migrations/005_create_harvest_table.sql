CREATE TABLE harvest (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    feeds TEXT NOT NULL,
    success BOOLEAN NOT NULL,
    papers_collected INT NOT NULL,
    papers_selected INT NOT NULL,
    papers_collected_new INT NOT NULL,
    papers_selected_new INT NOT NULL,
    log TEXT
);
