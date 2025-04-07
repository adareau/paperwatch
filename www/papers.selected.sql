--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= BODY ====================

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
    author_display as "authors",
    followed_authors,
    total_score,
    keywords_score,
    authors_score,
    authors_tags,
    keywords_tags,
    format("%s", link) as "link"
from papers where new = True and total_score > 0 True and viewed = False;
