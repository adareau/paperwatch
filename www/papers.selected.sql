--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('auth.sql') AS properties,
    sqlpage.read_file_as_text('shell.json') AS properties;

--- ================= BODY ====================

set tile_content="%s

keywords : %i  |  authors : %i"

-- == TITLE
select 'title' as component, 'papers : freshly selected' as contents;

-- == LIST
select
    'card'                     as component,
    1                          as columns;
select
    title            as title,
    link as link,
    format($tile_content, author_display, keywords_score, authors_score) as description_md,
    --'red'                       as color,
    format('hexagon-number-%i', total_score)   as icon

from papers
where viewed=False
and total_score > 0
order by total_score desc;
