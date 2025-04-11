--- ================= HEADER ====================
SELECT
    'dynamic' AS component,
    sqlpage.run_sql('header.auth.sql') AS properties,
    sqlpage.run_sql('header.shell.sql') AS properties;

--- ================= BODY ====================

select 'title' as component, 'log : global' as contents;


select
    'list'                 as component,
    TRUE                   as wrap,
    TRUE                   as compact

select
    format("[%s] **%s** >  %s"
    ,timestamp
    ,action
    ,details
    ) as description_md,
    (select case when error is True
          then 'red'
          else 'green' end) as color

from log
order by id desc
limit 50
;
