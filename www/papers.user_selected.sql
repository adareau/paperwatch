--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'Selected papers' as contents;

select
    'table' as component,
    True as search,
    True as striped_rows,
    False as small,
    'link' as markdown,
    'authors' as markdown,
    'action' as markdown,
    True as sort;
select
    title,
    substring(author_display, 1, 100) as "authors",
    format("[%s](%s)",feed_display_name, link) as "link",
    substring(date_added, 1, 10) as "date",
    format("[details](papers.details.sql?id=%i)", id) as "action"

from papers where selected is True;
