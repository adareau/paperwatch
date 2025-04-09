--- === read static configuration file
SELECT
    'dynamic' AS component,
    sqlpage.read_file_as_text('shell.json') AS properties;
