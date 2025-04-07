--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= BODY ====================

select
    'table' as component,
    True as search,
    False as small,
    'link' as markdown,
    True as sort;
select
    id,
    title,
    author,
    new,
    analyzed,
    selected,
    format("%s", link) as "link"
from papers where new = True and selected = True and viewed = False;
