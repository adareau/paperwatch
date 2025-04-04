SELECT
    'dynamic' AS component,
    sqlpage.read_file_as_text('shell.json') AS properties;

select 'title' as component, 'papers : selected' as contents;

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
    followed_authors,
    total_score,
    keywords_score,
    authors_score,
    authors_tags,
    keywords_tags,
    format("%s", link) as "link"
from papers where new = True and selected = True and viewed = False;
