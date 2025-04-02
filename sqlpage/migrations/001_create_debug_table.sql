CREATE TABLE debug (
    --- manual entries / informations
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    action TEXT,
    details TEXT,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
