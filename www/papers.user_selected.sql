--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'Selected papers' as contents;

------------------- TODAY's SELECTION ----------------------

set description_fmt = "%s ```%s```"

select
    'list'                 as component,
    "Today's selection"       as title,
    TRUE                   as wrap,
    True                   as compact;

select
    title            as title,
    -- 'index.sql?select_paper_id=' || id as edit_link,
    'papers.details.sql?id=' || id as view_link,
    link as link,
    format($description_fmt
            ,author_display
            ,feed_display_name
            ) as description_md,
    (select case when authors_score > 0 then 'red'
                 when total_score > 1 then 'green'
                 else 'gray'
    end) as color

from papers
where selected=True and date_selected = DATE()
order by
    authors_score desc,
    total_score desc
;

--------------------------------------------------------

select
    'divider' as component;

------------------- LAST 7 DAYS  ----------------------

set description_fmt = "**%s** ```%s```"

select
    'list'                 as component,
    "Recently selected (past 7 days)"       as title,
    TRUE                   as wrap,
    True                   as compact;

select
    -- title            as title,
    -- 'index.sql?select_paper_id=' || id as edit_link,
    'papers.details.sql?id=' || id as view_link,
    link as link,
    format($description_fmt
            ,title
            ,feed_display_name
            ) as description_md,
    (select case when authors_score > 0 then 'red'
                 when total_score > 1 then 'green'
                 else 'gray'
    end) as color

from papers
where selected=True and cast(JulianDay(date_selected) - JulianDay(date()) as integer) < 8
order by
    date_selected desc,
    total_score desc
;

--------------------------------------------------------

select
    'divider' as component;

------------------- LAST 10 added  ----------------------

set description_fmt = "**%s** ```%s```"

select
    'list'                 as component,
    "Last 20 papers added & selected"       as title,
    TRUE                   as wrap,
    True                   as compact;

select
    -- title            as title,
    -- 'index.sql?select_paper_id=' || id as edit_link,
    'papers.details.sql?id=' || id as view_link,
    link as link,
    format($description_fmt
            ,title
            ,feed_display_name
            ) as description_md,
    (select case when authors_score > 0 then 'red'
                 when total_score > 1 then 'green'
                 else 'gray'
    end) as color

from papers
where selected=True
order by id desc
limit 20
;
