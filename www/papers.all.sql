--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'All papers' as contents;

select
    'table' as component,
    True as search,
    False as small,
    'link' as markdown,
    True as sort;
select
    title,
    substring(author_display, 1, 100) as "authors",
    format("[%s](%s)",feed_display_name, link) as "link",
    substring(date_added, 1, 10) as "date"

from papers order by date_added desc limit 100;
