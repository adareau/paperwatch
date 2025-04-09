CREATE TABLE sqlpage_shell_config (
    ---
    key TEXT PRIMARY KEY,
    title TEXT,
    link TEXT DEFAULT "/",
    icon TEXT DEFAULT "file-search",
    favicon TEXT DEFAULT "img/favicon.png",
    norobot BOOLEAN default True
);

INSERT OR REPLACE INTO sqlpage_shell_config
VALUES (
    'default'
    , 'Paperwatch (dev)'
    , '/'
    , 'file-delta'
    , 'img/favicon-dev.png'
    , TRUE
);
