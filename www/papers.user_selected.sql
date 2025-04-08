--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= BODY ====================

select 'title' as component, 'papers : all' as contents;

select
    'table' as component,
    True as search,
    False as small,
    'link' as markdown,
    True as sort;
select
    id,
    title,
    author_display as "authors",
    new,
    analyzed,
    selected,
    format("%s", link) as "link"
from papers where selected is True;
