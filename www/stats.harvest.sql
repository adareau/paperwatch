--- ================= REDIRECT IF PAPER DOES NOT EXIST ====================
set id = select id from harvest where id=$id;
select
    'redirect' as component,
    '/' as link
where $id is null;
--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= ACTION ====================

--- MAIN INFOS
select
    'title' as component,
    format("Detail on harvest id:%i", $id) as contents
;

select
    'alert'     as component,
    'log' as title,
    log as description_md,
    'black' as color
    from harvest where id=$id and log <> "";

--- DETAILS
select
    'datagrid' as component
    from harvest where id=$id ;
select
    'date' as title,
    timestamp    as description
    from harvest where id=$id ;
select
    'papers collected' as title,
    papers_collected   as description
    from harvest where id=$id ;
select
    'papers added' as title,
    papers_collected_new   as description
    from harvest where id=$id ;
select
    'papers with errors' as title,
    papers_errors   as description
    from harvest where id=$id ;
select
    'Status' as title,
    (select case when success is True
          then 'success'
          else 'error' end) as description,
    (select case when success is True
          then 'green'
          else 'red' end) as color
    from harvest where id=$id ;

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
    format("```id:%02d``` > **%s** > collected : %i | kept : %i"
    ,json_extract(j.value, '$.id')
    ,json_extract(j.value, '$.display_name')
    ,json_extract(j.value, '$.papers_collected')
    ,json_extract(j.value, '$.papers_kept')
    ) as description_md
from json_each((select feeds from harvest where id=$id)) j;
