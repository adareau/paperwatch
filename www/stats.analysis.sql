--- ================= REDIRECT IF PAPER DOES NOT EXIST ====================
set id = select id from analysis where id=$id;
select
    'redirect' as component,
    '/' as link
where $id is null;
--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= CONTENT ====================

select
    'button' as component;
select
    'Back to analysis list'   as title,
    'tables.analysis.sql'     as link,
    'arrow-back-up' as icon,
    'Back to analysis list' as tooltip;

--- MAIN INFOS
select
    'title' as component,
    format("Detail on analysis id:%i", $id) as contents
;

-- select
--     'alert'     as component,
--     'log' as title,
--     log as description_md,
--     'black' as color
--     from analysis where id=$id and log <> "";

--- DETAILS
select
    'datagrid' as component
    from analysis where id=$id ;
select
    'date' as title,
    timestamp    as description
    from analysis where id=$id ;
select
    'papers analyzed' as title,
    papers_analyzed   as description
    from analysis where id=$id ;
select
    'papers selected' as title,
    papers_selected  as description
    from analysis where id=$id ;
select
    'Status' as title,
    (select case when success is True
          then 'success'
          else 'error' end) as description,
    (select case when success is True
          then 'green'
          else 'red' end) as color
    from analysis where id=$id ;


--- FEEDS
select
    'title' as component,
    3 as level,
    'feeds' as contents
;

select
    'list'                 as component,
    TRUE                   as wrap,
    TRUE                   as compact

select
    format("```id:%02d``` > **%s** > analyzed : %i | selected : %i"
    ,json_extract(j.value, '$.feed_id')
    ,json_extract(j.value, '$.feed_display_name')
    ,json_extract(j.value, '$.analyzed_papers')
    ,json_extract(j.value, '$.selected_papers')
    ) as description_md
from json_each((select log from analysis where id=$id)) j;
