SELECT
    'dynamic' AS component,
    sqlpage.read_file_as_text('shell.json') AS properties;

select 'title' as component, 'papers : new' as contents;

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
    analyzed,
    selected,
    format("%s", link) as "link"
from papers where new=True;
